-- Curso: Medita Estas Coisas (Richard Baxter) — slug medita-estas-coisas. Transcrição integral (PyMuPDF).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'medita-estas-coisas';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('medita-estas-coisas','Medita Estas Coisas','Estudo a partir de Medita Estas Coisas, de Richard Baxter. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/medita-estas-coisas', false, 0, 'espiritual', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Entende o Evangelho$t$, 1,
$conteudo$Para que a obra da sua conversão não venha a ser abortada, isto no caso em 
que pareça haver começado ou estar se desenvolvendo de modo 
esperançoso, o meu primeiro conselho é: 
Esforce-se para obter um correto entendimento da natureza do 
Cristianismo, e do significado do evangelho que visa salvá-lo. 
Você é por natureza escravo do Príncipe das Trevas, vive em um 
estado de trevas, pratica as obras das trevas, e precipita-se para 
a mais completa escuridão; e é a luz do conhecimento salvífico que 
pode recuperá-lo, ou não haverá recuperação. Deus é 'o Deus de luz, e 
habita na luz '; Cristo é 'a luz do mundo'; seus ministros são também os ' 
luzeiros do mundo ' , desde que se submetam a Ele; e são enviados para ' 
retirarem os homens das trevas para a luz, pelo evangelho que é a luz para 
os nossos pés; e isto para fazer-nos filhos da luz, para que não mais 
pratiquemos as obras das trevas, mas possamos ser participantes da herança 
dos santos na luz '. Acredite nisto, as trevas não são o caminho para a glória 
celestial. A sua doença é a ignorância espiritual, e o conhecimento 
espiritual precisa ser a sua cura. Eu sei que os ignorantes espirituais têm 
muitas desculpas, e que pensam que o caso deles não é assim tão ruim 
como queremos sugerir, achando que não há tal necessidade de 
conhecimento, e que um homem pode ser salvo sem ele. Mas eles pensam 
assim, exatamente porque carecem deste conhecimento, que lhes 
mostraria a miséria da sua ignorância e o valor do 
conhecimento. Não diz a Escritura claramente que, 'se o evangelho 
está encoberto, é para os que se perdem que está, nos quais o 
deus deste século cegou os entendimentos dos incrédulos, para que 
lhes não resplandeça a luz do evangelho da glória de Cristo, o qual é a 
imagem de Deus' ( 2 Cor 4:3,4)? 
Eu sei que muitos que possuem bastante conhecimento são 
impiedosos. Mas e daí? Pode por causa disso qualquer homem 
ser piedoso ou salvo sem conhecimento? Você pode ter um mau 
servo, o qual entretanto é extremamente capaz em seu serviço; mas 
você não solucionará o problema substituindo-o por outro que não 
tenha nenhuma capacidade para o serviço. Você pode mandar um 
homem como seu mensageiro, que conheça o caminho, o qual, não lhe 
obedecerá, mas procrastinará e enganará você; mas e daí? Solucionaria 
você o problema mandando outro que não conhece um passo sequer do 
caminho, nem irá aprender? 
Embora um homem com conhecimento possa ser um servo do 
mal, ainda assim, nenhum homem sem conhecimento, e que não 
faz uso da razão, pode ser um servo de Deus. Um homem pode ir 
para o inferno com conhecimento; mas ele certamente irá para o inferno 
se não o tiver. 
Eu não quero dizer com isto que todos devem ser eruditos, ou 
habilitados nas artes, ciências e línguas; mas você deve ter o 
conhecimento de um crente, embora não tenha o de um erudito. Pode 
você amar e servir a Deus a quem não conhece? Pode você abrir mão de 
amigos, bens, e da própria vida, por uma glória da qual não tem 
conhecimento? Pode você fazer do principal propósito de sua vida 
buscar um céu, cujas excelências nada conhece? Pode você lamentar 
seu pecado e miséria, quando nem sequer está familiarizado com ele? Ou 
esforçar-se-ia você na luta contra o pecado, como o mal maior, quando 
você não conhece o mal que há no pecado? Creria você em um Cristo, a 
quem não conhece a ponto de confiar-lhe sua alma e tudo o mais? 
Descansaria você em uma promessa, temeria uma ameaça, ou se 
submeteria a uma lei, as quais não compreende? Não é possível 
ser um crente sem conhecer a substância do Cristianismo; nem é possível 
ser salvo sem conhecer o caminho da salvação. 
Esforce-se, portanto, para se tornar bem familiarizado com as bases, 
razões e natureza da sua religião. Quanto mais clara for a sua luz, mais 
ardente será o seu coração. Iluminação é a primeira parte da 
santificação. A cabeça é a passagem para o coração. Oh, se você 
apenas soubesse realmente o que é o pecado, e o tipo de vida 
que serve carne, e qual será o fim disso, com que abominação 
você repugnaria o pecado! Se você realmente soubesse o que é mal vida 
de santidade, com que presteza você a escolheria! Se você 
realmente soubesse quem é Deus, quão infinitamente poderoso, sábio 
e bom; quão santo, justo, e verdadeiro; e que direito e autoridade. Ele 
tem sobre você; e que porção eterna Ele seria para você; como seria 
possível que você viesse a preferir o pó do mundo a Ele, ou demorar-se 
um momento sequer em voltar-se para Ele? 
Se você apenas soubesse verdadeiramente quem é Cristo, e o que Ele fez 
e sofreu por você, e o que significam o perdão, a graça e a glória que Ele 
adquiriu para você, e quão infalível é a sua promessa, pela qual estas 
bênçãos lhe são oferecidas, não é possível que você viesse a 
recusá-lo, demorar-se a entregar-lhe a sua alma. Você pensa 
realmente que um homem que sabe verdadeiramente o que é 
o céu e o que é o Inferno, ainda poderia ter alguma dúvida sobre o qual 
deles deveria escolher? Se Deus apenas abrisse os seus olhos para 
ver em que situação você se encontra, e o que você está fazendo, 
você correria como se para salvar sua própria vida, e rapidamente 
mudaria sua mente e caminhos. Você não permaneceria em seu 
estado carnal mais do que permaneceria em uma casa que 
estivesse desmoronando sobre a sua cabeça, ou em um navio, o qual 
percebesse estar afundando sob seus pés, ou sobre areia quando 
visse uma enchente vindo em sua direção. Se você apenas pudesse ver seu 
quarto cheio de demônios esta noite, não continuaria questionando se 
deveria render-se. Certamente, se você soubesse qual a intenção dos 
demônios para com você, como eles o enganam, o dirigem e esperam 
para carregá-lo para o inferno, você nunca mais protelaria uma noite 
sequer propositadamente em tal estado. 
Enquanto o homem não entender o que é o evangelho, nem o que o 
ministro lhe diz, não é de espantar que ele não o considere, e continue nos 
seus pecados. Se você vir um urso ou um cão raivoso avançando em 
direção a um homem, por mais que venha a avisá-lo e alertá-lo para que 
fuja, se o homem falar outra língua e não entender você, ele nunca se 
apressará; mas se 
ele entender e acreditar em você, sem dúvida fugirá. Enquanto as 
pessoas pensarem que os ministros estão gracejando com elas, ou 
que estão incertos quanto ao que dizem, não é de admirar que elas nos 
ouçam na brincadeira, ou como homens que não acreditam no que 
ouvem. Mas se você soubesse que a sua vida depende disso, sim, sua vida 
eterna, não daria você atenção para o que lhe é dito, nem atentaria para 
a sua situação? Agora você fica hesitando e questionando quanto a se 
deveria ou não arrepender-se e desvencilhar-se do pecado; mas se 
soubesse que certamente obterá o inferno juntamente com o pecado 
que quer manter, acredito que suas dúvidas seriam rapidamente 
solucionadas, e você relutaria em hospedar por mais uma noite 
convidados tão acusadores e perigosos. Agora, quando nós o persuadimos a 
uma vida de santidade, você objeta-se a isto, como se tivesse alguma 
dúvida quanto ao assunto; mas se você compreendesse a 
natureza e o fim da santificação, você cedo perderia suas 
dúvidas; e se você apenas soubesse o quão mais feliz seria com Deus, 
nunca se obstinaria em desvencilhar-se dos seus pecados mais deliciosos. 
Assim como os judeus rejeitaram a Cristo e preferiram um assassino a 
Ele, gritando ' crucifica-o ', e tudo isto porque eles não O conheciam, 
assim você deixa Cristo batendo e convidando-o, e oferecendo-lhe 
salvação, enquanto permanece questionando se deveria ou não 
obedecer ao seu chamado, ou se não deveria preferir as suas 
luxúrias a Ele; e tudo porque você não O conhece nem a graça e glória que 
Ele lhe oferece. Quando os homens não entendem as razões de Deus, 
as quais deveriam prevalecer sobre as deles, não é de admirar que não 
abandonem aquilo que lhes é tão querido quanto as suas vidas. Mas 
quando eles vêm a conhecer as razões do Cristianismo, aquelas 
razões comoventes, inegáveis e valiosas; que advêm da 
compreensão da realidade de Deus, do Céu e do Inferno, 
eles não mais questionarão o assunto, mas abrirão mão 
de tudo, até da própria vida. O conhecimento a que me refiro, 
entretanto, é um conhecimento espiritual, poderoso e prático, e não meras 
opiniões e conceitos vacilantes. 
Estude portanto quem é Deus, o que Ele significa para você, e o que 
Ele será para você; estude o pecado, e o que é a condenação e o 
que ele merece. Estude quem é Cristo, o que Ele fez e o que sofreu por 
você, e o que Ele está querendo fazer, se você não O negligenciar. 
Estude o que é o mundo, e o que, em última análise, o pecado fará a 
você. Estude o que é a glória eterna que você pode ter com Deus, se não a 
perder, por causa da sua loucura. Estude o que é a fé, o que é 
arrependimento, o que são o amor e a alegria, e o que é uma vida 
santa e celestial, e quão pouca razão você tem para ter medo 
dessas coisas. 
Se esse sentimento apossar-se profundamente de você, ele influenciará o 
seu coração, e fará de você um converso resoluto e confirmado. 
Mas, se ao invés disso, você apenas parece ter se arrependido, mas 
mal sabe o porquê, e adota a vida cristã antes de ser totalmente 
possuído pela sua natureza, bases e razões, não é de admirar que venha 
rapidamente se perder nas trevas, a hesitar, a ser enganado, e a ficar 
perplexo por causa de qualquer astuto que venha colocar em dúvida 
tudo o que você tem feito; ou que venha a correr de um grupo para outro, 
a seguir qualquer um que lhe conte uma mentira razoável; e nunca venha 
a saber no que se fixar, nem a saber quando está ou não no caminho 
certo. 
As apreensões da mente movem o homem por inteiro. A sabedoria é 
o guia e a âncora da alma. Pecar é cometer insensatez, e pecadores são 
insensatos. O júbilo deles é o júbilo dos insensatos, e a música 
deles é a música dos insensatos. Sim, o melhor das suas obras, 
enquanto se recusam a ouvir e a obedecer, não passa de sacrifício 
de 
insensatos.Isto não é próprio da casa de Deus, 'pois Deus não tem prazer 
nos insensatos '. Tal homem precisa ter discernimento dEle, e 
compreender o que lhe for possível, a fim de que possa ser servo do 
Deus dos Céus, escapar dos enganos do Diabo astuto, e alcançar o 
Céu por meio de tantas dificuldades que surgem diante de si. Portanto, 
acima de tudo o que puder adquirir, ' adquire a sabedoria '.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Baxter diz que a sua doença é a ignorância espiritual e que o conhecimento precisa ser a sua cura: que partes da natureza de Deus, do pecado e da graça você nunca parou de fato para conhecer?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se você soubesse verdadeiramente quem é Cristo e o que Ele sofreu por você, em que ponto da sua vida ainda estaria hesitando em entregar-Lhe a sua alma?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que "trevas" e obras você ainda chama de queridas, e o que mudaria no seu coração se a luz do evangelho lhe mostrasse o verdadeiro fim delas?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Examina as Escrituras$t$, 2,
$conteudo$Se você não quer que a obra da sua conversão venha a ser abortada, 
uma vez entendido o que lhe é oferecido, ' examine as Escrituras todos os 
dias para ver se as coisas são de fato assim ou não ' (At 17:11). 
Assim fizeram os Bereanos, e o texto 'diz que por causa disso 
creram ' (At 17:12). Nós não queremos enganá-lo, por isso não queremos 
que você aceite qualquer coisa que dissermos, mas aquilo que pudermos 
provar, pela palavra de Deus ser realmente verdade. Não desejamos guiá-lo 
nas trevas mas, pela luz do evangelho, queremos retirá-lo das 
trevas. Assim sendo, não recusamos submeter toda a nossa doutrina a 
um teste justo. Embora não desejemos que você se torne culpado por 
desconfiar de nós injustamente, ainda assim, não desejamos que aceite 
este ensinos importantes e preciosos, confiado meramente nas nossas 
palavras; porque neste caso, a sua fé seria colocada no homem; e, então 
seria de admirar que viesse a ser fraca, ineficaz, e facilmente abalada. 
Você pode confiar em um homem hoje e não mais confiar amanhã; um 
homem pode merecer o maior crédito de você este ano, mas no ano 
seguinte pode ser que outro homem, com pensamentos contrários, 
venha a merecer mais crédito aos seus olhos. Assim, nós não queremos 
que acredite em nós mais do que o suficiente para conduzí-lo a 
Deus, e para que o ajudemos a entender aquelas palavras nas quais você 
precisa crer. O nosso desejo, portanto, consiste em que você examine as 
Escrituras, e teste se as coisas que lhe dizemos são verdadeiras. 
A nossa palavra nunca alcançará o seu propósito em você, até que veja e 
ouça a Deus nelas, e compreenda que é Ele, e não apenas homens, quem 
está lhe falando. Se você não ouvir ninguém lhe falar, a não ser o ministro, 
não é de admirar que ouse desdenhar dele; pois ele é um homem frágil e 
mortal como você mesmo. Enquanto você pensar que a doutrina que 
pregamos é meramente o produto da nossa própria imaginação ou 
conjecturas, não é de admirar que não a valorize, nem abandone tudo o 
que cria anteriormente, pela simples persuasão de um pregador. Mas 
quando você sondar as Escrituras, e vier a descobrir que o que lhe está 
sendo pregado é a palavra do Deus dos Céus, ousaria você então 
desprezá-la? Quando você descobrir que nós não lhe dissemos mais do que 
fomos ordenados, e que o Deus que falou esta palavra a sustentará, então 
ela certamente lhe falará mais intimamente; você a considerará, e não 
mais a ouvirá com descaso. 
Se nós vendêssemos mercadorias defeituosas, certamente desejaríamos 
uma loja escura para esconder os defeitos; e se o nosso ouro ou prata 
fossem leves ou de má qualidade, nós certamente não 
recomendaríamos que os pesassem e testassem.Mas quando estamos 
convictos de que aquilo que falamos é verdade, não desejamos outra 
coisa, senão teste. Beleza e boa aparência não apresentam nenhuma 
vantagem sobre uma deformidade repugnante quando ambas encontram-se 
nas trevas, mas a luz mostrará a diferença. O erro será um perdedor 
quando houver luz, e assim fugirá dela. Mas a verdade será vitoriosa 
quando houver luz, e portanto a buscará. Deixe que os papistas 
escondam as Escrituras do povo, proíbam sua leitura na língua que 
eles conhecem, e ensinem-lhes a falar de Deus o que não entendem. Nós 
não ousamos fazer isso, nem o desejamos. Nossa doutrina não é pregada 
nas trevas; por isso convidamos você à 'lei e aos testemunhos '. 
Coloque nossas palavras na luz, e veja se elas não estão de acordo 
com a Palavra de Deus. Nada nos incomoda mais do que não podermos 
persuadir nossos ouvintes a fazerem este teste. Alguns deles, entretanto, 
estão tão endurecidos no seu pecado e miséria, que nem sequer se 
darão ao trabalho de abrirem suas Bíblias para testarem se o que 
dizemos é verdade ou não. Alguns deles nem sequer incomodarão 
suas mentes pensando sobre isto; ' Deus não está em nenhum dos seus 
pensamentos'.Alguns já se consideram sábios demais para aprender, e 
não mais abaterão a sua confiança em suas opiniões anteriores, 
embora, pobres almas, sua ignorância ameace-os de 
condenação. Outros estão tão envolvidos 
com facções pecaminosas, que os seus companheiros não lhes darão 
oportunidade para que questionem o caminho em que estão; enquanto que 
outros, ainda dificilmente tomarão as Escrituras como a norma pela qual 
devem testar e serem provados, porém olham mais para os costumes, e 
para a vontade daqueles que exercem poder sobre eles. Muitos não 
estão querendo submeter à teste o nosso ensino, porque não estão 
querendo saber a verdade, e não poderiam suportar descobrirem-se 
miseráveis, nem verem o que lhes é requerido mas que não 
apreciam praticar. Assim, não podemos conseguir que venham a testar se as 
coisas que lhes ensinamos são verdadeiras. 
É por causa disso que os homens enganam a si mesmos, e 
pensam encontrar-se seguros, quando na verdade encontram-se em um 
estado miserável, porque não testam, pela Palavra, o que lhes é dito. 
Isto os torna obstinados e confiantes na sua loucura, fazendo-os sorrir 
e cantar beira do inferno, e que nadem alegremente rio abaixo em direção 
ao abismo devorador como se mal algum os ameaçasse. Isto faz com 
que eles, embora em profunda miséria, não tenham pena de si 
mesmos, e se empenhem tão pouco para escapar deste estado. 
Embora tenham tempo, meios e ajuda à disposição, ainda assim 
não dispõem seus corações de razões para fazer uso disto. Sim, eles 
lançam-se diariamente mais e mais em direção ao abismo; e tudo 
porque não podemos fazer com que examinem as Escrituras, para verem 
se o pecado é algo assim tão insignificante, e se não terminará em 
amargura. Daí serem eles tão facilmente levados por uma tentação, terem 
aversão a uma vida santa, e menosprezarem aqueles que 
buscam diligentemente a salvação, e que são mais preciosos aos 
olhos de Deus. 
Daí escarnecerem do caminho no qual eles deveriam andar, porque não 
examinam as Escrituras para ver o que lhes é dito quanto ao assunto. A 
Palavra é uma luz que ajudaria muito a abrir-lhe os olhos e a salvá-lo 
para Deus, se eles apenas fossem a ela com desejo de conhecer a verdade. 
Vocês pensam que os ímpios ricos e poderosos estão em melhor 
condição 
do que um homem piedoso, o qual é pobre e desprezado. E qual a 
razão, se não porque não entram no santuário, e vêem em que 
lugar escorregadio eles se encontram, e qual será o fim destes 
homens? Em uma palavra, esta é uma ruína de milhões de almas. Eles 
passam a vida toda fora do caminho do Céu, e ainda assim não são 
persuadidos a perguntar pelo caminho; mas precipitam-se, fecham os 
olhos, e entregam-se ao perigo. Milhares partem deste mundo sem que 
tenham gasto, no total, o período de um dia testando, pelas Escrituras, se 
seu estado é bom e seus caminhos são certos. Não adianta; ainda que seus 
mestres lhes digam que precisam ser santificados e mudar de rumo, eles 
discordarão deles, embora não sejam tão sábios nem tenham 
tanto conhecimento quanto seus mestres; e os contradirão, não 
crerão neles, nem os considerarão. Por causa disso, não 
conseguimos com que venham a nós, a fim de que sujeitem suas questões 
à teste, e deixem que a Escritura seja o juíz. Se eles apenas tomassem 
essa atitude, não teriam pensamentos tão duros sobre seus mestres, nem 
se ofenderiam por causa do seu modo franco e rigoroso de lidar com eles. 
Se assim você fizesse, então diria: 'Agora eu vejo que o ministro não 
diz estas coisas se si mesmo; ele fala apenas o que Deus lhe ordena; 
e se ele não entregasse a mensagem do Senhor, ele seria indigno e 
desqualificado para ser Seu embaixador. Ele seria cruel para comigo, se 
não me puxasse do fogo do modo mais franco e rigoroso. Ele me 
odiaria, se não me repreendesse, mas permitisse que eu ficasse no 
pecado. Se ele estivesse preocupado em agradar a homens, não seria 
um servo de Cristo. Eu sei que ele não sente prazer em me 
afligir ou provocar; mas ele estaria concorrendo para a sua própria 
destruição se não me alertasse do perigo em que me encontro. Eu não 
tenho razão em desejar que ele tenha sua alma condenada, e permita 
que a mesma coisa aconteça com a minha; e tudo pelo temor de me 
desagradar, estando eu em pecado '. 
Estes seriam os seus pensamentos se você apenas provasse nossas palavras 
pelas Escrituras, para ver se falamos ou não de conformidade com a 
vontade de Deus. Não há dúvida de que nossas palavras penetrariam 
mais profundamente no seu coração, sendo mais fixadas e mais preciosas 
aos seus olhos, se você viesse a entender que elas são palavras de Deus. 
Esta, portanto, é a minha súplica, para que a obra da sua conversão 
não venha a ser abortada; leve tudo o que ouvir às Escrituras, e ali 
examine e veja se é realmente assim ou não; a fim de retire suas 
dúvidas e se torne convicto, ao invés de ficar hesitante; e para que a 
sua fé seja estabelecida pela autoridade de Deus. Assim, a obra será 
divina e, por conseguinte, poderosa e eficaz, visto que as bases e razões são 
divinas. Se você não ficar satisfeito com a doutrina que o 
ministro prega, examine primeiramente você mesmo as Escrituras; e se isso 
não o convencer, vá a ele, e peça-lhe que mostre a você suas bases na 
Palavra de Deus, e que ore por você, para que Deus lhe dê um 
entendimento correto dela. Você questiona se há realmente um 
julgamento realmente tão severo, um Céu, e um inferno, como os 
ministros lhe dizem? Examine as escrituras em Mt 25 e 2 Ts 1:8-10; Jo 
5:29; Mt 13. Você questiona que um homem não possa ser salvo sem 
conversão, regeneração e santificação? Abra sua Bíblia, e veja o que diz 
Deus em Jo 3:3,6; Mt 18:3; 2 Cor 5:17; Rom 8:9; Heb 12:14. Você 
pensa que um homem pode ser salvo sem conhecimento? Deixe que 
a Escritura julgue: 2 Cor 4:3,4; Jo 17:3; Os 4:6. Você pensa que um 
homem pode ser salvo, comportando-se como a maioria se comporta, 
vivendo no caminho ordinário em que o mundo vive? Examine as 
Escrituras e veja, Mt 7:13,20; 22:14; lc 12:32. Você pensa que uma 
alma não humilhada e que nunca foi contristada e teve um 
coração quebrantado por causa do pecado pode ser salva? Teste 
com: Is 57:15,66; Sl 51:17; lc 4:18; Mt 11:28. Você pensa que um 
homem pode ser um servo de Deus vivendo uma vida carnal e 
conservando seus pecados? Prove com Rom 8:13; Gál 6:8; Ef 5:5,6; 1 Jo 
3:9,10. Você tem dúvida quanto à necessidade de fazer tanto esforço 
para ser salvo, e ter tanto empenho, e fazer da religião a coisa 
principal da nossa vida? Teste com o Sl 1:1-3; 1 Pe 4:18; Heb 7:14; lc 
10:42; 13:24; Ef 5:15,16. Você pensa que um homem mundano, cujo 
coração está mais na terra do que nos Céus, pode ser salvo? Teste com 1 
Jo 2:15; Fp 3:19; Col 3:1; lc 14:26,33. 
Você tem dúvidas se deveria servir a Deus com sua família, instruí-los, e 
orar com eles? Examine Jos 24:15; Dt 6:6,7; Dn 6:10,11; Ex 20:10. 
Assim, se você, em todas estas importantes questões, apenas 
for às Escrituras, para ver se elas confirmam o que seus mestres 
dizem, você cedo poderia Ter suas dúvidas tiradas, e isto pela autoridade 
mais infalível do mundo. Você pode pensar que os seus ministros 
estão enganados, mas eu espero que admita que Deus não pode 
estar enganado. Você pode pensar que os seus ministros são 
impetuosos, presunçosos, ou que falam de tal modo por terem 
prevenção contra você; eu só espero que não ouse pensar assim do 
Senhor; Ele não tem nenhuma prevenção contra você, nem fala uma só 
palavra que não seja confiável. Você pode pensar que somos 
parciais, mas Deus é imparcial. Que melhor juiz poderia ter você, 
do que Ele, que é infalível e, no final, julgará a todos? Se algum 
papista colocar em sua cabeça a pergunta: Quem é o juiz do 
sentido das Escrituras? Eu respondo: Quem é o juiz do Juiz do mundo 
inteiro? A lei é feita para julgar você, e não para ser julgada por você. 
Ninguém pode ser melhor juiz do sentido da lei do que o próprio autor da 
lei, embora outros devam julgar seus casos pela lei. O seu dever é 
discernir, entender, e obedecer a lei; e o nosso é ajudá-lo a entendê-la; 
mas não é nossa tarefa, nem a sua, o ser o seu juiz próprio ou absoluto. 
Pelo menos onde fala claramente, ela não precisa de juiz. Venha 
portanto à Palavra, com humildade e humilhação, com uma disposição 
ensinável de espírito, um desejo de aprender a verdade, uma resolução de 
aceitá-la, e de submeter-se ao que lhe será revelado. Implore a Deus 
que Ele lhe mostre Sua vontade, que o guie verdade, e você 
descobrirá que Ele será encontrado por aquele que O busca.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$À maneira dos bereanos, você tem o hábito de levar o que ouve às Escrituras para ver "se as coisas são de fato assim", ou apenas confia na palavra de homens?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Baxter pergunta se você já gastou um único dia inteiro examinando, pela Palavra, se o seu estado é bom e os seus caminhos são certos: o que talvez você tema descobrir ao abrir a Bíblia com sinceridade?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando você vier a entender que é Deus, e não apenas o ministro, quem lhe fala nas Escrituras, como isso mudaria o peso e o valor que essas palavras têm no seu coração?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Medita Estas Coisas$t$, 3,
$conteudo$Se você não quer que a obra da sua conversão venha ser abortada, o 
meu próximo conselho é o seguinte: ' Reflita seriamente, em secreto com 
Deus, nas verdades que vier a compreender '. 
Eu já tenho falado freqüentemente sobre este assunto; por isso, embora 
eu considere importantíssimo, não me demorarei mais, ao tratar dele aqui, 
do que o farei com os demais assuntos. 
As verdades mais importantes no mundo não influenciarão muito 
aqueles que não meditarem nelas. A reflexão abre o ouvido que está 
fechado, e o coração que se encontra trancado; ela põe em ação 
os poderes da alma, e desperta-o de um sono de indiferença e 
segurança. Os pensamentos são as primeiras atividades da alma, os 
quais colocam o resto em ação. Pensar sobre os assuntos que devem 
nos fazer sábios, e podem realizar a obra de Deus no coração, é a parte 
que nos cabe fazer para que a nossa salvação se concretize. 
Pela reflexão, um pecador faz uso da verdade, a qual anteriormente 
ficava apenas na periferia e que, portanto, nada podia fazer. É através 
da meditação, que alguém aplica o remédio à sua alma, o qual lhe estava 
mão, mas que não podia realizar a sua obra curativa. Pela meditação, 
um homem faz uso da razão, que antes se encontrava 
adormecida e que, portanto, não podia realizar a sua tarefa. Enquanto o 
professor estiver em casa, os alunos estarão brincando. Quando 
o cocheiro adormece, os cavalos podem perder a direção, e 
possivelmente quebrarem o pescoço e o de vocês próprios. Se um 
lavrador seguir seu caminho sem atentar para o arado, ou o boi ficará 
para trás, ou o trabalho será mal feito. 
Assim, quando a razão é deixada adormecida e fora do caminho, o que não 
poderá fazer o apetite? O que não poderão fazer as paixões? E o que as 
tentações não poderão fazer com a alma? Um homem sábio, enquanto está 
adormecido, faz tão pouco uso de sua sabedoria quanto um 
insensato. Um erudito, enquanto adormecido, dificilmente pode 
disputar com um iletrado que está despertado. Um homem forte e 
habilidoso com suas armas, dificilmente estará habilitado, enquanto 
adormecido, a disputar com a criança mais fraca que estiver acordada. 
Todos os poderes da sua alma permanecerão como se estivessem 
adormecidos, até que a meditação os desperte. 
O que lhe aproveita ser um ser humano e ter razão, se não a usa 
quando necessita? Assim como os homens tornam-se irrefletidos 
quando estão fracos, assim também eles se tornam mais fracos quando são 
irrefletidos. A espada mais afiada, o maior canhão, nada farão contra 
um inimigo, enquanto, embora à mão, não forem usados. Há um 
magnífico poder na Palavra de Deus e no exemplo de Cristo para 
derrubar fortes influências, e conquistar as mais poderosas luxúrias e 
corrupções. Mas eles ( Cristo e a Palavra ) nada poderão fazer, enquanto 
estiverem esquecidos e negligenciados. 
Atrairia o Céu a um homem que não pensa nele? Desencorajaria o 
inferno a um homem que não pensa sobre ele? Por que é que toda a 
argumentação do mundo, não produzirá melhor efeito sobre um surdo do 
que se nada lhe for dito? 
Simplesmente porque a passagem para os seus pensamentos e 
entendimentos está fechada. Se você tem olhos mas não 
enxerga, ouvidos mas não ouve, e intencionalmente lança fora o que 
vê e ouve dos seus pensamentos, o que lhe aproveitará qualquer 
coisa que lhe for dita? Não é mantendo a comida da boca, ao invés de 
engolí-la, que você será nutrido; nem tampouco engolindo-a, 
sem contudo retê-la no estômago, mas vindo a vomitá-la. É preciso que a 
comida seja retida no estômago até que venha a ser digerida e absorvida. 
Assim, as verdades mais excelentes neste mundo não mudarão o 
seu coração a não ser que você permita que desçam até ele, e que 
venham sejam ali retidas através da meditação, até que venham a ser 
digeridas e transformadas em vida espiritual. 
A pomada deve ser colocada sobre a ferida, se você quiser ser 
curado. Ora, a ferida, a doença, está no seu coração; e se você não 
introduzir a Palavra no seu coração, 
aonde está a doença, eu não vejo como você poderia esperar a cura. A 
alma não será magicamente santificada pelo mero ouvir ou repetir 
algumas palavras bonitas, como os feiticeiros fazem para curar doenças, ou 
para parecerem que as curam. É a verdade aplicada ao coração que pode 
curá-lo. Se você não pensar e repensar nelas, como pode esperar que 
venham a penetrar no seu coração? 
Você diz que receberia alegremente a Cristo e a Sua graça, mas está pronto 
a culpar a Deus, por Ele não aplicá-los ao seu coração, dizendo: ' Eu 
não posso converter a mim mesmo '. Mas como você espera que o 
Espírito entre, mantendo a porta fechada para Ele? Ele bate e deseja que 
você abra a porta e o receba, e você diz que quer que Ele entre, mas 
tranca a porta, e não há súplica que faça com que você a abra! É a 
reflexão nas doutrinas salvadoras do evangelho que abre o coração 
e faz com que este venha a hospedá-lo. Disponha-se, 
portanto, propositadamente, a esta obra; abra as portas do seu 
coração, que agora estão trancadas, e permita que o Rei da glória entre. 
Quem acredita que você ama a luz, se você tranca a janela e fecha as 
cortinas? Se você se dispuser a considerar as verdades do evangelho, 
as janelas de sua alma se abrirão e, então, a luz certamente entrará. 
Agora você lê capítulos e mais capítulos, e ouve sermões e mais 
sermões, mas eles nunca o movem, ou movem menos do que deveriam, 
como um homem que, no inverno, não se aqueceu direito ao fogo, e ao 
sair sente mais frio do que antes. Mas se você se dispusesse a refletir 
no que lê ou ouve, uma linha de um capítulo ou uma sentença de um 
sermão seria suficiente para levá-lo as lágrimas, ou fazê-lo gemer, ou 
pelo menos o moveria mais do que agora. Satanás guarneceu o coração de 
todo homem carnal, e a reflexão é o meio principal para expulsá-lo de 
lá. Se, ao considerar as terríveis ameaças do mundo, você 
disparasse estes canhões de Deus contra elas,que artilharia não seriam 
contra as corrupções da sua alma! O nosso Deus é fogo consumidor, e o 
fogo do inferno é a ameaça da Sua lei como salário do pecado. Através de 
séria reflexão, você pode como que abrir fogo de Deus e da Sua Palavra, e 
disparar contra o próprio portão da guarnição de Satanás, e abater 
muitas das suas influencias. 
Visto que o assunto é muito necessário, eu o 
desenvolverei mais detalhadamente. Primeiro, para falar sobre 
algumas das coisas nas quais você deveria refletir. Segundo, para 
dizer de que maneira deveria fazer isto. E, terceiro, para lhe dar algumas 
motivações para que se disponha a esta prática. 
EM QUE MEDITAR 
1. A primeira coisa a que eu o convidaria a pensar, é sobre a natureza do 
deus com o qual você tem que lidar. Reflita que, se Ele é o mais sábio, há 
toda razão no mundo para que Ele o governe. Se Ele é bom, infinitamente 
bom, há toda razão do mundo para que você O ame, e não há qualquer 
razão para que você o ame o mundo ou o pecado ao invés de amá-lO. Se 
Ele é o mais fiel e verdadeiro, Suas ameaças devem ser temidas, e suas 
promessas não devem ser colocadas em dúvidas; e não há razão para que 
você tenha qualquer dúvida quanto a sua palavra. Se Ele é santo, a sua 
santidade deve, necessariamente, ser a mais excelente, e aqueles que são os 
mais santos precisam, necessariamente, refletir Sua excelência porque se 
assemelham a deus. logo, Ele deve ser inimigo do pecado, e de todos os 
que são ímpios, porque são contrários à Sua natureza. 
Considere que ele é todo-poderoso, e que não há resistência ou oposição 
que possa sobrepor-se a Ele. Em um piscar de olhos, Ele pode arrancar tua 
alma culpada do teu corpo, e lançá-la aonde o pecado se sente mais à 
vontade. Uma palavra de sua boca pode colocar o mundo inteiro contra ti, 
bem como a tua própria consci6encia. Um franzir de sua face pode te atirar 
no inferno; e se Ele for teu inimigo, não importa quem seja teu amigo, pois 
o mundo inteiro não pode te salvar se Ele te condenar. São abençoados 
aqueles que Deus abençoa, e são realmente amaldiçoados aqueles que Ele 
amaldiçoa. Ele é desde a eternidade, mas tu és, por assim dizer, desde 
ontem. A tua existência procede dEle; a tua vida está sempre na Sua mão; 
tu não podes viver uma hora sem o Senhor, não podes respirar sem Ele, 
nem pensar um 
pensamento sem Ele, nem falar uma palavra sem Ele, nem mover um pé 
ou uma mão sem Ele. Ser-te-ia mais possível viver sem pão, bebida, fogo, 
ar, terra, ou água, do que sem Deus. Todo o mundo é, diante dEle, apenas 
como uma gota de um balde, ou como um grão de poeira comparado com o 
peso de toda a terra. Se tu pelo menos circundasses este mundo visível, e 
contemplasses todas as nações, sua maravilhas, as grandes profundidades 
dos imensos oceanos, e a abundância de criaturas que existem, oh, que 
pensamentos não terias de Deus! E se te fosse possível ir além das estrelas, 
e ver o sol em toda a sua glória, ver a forma e curso de suas órbitas, ver os 
abençoados anjos, e todos os habitantes do mundo espiritual, então, oh, que 
pensamentos sobre Deus não conceberias! Oh, mas se te fosse possível ver 
a Sua glória, ou ver Suas costas, como viu Moisés, ou vê-lO em Cristo, o 
Redentor agora glorificado, que apreensões não terias dEle? Como, então, 
abominarias o pecado, e como aborrecerias a vida mais deleitável que a 
sensualidade 
pudesse 
te 
proporcionar! 
Então 
tu 
compreenderias 
rapidamente que não há amor suficiente grande, nem louvores 
suficientemente elevados, nem culto suficientemente bom ou puro para tal 
Deus. Então tu logo compreenderias, que este não é Deus para ser 
negligenciado nem gracejado, nem resistido ou provocado, quebrando- se 
propositalmente as Suas leis. 
É vida eterna conhecer este Deus, e é por falta do conhecimento dEle, que 
o pecado abunda no mundo. É isto que faz da santidade algo tão escasso e 
pobre. Os homens não atentam para como cultuam, porque não conhecem o 
que cultuam. Oh, portanto, habita nas meditações do Todo-Poderoso! 
Enquanto Ele possuir tua mente, não haverá lugar para pecado e vaidade. 
Se eu não te propusesse outra tarefa, nem te falasse de nenhum outro 
assunto é, em certo sentido, tudo. O que não fará a uma alma no verdadeiro 
conhecimento de Deus? O melhor cristão, e o mais feliz dos homens, é 
aquele que mais O conhece. O mais vil e miserável desventurado é aquele 
que está mais longe dEle e é mais estranho a Ele. Este é o caráter de tolo 
dos tolos: tem um coração cuja disposição e prática diz: ' Não há Deus'; ou 
seja, é de tal modo afetado e ocupado em seu coração, como se não 
houvesse Deus. 'Deus não está em nenhum dos seus pensamentos'. 
Era muito melhor para o homem, quando ele tinha menos conhecimento 
sobre si mesmo e pensava menos sobre si e mais sobre Deus. E não há 
maneira de nos restaurar um entendimento saudável, e aperfeiçoar nosso 
conhecimento, a não ser que voltemos nossos olhos novamente para Deus; 
pois em conhecê-lO, conhecemos tudo o que é digno de ser conhecido. 
Agarra-te, pois, ao Deus bendito nas tuas meditações, enche os teus 
pensamentos dEle, e habita nesses pensamentos. lembra-te que Ele está 
sempre contigo, onde quer que estejas, e o que quer que estejas fazendo, 
certamente Ele te vê. Tão certo quanto tu lá estás, lá também está o Senhor. 
Ele conhece os teus pensamentos, Ele ouve as tuas palavras, Ele vê os teus 
caminhos. É tal Deus um Deus a ser provocado ou desprezado? Não seria 
melhor provocar e desprezar o mundo inteiro? Deveria o Seu favor ser 
desconsiderado? Não seria melhor perder o favor do mundo? Medita estas 
coisas. 
2 . Outra coisa que eu queria que você pensasse com freqüência, é sobre o 
fim para o qual você foi feito, e com que propósito você veio ao mundo. 
Pense 
que Deus não o criou em vão; e que Ele não o fez para outro fim mais 
baixo, que não para Si mesmo; e que Ele nunca o teria feito nem 
preservado por tanto tempo, se Ele não se importasse com o que você faz. 
Deus nunca o teria provido de uma mente racional e imortal; a não ser que 
fosse para um fim elevado, nobre e imortal. Certamente foi para que você 
pudesse ser feliz em conhcê-lO; que Ele fez com que fosse capaz de 
conhecê-lO; pois Ele não fez nada em vão. E útil para um cavalo conhecer 
seu pasto, forragem, trabalho, e talvez seu dono; mas ele não precisa saber 
que há um Deus; ele foi qualificado de acordo com seu propósito. Mas o 
principal propósito do homem é saber que há um Deus, e quem é Ele, como 
serví-lO, e o que Ele é e será para nós; ou, de outro modo, nunca teríamos 
em nós a capacidade para tais coisas. Ele nunca o teria feito com 
capacidade de amá-lO, a não ser que fosse para que você exercitasse esse 
amor e fosse feliz nEle. A estrutura, faculdades , capacidade de sua alma, e 
o escopo das Escrituras, tudo declara que você foi mandado a este mundo 
para buscar a Deus, amá-lO, obedecê-lO, alegrar-se nEle dentro da sua 
limitação; e para se preparar para uma vida de mais íntima comunhão, 
aonde você poderá gozá-lO e louvá-lO na mais elevada perfeição. 
Considere consigo mesmo se foi para uma vida de pecado que você foi 
feito; ou se Deus o mandou para cá a fim de quebrar Sua lei e seguir suas 
próprias paixões; ou se a satisfação da carne, ou aquisição de alguns dos 
recursos deste mundo, ou o acúmulo de riquezas que você pode deixar de 
uma hora para outra, parece ser o provável propósito para o qual Deus o 
mandou a este mundo. 
A próxima coisa em que você precisa meditar, é em como tem respondido 
ao fim para o qual você foi criado, e como tem realizado aquilo para o que 
veio a este mundo. Olhe para trás, para o curso de seu coração e vida; leia 
novamente os registros mais antigos de sua consciência; e veja o que você 
tem sido e o que vem fazendo no mundo até agora. Tem você gastado os 
seus dias em buscar a Deus, e os seus recursos e forças para servir-lhe 
fielmente? Tem você vivido todo este tempo admirando as Suas 
excelências, com amor fervoroso, recordações deliciosas, e com zelo ao 
cultuá-lO? Se você tem feito isso, não precisa de conversão. Mas medite; 
não tem você se esquecido do propósito que tem neste mundo, sem se 
importar com o mundo para o qual deveria se preparar, e vivido como 
quem não conhece Aquele que o fez, ou porque fez? São o esporte e a 
diversão o fim para o qual você foi criado? É o comodismo, a frivolidade, a 
comida, a bebida, as conversas vãs, ou a recreação, o propósito para o qual 
você veio ao mundo? É o viver da carne, o acumular riquezas, ou o andar 
atrás da apreciação de homens, a obra que Deus o mandou fazer aqui? Foi 
para isso que Ele o preservou, e lhe deu o sustento diário? O que foi que fez 
com que você O esquecesse, O desprezasse, O tirasse do seu coração, e lhe 
roubasse o serviço e a honra, e colocasse a carne em Seu lugar, dando a ela 
aquilo que é a Ele devido? Pense no que você tem feito, e se tem feito a 
obra para a qual foi mandado, ou não. 
A próxima coisa em que você precisa refletir, é em quão gravemente tem 
pecado, e a que estado o pecado o levou. Se voc6e apenas tivesse uma 
visão imparcial da sua vida, veria quão longe do alvo você tem olhado, e 
quão longe tem estado daquilo que deveria Ter sido, e quão pouco tem feito 
daquilo que deveria ser o propósito da sua vida. Oh, que abundância de 
agravantes há no seu pecado, os quais eu não tratarei aqui, pois devo 
mencioná-los quando tratar de ouro assunto. Não se trata apenas de 
algumas transgressões contra a tendência do seu coração e da sua vida; mas 
o próprio coração é falso e longe de Deus, e resolvido a fazer o mal. Oh, 
quanto tempo você perdeu; quantos meios e ajudas negligenciou; a quantos 
bons impulsos você resistiu; que enxame de maus pensamentos tem 
enchido a sua imaginação; que rios de palavras vãs e frívolas têm saído da 
sua boca; que obras das trevas, em público e em secreto, Deus tem visto 
você praticar! E durante todo este tempo, quão vazio você foi em santidade 
interior, e quão infrutífero em boas obras, a Deus e aos homens? O que 
você tem feito com todos os seus talentos? E quão pouco ou nada teve 
Deus a ver com eles? Agora considere o estado em que você se encontra 
enquanto permanecer sem se converter. Você fez de si mesmo um poço de 
pecado, escravo de satanás e da carne, e é hábil em nada mais, a não ser em 
fazer o mal. Quando é convidado à oração e à meditação santa, o seu 
coração se opõe por não estar acostumado a isto, não sabendo, portanto, 
como fazer estas coisas com benefícios. Mas pensar os pensamentos da 
luxúria e ambição, ou ira, ou malícia, ou vingança, isto você pode fazer 
sem nenhuma fadiga. Falar sobre o mundo, esportes e prazeres, ou contra 
aqueles de quem não gosta, isto você pode fazer sem nenhum estudo. Você 
é tal qual aqueles sobre quais é dito: 'deveras o meu povo está louco, já não 
me conhece; são filhos néscios, e não entendidos; são sábios para o mal, e 
não sabem fazer o bem' ( Jer 4:22 ). 
Você está crescendo como um estranho para com o Deus que o fez, em 
cujo amor e serviço deveria viver e encontrar o principal prazer. O seu 
coração está endurecido, e se você está morto nos seus pecados; a culpa dos 
seus pecados ainda está sobre você. Você não pode olhar para o seu 
coração ou para a sua vida, nem mesmo para um dia de sua vida, ou para a 
hora que viveu, a não ser para ver a face deformada do pecado que merece 
condenação. Você fez de Deus o seu inimigo, quando Ele deveria ser a 
única razão da sua felicidade. Apesar disso, você está sempre sob a Sua 
misericórdia, e em Suas mãos.Você sabe muito pouco sobre o tempo que a 
Sua paciência ainda o suportará; ou a que horas Ele reclamará a sua alma. 
Quando a morte vier, em que estado ela o encontrará? Quando 
lamentavelmente desprezado você está para encontrá-lo; quão despreparado 
para aparecer diante do Deus terrível, a quem ofendeu; e quão terrível, você 
pensa, será este momento para você? Certamente, se você morrer antes de 
ser convertido, não demorará uma hora até que venha a se encontrar entre 
os demônios e almas perdidas. A lei já amaldiçoou, e você será executado 
se morrer em seus pecados. Então poderá ver qual é o lucro do pecado, e o 
mal que esteve fazendo durante toda a sua vida para a sua própria alma, e a 
que estado você se colocou a si próprio, e que necessidade tem de atentar 
urgentemente para a sua situação. 
5. O próximo passo da sua meditação deveria ser o seguinte: Relembre a si 
mesmo em que abençoada condição você poderia estar se através da 
conversão fosse recuperado desta miséria e trazido para Deus. Foi isto que 
moveu o coração do filho pródigo para retornar, 'Então, caindo em si disse: 
Quantos trabalhadores de meu pai têm pão com fartura, e eu aqui morro de 
fome!' (lc 15:17). Aquele que não tinha alfarrobas para se alimentar com os 
porcos refletiu sobre a abundância que abandonou em casa. O membro 
mais pobre da família de Cristo está em melhor condição do que o maior 
rei na terra que não for convertido.Você poderia ter vivido um tipo de 
vida diferente do que viveu, para sua segurança e benefício, com conteúdo 
verdadeiro, se tivesse voltado sua mente e vida para Deus. Se você apenas 
se convertesse, seria um membro vivo de Cristo, e os Seus preciosos 
benefícios seriam seus. Seu sangue o purificaria de todos os seus pecados e 
eles seriam graciosamente perdoados. Deus seria reconciliado com você e 
se tornaria seu amigo, seu pai e seu Deus, e lhe tomaria como servo e filho 
adotivo; o Espírito santo habitaria em você, guiaria seu entendimento, lhe 
mostraria o que nem carne nem sangue podem revelar, e o faria 
familiarizado com os mistérios de Deus. Ele seria um Espírito de luz e de 
vida dentro de você, operaria no seu coração movendo-o mais para Deus, e 
lhe daria inclinações e afeições mais fortes para com as coisas do alto. Ele 
o ajudará quando você estiver fraco, e o vivificará quando estiver 
desanimado, e o lembrará quando estiver esquecido de coisas necessárias. 
Ele o ajudará nas orações, tanto no conteúdo quanto na maneira, o ajudará 
na meditação, nas conversas,e em outros deveres. Ele o advertirá do perigo, 
o fortalecerá contra as tentações, e fará com que seja vitorioso; e se você 
cair, Ele fará com que se levante novamente. Ele será um confortador que 
habitará em você, e lhe falará de paz de modo tão afetivo, em meio as suas 
inquietudes, que ao falar dela, Ele a criará em você; e na multidão dos seus 
pensamentos, o Seu conforto deleitará a sua alma. Oh! Que vida você 
poderia viver com Cristo, pelo Seu Espírito, vivesse em você! Você poderia 
refletir quão meigo é Cristo para com os seus próprios membros, quão 
carinhosamente Ele os ama, com que constância Ele cuida deles, quão 
plenamente Ele os provê, e com que segurança Ele os preserva. Se você 
viesse a se encontrar em um caminho tempestuoso, Ele o retiraria dali. 
Aflições nunca serão colocadas sobre você, a não ser para o seu bem, nem 
durarão mais do que a sua condição o faç a necessário, sendo no final 
retiradas para a sua satisfação e contentamento. Na verdade, a sua vida 
seria uma vida de misericórdias, e aquilo que é apenas uma misericórdia 
comum para os homens, seria uma misericórdia especial para você, visto 
que provêm do seu Pai de amor, pressagiando a sua salvação, e apontando 
para as misericórdias eternas. Você não poderia abrir os olhos senão para 
ver aquilo que pode encorajá-lo e confortá-lo; todas as obras de Deus que 
você contempla, lhe mostraria a Sua majestade, Seu amor e Seu poder, 
conduzindo-o a Ele. 
Você não poderia abrir a sua Bíblia sem que viesse a encontrar nela as 
benditas linhas de amor. Oh! que bem lhe faria, ler nela os benditos 
atributos do seu Deus, reverenciar o Seu nome, e ler com atenção a 
descrição da sua natureza perfeitíssima! Que bem lhe faria ler sobre a 
natureza da encarnação, vida, morte, ressurreição, ascensão, intercessão e 
retorno do nosso bendito Redentor!Que bem lhe faria descobrir aquelas 
normas santas, das a sua nova natureza se agrada bem como ler a lei que 
está escrita no seu coração, assim como ler as maldições das quais você foi 
livrado! Que vida e alegria receberia a sua alma das inúmeras, plenas e 
generosas promessas de graça! Se você fosse realmente santificado e feito 
nova criatura, a sua condição seria freqüentemente de conforto, e sempre 
segura; e mesmo quando estivesse em grandes temores e perplexidades, 
ainda assim estaria firme nos braços de Cristo. Medite em como lhe seria a 
vida, se você tivesse acesso diário a Deus em oração e descanso 
em todas as necessidades e perigos; se pudesse procurá-lo, com a promessa 
de ser ouvido e atendido, e pudesse estar seguro de que pode esperar dEle 
mais do que uma criança poderia esperar do pai mais meigo, ou do queuma 
esposa do marido mais apaixonado sobre a terra. Que vida você teria, ao 
poder sempre pensar em Deus com a razão da sua felicidade, e extrair dEle 
os prazeres mais sublimes, enquanto que dEle têm os ímpios os maiores 
terrores? Também não é uma parte desprezível dos Seus benefícios, poder 
viver entre Seu povo, gozando de um amor especial da parte deles, tendo 
uma comunhão especial eles, ser lembrado nas suas orações, e de possuir, 
com eles, o privilégio dos santos e das ordenanças de Deus. Não é 
desprezível que, ao invés das conversas vãs, da inútil comunhão dos filhos 
e obras das trevas, você possa unir-se à igreja de Deus em seu louvor, e 
alimentar-se com eles do corpo e sangue de Cristo, à Sua mesa, e então ter 
renovadas comunicações de graça, e renovado o perdão selado à sua alma. 
Mas por quanto tempo teria eu que falar sobre isso se tivesse que lhe dizer 
apenas a metade das bênçãos de um estado santificado e espiritual? Em 
uma palavra, Deus seria seu, Cristo seria seu, o Espírito Santo seria seu, 
todas as coisas seriam suas; o mundo inteiro estaria, de algum modo, 
relacionado com o seu bem. Os demônios seriam subjugados a você e 
expulsos da sua alma; o pecado seria tanto perdoado como vencido; os 
anjos seriam espíritos ministradores para o seu bem; as promessas das 
Escrituras seriam suas, a glória eterna seria, no final, sua; e enquanto 
estivesse na terra, poderia ser confortado o quanto quisesse, com a 
confiante antevisão daquela felicidade inimaginável, indizível e eterna. Que 
tesouro tenho eu aqui expressado em poucas palavras; que coração você 
teria se apenas fosse possuído viva e sensivelmente de tudo o que está 
contido nestas uma ou duas páginas! Você não invejaria a glória do maior 
príncipe desta terra, nem trocaria de posição com nenhum homem que 
fosse estranho a estas coisas. Se você apenas considerasse o estado dos 
santos, como poderia continuar no pecado e demorar-se tanto em voltar-se 
para Deus? Certamente esta consideração poderia mudar os seus valores. 
6.A próxima parte da sua meditação deveria ser na obra graciosa e 
maravilhosa da nossa redenção, nos meios e recursos que são providos para 
a sua alma, e nos termos pelos quais a salvação pode ser obtida. 
Apesar de todos os pecados que tem cometido, você não deve se entregar 
ao desespero; o Senhor não o deixaria sem solução. A sua salvação e 
conversão não é algo impossível. Não! Tanto já foi feito por Cristo, que a 
sua salvação foi colocada ao alcance de suas mãos. Um novo e vivo 
caminho é consagrado a nós por Cristo através do véu da Sua carne, e 
através do Seu sangue podemos ter ousadia para entrar no Santo dos 
Santos. Ele suportou seu fardo, e lhe oferece, em seu lugar, o fardo dEle, 
que é leve. Ele removeu a impossibilidade e encravou na Sua cruz o 
inscrito de dívida que era contra você, e em lugar dele lhe oferece o seu 
jugo suave. Ele despojou os principados e potestades, que lhe haviam feito 
cativo, e também triunfou sobre eles na cruz. Você não é deixado com o 
dever de justificar-se diante de Deus pelos seus próprios pecados, mas 
apenas de aceitar o Redentor que os justificou. Eu ouso lhe dizer tudo isso 
confiantemente, sem que esteja estendendo demasiadamente os Seus 
benefícios. Seria por falta de fé, e não por insuficiência da satisfação do 
Redentor, se qualquer pessoa viesse a perecer. Oh, quão livre são as Suas 
ofertas! Quão plenas são as suas promessas! A condição que lhe é imposta 
não se trata de uma obra meritória ou mercenária, mas a aceitação dos 
benefícios dados gratuitamente, de acordo com sua natureza, uso e fins. 
Esta é a fé através da qual você deve ser justificado; estes são os termos nos 
quais você pode ser salvo. 
Além disso, o Senhor proveu meios, sim, excelentes, copiosos, e poderosos 
meios para auxiliarem a sua alma no cumprimento dessa condição, 
ajudando-o a crer e a arrepender-se, a fim de que você possa viver. Se o 
espírito não tornar esses meios efetivos, e não adicionar Sua graça especial, 
e por fim você não vier a se converter, não será por culpa do Espírito, mas 
por sua própria culpa. Desse modo, você pode perceber em que 
esperançosa situação ainda se encontra, por causa do sangue do seu 
Redentor. Se você não destruir sua própria esperança através de 
impenitência deliberada e recusa da livre graça de Deus, quanta chance 
ainda tem de se qualificar para os Céus; e que feliz oportunidade tem para 
ser salvo! A salvação é até trazida à sua porta; ela é como que enfiada nas 
suas mãos. O Redentor já fez tanto por você, 
ao ponto de colocar a Sua salvação ao seu alcance da sua própria vontade; e 
se você for Seu escolhido, Ele também operará o querer. 
Você tem preceitos para crer, tem ameaças se não crer, tem promessas 
sobre promessas, e o próprio Cristo lhe oferece perdão, vida e salvação, se 
você apenas o quiser verdadeiramente e de coração. Você tem o próprio 
Deus condescendendo a rogar que você O aceite, e embaixadores que O 
representam, admoestando-o em Seu nome. Você tem ordenanças 
apropriadas às suas necessidades, tanto a leitura como a pregação, os 
sacramentos e a oração. Você tem abundância de livros francos e 
poderosos; você tem os piedosos ao seu redor, muito desejosos em assistí-
lo, e que ficariam felizes em ver e ouvir a respeito da sua conversão. Você 
tem também a visão dos ímpios, que estão se revolvendo nas suas próprias 
impurezas, assim como do mundo, para fazê-lo odiar tais caminhos ímpios. 
Você tem razão e consciência dentro de si para considerar tais assuntos; 
meditar neles, e aplicá-los a si mesmo. Você tem tempo e vigor para fazer 
tudo isto; a não ser que os desperdice, e provoque Deus a retirar todos estes 
recursos por causa da sua negligência. 
Você tem muitos tipos de misericórdias, internas e externas, para que saia 
vitorioso, e seja encorajado a agir; e, às vezes, experimenta também 
algumas aflições para lembrá-lo, despertá-lo e estimulá-lo. O diabo e todos 
os demais inimigos seus estão tão incapazes, que não podem destruí-lo 
contra a sua vontade, nem mantê-lo longe de Cristo; a não ser com o seu 
próprio consentimento. Os anjos nos Céus estão prontos para ajudá-lo, e até 
se regozijariam na sua conversão. 
Esta é a sua situação; estes são os auxílios e encorajamentos; você não está 
entregue ao desespero. Deus nunca lhe disse que é vão meditar na 
conversão, ou que é tarde demais. Se alguém lhe disse, foi o diabo e não 
Deus. É de se esperar que tais considerações façam com que você leve a 
mão 1a cabeça, e sejam efetivadas para movê-lo a uma resolução e 
mudança. 7. A última coisa que eu colocaria diante de você para ser 
considerada é: Qual será o seu fim, se apesar de tudo isso você vier a 
morrer sem estar convertido. 
O seu coração não está habilitado a conceber tal coisa, nem a língua de 
nenhum homem mortal é capaz de manifestá-la. Mas só o tanto que 
podemos com certeza manifestar, já é de se esperar que faça seu coração 
temer. É possível que você já tenha visto um homem à beira da morte; com 
que tormento e agonia ele se separa da sua alma. Você já deve Ter visto 
também como fica o corpo que é deixado para trás, e como é colocado na 
terra comum. Mas você não vê o que acontece com a alma, nem qual é o 
seu aspecto no outro mundo, nem que tipo de companhia tem ela, ou para 
que lugar ou estado ela passou. Quando houver chegado a hora em que este 
for o seu próprio caso, será despertado em você outro tipo de sentimento 
diferente do que você tem ou pode ter ao ler estas palavras. É espantoso 
que tão pouca distância nos torne tão insensível quanto aquela mudança 
que todos nós com certamente viremos a experimentar. Ainda assim, 
devido à loucura e amortecimento do nosso coração é isto o que acontece. 
Mas o tipo de pensamento que você terá sobre estes assuntos tão 
importantes, uma hora após a morte, será bem diferente do que os 
sentimentos mais vivos que venha a conceber por antecipação. 
A miséria em que o Redentor o encontrou, a qual você merecia por causa 
dos seus pecados contra a lei do seu Criador, foi grande. Mas, se por fim, 
você for encontrado inconverso, a sua punição será muito mais dolorosa, e 
a sua situação muito pior do que era anteriormente. A lei ou o Evangelho 
do Redentor tinha suas advertências peculiares, as quais diferem da lei do 
mero Criador em diversos aspectos. 1. Quanto à natureza da punição, que 
redundará em tormentos de consciência para aquele que negligenciar o 
Redentor e a Sua graça recuperadora, os quais você nunca sentiria se jamais 
lhe tivesse sido oferecida à redenção. 2. Quanto ao grau de punição, que 
será muito mais doloroso. E, 3. Quanto à sua irremediabilidade, visto que a 
sentença é irreversível e peremptória. 
É verdade que a primeira lei não provia remédio, mas também não excluía, 
nem fazia a salvação impossível. Mas, a lei de Cristo positiva e 
expressamente exclui todo remédio, e deixa a alma que sai do corpo não 
convertida em completo desespero e miséria, sem ajuda ou esperança. Mas 
eu não me demorarei aqui em escrever os terrores do julgamento ou do 
inferno, por que já fiz isto em outros livros, os quais eu desejo que 
você compare com o restante desta meditação; quais sejam, o meu Tratado 
sobre o Julgamento, e o início da terceira parte do Descanso Eterno dos 
Santos. 
Como Meditar 
Tendo lhe falado sobre as coisas que deveriam ser o assunto da sua 
meditação, eu lhe falarei a seguir, brevemente, de que maneira você deve 
fazer isso. Eu não me demorarei em prescrever-lhe nenhum longo ou exato 
método de meditação, tanto porque isto não estaria de acordo com a minha 
intenção de brevidade, como porque as pessoas com as quais eu agora estou 
tratando não seriam capazes de observar tais regras. Se alguém desejar este 
tipo de ajuda pode transferir os conselhos que são oferecidos sobre outro 
assunto no meu livro sobre o Descanso, para o assunto que trataremos 
agora. 
1. Não espere que tais pensamentos venham por si mesmos à sua mente, 
mas disponha-se propositadamente a considerar estes assuntos. Tome 
algum tempo para chamar sua alma para considerar o seu presente estado e 
sua preparação para a eternidade. 
Se um ímpio, Sêneca, podia obrigar-se cada noite a prestar contas a si 
mesmo elo mal cometido, e pelo bem a que se omitiu no dia findo, como 
ele declara que fazia cotidianamente, por que, mesmo um homem não 
convertido, que dispõe dos incentivos que agora encontra em nosso meio, 
não pode meditar sobre o estado da sua alma? Mas eu sei que um coração 
carnal é excessivamente avesso a considerações sérias, e detesta ser 
incomodado com tais pensamentos. Além disso, o diabo fará o que puder 
para impedi-lo, pessoalmente ou por intermédio de outros. Mas, se pelo 
menos os homens fizessem o que está ao seu alcance, a situação poderia ser 
bem melhor do que é. Está você disposto a, pelo menos aqui e ali, se retirar 
deliberadamente das demais companhias para um lugar isolado, e ali 
colocar o Senhor diante dos seus olhos, e convocar a sua própria alma a 
uma estrita prestação de contas sobre os assuntos que eu acabo de 
mencionar, e dedicar-se a exercitar a sua razão sobre estes assuntos? Está 
você 
disposto, quando for 
à igreja 
para ouvir, a obrigar-se 
propositadamente a este dever de meditação como algo realmente 
necessário? 
2. Ao meditar sobre estas coisas, esforce-se para despertar sua alma, e para 
ser muito sério em todos os seus pensamentos. 
Não medite sobre estes assuntos da salvação do mesmo modo que o faria 
ao meditar sobre um assunto ordinariamente trivial, o qual você não 
considera ou dá importância; mas lembre-se de que a sua vida depende 
disso, e até mesmo a sua vida eterna. Assim, evoque os seus mais sinceros 
pensamentos, e desperte todos os poderes da sua alma, e não permita que 
eles fujam,mas ordene-os à ação; então, coloque os diversos pontos que eu 
mencionei diante de você, e, quando pensar sobre eles, esforce-se para ser 
afetado por eles em algum grau, conforme sua suma importância. Assim 
como Moisés disse a Israel 'aplicai os vossos corações a todas as palavras 
que hoje testifico sobre vós, para que ordeneis a vossos filhos que cuidem 
em cumprir todas as palavras desta lei. Porque esta palavra não é para vós 
outros cousa vã, antes é a vossa vida' (Dt 32:46;47). E assim como Cristo 
disse, 'Fixai nos vossos ouvidos as seguintes palavras...' (lc 9:44), assim 
eu lhe digo: deixe que estes 
assuntos sobre os quais você pensar penetrem no seu coração e sejam 
profundamente enraizados, a fim de que vivifiquem os seus sentimentos. 
E se o seu coração escapulir desta obra, e outros pensamentos rastejarem 
para dentro da sua mente, e você se enfastiar dessas considerações antes 
que elas realizem sua obra em você, atente para que não se entregue à 
preguiça ou má vontade, mas lembre-se que está é uma obra que precisa ser 
realizada, e assim mantenha seus pensamentos nestas coisas até que o seu 
coração seja comovido e aquecido dentro de você. 
E, se apesar de tudo, você não conseguir despertar seus pensamentos à 
seriedade e sensibilidade, coloque para si mesmo duas ou três destas 
despertadoras questões: 
(1) O que aconteceria com o meu corpo, meu estado, ou nome, se eu não os 
considerasse diligentemente? Se alguém apenas me prejudicar, quão 
facilmente posso meditar nisso, e quão prontamente eu o sinto; e quão 
facilmente eu esqueço! Se o meu bom nome for desonrado, e eu for 
desgraçado, eu posso pensar nisso noite e dia. Se eu perder uma 
propriedade, ou tiver algum sofrimento no mundo e vier a experimentar a 
decadência, eu posso pensar a respeito com grande sensibilidade. Se eu 
perder um filho ou um amigo, eu poderei tanto sentir como pensar sobre 
isso. Se a minha saúde declinar, e a minha vida estiver em perigo, eu estarei 
bem disposto a pensar seriamente. Não deveria eu pensar com igual 
seriedade sobre os assuntos concernentes à vida eterna? Não deveria pensar 
eu sóbria e diligentemente nestas coisas, quando o corpo e a alma estão em 
jogo, e quando o assunto diz respeito ao meu gozo ou tormento eterno? 
(2) O que aconteceria se eu apenas ouvisse o próprio Filho de Deus me 
convocando a arrepender-me e a ser convertido, concluindo a Sua 
exortação com a seguinte expressão: 
'Aquele que tem ouvidos para ouvir, ouça'? Isto não me levaria a sérias 
considerações sobre o meu estado? Por que, então, que isto que Ele fez 
quando estava no mundo, e que continua a ser feito pelos seus 
embaixadores, não deveria levar-me à séria consideração? 
(3) O que aconteceria se eu soubesse que a morte esta às minhas costas e 
pronta para me arrastar, e que eu estaria no outro mundo daqui a menos de 
uma semana? Eu certamente começaria a considerar estas coisas com 
empenho. Por que, então, eu não faço isto agora, que sei que não posso 
controlar uma hora sequer do curso da minha vida, e que é certo que dentro 
de pouco tempo esta hora virá? 
(4) O que aconteceria se os meus olhos apenas fossem abertos para ver 
aquilo que eu digo crer, e que é certamente verdadeiro? Sim, se me fosse 
dado um vislumbre da majestade do Senhor, e eu pudesse ver os santos em 
alegria e glória, e ver as almas perdidas em miséria, e se ouvisse suas 
lamentações, não induziria o meu coração à meditação? Oh, com que 
diligência eu não pensaria então nestas coisas! Porque eu não faço isto 
agora, visto que estas coisas são tão certas como se eu as estivesse vendo, e 
visto que muito em breve eu as verei? 
Muitas outras questões despertadoras como estas estão à disposição, mas eu 
toquei apenas brevemente nestas coisas que são as mais comuns e óbvias, e 
que mesmo os mais ignorantes destas realidades estarão habilitados a delas 
fazer uso. Com tais pensamentos você pode dar partida ao seu coração 
negligente, sacudi-lo da sua insensibilidade, e despertar seus pensamentos à 
ação. 
3. Motivações para Meditar 
Quando você houver levado o seu coração à seriedade, certifique-se de 
prosseguir na sua consideração at'w chegar a uma resolução. Não pare no 
meio, ou antes, de trazer o assunto a um resultado, mas permita que tudo 
seja feito com um objetivo prático. Quando você estiver meditando sobre 
as excelências de Deus e do mundo por vir, e compará-las com os prazeres 
da terra, faça a seguinte pergunta ao seu coração: 'O que é que tu dizes 
agora, ó minha alma; qual destes é melhor para ti? Qual é o mais desejável; 
e qual tu proferes? Decide-te então, e faz a tua escolha de acordo com a luz 
e convicções que recebestes '. Quando você estiver pensando a respeito das 
razões que deveriam impedi-lo a ser convertido, pergunte a si mesmo: 'É a 
minha decisão firme, ou não? 'E se o for, por mais firme que seja, escreva-
as com as suas próprias mãos ou, pelo menos, em seu coração: ' Eu aqui 
confesso, diante do Senhor, que os Seus mandamentos são justos, os Seus 
atos razoáveis, Suas ofertas excessivamente misericordiosas. Estou 
convicto de que o melhor para mim é tornar-me rapidamente para Ele de 
todo o meu coração.Confesso diante dEle que não tenho argumento em 
contrário Este portanto, é o meu próprio julgamento, disso estou 
convencido; se não me voltar para Ele depois de tudo isso, a luz que está 
em mim, e o discernimento que agora possuo, necessariamente serão uma 
testemunha contra a minha alma'. 
Se você levar adiante o caso a uma resolução das suas convicções, você 
terá uma grande vantagem para mover a sua vontade à determinação, o que 
é a próxima coisa que você deve fazer. A seguir, portanto, pergunte a si 
mesmo: 'Por que não deveria eu decidir, e decidir resolutamente, a voltar-
me a Deus sem demora alguma? O caso não está claro diante de mim? Que 
argumentos tenho eu para ainda ficar questionando o assunto, e não querer 
se feliz? Provocarei eu a Deus, brincando com Ele e pondo em risco a 
minha alma, desperdiçando 
meu tempo em tal estado miserável? Não! Pela graça de Deus tornarei para 
Ele, agora mesmo e sem demora'. Portanto, prossiga com suas 
considerações até uma resolução. 
A essa altura você já deve ter reconhecido a necessidade deste dever de 
meditação, e como ele precisa ser realizado, a fim de que você possa levar 
adiante a sua conversão. Entretanto, visto que o assunto é de grande 
necessidade, eu estou relutante em deixá-lo como está, até que tenha feito 
tudo o que é possível para persuadi-lo a praticá-lo. Com este fim, eu lhe 
rogo que medite nas seguintes motivações: 
1. Meditação é um dever que, se quiser, você pode cumprir. Você não pode 
dizer que a meditação está totalmente fora da sua capacidade; deste modo, 
você é deixado sem desculpa se não for persuadido a esta prática. Você diz 
que não pode converter a si mesmo; entretanto, você não pode dispor-se a 
'considerar os seus caminhos', e pensar sobre aquelas verdades que seriam 
os instrumentos da sua conversão? Os seus pensamentos estão parcialmente 
sob o comando da sua vontade; você pode dirigi-los para uma ou outra 
coisa. Mesmo um ministro não santificado, o qual não tem prazer salvífico 
nas verdades espirituais, pode pensar sobre elas, e gastar a maior parte do 
seu tempo meditando nelas, a fim de que possa pregá-las a outros. Por que 
então não pode você mesmo voltar os seus pensamentos para estes 
assuntos? Você pode pensar sobre casa, terra, amigos, comércio e sobre 
qualquer outra coisa que o aflija, ou sobre qualquer coisa que queira, que 
ame, ou que pense que venha fazer-lhe bem. E por que então não pode 
você pensar em seus pecados e riscos, sobre Deus, sobre Suas palavras e 
obras, sobre o estado de sua alma e sobre a vida eterna? Não está você em 
considerar estes assuntos por você mesmo? Não está você habilitado, 
quando sozinho na sua cama, ou quando está viajando, ou trabalhando, a 
pensar como estão as coisas com a sua alma? Por que não estaria você 
habilitado a isto? O que poderia impedi-lo desta prática se você apenas o 
quisesse? 
2. A meditação é um remédio tão barato, que se você não fizer uso dela, é 
porque despreza a sua alma. Sim, você despreza o próprio Senhor e as 
coisas eternas, às quais é chamado a considerar. Um homem que está em 
perigo de perder seus bens, sua saúde ou sua vida, e não fizer o máximo 
que ele pensar ser um remédio, certamente despreza estas coisas'e as 
perderá devido à sua negligência. Um homem que tiver a sua casa pegando 
fogo e não pensar o máximo que puder em como apagá-lo, merece que a 
casa venha a ser queimada. Se os seus pais, ou filhos, ou amigos estiverem 
em perigo, e você não se der ao trabalho de pensar neles, isso seria um sinal 
de que você não lhes dá valor.E então: não é a sua alma valiosa o suficiente 
para merecer a sua consideração? E você ainda finge hipocritamente que 
ama a Deus mais do que tudo, quando nem sequer medita seriamente 
nEle.Como pode você demonstrar maior desprezo sobre alguma coisa, do 
que tirá-la da sua mente como algo indigno de ser meditado? E como você 
pode de modo mais evidente mostrar que despreza Deus e os Céus agindo 
assim? Se alguma coisa não é digna de ser meditada, ela não vale nada. 
3. Considere que o próprio Deus não colocou tão pouco valor na sua 
salvação. Ele a considera muito mais. É correto que Cristo considere a sua 
salvação digna do Seu sofrimento de sangue, e de uma vida de labor e 
dores, enquanto que você não a julga algo digno das suas sérias 
considerações? Se Ele não tivesse pensado e repensado na sua salvação, 
quão miserável você teria permanecido. Os ministros também pensam 
sobre ela e dedicam-se a como salvar sua alma. E não deveria você dedicar-
se a como salvar a sua própria? É correto que outro homem faça disso o 
objetivo de sua vida, o pensar em como lhe fazer o bem, a fim de que você 
seja salvo, enquanto você não se obriga a fazer o bem a si mesmo?. Sim, 
todos os que temem a seu respeito diante de Deus estão empenhados para o 
seu bem; e não deveria estar você meditando sobre as coisas que dizem 
respeito ao seu próprio bem? 
4. Além disso, para que é que você tem uma mente a não ser para pensar? E 
em que difere você dos outros animais, do que em possuir uma razão? Se 
você tem uma razão e não fizer uso dela, se brutificará, e viverá como um 
louco; pois o que é a loucura, senão uma perda do uso da razão? Você acha 
insignificante desfigurar tão nobre criatura como o ser humano, 
transformando a si mesmo em um animal ou um louco? Você acha que 
Deus não lhe pedirá contas da sua razão, de como você a usou? 
Indubitavelmente, Ele a deu a você para o uso mais elevado do que para 
habitá-lo a arar a terra, semeá-la, realizar os seus negócios, e fazer 
provisões para a sua carne. Se isso fosse tudo em que o homem excedesse a 
um animal, que tola e desgraçada criatura ele seria! Sim, muito mais 
miserável do que os animais, visto que seu conhecimento lhe gera muito 
mais cuidados, dores e temores do que o deles. Que aproveitaria afinal ter 
uma razão, se não fosse para poder usá-la para meditar em Deus e na vida 
eterna? 
5. Além disso, a sua alma é um princípio ativo que estará operando de um 
modo ou de outro; seus pensamentos estarão sempre fluindo para uma ou 
outra coisa; e assim, portanto, a simples meditação não é grande tarefa para 
você. Se você tem necessariamente que colocar seus pensamentos em 
alguma coisa, não é melhor colocá-los nessas coisas do que em quaisquer 
outras? Tem você algo melhor para pensar do que isto? Têm você assuntos 
mais importantes ou necessários para meditar? Você não pode imaginar 
algo mais importante; ou pelo menos, se o pudesse, teria vergonha de dizer. 
Isto faz com que a sua irreflexão seja um pecado indesculpável. 
Se a meditação for um peso para você, qualquer outra coisa também o será. 
Todavia, visto que precisa pensar em alguma coisa, porque não pensar em 
Deus, no seu estado eterno, e no caminho para o Céu, assim como nos 
demais assuntos dessa natureza? Preferirá você jogar fora os seus 
pensamentos do que permitir que Deus se apodere deles? Se um homem 
ordenar a um servo seu que é coxo a fazer alguma coisa, ele tem uma boa 
desculpa: 'Eu não posso atender, do contrário, poderei vir a sentir muita dor 
ou colocar em risco a minha saúde'. Entretanto, se um homem tem um filho 
ou um servo tão inquieto que não pode ficar parado, mas passa todo o seu 
tempo correndo para cima e para baixo, dançando e pulando, esta pessoa 
não tem desculpa se recusar-se a levar um recado de seu pai, visto que fica 
vagando segundo a sua vontade, mas não dá alguns passos quando lhe é 
pedido; especialmente se fosse pela sua própria vida ou bem estar. Assim 
visto que seus pensamentos não ficarão inativos, mas vaguearão pelo 
mundo, e apesar disso você não pensa em Deus e nos assuntos 
concernentes a sua paz, quão obstinada é você! 
Se você pedisse carne, bebida ou dinheiro a alguém que não tem, ele bem 
poderia negar-lhe. Mas se você pede estas coisas a alguém que tem em 
abundância e não sabe o que fazer com elas, e constantemente as 
desperdiça ao invés de dá-las a você, o que pensaria você de tal pessoa, 
especialmente se tratasse de um servo seu ou um filho que tanto lhe deve? 
Assim faz você com Deus e com a sua própria alma. Você tem 
pensamentos suficientes para desperdiçar, e não sabe o que fazer com eles. 
Ainda assim, ao invés de gastar uma hora no dia ou na semana em séria 
consideração sobre o estado da sua alma e sobre a vida por vir, você os 
desperdiça com notícias, novelas, e outras ocupações populares que não lhe 
dizem respeito. Sim, você atira os seus pensamentos numa fossa de 
avareza, malícia, lascívia, devassidão, tornando-os servos do Diabo e da 
carne. 
Se você tem um riacho correndo nas imediações da sua terra, você se 
esforçará para fazê-lo passar por ela, pois, tendo em vista que o riacho tem 
que correr de qualquer modo é melhor que corra pelo caminho em que 
possa trazer algum proveito, do que em vão. Assim também, visto que os 
seus pensamentos têm que fluir de qualquer modo, não é melhor fazê-los 
correr para o seu próprio coração e estado, a fim de que possa se preparar 
para o mundo em que breve estará ingressando, ao invés de deixá-los correr 
em vão? Se você vir um homem entrando em uma adega, ainda que seja 
dele próprio, e abrir as torneiras, deixando que o vinho se derrame pelo 
chão, e não permitindo que ninguém o detenha ou faça o melhor para evitar 
tal coisa, o que penaria você da sabedoria e caridade desse homem? Os 
seus pensamentos são muito mais preciosos do que i vinho, e não deveriam 
ser desperdiçados; todavia, não é esta a sua prática diária? Você está diante 
dAquele que conhece os seus pensamentos; negue isto se puder. A que hora 
do dia alguém pode ir a você e encontrá-lo pensando em absolutamente 
nada? A que minuto de qualquer hora pode alguém perguntar-lhe, 'Em que 
você está pensando agora?', que você possa, com sinceridade, responder: 
'Em nada!'. Eu sei que, uma vez acordado, você sempre estará pensando em 
alguma coisa, e talvez, até mesmo quando está adormecido. Em que você 
pensa, afinal? O seu corpo merece seus pensamentos; outras pessoas 
merecem os seus pensamentos; cada palavra que ouve, cada coisa errada 
que faz, e quase qualquer coisa que ponha os olhos merecem seus 
pensamentos; mas deus e a sua 
própria salvação não merecem nenhum. Aí está: você desperdiça seus 
pensamentos deixando-os correr em vão, não os usa apropriadamente, nem 
retira deles real proveito para si próprio. 
6. Tem você qualquer outra coisa que mereça mais a consideração do que 
Deus e a sua salvação? Certamente Deus tem mais direito aos seus 
pensamentos do que qualquer outra coisa que possa ocupar por sua mente. 
Sua carne, seus amigos, seus negócios seculares não são assuntos tão 
dignos, nem tão necessários, nem tão proveitosos quanto o são Deus e os 
Céus. Assim como a mais proveito a ser extraído de uma lavoura de terra 
frutífera do que do mato árido, ou em cavar uma mina de ouro do que em 
uma barreira, assim também a mais prazer e proveito a ser extraído em uma 
hora de considerações sérias sobre a sua salvação, do que em pensar a sua 
vida toda sobre o mundo. 
7. Eu penso que você deveria pelo menos meditar em quão desproporcional 
e desigualmente despende os seus pensamentos. Pode você negar a Deus 
um décimo, ou mesmo um centésimo dos seus pensamentos? Atente para o 
curso de sua vida, investigue os seus pensamentos dia após dia, e diga-me 
quantas horas em um mês, em um ano, você gastou em pensamentos sérios 
sobre o estado da sua alma e sobre a vida por vir? Gastou você uma hora 
em cem, ou em mil, ou em dez mil? Não! Eu tenho razões para temer que 
há alguns, sim, muitos, talvez a grande maioria, que nunca gastou uma hora 
desde que nasceu a meditar muito seriamente tendo-se retirado proposital 
e sobriamente de toda e qualquer outra atividade sobre o estado em que se 
encontram, sobre que evidências têm salvação, ou em como devem ser 
justificados diante do tribunal de Deus; ou, ainda, sobre que propósito têm 
no mundo, para que existem, ou como têm feito a obra para a qual foram 
criados. 
A sua consciência o justifica quanto a isto, ou ela atormentá-lo-á dia após 
dia a lembrar-se dessas coisas? O que?! Atua terra, tua vida, e as questões 
deste mundo merecem todos os teus pensamentos, e a salvação da tua alma 
não mereceu nem alguns deles? A luxúria, os esportes e a frivolidade 
mereceram todos, e Deus não mereceu nenhum? Estas coisas não foram 
dignas de uma hora, pelo menos de vez em quando, do teu tempo? Não?! 
Nem mesmo uma hora em toda atua vida para meditares seriamente como 
obter uma vida de gozo e glória infinitos, e em como escapar das chamas 
do inferno? 
Você deve confessar, pelo menos em terror de alma, que esta não é uma 
distribuição equilibrada dos seus pensamentos. 
8. O objetivo da sua vida e das advertências no presente tempo é que você 
possa considerar e preparar-se para o seu estado eterno. O que tem você a 
fazer na terra, senão meditar em como alcançar os Céus. Oh, se você 
compreendesse que grande misericórdia tem diante de si em apenas dispor 
de tempo para meditar sobre isso, e fazer sua eleição firme, antes que entre 
em uma vida interminável! Se você estivesse determinado a partir 
subitamente esta noite, e o anjo do senhor lhe dissesse; 'Prepare-se, pois 
nesta mesma hora você morrerá, e terá que comparecer diante do Deus 
vivo', não clamarias então: 'Oh, não tão subitamente, Senhor! Dá-me um 
pouco mais de tempo para que considere sobre a minha condição; dá-me 
mais um mês, para que medite no estado da minha alma, e venha a 
certificar-me de que estou justificado da culpa dos meus pecados. Dá-me 
pelo menos mais um dia para que me prepare para o meu estado eterno; 
porque, ai de mim, ainda estou despreparado!...'Não seria este o seu clamor, 
se Deus o chamasse para partir agora? No entanto, agora você dispõe de 
tempo, mas não se prepara, meditando nestes assuntos. 
9. Além disso, não é tempo de você considerar os seus caminhos, visto que 
Deus os considera? Se você se esquecer dos seus caminhos, ou 
desconsiderá-los, estaria você mesmo considerando-os desprezíveis. 
Entretanto, esteja certo de que, quer você considere os seus caminhos quer 
não, deus os considera. Ele lembra-se dos seus caminho, embora você deles 
se esqueça. Você não sabe que todos os pecados de sua vida ainda estão 
registrados diante do Senhor? Jó disse: 'Tu contas os meus passos; não 
levarias em conta os meus pecados? A minha transgressão está selada num 
saco, e terias encoberto as minhas iniqüidades' (Jó 14:16,17). Você pensa 
que Deus se esquece dos seus pecados, como você o faz? Disse o Senhor 
pelo profeta Oséias: 'Não consideram no seu coração que eu me lembro de 
toda a sua maldade; agora; pois, os seus próprios erros os cercam: acham-se 
diante da minha face' (Os 7:2). 
Mas você dirá: Por que Deus considera os nossos caminhos? Certamente 
não é sem razão alguma, visto que o mal está sempre próximo se não for 
evitado. Conforme disse o Senhor, 'Não está isto guardado comigo, selado 
nos meus tesouros? A mim pertence à vingança, a retribuição, há se tempo, 
quando resvalar o seu pé: porque o dia da calamidade está próximo, e o seu 
destino se apressa em chegar'(Dt 32:34,35). 
Se Deus está registrando os seus pecados, tu tens razão para tremer, ao 
pensar o que isto pressagia; pois nesta'tua dureza e coração impenitente 
acumulas contra ti mesmo ira para o dia da ira e da revelação do justo juízo 
de Deus'(Rm 2:5). Assim como a graça é a semente da glória, assim 
também o pecado é a semente da vergonha, aflição, e tormento eterno. 
Embora a colheita possa parecer ainda distante, tu provarás, no final, os 
frutos mais amargos; e o que quer que tenhas plantado, isto colherás. 
10. Além disso, se qualquer coisa o aflige, você espera que 
Deus 
prontamente o atenda, ou se você precisa de alguma coisa, você acha que 
Ele deveria suprir suas necessidades; no entanto, não deveria você 
considerá-lO, e as suas próprias necessidades? 
Quando se encontra em dificuldades, você clama a Deus: 'Tem misericórdia 
de mim, ó Senhor; considera as minhas dificuldades; considera e ouve-me, 
ó Deus. 'Quando está atormentado com dores e doença, você clama a Deus: 
'Considera as minhas aflições, e livra-me. 'Se você for oprimido e 
maltratado, gemerácomo os Israelitas sob as mãos dos seus capatazes, e 
talvez venha clamar a Deus, como o povo cativo: 'lembra-te, Senhor, do 
que nos tem sucedido; considera, e olha para o nosso opróbrio' (lm 5:1). 
Entretanto, deve Deus considerá-lo, visto que você não O considera, nem a 
sua própria alma? Ou não deveria você antes esperar aquela terrível 
resposta, a qual Ele dá a tais pecadores negligentes; e que Ele ouça os 
clamores de vocês como vocês ouvem os Seus conselhos, e que pense em 
vocês assim como vocês pensam nEle? Sim, mas isso não acontece. Mesmo 
quando você se esquece dEle, o Senhor diariamente o considera, supre suas 
necessidades, e salva-o dos perigos; e deveria você expulsá-lO de seus 
pensamentos? Se Ele não pensasse em você, logo você perceberia, para o 
seu mal e tristeza. 
11. Ademais, é de se esperar que a natureza do assunto deveria forçar uma 
criatura racional a considerá-lo, e a fazê-lo freqüente e diligentemente. 
Visto que tudo o que foi dito contribui para que o assunto da sua salvação 
venha a ser considerado, aquele que não o fizer deve ser um tolo ou um 
louco. Este é o maior e mais excelente assunto em todo mundo; este é um 
assunto que é nosso, visto que diz respeito a nós mesmos; este é o assunto 
mais necessário, proveitoso e deleitável; mas este é também o assunto mais 
difícil a ser considerado, e que envolve maior perigo de vê-lo fugir. Este é 
o assunto da sua salvação. 
(1) Se você não pensar em Deus, na sua alma, nos Céus, e no Inferno, em 
que, então, pensará? Todos os demais assuntos no mundo são apenas 
brincadeiras e gracejos comparados com estes. Coroas, reinos, terras e 
domínios são apenas restolho e ninharias comparados com estas questões 
eternas. As proezas de renomados reis e conquistadores são apenas 
brinquedos de marionetes em comparação com o desenvolvimento da sua 
salvação. Ainda assim não será você levado à consideração de coisas tão 
espantosas como estas? 
Seria de esperar que a excelência do assunto viesse a forçar você a 
considerá-lo, quer o faça ou não. Quando coisas menores não afetam os 
sentidos, as mais importantes forçam seu caminho. Aquele que tem apele 
tão dura que não pode sentir uma pluma, deveria, parece-me, sentir o peso 
de uma pedra de moinho; e se ele não sente a picada de um inseto, deveria, 
penso eu, sentir uma adaga. Aquele que não pode ouvir um sussurro, 
deveria, eu acho, ouvir um canhão, ou um estrondo de trovão, se é que 
ainda tem alguma coisa da sua audição funcionando. Um homem neste 
estado está tão ruim da vista que não pode ver o sol. Seria de esperar que 
algo tão glorioso como Deus, viesse a atrair os olhos dos homens, de 
modo que não os desviassem dEle. Seria de esperar que tais assuntos como 
o Céu e o Inferno viessem a acompanhar os teus pensamentos para onde 
quer que fossem, de modo que não pudessem olhar além deles, ou pensar 
em quase qualquer outra coisa, sem que agisse com negligência e 
desconsideração. Oh, quão terrível é um coração de pedra, que pode 
esquecer não apenas o Deus através do qual vive, como também o lugar 
onde deverá viver para sempre! Sim, quão terrível é um coração que não 
se deixa persuadir a uma consideração séria destes assuntos por uma hora. 
(2) Visto que estes assuntos são os mais importantes e relacionados com 
você mesmo, seria de esperar que não necessitasse de tanta ajuda para fazê-
lo considerar neles. Se estes assuntos não lhe dissessem respeito, eu não 
deveria me admirar que você não os considerasse; mas o amor próprio 
deveria fazê-lo considerar estes assuntos que dizem respeito a você mesmo. 
Quando se trata de coisas exteriores, todos procuram os seus interesses. 
Não teria você mais razão para buscar a sua própria salvação? Trata-se da 
sua própria alma, do seu próprio perigo, dos seus próprios pecados, dos 
seus próprios deveres que eu o estou persuadindo a considerar. Deus e 
Cristo podem ser seus; os Céus e uma abençoada condição podem ser seus, 
se você, por negligência não os perder; neste caso, então, o inferno e os 
tormentos serão certamente seus, se você não evitá-los. Não deveriam estas 
coisas serem meditadas? Você pensará nos seus próprios bens, terras ou 
riquezas; na sua própria família, negócios e vida; e porque não na sua 
própria salvação? 
(3) Além disso, o assunto não apenas diz respeito a você mesmo, mas trata-
se de algo extremamente necessário. Trata-se de assuntos dos quais 
dependem a sua vida ou a sua morte, a sua alegria ou tormentos 
eternos.Deste modo, eles devem ser considerados, ou você estará perdido 
para sempre. Miséria e desgraça o aguardam se você não considerar estas 
coisas. Comer, beber, dormir, viver, não são tão necessários quanto se 
certificar da sua vida eterna; e o proveito será correspondente à 
necessidade. Não cumpre mais nada, exceto esta pérola, e você será 
extremamente beneficiado, mesmo que seja obrigado a vender tudo o que 
tenha no mundo para comprá-la. Consiga a Deus, e terá conseguido 
tudo.Certifique dos Céus, e então não temas perdas, nem necessidades, nem 
tristezas. Se você não considerar o mundo inteiro como poeira para ganhar 
a Cristo, ser encontrado nEle, e apossar-se da Sua justiça, é porque não 
conhece nem o mundo nem Cristo. Sim, pois o deleite também 
corresponderá à comodidade, pois, 'na Tua presença há plenitude de 
alegria, na Tua destra delícias perpetuamente'(Sl 16:11). E a antecipação 
dessas coisas podem bem 'alegrar o nosso coração, e fazer com que a nossa 
glória se regozije'. 'Bondade e misericórdia certamente me seguirão todos 
os dias da minha vida; e habitarei na casa do Senhor para todo o sempre'(Sl 
23:6).'Tu me guias com o Teu conselho, e depois me recebes na glória'(Sl 
73:24). E para que você não venha a suspeitar da insuficiência do Seu 
conforto, Ele lhe diz que você 'entrará no gozo do seu Senhor'(Mt 25:21), e 
que estará com Ele aonde Ele estiver para contemplar a Sua glória (Jo 
17:24). 
(4) E ainda assim, se tudo isso pudesse ser obtido com facilidade, se o Céu 
fosse a porção de mundanos e preguiçosos, que quase não incomodam seus 
pensamentos quanto a isto, então você poderia ter alguma desculpa para a 
sua irreflexão. Mas não é assim; há 0 dificuldades no seu caminho; 
muitas e grandes dificuldades. 
Que entendimento obscurecido você tem que iluminar, que natureza 
estúpida e obtusa você tem que estimular, que apetite desarrazoado, que 
paixões desordenadas, que sentimentos violentos e rebeldes para combater, 
dominar e submeter! Abundância de adversários de iodos os lados: um 
diabo tão astuto quanto malicioso, então furioso quanto hábil para causar-
lhe dano se Deus não o impedir; um mundo de homens ímpios ao redor de 
você, cada um mais determinado ao erro do que você na verdade, e mis 
apegados ao diabo do que você a Deus, se a Sua graça não o mantiver 
apegado a Ele mais do que você por si mesmo puder5 apegar-se.Assim, 
portanto, se neles são mais hábeis para enganá-lo do que você o é para 
encaminhá-los. Muitos deles são astuciosos e podem confundir novatos 
inexperientes como você, e podem mascarar com face de reverência e 
verdade erros abomináveis e caminhos perniciosos, enquanto que aqueles 
que não são tão astutos, são dotados de louca violência, escárnio e paixões 
suficientes para lança-lo em direção ao inferno, se não puderem atraí-lo 
para si. Você precisa vencer todos estes inimigos ou estará perdido. Não é 
tempo de um homem em tamanho perigo dispor-se a considerá-los, afim de 
descobrir como escapar? E de alguém que está cercado por tais 
dificuldades, vir a considerar como atravessá-las? 
Quantas coisas você tem para considerar; a sua vida passada, os 
relacionamentos que tem mantido, e como tem desempenhado os deveres 
destes relacionamentos; o tempo que você tem tido, e como o tem gastado; 
as oportunidades que tem tido, e o que tem extraído delas; o presente 
estado de sua alma, seus pecados, suas misérias, suas esperanças, e os 
deveres que 
lhe são incumbidos, a fim de que seja recuperado; as tentações com as 
quais se defronta; e as graças que devem ser exercitadas e confirmadas 
diariamente! Não deveria um homem refletir com todo o cuidado possível, 
e considerar, se necessário considerar cem vezes, o que tem tudo isso a ver 
ou não com o seu estado eterno? Você tem muito para saber, que não é 
fácil de conhecer, mas que deve ser conhecido:; muito para fazer, receber, e 
sofrer, que é tanto necessário como difícil. Fossem essas coisas necessárias, 
mas não fossem pesadas, a facilidade faria com que você as desprezasse. 
Fossem pesadas mas não necessárias, a dificuldade poderia desencorajá-lo 
mas do que o assunto poderia excitá-lo. Mas, visto que a reflexão nestes 
assuntos é algo que precisa ser feito ou você seria excluído dos Céus e 
lançado para sempre no inferno, embora haja dificuldades no caminho, eu 
acho que é tempo de você atentar e considerar seriamente na sua condição. 
12. Para concluir, a meditação evitaria um mundo de miséria, o qual, de 
outro modo, fará com que você venha a considerar apenas quando for tarde 
demais. A meditação haverá de ser um dos principais instrumentos para a 
sua salvação se você vier um dia a ser salvo. Se Deus tiver misericórdia de 
você, Ele haverá de fazê-lo refletir. Ele haverá de colocar os seus 
pensamentos diante de você, colocar o fogo do inferno diante de sua face, e 
segurar os seus pensamentos nisto, de modo que não possa desviá-los. Ele 
haverá de colocar diante de você um Cristo crucificado, e lhe dirá que isto 
que o seu pecado fez, e o fará pensar sobre a razão dos Seus sofrimentos, e 
sobre o que há no pecado a ponto de requerer a morte de Cristo; e o que 
significa se rebelar contra o Senhor, e precipitar-se para dentro do fogo 
consumidor. Agora os seus pensamentos estão vagueando ao redor do 
mundo, correndo atrás de tolice e fugindo de Deus. Mas se Deus houver um 
dia de salvá-lo, Ele terá que alcançar o seu coração, trazê-lo para casa, e 
mostrar-lhe que ele tem algo mais em que pensar. Se Suas admoestações 
não forem suficientes, Ele expedirá Suas ameaças; terrores cairão sobre a 
sua alma, e a perseguição como o vento. Ele o retirará do bar e da casa de 
jogo, e porá fim ao seu humor frívolo, e colocará sobre o seu coração um 
peso do qual você não se livrará facilmente. Se você está tomado por 
cuidados do mundo, Ele lhe mostrará que você tem algo mais com que se 
preocupar, e transferirá seus cuidados para coisas mais importantes. Se 
você tem uma mente tão inconstante, hesitante e preguiçosa, que não pode 
colocar seus pensamentos em Deus e mantê-los nEle, Ele primeiramente 
colocará nos seus pensamentos obstáculos trancas capazes de reprimi-los 
das suas imaginações vãs, e então, colocará neles um pendor tal que os 
ordenará melhor, e os fixará no tempo porvir. 
Não se vai para o Céu sem nunca pensar nele. Não se escapa do fogo do 
inferno e da praga do pecado, e da maldição da lei, da ira de Deus, e da 
fúria de Satanás sem nunca meditar estas coisas. Também não é pensando 
em outras coisas que, de súbito, alguém se encontra no Céu, sem nunca ter 
sonhado nisto, ou sem que haja colocado nisto o seu coração.Não; se Deus 
houver de salvá-lo um dia, Ele o fará considerar repetidas vezes estas 
coisas, e talvez até com suspiros e gemidos, e colocará estas coisas tão 
perto do seu coração, que você não apenas pensará nelas, como as sentirá. 
Elas terão de ficar como que escritas diante dos seus olhos; você pensará 
nelas ao deitar-se e ao levantar-se, como se estivessem escritas no espelho 
da sua cama. Você terá que meditar nestas coisas enquanto estiver sentado 
em casa, quando sair, como se as carregasse consigo para onde quer que vá. 
Assim como anteriormente Deus não estava em nenhum dos seus 
pensamentos, então Ele terá que vir a ser a soma e fim de todas as suas 
considerações. 
 
Conclusão 
Se, devido a sua resistência, você fugir dessas considerações, acredite, 
Deus o fará considerar estas coisas de um modo mais severo e terrível. Se 
Ele apenas der uma ordem a sua consciência, isto o perseguirá, e o levará a 
um estado similar ao de Judas. Se Ele o colocar sob Seus julgamentos, e lhe 
falar através de Sua vara, e o açoitar com cada palavra, e lhe perguntar se 
você ainda não irá considerar o assunto, isto poderá trazer coisas tais aos 
seus pensamentos, com as quais você nunca antes foi tão incomodado. Se 
Ele apenas proferir uma palavra, quão prontamente a sua alma será 
requerida de você! Então, quando for lançado no inferno, e sentir seus 
tormentos, você considerará o assunto. Agora nós não conseguimos que 
você despenda uma hora de sóbria consideração; mas então, você fará isso 
sem que lhe supliquem; então, você será como um homem que sofre com 
pedras nos rins, artrite, ou dor de dente, que não pode esquecer-se, embora 
o desejasse como nunca. Esqueça a sua loucura, obstinação e ingratidão, 
então, se puder; esqueça a ira de Deus e os tormentos que estará sentindo, 
se puder. Agora você está tão ocupado que não tem tempo para pensar nos 
assuntos do mundo por vir; mas quando ali estiver, Deus lhe dará todo o 
tempo necessário; você terá pouquíssimas outras coisas para fazer: disporá 
de tempo suficiente. Quando houver pensado sobre essas coisas durante dez 
mil anos, você ainda terá tempo suficiente diante de você para pensar e 
repensar nelas. Agora você não medita nestas coisas, mas quando 'Deus 
houver executado e cumprido os desígnios do seu coração; nos últimos dias 
entendereis isto claramente'(Jr 23:20). 'Oxalá fossem eles sábios! Então 
entenderiam isto, e atentariam para o seu fim'(Dt 32:29). 
O que é que leva tantos milhares de almas para o inferno senão o fato de 
que não meditam a tempo nestas coisas? Se você pudesse falar com 
qualquer dessas almas desesperadas, e perguntar-lhes como vieram a este 
lugar de tormento, elas responderiam: 'Porque nós não consideramos nossa 
situação a tempo; pouco pensamos sobre este dia, embora fôssemos 
advertidos sobre ele; tínhamos uma carga de pecado sobre nós, mas não 
consideramos em como poderíamos ser socorridos; tínhamos Cristo e Suas 
misericórdias diante de nós, mas não consideramos o valor de ambos, nem 
em como sermos feitos participantes deles. Nós tivemos tempo, mas não 
consideramos em como usá-lo do modo mais proveitoso; tivemos a obra da 
nossa salvação nas nossas mãos, mas não consideramos em como 
poderíamos consumá-la. Oh, se houvéssemos refletido sobre os tormentos 
que agora estamos sentindo; poderíamos ter escapado de tudo isto, e 
estaríamos vivendo com Deus!' Estas seriam as respostas daquelas almas 
miseráveis se você pudesse perguntar-lhes a causa da sua miséria. 
Dificilmente há um ladrão ou assassino que veio a morrer na forca, que não 
clamaria: 'Oh, se eu apenas tivesse juízo e graça para ter considerado estas 
coisas a tempo; então eu não estaria agora em tal situação!' Dificilmente há 
um esbanjador que veio a cair na mendicância, ou um homem levado ao 
infortúnio, que não venha dizer: 'Se eu houvesse considerado estas coisas 
de antemão, poderia ter evitado tudo isto.' 
A maioria das calamidades do mundo poderiam Ter sido evitadas por 
reflexões sóbrias e oportunas. O próprio Deus atribui muito da impiedade 
humana à sua irreflexão, e vê nela a causa da sua destruição. Qual a causa 
da espantosa rebelião de Israel? É porque ' Israel não tem conhecimento, o 
meu povo não considera'(Is 1:3). 'Ele quebrará em pedaços homens 
poderosos sem número e colocará outros em seu lugar, Ele os subverte de 
noite de modo que são destruídos'(Jó 34:24-27). Porque vivem os homens 
deliberadamente em pecado, senão porque ' não consideram que fazem 
mal'(Ec 5:1). Quantos desse se apegaram ao mundo que Deus causa pesar, 
os quais bebem, divertem-se, casam-se, 'porém não consideram os feitos do 
Senhor nem olham para as obras das sua mãos'(Is 5:12). 'Eles não 
consideram em seus corações a loucura dos seus caminhos'. Quando eles 
contemplam o juízo de Deus, não consideram o significado deles, e assim 
não os tomam seriamente em consideração. Quando Deus chama os 
homens à conversão ou à restauração, Ele os chama à meditação quanto ao 
caminho que levará a isto; 'assim diz o Senhor dos Exércitos: considerai os 
vossos caminhos'(Ag 1:5). O filho que escapará da miséria de seu pai, é 
aquele que, 'considera e foge das suas transgressões, e considera e não 
pratica a obra de seus ancestrais'. Quando Deus 
envia seu profeta ao povo, o faz com este encorajamento: 'Bem pode ser 
que considerem, ainda que eles são casa rebelde'(Ez 12:3). Davi confessa 
que a meditação foi o início da sua conversão, 'considero os meus 
caminhos, e volto os meus passos para os teus testemunhos. Apresso-me, 
não me detenho, em guardar os teus mandamentos'(Sl 119:59-60). Eu sei 
que é o Senhor quem renova e vivifica uma alma pecaminosa, mas, não 
obstante a soberania de Deus, a meditação tem tudo a realizar. Oh, se nós 
pudéssemos apenas persuadir o nosso povo; certamente eles não poderiam 
continuar como estão, e a agir como têm agido. Viveriam tantos milhares 
tão tranqüila e despreocupadamente sob a culpa de tantos pecados, e sob a 
ira de Deus, se eles apenas considerassem seu estado? Ousariam eles viver 
tão tranqüilamente em um estado de morte e de escravidão ao diabo se eles 
apenas considerassem o assunto? Não teriam eles mais empenho em se 
preparar para o seu iminente comparecimento diante de Deus, e em escapar 
do fogo do Inferno, se eles apenas meditassem nisto? Continuariam a 
engolir vorazmente as suas bebidas, e a se entregar com tanta 
prontidão ao mundo se eles apenas considerassem o que estão 
fazendo? Eu acredito que não. O argumento do pecado e do diabo é tão 
fraco, que eu alimento a esperança de que poderia envergonhar até os mais 
ímpios, se apenas pudesse levá-los a uma séria consideração do assunto. 
Oh, como cairia o reino de Satanás, se nós apenas pudéssemos persuadir as 
pessoas à prática da meditação! Quão rapidamente o diabo perderia os seus 
servos! Que vitória teria Cristo! Quantos seriam salvos se nós apenas 
pudéssemos levá-los à meditação! Poderia se pensar que isto seria uma 
coisa fácil de ser feita, visto que o homem é uma criatura racional e com 
amor próprio. Todavia, apesar disso, para nossa aflição e grande 
sofrimento, não podemos conduzi-los a tal prática. Eu não duvido que 
apenas um sermão ou uma sentença de um sermão, poderia fazer mais bem 
do que uma centena agora o fazem, se eu apenas pudesse persuadir os 
ouvintes à quando chegarem em casa, relembrarem o que ouviram através 
de séria consideração. Mas, não podemos persuadi-los a isto. Mesmo que 
as nossas vidas dependam disso, nós não podemos levá-los a uma 
consideração séria do que pregado. Embora saibamos que as nossas vidas 
e salvação dependem disso, ainda assim não podemos levá-los a esta 
prática. 
Antes de encerrar esta direção, eu tenho uma pergunta e uma súplica a te 
fazer, seja tu quem fores, que tenhas lido estas linhas. A minha pergunta é 
esta: Tu já consideraste sobriamente alguma vez os teus caminhos, e já 
aplicaste o teu coração a estes assuntos? Tu já tiveste alguma vez o hábito 
de retirar-se, sozinho, para gastar algum tempo nesta obra indispensável? 
Se não, a súplica que te faço é no sentido de que agora, finalmente, tu faças 
isso sem nenhuma demora. Eu te imploro isto; o senhor, que te criou, te 
comprou e te preservou te implora isto: que tu te retires para um lugar 
secreto, e te disponhas propositadamente a esta obra de reflexão; prossigas 
nisso diligentemente, lutando com o teu coração até que consigas algum 
resultado, e o conduzas a uma resolução. Estás, portanto, disposto a gastar 
um pouco de tempo a pensar sobre o caso contigo mesmo, convocando o 
teu coração a uma estrita prestação de contas, e a perguntar a ti mesmo: 
'Para que é que fui criado, e com que propósito fui mandado a este mundo? 
Como me tenho conduzido? Como tenho gasto o meu tempo, os meus 
pensamentos, minhas palavras, e como responderei por eles? Estou eu 
pronto para morrer, ainda que fosse nesta mesma hora? Tenho eu certeza da 
minha salvação? Está minha alma convertida e verdadeiramente santificada 
pelo Espírito santo? Se não, que razão tenho eu para protelar? Por que não 
começo agora, e resolvo rapidamente? Demorar-me-ei até que a morte 
venha e me alcance inconverso? Oh, então, que triste aparição farei eu 
diante do Senhor! Desse modo, continua a dialogar com o teu coração. 
O que você diz? Você promete que me concederá apenas algumas horas, 
nem que seja somente aos domingos, ou quando estiver sozinho a caminho, 
ou na sua cama, ou nas suas compras, nessas reflexões? Eu lhe rogo que, 
mesmo que você venha a negar qualquer outra coisa que eu lhe peça, não 
me negue este pedido. Eu não estou lhe pedindo nada que não seja 
razoável. Se eu desejasse que um de vocês gastasse uma hora conversando, 
cavalgando, ou passeando comigo, você certamente as esqueceria. Não 
atenderá você ao pedido para gastar aqui e ali um pouco de tempo 
pensando nos assuntos referentes a sua própria salvação? Ainda que você 
negue este pedido a mim, não o negue a si mesmo, não negue isto a Deus. 
Não 
deveria você lembrar-se por algumas poucas horas do lugar e estado no 
qual deverá viver para sempre? 
Os homens constroem casas resistentes aonde eles acham que vão viver por 
muito tempo; mas uma tenda, ou uma cabana é suficiente para que um 
soldado passe algumas noites. Oh! a eternidade é um dia muito longo. Em 
nome de Deus, não permita que a sua consciência tenha tal acusação como 
esta contra você daqui em diante. Você pode chegar a sua longa morada, ao 
seu estado eterno, antes que gaste o período de uma hora em profundas, 
tristes, e sérias considerações sobre ela, ou que tente adquirir direito a ela. 
Oh, que desconcertante acusação seria esta! Eu estou convicto de que conto 
com o testemunho da sua própria consciência a lhe dizer comigo que o que 
lhe peço é algo razoável e necessário. 
Se, apesar de tudo, você não atender ao que lhe peço, e eu não conseguir 
que você gaste uma hora de sóbrio diálogo, em secreto, com o seu coração, 
sobre estas coisas, então que remédio, senão deixá-lo entregue à sua própria 
miséria! Mas, concluindo, eu devo dizer-lhe que eu não alimento esperança 
quanto a uma alma que não se deixa persuadir a este dever de meditação. 
Entretanto, se eu pudesse persuadi-lo a entregar-se com dedicação a esta 
obra razoável, fácil e necessária, eu teria grandes esperanças quanto à 
salvação de todos vocês. Eu lhe tenho dito a verdade, 'pondera o que acabo 
de dizer, e o Senhor te dará compreensão'(2Tim 2:7). Mas, se você me 
obrigar a concluir em termos mais ásperos, eu ainda usarei os oráculos de 
Deus: 'Considerai, pois, nisto vós que vos esqueceis de Deus, para que não 
vos despedace, sem haver quem vos livre'(Sl 50:22).$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Baxter compara a meditação a reter o alimento no estômago até ser digerido: quais verdades do evangelho você já ouviu mil vezes, mas nunca permitiu que descessem ao coração e ali permanecessem?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se a reflexão é o meio principal de abrir a porta trancada para que o Rei da glória entre, que portas e janelas da sua alma você tem mantido fechadas à luz?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Reservando tempo a sós com Deus para meditar em quem Ele é, no pecado e na glória eterna, que poder adormecido na sua alma você acredita que despertaria?$p$, 'reflexao', null);
  end if;

end $migration$;
