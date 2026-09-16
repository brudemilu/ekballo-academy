-- 306_perspectivas_artigos_complementares.sql
-- Cria a seção "Artigos complementares" no fim do curso, decidida pelo Bruno:
-- uma seção única, com os textos abaixo como subitens.
--
-- São capítulos que vieram nos volumes enviados mas que NENHUM dos treze guias
-- indica como leitura de lição. Até agora eu os deixava de fora e avisava; eles
-- passam a existir no acervo, reunidos e identificados como complementares, em
-- vez de sumirem ou de poluírem uma lição a que não pertencem.
--
-- O Bradford cap. 10 ESTAVA publicado na Lição 3 desde a primeira carga, sem
-- que o guia daquela lição o pedisse. Sai de lá e vem para cá — por isso as
-- ordens da Lição 3 em diante recuam uma posição.
--
-- A abertura do Bosch foi transcrita à mão, como as seis da migration 302-304:
-- mesmo defeito de OCR no título e na caixa de biografia.
--
-- O título da seção não leva "· Leitura —", então o sumário o mostra como
-- cabeçalho; os itens levam, e aparecem recuados abaixo dele.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';

  -- Bradford sai da Lição 3; quem vinha depois recua uma posição
  update aulas set ordem = 9000 where curso_id = cid and titulo like 'Lição 3 · Leitura — Bradford%';
  update aulas set ordem = ordem - 1 where curso_id = cid and ordem between 27 and 71;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Artigos complementares', 'Estes textos vieram nos mesmos volumes do curso, mas nenhum guia de estudo os indica como leitura de lição. Ficam reunidos aqui, à parte, para quem quiser ir além do roteiro.

Não há ordem obrigatória nem pergunta de estudo ligada a eles: são leitura livre.', 71 from cursos where slug = 'perspectivas';

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Artigos complementares · Leitura — Bosch, cap. 7: Testemunha para o mundo', 'David J. Bosch

DAVID J. BOSCH foi missionário em Transkei de 1957 até 1971, ao ser designado para a faculdade da University of South Africa. Ele também trabalhou como deão de teologia e é muito conhecido por seus livros, A Spirituality of the Road, Witness to the World [Uma espiritualidade do caminho, testemunho para o mundo] e Missão transformadora (Porto Alegre: EST; São Leopoldo: Sinodal, 2002).

De Transforming Mission (San Francisco: Harper Collins, 1990). Usado com permissão.

Uma leitura cuidadosa do Antigo Testamento e também do

Novo Testamento revelará que o próprio Deus é o tema das missões. Estamos lidando aqui com a Missio Det, isto é, a missão de Deus. O mártir, a testemunha por palavra e por obra, tem sua origem última não na testemunha em si, mas em Deus. À isso devemos imediatamente acrescentar, entretanto, que a testemunha em si não está, de forma alguma, excluída aqui, mas é parte da missão divina, sendo Deus o autor.

Uma das formas pelas quais o Antigo Testamento, em particular, dá expressão a essa convicção é pela ênfase no que Deus faz, e não no homem, quase a ponto de sugerir que o ser humano é inativo. Esperamos que fique claro, porém, que essa não é a intenção. O “servo do Senhor” Há muito tempo, tornou-se comum fazer referência ao “servo do Senhor” (Is como o missionário por excelência. Essa interpretação flui da centralidade do conceito “testemunha” neste artigo.! O “servo” não é, porém, um missionário ativo enviado às nações. O verbo yósi, em Isaías 42.1, não deve ser traduzido por “executar” ou “levar”, e sim como “fazer com que se torne visível”. À tradução da Almeida Revista e Atualizada (ARA), portanto, é a mais adequada: “O meu servo promulgará o direito para os gentios”, Não são enfatizadas aqui asatividades próprias do servo, mas o fato de que Deus opera nele e por meio dele. Sabemos que ele compareceu ao tribunal para testemunhar no caso entre Deus e as nações e que ele é uma testemunha-chave. Entretanto, de acordo com nossos padrões, também é inútil, pois não pode ver nem falar (Is 42.1820; 43.8-13). O propósito dessa metáfora não é, mais uma vez, dizer que a testemunha seja de fato cega e surda, e sim que, na análise final, o próprio YHwH é a testemunha.

O “servo do Senhor” de Isaías 40-55 é um paradigma de Israel. À eleição e a existência de Israel não têm nenhum objetivo em si, mas é por meio de Israel que Deus se ocupa das nações. Sua eleição,

Allison À. Trites, The New Testament Concept of Witness (Cambridge: Cambridge University, 1977), p. 35-47.

O PEER... portanto, é uma prolepse, uma antecipação. Em para dar expressão tanto do movimento centri-Israel e por meio de Israel, Deus estende suas peto quanto ao centrífugo. Uma luz brilhando mãos para o mundo. Suas atividades salvíficas ma escuridão atrai pessoas para si, de forma cenem Israel representam um sinal para as nações, tripeta, porém ao mesmo tempo ela se espalha, por isso ela é chamada para ser uma “luz para cruzando fronteiras e permitindo, nas palavras os gentios" (Is 42.6). Deus pretende fazer mais de Isaías 49.6, que a salvação de Deus alcance que restaurar as tribos de Judá e trazer de volta a “extremidade da terra”, os descendentes de Israel: “Também te dei como Entretanto, no Antigo Testamento, à imporluz para os gentios, para seres a minha salvação tância missionária de Israel encontra-se predoaté à extremidade da terra” (Is 49.6). minantemente dentro da estrutura de categorias

Por muitos anos, sustentou-se O argumento centrípetas, Isso explica a centralidade de de que o Antigo Testamento vê as missões de Jerusalém, de Sião, nas passagens universalistas forma centripeta as nações vindo em dire do Antigo Testamento, À categoria centrípeta ção a Israel enquanto no Novo Testamento é, portanto, empregada para dar expressão à ela é centrifuga do centro, Israel ou a Igreja, convicção de que Deus, é não Israel, é o autor Os missionários partem para o exterior, para o das missões, mundo, É bem verdade que o Antigo Testamen- Zacarias 8 apresenta uma expressão clássica to vê as missões predominantemente em cate- dessa realidade, Será quem, após o exígorias centripetas, porém não é algo exclusivo. ho, trará de volta das nações seu povo disperso A metáfora da luz, em Isaías 42.6 e 49.6,cem (vv. 7-8) e os instruirá (vv, As nações outras referências, é particularmente adequada observarão isso e, espontaneamente, expressarão PRICE SO E SO e RIP a e a ir saia O DA E Te e e sand As duas forças Jonathan Lewis É No cumprimento da obrigação de Israel, duas forças estavam em evidência. A primeira era a força atrativo, a primeiramente simbolizada pelo tabernáculo e depois pelo templo em Jerusalém. Essas instalações eram os locais da habitação do nome de Deus. Eram lugares sagrados, centro das cerimônias e práticas religiosas E de Israel, mas que, no entanto, não foram construídos para servir apenas a Israel, Quando Salomão consagrou O templo, estava claro para ele que o templo tinha um propósito mais abrangente.

A Biblia registra diversos casos de estrangeiros que foram atraídos para Israel por causa da evidência da bênção de Deus, entre eles, Rute, a moabita, e o siro Naamã. Centenas de outras histórias narradas são evidenciadas pelo fato de que, no dia de Pentecostes, havia homens piedosos de “todas as nações debaixo É do céu” (At 2.5) habitando em Jerusalém. O plano de Deus para alcançar as nações, todavia, consiste em muito mais que uma atração passiva.

A segunda força em operação era ativa, a força expansiva. Ela fazia com que a mensagem de Deus fosst enviada para além das fronteiras de Israel. Podemos citar exemplos de israelitas cativos usados para pro clamar à mensagem de Deus à outras nações, como José, e exilados, como Daniel e Ester. Podemos const derar também o profeta Jonas, que recebeu a ordem de pregar o arrependimento em Nínive, e Jeremias. designado “profeta às nações”. Especula-se até que ele e outros mensageiros viajaram por muitos lugares a propagação de seus oráculos. Contudo, Deus não usou apenas os grandes na função de conceber sus Jonathan Lewis (Ph D é consultor organizacional da World Evangelical Alliance. Nascido na Argentina, trabalhou criação de centros de treinamento missionário na América Latina é em outros países, É o editor de três cursos de mis ões, pubbcados em diversos idiomas,

Da segunda edição de Jonathan Lewis (Org World Mission [Missão mundial] (Pasadena: Williám Carey Libra% 1994) Usado com a permissão.

A E.

O a também o desejo de ir a Jerusalém. Dez homens brilhe no mundo, sendo exemplo e dando tes“de todas as linguas das nações” agarrarão as temunho por palavras e obras. vestes de um judeu e dirão: “Iremos convosco, porque temos ouvido que Deus está convosco” Deus e o homem: competidores? (v. 23), Não é a fé, nem o exemplo, nem o tes- Seria errado, entretanto, encontrar a verdadeira temunho de Israel que agem como ímã aqui,e diferença entre o Antigo e o Novo Testamento na sim a fidelidade de Deus para com Israel, que distinção entre centrípera e centrífuga. Há pelo faz com que as nações venham até ele. Mesmo menos três razões para considerarmos relativa assim, nem por um momento é sugerido que a tal distinção. fé, o exemplo e o testemunho de Israel sejam Em primeiro lugar, a dimensão missionária dispensáveis. Mais uma vez, portanto, a pró- centrípeta não está, de forma alguma, restrita ao pria nação de Israel está inteiramente envolvida Antigo Testamento; é também característica do na missão de Deus para com as nações. Israel Novo Testamento. Astrólogos vieram do Orienera uma nação pagã que Deus elegeu para a te à Jerusalém com o propósito de encontrar o salvação, porém, ela manterá sua nova e espe- Salvador do mundo (Mt 2). Simeão refere-se cial condição de “não pagã” somente enquanto à libertação que Deus havia preparado “diante aceitar e viver sua responsabilidade no mundo. de todos os povos: luz para revelação aos gen-Antes de tudo, isso significa permanecer ver- tios..." Ao mencionar Isaías 56,7, dadeiro para com YHwtH. Em seguida, como Jesus referiu-se ao templo como “casa de oração consequência, implica permanecer verdadeiro para todas as nações” (Me 11,17). Além disso, a em relação ao mundo, por permitir que a luz purificação do templo sugere que a restauração NESTA ESA nina a pe mim eat Sia PÓS e ASP CU SEIA SARL A Sra cas mensagem: afinal, foi uma pequena escrava israelita que anunciou o divino poder de cura ao poderoso, porém leproso, Naamã, capitão do exército siro.

Alguns podem argumentar que esses casos são exceções, pois algumas dessas pessoas eram cativas ou ministraram contra a vontade. Entretanto, o voluntarismo nunca foi o fator decisivo para se promover a missão de Deus. Afinal, ele usa seu povo para anunciar sua mensagem, sejam eles agentes dispostos ou não. A história trágica de Israel teria sido consideravelmente diferente se a nação tivesse sido um instrumento disposto a realizar o plano redentor de Deus, mas não foi isso que aconteceu. Deus usou o cativeiro e o exílio tanto para julgar a desobediência de Israel quanto para estender seu testemunho além das fronteiras.

Essas duas forças dinâmicas também estão presentes em nossos dias. Na escala global, muitos são atraídos para as “nações cristãs” por causa da evidência da bênção de Deus por meio de riqueza material e estabilidade econômica. Nas comunidades, as congregações em que o poder e a graça de Deus são evidentes também atraem pessoas. Já no nível pessoal, o caráter piedoso exerce atração sobre 05 que desejam possuir as mesmas virtudes. Mesmo assim, o evangelho não será pregado a todas as nações simplesmente

LILI LILIA pela atração passiva. Há muitas barreiras sociais, culturais e geográficas a serem transpostas para que isso aconteça. O povo de Deus deve se dispor e ir às na»

ções com as boas novas para cumprir,

Força atrativa Força expansiva dessa forma, as obrigações expressas

“Vem pela bênção” “Vai às nações" na aliança.

é. de Israel deve proceder a peregrinação dos povos ptecusatéro. O oficial do extrcito romano que se aproximou de Jesus (Mt 85) cos gregos que veta a Jerusalém para conhecê-lo (Jo 12.20) dão expressão à mesma leia: a salvação é en contrada em Issael, os povos que desejarem fazer parte dela deverão se dirygir para lá. Afinal de contas, “a salvação vem dos judeus” (Jo 4.22). A salvação do mundo só pode ser consumada num úsmico lugar: Jerusalém, o que explica a proeminência dessa cidade nos quatro evangelhos, especialmente no evangelho de Lucas, que não era judeu.

Em segundo lugar, temos de enfatizar que a distinção entre centripeta e centrífuga pode facilmente levar a “verdadeira” missão a serentendida como apenas centrífuga, quando esta sugere o cruzamento de fronteiras geográficas e a proclamação verbal aos pagãos. Entretanto, sustentamos que o cruzamento de fronteiras geográficas constitui apenas um elemento daquilo que a Bíblia entende por “missão” e também que “missão” é mais que a pregação oral aos pagãos.

Em terceiro lugar, há uma tendência de se entender a missão no Antigo Testamento exclusivamente como “trabalho de Deus”. Entretanto, isso implica que a missão centrifuga do Novo Testamento, na qual o homem parece estar mais ativamente envolvido, poderia ser taxada de “trabalho do homem”. Com isso, porém, entraríamos numa área escorregadia onde a atividade de Deus exclui a do homem e vice e versa, Dessa forma, Deus eo homem tornar-se-iam competidores. Alguns dos contemporâneos de Jesus de fato acreditavam que o trabalho de Deus, por definição, excluía qualquer envolvimento humano.

Categoricamente, queremos dizer que essa concepção é falsa e prejudicial à igreja, sobrea qual a Bíblia se refere com uma clareza cativanre, Os discípulos são as sementes (Mt 13.38),e, ao mesmo tempo, os trabalhadores que trazem a colheita (Mt 9.37,38); são parte do rebanho (Mr 10.16; Le 12.32; Jo 10.1-16) e também pastores (Mr 10.6; Jo 21,15-17); têm necessidatestemunha para O frustuio, R de de perdão (Mt 18,23-27) e também podem conceder perdão (Mt 16,19, 18 18; Jo 20.25) Deus revelou-lhes os “mistérios do mesmo dos céus” (Mt 13,11), mesmo assum elos dever buscar o Reino (Mt Le 134245. 55 filhos de Deus (Mt 17.26), mas dever assar seus inimigos para serem filhos (Mt Receberam a vida eterna (Jo contudo, precisam entrar pela porta que Jews vida(Mt 7,14). Pelo fato de os discípulos teseo feito o que Jesus esperava do jovem nico, cles são “perfeitos” (Mt 19.21; vw. Me 10.28), no ensasto, devem vigiar orar para que não casam em tentação (Mt 26.41). Os crentes devem pôs em prática sua salvação com temor tremor, pos é Deus quem opera neles (Fp 2.12,13). Assina, de forma um tanto inconsciente, Paulo pode chamá-los “cooperadores de Deus” (1Co 3.9, ARC). A chave para esses paradoxos, aparentemente inconciliáveis, está na expressão do Novo Testamento “em Cristo”: “Pela graça de Deus, sou o que sou; e a sua graça, que me foi concedida, não se tornou và; antes, trabalhei muito mais do que todos eles; todavia, não eu, mas à graça de Deus comigo” (1Co 15.10).

Entretanto, se considerarmos Deus e o homem competidores e colocarmos o trabalho de Deus em contraste com o do homem, logo nos encontraremos num dilema insolúvel, Se enfatizarmos apenas um lado, nossa fé adotará as características cegas e inflexíveis do destino; se enfatizarmos apenas o outro lado, nos tornaremos fanáticos e arrogantes. Como indicam certos exemplos das Escrituras, existe uma tensão criativa entre o trabalho de Deus e o do homem, e qualquer tentativa de explicá-la por meio de uma fórmula ou de codificá-la num dogma poderá destruir seu maravilhoso rmistério, Reconhecer isso é de suma importância para o fundamento bíblico das missões. Em Cristo Muitos estudiosos destacam o fato marcante de queatão falada Grande Comissão (Mt 28,1820€ paralelos) parece não exercer nenhum papc! na própria Igreja do Novo Testamento, pelo faro

The Church as Witness, Reformed Reviews, v. 35, n. 1, mar. 1978, p. 9. Die Anfiinge der urchristlichem Mission (Munich: Chr. Kaises, 1969), p. 109-23. Kasting mostra que eram 05 membros terior, especialmente após o primeiro século, a posição judaica “não oficial” tornou-se a mais aceita no cristianismo judaico, Tal atitude, por fim, tornou-se um dos principais fatores para fim do cristianismo judaico,

Duevid Bosch de esse papel nunca ter sido mencionado entre os prumetros cristãos, Dois motivos, talvez, po dem ser apontados para explicar esse silêncio. O primeiro é que a Grande Comissão não é uma ordem, no sentido comum da palavra. Trata-se, pas precisamente, de uma declaração criativa à maneira de Génesis 1.3 e outras referências: “Haia...” ou do que Newbigin comenta sobre Atos 1.8:ºA frase “sereis minhas testemunhas'' não é uma ordem a ser obedecida, mas uma promessa em que confiar". Tal promessa, porém, só pode ser percebida num ato de obediência. Foi o que Pedro descobriu ao visitar Cornélio, quando o apóstolo exclamou, maravilhado: “Reconheço, por verdade, que Deus não faz acepção de pessoas” (At 10.34), Paulo refere-se a ela como um “mistério”, um segredo revelado a ele somente no ato da pregação do evangelho a todos os povos, significando “que os gentios são coerdeiros, membros do mesmo corpo e coparticipantes da promessa em Cristo Jesus por meio do evangelho” (Ef 3.6).

O segundo motivo para o silêncio em torno da Grande Comissão na Igreja primitiva reside no fato de que uma missão para os gentios nunca esteve em pauta entre os primeiros cristãos, apesar dos pontos sustentados por estudiosos como Ferdinand Hahn, Ernst Kisemann e outros. Heinrich Kasting refuta, de forma convincente, os argumentos deles e mostra que a missão para os gentios, na verdade, nunca foi um ponto de controvérsia na Igreja primitiva. Às opiniões divergiam apenas na maneira em que os gentios deveriam ingressar na Igreja, especialmente na questão relacionada à circuncisão.* Nessas circunstâncias, uma referênciaa uma “ordem missionária” teria sido irrelevante. As duas considerações mencionadas demonstram que, no Novo Testamento, “missão” é mais que uma questão de obedecer a uma ordem. Trata-se, mais precisamente, do resultado de judeus da Igreja primitiva, e não a Igreja “oficial”, que tinham

[A um encontro com Cristo, Conhecer a Cristo stgmufica tornar-se parte de wma mussão para o mundo.

A mussão é um privilégio do qual tados devem participar. Paulo se apresenta À igreja em Roma como alguém que, por meio de Cristo, recebeu “graça e apostolado por amor do seu nome, para a obediência por fé, entre todos os gentios" (Rm 1,5), Missão, para Paulo, foi a con sequência lógica de seu encontro com o Cristo ressurreto, na estrada de Damasco,

Semelhantemente, no assim chamado “hino cristológico” (Fp 2.6-1D, não há nenhuma referência a uma ordem missionária, mesmo assim a missão mundial recai claramente dentro da extensão do hino:*... para que ao nome de Jesus se dobre todo joelhol...] e toda língua confesse que Jesus Cristo é Senhor” (v. 10,11). Portanto, “missão”, de acordo com o Novo Testamento, é um predicado da cristologia, É dessa forma que aparece em outro hino dos primeiros cristãos; “Aquele que foi manifestado na carne foi justificado em espírito, contemplado por anjos, pregado entre os gentios, crido no mundo, recebido na glória” (1Tm 3,16). Semelhantemente, em 2Coriíntios 5.18-20 e Efésios 2,14-18, a missão está cristologicamente fundada como a mensagem de reconciliação do mundo com Deus. À obra da reconciliação confiada à Igreja procede do fato de que Jesus, entre judeus e gentios, quebrou, em seu corpo de carne, “a parede da separação que estava no meio, a inimizade” que existia entre eles, para assim criar em si mesmo “dos dois um novo homem”,

À igreja, portanto, está envolvida com missões, porque a Jesus foi dado um nome que é acima de todos os nomes (Fp 2,9) e se declarou Filho de Deus com poder, pela sua ressurreição dentre os mortos (Rm 1,4), porque Deus estava em Cristo reconciliando consigo o mundo e judeus e gentios num só corpo, a tendência de limitar a salvação a Israel, Num estágio poso

PIRES EDTA ISP AL O DNIT PMES RENDEU RO O

Perguntas para estudo 1, Cite alguns exemplos de testemunha centrípeta na Bíblia e no mundo moderno. 2. Tente descrever da melhor maneira o que Bosch chama “maravilhoso mistério”, a parceria en-

Deus homem missão, Que verdades bíblicas descrevem paradoxo da para si mesmo, por meio da cruz (Ef 2.16). Se a igreja está “em Cristo”, ela está envolvida na missão, o que faz com que toda a sua existência tenha caráter missionário, Sua conduta, bem como suas palavras, convencerão os incrédulos (1Pe 2,12) e emudecerão sua ignorância e insensatez (1Pe 2,15). Os “eleitos que são forasteiros” de Deus, a quem a primeira carta de Pedro é dirigida (v. 1,1), são uma raça escolhida, um sacerdócio real, uma nação santa cum povo de propriedade exclusiva de Deus. Essa nova condição em Cristo tem um propósito claro: anunciar as grandezas daquele que os chamou tre e o na trabalho de Deus e do homem?

a das trevas para sua maravilhosa luz (v. 1 Pe 2.9), Por causa dessa nova vida em Cristo, a missão “acontece”, digamos assim, porque somos informados que os incrédulos pediam aos cristãos que explicassem a esperança que estes declaravam possuir (1Pe. Essa esperança era tão evidente que os incrédulos ficaram não só curiosos, mas também se tornaram invejosos. Na linguagem paulina, foi a maneira pela qual Deus espalhou a “fragrância do seu conhecimento” (2Co 2.14). Onde quer que apóstolo vivesse, falasse e agisse como “perfume de Cristo”, algo acontecia com as pessoas ao seu redor, o missão como', 72
from cursos where slug = 'perspectivas';
update aulas set titulo = 'Artigos complementares · Leitura — Bradford, cap. 10: Ministério radical em um mundo polarizado',
                 ordem = 73
where curso_id = (select id from cursos where slug = 'perspectivas') and ordem = 9000;
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Artigos complementares · Leitura — Hudson Taylor, cap. 41: A necessidade e os clamores', '4 dad espiri Ro. A E

É ape ala Niro Raro se lamores da Ch J. Hudson Taylor J. Hudson Taylor escreveu China''s Spiritual Need and Claims [A necessidade e os clamores espirituais da China] como consequência da decisão crucial que tomou em Brighton; recrutar obreiros para sua agência missionária, Nos anos seguintes, outras edições foram impressas cos parágrafos a seguir foram extraídos de uma dessas edições posteriores. Taylor conclui aqui o panfleto com uma retrospectiva dos efeitos da primeira edição e dos primeiros anos da Missão para o Interior da China. Sua vida e a agência que ele organizou são testemunhas daquilo que costumava afirmar: “Há um Deus vivo, Ele se pronunciou em sua Palavra. Ele quer dizer exatamente o que diz e fará tudo que prometeu”,

Livra os que estão sendo levados para a morte e salva os que cambaleiam indo para serem mortos, Se disseres: Não o soubemos, não o perceberá aquele que pesa os corações? Não o saberá aquele que atenta para a tua alma? E não pagará ele ao homem segundo as suas obras? (Pv 24.11,12).

2 verdade solene e grave que cada ato nosso na vida presente e também cada omissão nossa tem um resultado direto e importante tanto em nosso bem-estar futuro quanto no de outros. Na condição de crentes, convém que tudo que venhamos a fazer seja feito em nome de nosso Senhor Jesus Cristo. Em seu nome e com sincera oração, pedindo sua bênção, é que estas páginas foram escritas; em seu nome e com sincera oração, pedindo a sua bênção, que sejam lidas. O escritor sente profundamente que tem a obrigação de apresentar os fatos contidos nestas páginas ao coração e à consciência do povo do Senhor, na qualidade de mordomo fiel. Ele crê também que os fatos relatados devem produzir algum fruto no coração de cada leitor cristão. O fruto legítimo indubitavelmente será não palavras vãs de simpatia oca, mas oração fervorosa e eficaz e um esforço extenuante altruísta para a salvação dos chineses ignorantes. Se em qualquer caso deixarem de produzir esse fruto, o autor insiste na consideração das solenes palavras citadas no cabeçalho deste artigo: “Livra os que estão sendo levados para a morte e salva os que cambaleiam indo para serem mortos. Se disseres: Não o soubemos, não o perceberá aquele que pesa os corações? Não o saberá aquele que atenta

306 para a tua alma? E não pagará ele ao homem segundo as suas obras?”.

Logo no início de seu ministério, o Senhor Jesus ensinou ao povo que eles deviam sera luz não de Jerusalém, nem da Judeia, nem mesmo da nação judaica, mas do mundo. Ele também os ensinou a orar não como pagãos, que usam repetições vãs e sem significado; nem como aqueles que primeiro pedem (quando não é só o que fazem) solução para as próprias necessidades e benefícios pessoais: “Deus, o vosso Pai, sabe o de que tendes necessidade, antes que lho peçais. Portanto, vós orareis assim: Pai nosso, que estás nos céus, santificado seja o teu nome; venha o teu reino; faça-se a tua vontade, assim na terra como no céu”,

Só depois desses pedidos é que devem ser apresentadas, em segundo plano, as petições pessoais. Até mesmo o comedido “o pão nosso de cada dia dá-nos hoje” vem a seguir. Nãotem sido essa ordem invertida com demasiada frequência em nosso dias? Não sentem cagem os cristãos quase sempre como se tivessem sido incumbidos de começar com “o pão nosso de cada dia dá-nos hoje” para então concluir: “Se for consistente com isso, que teu nome seja santificado também”? Será que Mateus 6.33 “Buscai em primeiro lugar,oseureinoca sua justiça, e todas estas coisas vos serão acrescentadas” não tem sido praticado assim, até mesmo entre os discípulos professos de Cristo: buscar primeiro todas estas coisas (alimento e roupa, saúde, riqueza e conforto) e só depoiso Reino de Deus e sua justiça? Em vez de honrá-lo com as primícias de nosso tempo cenergia, será que não nos contentamos em lhe oferecer as migalhas, depois que nossas supostas necessidades já foram supridas? Se nos recusamos a levar os dízimos à casa do tesouro e, dessa forma, a fazer prova do Senhor, como podemos nos admirar de que ele não abra as janelas do céu e não derrame sobre nós a plenitude da bênção que desejamos?

Temos na vida e na morte de nosso Senhor Jesus Cristo um exemplo notável de como podemos buscar primeiro o Reino de Deus e sua

A necessidade e os clamores espirituais da China. justiça. Ao ressuscitar dos mortos, antes de subir ao céu, ele comissionou seu povo a proclamar em todos os lugares as boas novas da salvação plena e livremente pela fé em sua obra consumada. Esse dever ele transmitiu a nósda maneira mais inequívoca e exata: “Ide portodo o mundo e pregai o evangelho a toda criatura”, Infelizmente, a Igreja falhou no cumprimento dessa ordem. É triste observar que, tão perto do fim do século XIX da era cristã, ainda existem porções imensas do globo terrestre totalmente destituídas ou mal providas dos meios da graça e do conhecimento da salvação.

Para que nossos leitores possam perceber a vasta extensão dos distritos mais remotos do Império Chinês, sugerimos uma comparação desses distritos com os países próximos de nós.

Todo o continente europeu tem uma área de 9.607.749 quilômetros quadrados; a área da Manchúria, a Mongólia, os territórios do Noroeste e o Tibete juntos somam 10.233.380 quilômetros quadrados. Essas extensas regiões contêm muitos milhões de seres que são nossos semelhantes, mas, à exceção de nossos quatro obreiros em Yingkou, eles não têm nenhum missionário. Estão perecendo, e ninguém os socorre. Nenhum missionário reside entre eles para revelar aquela sabedoria, o bem do qual se diz que “melhor é o lucro que eladádoqueoda prata, e melhor a sua renda do que o ouro mais fino”. Por todo esse imenso território, maior que o continente inteiro da Europa, com a exceção mencionada acima, não há um só embaixador de Cristo enviado por qualquer igreja protestante da Europa ou da América para levara palavra da reconciliação e falar aos homens,em nome Cristo: “Rogamos que vos reconcilieis com Deus”. Quanto tempo esse estado de coisas vai continuar?

Pense nos mais de 80 milhões que estão fora do alcance do evangelho nas sete províncias em que os missionários estão há mais tempo. Pense nos mais de 100 milhões nas outras 11 províncias da China propriamente dita forado alcance dos poucos missionários que lá estão.

4

Pense nos mais de 20 milhões que habitam as vastas regiões da Manchúria, Mongólia, Tibete e dos territórios do Noroeste, que excedem toda a extensão da Europa um total de mais de 200 milhões fora do alcance de todas as agências existentes e diga como poderá o nome de Deus ser santificado por eles, seu Reino chegar a eles e sua vontade ser cumprida por eles? O nome é os atributos de Deus são coisas que eles nunca ouviram. O Reino não está sendo proclamado entre eles. A vontade divina não lhes tem sido revelada!

Você cré que desses milhões cada um tem uma alma preciosa? E que “não existe nenhum outro nome, dado entre os homens, pelo qual importa que sejamos salvos” além do nome de Jesus? Você cré que só ele é “a porta no aprisco”, “o caminho, e a verdade, e a vida"? Que ninguém vem ao Pai senão por Ele? Nesse caso, penseno estado daqueles que não estão sendo salvos e examine solenemente o coração à vista de Deus, para ver se você está fazendo o máximo que pode para torná-lo conhecido entre eles.

Apresentamos um panorama resumido e superficial da situação e das necessidades da China. Para apresentar em detalhes cada província, teríamos de dedicar mais tempo e espaço que à consideração de todo o império. Já vimos que Deus abençoou os esforços despendidos e tentamos apresentar as facilidades que hoje existem para uma evangelização mais extensa deste país. Temos buscado obedecer à grande ordem de nosso Salvador ressuscitado: “Ide por todo o mundo e pregai o evangelho a toda criatura”. Destacamos que, em Mateus na parábola do Senhor, não foi um estranho, mas um servo; não um imoral, mas um inútil que foi lançado nas trevas exteriores, onde há. choro e ranger de dentes. “Se me amais”, disse nosso Mestre, “guardareis os meus mandamentos”, é um deles foi: “De graça recebestes, de graça dai”, Mostramos que nas sete províncias da China propriamente dita, havendo para os missionários protestantes e seus assistentes nativos muito mais do que eles podem realigar, existe uma multidão imensa ainda fora do alcance do evangelho, Mostramos que há outras 11 províncias ainda mais carentes, das quais a menor excede a população da Birmânia ou da Escócia e Irlanda juntas, Que dizer então das vastas regiões da Tartária e do Tibete mais extensas que todo o continente da Europa, sem nenhum missionário protestante, a não ser os quatro em Yingkou? As reivindicações de um império como este deveriam não só ser consideradas, mas também satisfeitas! Será que os interesses eternos de um quinto da raça humana não conseguem despertar as mais profundas simpatias de nossa natureza, os mais extenuantes esforços de nossas habilidades, que foram compradas com sangue? Será que os gemidos da miséria desamparada e sem esperança, que se levantam da metade do mundo pagão, não penetram em nossos ouvidos lentos em ouvir não são capazes de despertar nosso espírito, alma ecorpo para um grande, contínuo e insuperável esforço de salvar a China? Que na força e no poder de Deus, possamos arrebatar a presa das mãos dos poderosos; que possamos arrançá-la do fogo eterno e salvar aqueles escravos do pecado e de Satanás, para exaltar o triunfo do Rei soberano e reluzir para sempre como estrelas em sua coroa!

Não podemos deixar de crer que a contemplação desses fatos solenes já despertou muitas orações sinceras: “Senhor, o que queres que eu fara para que teu nome seja santificado, teu Reino venha a nós e tua vontade possa ser cumprida na China?”. É o meditar nesses fatos, com oração ca percepção cada vez maior dos terríveis problemas da China, destituída de tudo que pode tornar o ser humano verdadeiramente feliz, que constrange o autor colocar suas reivindicações como um pesado fardo sobre o coração daqueles que já experimentaram o poder do sangue de Cristo, e buscar, primeiro com o Senhor e em seguida com seu povo, os homens e os meios para levar o evangelho a todas as partes desta terra não civilizada. Temos de nos haver com ele, que é o Senhor de todo poder, cujo braço não foi encurtado, cujo ouvido não está surdo; com aquele cujas palavras imutáveis levam-nos

308 A necessidade e os clamores espirituais da Chóra a pedir e a receber, para que nossa alegria seja declarado na primeira edição deste apelo, ck completa. Temos de abrir bem a boca, para que não hesitou em pedir ao grande Senhor da seele possa enché-la. Faríamos bem em lembrar ara que chamasse, que enviasse 24 europeuse que esse Deus gracioso, que condescendeu cm 24 evangelistas nativos, a fim de implantarem colocar seu poder excelso às ordens da oração o símbolo da cruz em todos os distritos não da fé, não olha com leviandade para a culpa de evangelizados da China propriamente ditae sangue dos que negligenciam o bem-estar dos da Tartária chinesa. que perecem, pois ele disse: “Livra os que estão As mesmas considerações levam-nos hoje 3 sendo levados para a morte e salva os que cam- clamara Deus por muito mais, Quem nunca foi baleiam indo para serem mortos. Se disseres: chamado para provar a fidelidade do Deus que Não o soubemos, não o perceberá aquele que cumpre as alianças no suprimento, na resposta pesa os corações? Não o saberá aquele queaten- às orações e nas necessidades financeiras de seus ta para a tua alma? E não pagará eleao homem servos, talvez considere o envio de evangelistas segundo as suas obras?”. a uma terra pagã distante uma experiência peri-

Tais considerações levaram o autor a sentir, gosa, tendo “apenas Deus para cuidar deles”. Já em 1865, de tal modo a imensa necessidade de para aquele que há muitos anos tem o privilégio mais obreiros para a China, que, conforme ficou de experimentar a fidelidade de Deus em diversas [on náo e Ca Qu o O o ag Ap do SA ooo to À

Proporção de missionários em relação à população das 18 províncias da China oa su iemihões Zomibões [os fianco0o [izijomo formoipmo rurtiocso om [SHANTUNG [zomibies 19mihões 65 60 [1316000 fizsáoo sheffeio(o9s) nevcsieeronsmoatsim upei [Bomber es [isréooo notingramecamomo cannwur 9mihões [1:600000 lverpooi(s86320) Hansi] sei imiões Gmihões 30 [isso fomos) SalordeHuddersfela(o99a)

omibões [O fisssdeo stetiçnoss [sicwan zomihões [1:1176000 [Glasgoweliverpooi(1108319)

Rd AR ter (1.919.595) E manos smilhões 0 [idanda(semmissonário, jHoman [asmihões 3 [15000000 [londres

O número de missionários foi corrigido em março de 1887.

SIS EE EE AE E CEE SERENA 1. À semelhança de Carey, Taylor é profundamente tocado pelos dados estatísticos que tem diante de si. Que “fruto” ele acha que deve ser resultado da consideração dos “fatos”? 2. Que comentários Taylor faz acerca da natureza e do propósito da oração?

Hudson Taylor circunstâncias em casa e no estrangeiro, por terra e por mar, na enfermidade e na saúde, nas necessidades, nos perigos e diante da morte tais apreensões são indesculpáveis. O autor tem visto Deus, em resposta às orações, acalmar tempestades, alterar a direção do vento cenviar chuva no meio de prolongada seca. Ele tem visto Deus, em resposta às orações, acalmar os impulsos irados e as intenções assassinas de homens violentos e reduzir a nada as maquinações dos inimigos de seu povo. Ele tem visto Deus, em resposta às orações, restaurar moribundos quando todo auxílio humano era vão e preservarseu

Perguntas

309 a servo da epidemia que se propaga nas trevas da destruição que ataca ao meio-dia. Por mais de 27 anos, ele tem experimentado a fidelidade de Deus em suprir os meios financeiros para as necessidades pessoais e para as necessidades da obra da qual se ocupa. Ele tem visto Deus, em resposta às orações, suscitar muitos obreiros, não apenas uns poucos, para este imenso campo missionário, suprir os meios necessários para roupas, passagens e sustento c abençoar os esforços de muitos deles, tanto entre os cristãos nativos quanto entre os chineses pagãos nas 14 das 18 províncias mencionadas. para estudo', 74
from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Artigos complementares · Leitura — Alderi Souza de Matos, cap. 50: A Reconquista', 'Cristãos SENA muçulmanos: 5 uma longa história de conflitos e

Alderi cem a

Fa a d muauma ALDERI SOUZA DE MATOS, ministro presbiteriano, é doutor em história da Igreja pela Universidade de Boston e historiador oficial da Igreja Drsebinadiana do BrbSi

Extraído da revista Ultimato, n. 273, nov-dez. 2001. Usado com permissão.

Souza de Matos acostumados a ouvir notícias sobre o relacionamento hostil entre palestinos e judeus em Israel. Vez por outra, também tomamos conhecimento de violentos choques entre muçulmanos e adeptos do hinduísmo e de outras religiões na Índia e em outros países asiáticos.

Todavia, mais antigo e mais pleno de consequências para o mundo tem sido o relacionamento tenso por vezes abertamente belicoso entre cristãos e muçulmanos há quase 1,400 anos. Os recentes atentados terroristas nos Estados Unidos, as ações militares norte-americanas no Afeganistão e as iradas manifestações de muçulmanos em muitos países constituem outro capítulo dessa longa história de conflitos. O advento do islamismo Desde o início, o islamismo foi uma religião aguerrida e militante, marcada por intenso fervor missionário. Um conceito importante é o da jihad, ou seja, o esforço em prol da expansão do islã por todo o mundo. Esse esforço muitas vezes adquiriu a conotação de guerra santa, como aconteceu de maneira especial no primeiro século após a morte de Maomé, em 632. Movidos por um profundo zelo pela nova fé, os exércitos muçulmanos conquistaram sucessivamente a península da Arábia, a Síria, a Palestina, o Império Persa, o Egito e todo o norte da África. Nesse processo, o cristianismo foi enfraquecido ou aniquilado em muitas regiões nas quais fora extremamente próspero nos primeiros séculos. Lugares como Antioquia, Jerusalém, Alexandria e Cartago, onde viveram os pais da Igreja Orígenes, Cipriano, Tertuliano e Agostinho, foram perdidos em definitivo pelos cristãos. Em 674, os muçulmanos lançaram os primeiros ataques contra Constantinopla, a grande capital cristã do Império Bizantino.

No ano 711, os mouros atravessaram o estreito de Gibraltar sob o comando de Tarik (daí Gibraltar, isto é,“a rocha de Tarik”) e invadiram a península Ibérica, ocupando a maior parte do território espanhol. Em seguida, atravessaram os Pirineus e penetraram na França, mas foram finalmente derrotados RE por um ME exército PAES cristão comandado por Carlos Martelo, o avô de Carlos Magno, na batalha de Tours, em Poitiers, no ano 732.

Alderi Souza de Matos b

É verdade que, tanto no Oriente Médio e no norte da África quanto na península Ibérica, os sarracenos foram relativamente tolerantes com os cristãos e os judeus, Eles geralmente não eram forçados a se converter ao islamismo, porém tinham de pagar um imposto se não o fizessem, Em todas essas regiões, muitos acabaram aderindo à nova religião. Em diversas áreas que conquistaram, os seguidores de Maomé criaram grandes centros de civilização, como foi o caso de Bagdá, o Cairo e a Espanha, O Califado de Córdova foi marcado por notável prosperidade, destacando-se pela belíssima arquitetura com seus elaborados arabescos e pelos avanços nas ciências, na literatura e na filosofia. As Cruzadas O avanço islâmico teve profundas repercussões para o cristianismo, Como vimos, a Igreja oriental ou bizantina foi seriamente enfraquecida, tendo perdido algumas de suas regiões mais prósperas, À Igreja ocidental ou romana voltou-se mais para o norte da Europa. Com isso, o cristianismo tornou-se mais europeu e menos asiático ou africano. Também foi acelerado o processo de separação entre as igrejas grega e latina.

Outro problema para os cristãos foi a mudança de postura com relação à guerra ce ao uso da força. Desde o início, os cristãos haviam aprendido de Cristo e dos apóstolos a prática do amor e da tolerância no relacionamento com o próximo. Agora, num mundo cada vez mais hostil à sua fé, eles acabaram abandonando muitos de seus antigos valores e passaram a elaborar justificativas filosóficas e teológicas para legitimar a violência em certas situações. Esse processo havia se iniciado com a aproximação entrea Igreja e o Estado a partir do imperador Constantino, no século IV, tendo se intensificado nos séculos seguintes. Num primeiro momento, legitimou-se o uso da força contra grupos cristãos dissidentes ou heréticos, como os arianos e os donatistas. Séculos mais tarde, Os cristãos haveriam de articular uma versão “própria de guerra santa, dirigindo-a principalmente contra os muçulmanos,

375

À maior, mais prolongada e mais sangrenta confrontação entre cristãos e islamitas foram as famosas Cruzadas, que se estenderam por quase 200 anos (1096-1291). Antes disso, a cristandade já havia começado a lutar contra os muçulmanos na Espanha, o que ficou conhecido como 4 Reconquista, intensificada a partir de 1002 com a extinção do Califado de Córdova, Desenvolveu-se, assim, a partir da península Ibérica, uma forma de catolicismo agressivo militante, que haveria de estender-se a outras partes do continente,

As cruzadas foram um fenômeno complexo, cuja causa inicial foi a impossibilidade de acesso dos peregrinos cristãos nos lugares sagrados do cristianismo na Palestina, Por vários séculos, os árabes haviam permitido, salvo em breves intervalos, as peregrinações cristãs a Jerusalém, e estas cresciam continuamente, Todavia, a situação mudou quando os turcos seljúcidas, a partir de 1071, conquistaram boa parte da Ásia Menor e, em 1079, a cidade de Jerusalém, fazendo cessar as peregrinações, Com isso, surgiu na Europa um clamor pela libertação da Terra Santa das mãos dos “infiéis”,

A Primeira Cruzada foi pregada pelo papa Urbano II, em Clermont, na França, em 1095, sobo lema Deus vult (“Deus o quer”), Depois de uma horrível carnificina contra os habitantes muçulmanos, judeus e cristãos de Jerusalém, os cruzados implantaram naquela cidade e região um reino cristão, que não chegou a durar um século (1099-1187).

A Quarta Cruzada foi particularmente desastrosa em seus efeitos, porque se voltou contra a grande e antiga cidade cristã de Constantinopla, que foi brutalmente saqueada em 1204, A Oitava Cruzada encerrou a série de campanhas militares, que trouxe alguns benefícios, como maior intercâmbio entre o Oriente e o Ocidente e a introdução de inventos e novas ideias na Europa, mas os efeitos adversos foram mais profundos, aumentando o fosso entre as igrejas latina e grega e gerando enorme ressentimento dos muçulmanos contra o Ocidente cristão. Esse ressentimento persiste até os dias de hoje.

376 A Reconquista É verdade que alguns cristãos daquele período tiveram uma atitude mais construtiva em relação aos islamitas, procurando ir ao encontro deles com o evangelho, e não com a espada. Foi o caso de alguns dos primeiros membros das novas ordens religiosas surgidas no início do século XTII, os franciscanos e os dominicanos. O mais célebre missionário aos muçulmanos foi o franciscano Raimundo Lúlio (c. 1232-1315), de Palma de Majorca, que fez diversas viagens a Túnis e à Argélia.

Todavia, o espírito predominante do período foi o de beligerância não só contra os muçulmanos, mas até contra grupos cristãos dissidentes, como foi o caso dos cátaros ou albigenses, no sul da França, aniquilados por uma cruzada entre 1209 e 1229. Também data dessa época o estabelecimento da temida Inquisição. Na Espanha, a Reconquista tomou ímpeto no século XIll,ea partir de 1248 os mouros somente controlaram o Reino de Granada. Nos séculos XII e XIII, nesse contexto de luta contra os mouros, Portugal como um reino independente.

O Reino de Granada foi finalmente conquistado pelos reis católicos Fernando e Isabel, em 1492, o ano do descobrimento da América. Após um período inicial de tolerância, foi lançada contra os mouros uma campanha de terror, com o propósito de forçar sua conversão. Finalmente, em 1502, todos os muçulmanos acima de 14 anos que não aceitaram o batismo foram expulsos, como havia acontecido com os judeus dez anos antes. Sob a liderança de Tomás de Torquemada, a Inquisição espanhola, organizada em 1478, voltou-se de maneira especial contra os mouriscos e os marranos (muçulmanos e judeus convertidos ao cristianismo) acusados de conversão insincera.

Ao mesmo tempo em que o islamismo sofria essas pesadas perdas na península Ibérica, obtinha estrondosos sucessos no Oriente Médio e na Europa Oriental. Um novo poder islâmico, os turcos otomanos, vindos da Ásia Central, depois de se estabelecerem firmemente na Ásia Menor, invadiram em 1354a parte europeizdo

Cristãos e muçulmanos: uma longa história de comfma, Império Bizantino, gradualmente estendendo, seu domínio sobre os Bálcãs, regiões que estive. ram ainda recentemente nos noticiários (Sérvia Bósnia-Herzegovina, Albânia). Em 1453, de tomaram Constantinopla (hoje Istambul). selando o fim do antigo Império Romano oricatal e impondo novas e pesadas perdas à Ig Ortodoxa. Nos séculos XVI e XVII, os exércsos turcos haveriam de cercar duas vezes Viena, capital da Áustria (1529 e 1683). Os dois últimos séculos Um período especialmente humilhante par os muçulmanos diante do Ocidente cristão foi o colonialismo dos séculos XIX e XX, em: que virtualmente todas as regiões islâmicas do Oriente Médio e do norte da África ficaram sob o domínio de países europeus como a França, a Inglaterra, a Itália e a Espanha. Atéoiníciodo século XIX, aquelas regiões haviam sido parte do vasto Império Otomano, com sua capita! em Istambul. Com o colonialismo, chegaram os missionários, católicos e protestantes, com suas igrejas, escolas e hospitais.

Após a Primeira Guerra Mundial, â medida que as novas nações árabes foram alcançando sua independência, cresceu o sentimento nado nalista e a reafirmação dos valores islâmicos. Ao mesmo tempo, o islamismo ultrapassara hzviz muito os limites do mundo árabe, tendo alcznado, além dos persas e dos turcos, muitos outros povos na África e na Ásia, chegando à Indonésia, hoje a maior de todas as nações muçulmznas, com mais de 100 milhões de habitantes. E= muitas dessas nações, árabes ou não, a presesça de populações cristãs tem produzido graves conflitos entre os dois grupos, como aconteces ainda recentemente na Indonésia. Um acontedmento pouco divulgado foi o pavoroso genocidio promovido pelos turcos contra os armênios cristãos no início do século XX.

Outro evento que acabou por gerar nov animosidade entre os países muçulmanos é o Ocidente cristão foi a criação do Estado de Israel, em 1948, e a percepção de que o Ocidente, principalmente os Estados Unidos,

2, Qual deve ser a postura do cristão atual perante os muçulmanos em vista da agressão praticada

Adeti Souta de Matos apoia incondicionalmente o Estado judeu em sua luta contra os palestinos e outros povos ára= “bes, Dois novos ingredientes nessa luta foram o súbito enriquecimento de algumas nações árabes com a exploração do petróleo e o surgimento “do fundamentalismo militante entre os xiitas, antiga facção islâmica minoritária ao lado da maioria sunita.

A militância islâmica tem gerado várias vevoluções e regimes islâmicos, como aconteceu há alguns anos no Irã, Além do apoio do Estados Unidos a Israel, os fundamentalistas ressentem-se da presença de tropas americanas

Perguntas 1, Qual a diferença entre as batalhas de Israel por cristãos de outras épocas?

À na Arábia Saudita, o berço do islã, e da influénicia cultural do Ocidente em seus países, vista como danosa para sua fé e seus valores tradicionais,

Agora, no século XXI, o islamismo repre senta o maior desaÃo para o eristiantemo, em diversos sentidos, Como um dos “povos do livro” (expressão aplicada aos judeus e cristãos, visto serem mencionados no Condo), os cristãos precisam reconhecer os muitos erros cometidos contra os muçulmanos ao longo da História e renovar sua determinação de contribuir para o bem-estar político, social e espiritual dos seguidores de Maomé, para estudo no Antigo Testamento e as Cruzadas?', 75
from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Artigos complementares · Leitura — Johnstone: Cobrindo o globo', 'Cobrindo ndo glob

Patrick Johnstone o o E E, ae te o E 4 RAE

NA nanaRanRa TE PATRICK JOHNSTONE foi diretor de Erquisa da WE Intemacioria 1980 a 2004. Durante o longo periodo Es que trabalhou como inisioiáiô nã África, começou a compilar material que auxiliasse os cristãos a interceder pela evangelização mundial, com base em dados estatísticos. O esforço dtóm nt ferramenta para a oração em prol dos não alcançados. Atualmente, reside no Reino Unido, onde escreve livros, dá palestras e mentoreia líderes,

Artigo adaptado dos capítulos de 20 a 22 de A Igreja é maior do que cê penso (Mont Verde: Horizontes, 1998), Usado com permissão, globo /1 É on boas razões para nos animar com o que Deus está fazendo no mundo, mas esse entusiasmo deve ser equilibrado pela séria realidade que mostra quanto ainda resta a ser feito e quão tremendas são as forças que se opõem a nós. O fim da evangelização do mundo está em destaque, mas existem enormes barreiras a serem transpostas e fortalezas a serem vencidas antes do fim, quando então Jesus voltará.

Isaías profetizou a grande colheita espiritual com uma promessa:

“Transbordarás para a direita e para a esquerda; a tua posteridade possuirá as nações e fará que se povocem as cidades assoladas”

(Is 54.3).

Às três frases nesse versículo conduzem aos três maiores desafios missionários que enfrentamos, se pretendemos completar a tarefa. São eles: geográfico: alcançar todas as partes habitadas do mundo; étnico: alcançar cada povo; urbano: o conceito de alcançar cidades. O DESAFIO GEOGRÁFICO À promessa é que o povo de Deus transbordará para a direita e esquerda e também, poderíamos dizer, de norte a sul e de leste a oeste. Toda a parte habitada de nosso mundo deve ser apresentada ao evangelho do Senhor Jesus Cristo. E um desafio geográfico. Existem duros obstáculos, mas para que missionários os alcancem:

nenhum vale é tão isolado quanto o distante e não evangelizado Reino de Mustang, na fronteira norte do Nepal;

nenhuma ilha é tão distante quanto as ainda não alcançadas ilhas Maldivas, no oceano Indico;

es nenhuma floresta é tão densa quanto as florestas do Congo, onde vivem os pigmeus; PLONE nenhuma montanha é tão inacessível quanto o distante e do TRAÇA PIT pe ma Eua NEGA o nenhuma cidade é tão fortificada quanto Meca, em que é proibido a qualquer cristão pisar;

O Cinturão a. de Resistência a e a Janela 10/40 e EM

Países com maioria de muçulmanos, hindus ou budistas a DO A Pa o may sERá A pis Po o. a EP aaa ia a sê tea Pedi no 4 Dodo o QU reta a GET a Bea N EAD a Nas Na Do ed TE sê Wes

SA ER MEDO, o asim to ani Dad Paiao CASS NAAS ea a io Rio ca Econis O sê sa o “q AA é sá os “y DE Sr(a 2a as Wo a

A a E fita EE 36 países muçulmanos população: 1,1 bilhão (2000) O teve OO ranleide 2 países hindus população: 1,1 bilhão (2000) E N O As Rap Pe. As a 12 países budistas população: 305 milhões (2000) ã

E Co ABR tina Total 50 países Es” Pense E Budista População: 2,5 bilhões (2000) 4

Não evangelizados quanto Não cristãos A Janela 10/40 Restante do mundo Mongólia, repúblicas muçulmanas da Central, Sri Lanka, Maldivas e Somália deveriam incluídos, mas estão fora da Janela, Alguns países importantes da Janela, como a Corcia do Sul, Filipinas, Eritreia muitos países haver 20% de não evangelizados 47% de não cristãos vivendo lugares com acesso ao evangelho B. Barrett estima haver 17% nenhum deserto é tão hostil como o oásis Saariano, na Argélia, onde vive o povo Berbere mzabi.

Eis alguns desafios geográficos: AJanela 10/40 Grandes faxas da superfície do globo conti“quam sem uma testemunha cristã nativa. O mapa a seguir mostra a extensão da área não alcançada pelo evangelho, predominantemente no norte da África é e da Ásia, i onde o islamismo, i Á o hinduismo di e budismo dia são dá as religiões ti dominantes. O mapa destaca essa desafiante região do mundo, que deve ser prioritária area para aqi agp eba ro as missões pioneiras na Pp próxima década nas no Eno, Fem SVO TRAP à area Mais nes e A, Ee PUNCO pe Da urante anos, chamei essa região Cinturão de Resistência. Desde 1990, o nome Janela “10/40, criado por Luis Bush, do Movimento AD2000,! tornou-se amplamente conhecido. Essa é a área entre as latitudes 10º e 40º ao norte dalinha do equador e entre os oceanos Pacífico e Atlântico. O conceito é bom, e o impacto publicitário, brilhante, mesmo que esse retâni Evangelização mundial e a Janela 10/40 o EM Ê ar DE: À e L E E é EE 5: E! EO Faorl ES Rê mu ooo

Eegsee ev mnreaa] 0.47

Publicações do Movimento AD2000 e Além.

“Indonésia, as Ásia europeus mediterrâneos, quase todos com populações cristãs “Johinstone estima e 33% de cristãos professos. David

Co 5.14,15.

gulo apenas aproxime as áreas de maior desafio espiritual? Os países que estão essencialmente dentro ou próximos da Janela 10/40 que são menos evangelizados ocupam apenas 35% da superficie do globo, mas representam 659% de sua população. O mapa inclui tanto o conceito da Janela 10/40, mostrado pelo retângulo, quanto

Cinturão de Resistência (sombreado).

O número absoluto de povos vivendo nã área da Janela que Dos e de ao idas tas RA pa 1,2 send aciy à ÇA evangelho,'' e mais de 95% dessas pessoas vivem dentro da Janela, Como ignorar tal número diante da eternidade sem Cristo e a falta de oportunidade de ouvir as boas novas do evangelho e experimentar o amor de Deus, revelado no Senhor Jesus? Que desafio de fé, intercessão e ação! Temos de fazer algo a respeito, pois o amor de Deus nos constrange a isso.

Acrescente-se ao desafio o fato de que mais de 90% dos mais pobres, dos excluídos e das crianças maltratadas e menos alfabetizadas vivem na Janela. É 0 lugar em que doenças como AIDS, tuberculose e malária se espalham sem tratamento e sem controle. E também a área menos acessível a qualquer esforço missionário aberto, tanto em razão do sistema religioso e político antagônico pelo estilo de vida e pela localização geográfica. Por exemplo, quase todos

E

Estamos diante de nosso maior desafio para a evangelização do mundo. O tempo para o evange-

039 hosurgiue floresceu sobre dois

137 terços do mundo e se encaminha para o terço restante, em que os últimos baluartes do reino de ser e nominais, talvez sejam ou devam ser omitidos.

em de não evangelizados.

Ee Pee ee a

Nus

*V. Johnstone, Patrick, À Igreja é mator do você (Monte Verde: Missão Horizontes, 1998). Pesquisas adicionais informações dos indicaram alguns dos 1,500 não etnolinguísticos, lista paralela, contendo categorias, pois da maior relevância tarefa de plantar igrejas.

era uma os povos menos ou que com *Um bom e colorido desses blocos de afinidade foi publicado pela SEPAL Global Mapping International

Qu Satanás ainda precisam ser derrubados. Não devemos minimizar o tamanho da tarefi, mas também não devemos ser desencorajados por sua magnitude, O DESAFIO ÉTNICO Jesus declarou, no grande mandamento de Mateus 28.19, que devemos fazer discípulos de todos os povos. Não é suficiente teruma presença cristã em todo Jugar, mas também terseguidores de Jesus em todos os povos. Já vimos o emocionante progresso na tarefa de alcançaros povos." Não somente sonhamos em discipular cada pessoa, mas podemos ver esse sonho realizado em nossa era, Existem vários ministérios importantes que devem ser intensificados para que o discipulado seja eficaz e duradouro. Pesquisa Precisamos conhecer os fatos, se quisermos discipular todos os povos. Pesquisar as informações é de extrema importância. Foram desenvolvidas pesquisas durante todo o século XX. O impulso para a pesquisa sobre os povos do mundo foi acelerado nos últimos 30 anos.

Precisamos saber quem são os povos não alcançados, onde eles vivem e qual sua condição quanto à evangelização. À Consulta Global sobre Evangelização Mundial, realizadaem Pretória, em junho de 1997, foi uma oportunidade de apresentar um panorama praticamente completo dos povos não alcançados do finaldo século XX.

Durante os meses que antecederam o congresso, muito trabalho foi realizado a fim de preparar as listas dos povos do mundo. Foi deque pensa e campos etnoculturais. Isso veio a lume após o argumento de alguns não correspondiam à realidade etnocultural da plantação de essas era "O objetivo lista completa de todos população inferior a 10 mil habitantes.

À lista completa está disponível como livro, publicado Springs). Disponível em: «www.ad2000.0rg>.

mapa (GM). Disponível em: ewww.infobrasilorg>.

roem cidido vários anos antes que precisariamos Jim; tar estrategicamente os povos ao de popula, superiores a 10 mil e com menos de 5% q, cristãos ou 2% de evangélicos, À lista també,, foi limitada por etnia ou língua.” Os pontos de restrição eram razoáveis, contudo arbitrários, A dificuldade na obtenção de informações ag. radas sobre os povos menores era a principa consideração: Isso reduziu o número de cep. ca de 3 mil para 1,500 povos estrategicamen. te menos alcançados, Pesquisas posteriores em agências missionárias comprometidas com os povos dessa última lista revelaram que apenas entre 500 dos 1.500 povos não havia trabalho missionário conhecido." Todavia, tenho conhecimento, por outras fontes, que existe atividade missionária entre vários desses povos, mas que os missionários não nos enviaram os questionários respondidos.

Também percebemos que ler, entender e agir para atender de forma significativaa uma longa lista de 1,500 povos é um desafio assustador. Por esse motivo, agrupamos os povos em duas categorias:

É

1. Blocos de afinidade. Foram definidos 12 blocos, nos quais agrupamos cada um dos 1.500 povos relacionados. Apresentamos aqui um mapa com 11 deles? O décimo segundo bloco é o dos judeus, que estão dispersos e por isso não estão representados no mapa. O décimo terceiro grupo não constitui um “bloco”, mas uma categoria “depósito”, para os povos não relacionados ao redor do mundo e que não se encaixam nos outros 12 blocos. Os 11 blocos regionais estão agrupados por afinidades linguísticas, históricas, culturais etc, Todos estão que povos eram mas líderes cristãos indianos de que as categorias etnolinguísticas igrejas entre as castas da Índia, Logo tivemos de redigiruma para a alcançados, seja, incluísse também aqueles

É pelo escritório do Movimento AD2000 e Além (Colorado

Be A e

Ei to Go (Pasadena: William Carey Library, 1989). a patrick Johnstarl atuados dentro ou próximos da Janela 10/ 40. 4 a joso que quase todos os povos menos alcandos no mundo sejam exatamente os imigrandesses 11 blocos, que hoje o vivem na Europa, tes “nas Américas e na Australásia.

2. Grupos de povos. Dentro de cada um dos blocos de afinidade existem outros agrupamentos menores de povos, que normalmente têm um nome ou identidade em comum, porém estão divididos por fronteiras políticas, diferenças no dialeto e outros. Definimos cerca de 150 desses grupos de povos, que compõem cerca de 809% dos 1.500 povos da lista do Projeto Josué. Aqui estão os 50 exemplos mais importantes dos grupos de povos menos alcançados nos vários blocos de afinidade: África Sahel: fulani, mandingo, wolof, hausa, kanuri Cushita: núbio, somali, beja Mundo árabe: Argélia árabe, kabyle, riff, árabe líbio lraniano; curdo, farsi, tadjique, pathan, balúchi, luri Turco: turco, azeri, cazaque, tártaro, usbeque, uigur Indo-iraniano: bengali, biari, povos de fala hindi, urdu, gonde Tibetano: tibetano lhasa, amdo, butanês, khampa Sino-asiático: hui, mongol, japonês. Sudeste da Ásia: birmanês, tai, Zhuang, laosiano, dal Malaio: minangkabau, acenês, sundanês, madurês Euro-asiático: checheno, circassiano, bósnio, grupos omenaries Esses povos estão Ê classificados e na seguinte tabela: Nome dos blocos Ei sa ne Es aeb povos bloco África Sahel 19 395 pato Rana o lraniano 12 181 Eco o nao-iraniano Tibetano 5 197 Ee asia ugeste Ga Asia Malaio 18 175 po aslafico 5 4 à à Ed Total (aprox.) te

Dawn 2000; 7 Million Churches necessária multiplicação de igrejas aplica-se tanto às áreas mas a acessibilidade às igrejas não é a mais adequada.

533

Pela primeira vez na história das missões, temos uma lista completa e confiável dos povos do mundo c a extensão em que foram evan-Belizados. Essa é a razão E» que torna possível 4 a próxima etapa da plantação de igrejas. Plantação de igrejas Alguns podem perguntar: “Será possível ver realmente as iniciativas de plantação de igrejas lançadas em todos os povos ainda em nossa geração?”.

O fato é que estamos em falta para com os povos que ainda não contam com um trabalho pioneiro em andamento ou em projeto. Chegar a esse estágio será um momento especial na história de missões! Existe a necessidade de trabalho em grupo e de parcerias eficazes, a find dé garantir o caminho mais eficiente para al cançar a meta.

Plantar uma congregação de crentes numa pequena tribo de mil habitantes pode ser sigiifontivê. aee iáua igreja Entré iinilhãos de tibetanos ou algumas igrejas ye, entre os 200 milhões de bengalis o significa e menos q que uma 5 gota

Nail aÃ d uma igreja para cada povo, mas Isso é apenas o começo. Aqui vemos como o Disciplinamento de u ma N Nação 5 Inteira Du (DUNI), de de) Jim Montgomery, é tão eficaz. Precisamos nos certificar de que haja um grupo de crentes fieis e firmes envolvidos no alcance de cada homem, mulher e criança no mundo. Calculo que hoje existam cerca de 3 milhões de congregações cristãs de todos os tipos no mundo. Montgomery escreveu um livro desafiador, no qual enfatiza a tarefa à nossa frente.''” O movimento fundado por Montgomery causou impacto o em muitos países ao redor do mundo, ao estabelecer "alvos abrangentes multidenominacionais a para “plantação de igrejas.

A plantação de igrejas foi muito enfatizada por meio de ministérios de mídia e de apoio,

O desafio de Montgomery para ainda não evangelizadas quanto às que já foram evangelizadas, pise

Blocos de afinidade é e a Janela 10/40 FER ae, Es 3 a we o e ciento coque! reter act sreeem Tete E q (ma RO ToTam astato treme iosessssres igesies ei ssralN DERLTS NaN A Sr A (O A rrrerspes so essesIrIaea coca cocos sa ces toSESESISETA PTE Rua apt e angra Pinta ESSES o aa ndo ea í o CA O E E E SEoh— Aa rates srSEToNaçes Ei qo CONTATE GITSRERES qi apima sera e RA nº) REKEEEUS Sestiissiciiiiccass EST E Tectos gra sat tÉ a

CE UE DOC 00 00004 CETTE ou mam a Poema. Gas

O PE e... 8

E eo) não +0us tétts: do di Doo ga so ANN et ET O TI ÃO ERRO! Vet Í go

PESE ARA, DO Cad: fe VE Ad. o canta q De: 4

E Se, ES RES 9 Sa dresd)

A$tE

HS”) Doaas SE Os povos do mundo menos evangelizados agrupados por caracteristicas comuns E (linguísticas, culturais, econômicas ou políticas) E E E Árabe Cushita África Sahel Riu Turco indo-iraniano Res (280 povos) (40 povos) (400 povos) (260 povos) (180 povos) No Indo-lranlano Tai/ Dai Tibetano Sino-asiático Malalo Euro-asiático A o (450 povos) (130 povos) (80 povos) “e 4É (60 povos) A ARO qem) (OO poses) E, Pias após 1.500 1800 4 of Christian (Hasmondworth: Penguin, 1964), p. 269-70.

que são suscetíveis às linguagens dos povos. imensos esforços estão sendo feitos nesses miaistérios, que têm o potencial de cobrir quase votalmente os povos populações do mundo, Descrevo aqui resumidamente os alvos cas possíbilidades de alguns desses megaministérios. Tradução das Escrituras É praticamente impossível conce- Idiomas ber uma igreja forte num povo que 500 não tenha a Bíblia traduzida em 3000 seu idioma, À falta das Escrituras paraaslínguas berberes do norte da E África foi um fator importante no 2000 "surpreendente desaparecimento da ceúá grande igreja norte-africana entre à chegada do Islã, em 698, coséculo 1000 XII. O mesmo se aplica aos povos so núbios, que vivem acíma do Nilo sucumbiram ao islã anos de cristianismo. À Bíblia nunca foi traduzida para as línguas núbias.

Para William Carey, a tradução da Bíblia era tão importante que se tornou o principal impulso de seu trabalho missionário. Ele quis lançar os alicerces para as fortes igrejas hindus que surgiriam por obra de seus sucessores missionários. O impacto da tradução da Bíblia é mostrado pelo trabalho pioneiro da Sociedade Missionária de Londres em Madagáscar. Ela deu prioridade máxima à tradução do Novo Testamento para o malgaxe. Logo depois, uma terrível perseguição surgiu por parte da rainha Ranavalona. Os missionários foram expulsos. Apesar de tudo, a Igreja sobreviveu e até se multiplicou.”

Podemos apenas louvar a Deus pelo ministério extraordinário das sociedades bíblicas ao redor do mundo, que multiplicaram repetidamente o número de línguas que possuem as Escrituras. Em tempos recentes, Deus leyvantou a Associação Wycliffe de Tradutores da Bíblia, cujo propósito é fornecer um Novo Testamento para cada língua que ainda não tem

Stephen Neill, History Missions

4 Escrituras, Ela é hoje uma das masores agências missionárias transculturais no mundo. Seus obreiros haviam traduzido as Escrituras para

)ínguas até 1997, é tem equipes trabalhando em mais 965 traduções, À taxa de crescimento de tradução da Bíblia para novas línguas é mostrada no diagrarma a seguir. em que foram traduzidas as Escrituras 1600-2000

2509 o

3 s2 67

1700 1800 1500 100

Ano

Das 6.912 línguas do mundo, pelo menos 925 e talvez mais de 2 mil ainda precisem do trabalho de tradução do Novo Testamento. À maioria desses idiomas está na África Sahel e no Chifre da África, entre os povos iranianos, na Ásia Central, no Cáucaso, na China e na Índia. Devemos recrutar, em caráter de urgência, muitos outros missionários tradutores da Bíblia, talentosos e dedicados, de forma que possamos veressa tarefa alcançada. Há muito trabalho, o bastante para manter um exército de tradutores ocupados por uma geração ou mais. Literatura O poder da literatura não cristã em corromper milhões já é conhecido. Basta mencionar o mal pernicioso disseminado pela obra racista Mein Kampf, de Hitler, as teorias de Marx em O capitale as diatribes venenosas de Mao Tsé-tung em seu Pequeno livro vermelho.

O poder da literatura cristã não deve ser subestimado. Alguns calculam que mais da metade screen

Mountains Singing: The Story of Gospel Recordings in the Philippines (Chicago: Count it Joy: The Story of Joy Ridderhof (Gospel Recordings, 1978).

dos cristãos evangélicos atribuem sua conversão, pelo menos em parte, à literatura cristã.

Existe hoje um volume imenso de literatura cristã produzida e distribuída paralelamente, complementar ao trabalho das sociedades bíblicas, taís como The Bible League (A Liga Bíblica), Scripture Gift Mission (Missão de Doação das Escrituras), os Gideões Internacionaís, a Liga de Testamento de Bolso e muitos outros, Descreverei aqui o que consideroa visão literária mais abrangente que o mundo já viu: o ministério Cada Lar para Cristo. Aideia é muito simples, e sua estratégia teve alcancce impacto extraordinário,

O trabalho consiste em distribuir com dedicação um simples exemplar do evangelho para cada lar ou instituição em cada país do mundo. O ministério Cada Lar para Cristo distribuiu sistematicamente mais de 2,5 bilhões de mensagens do evangelho no mundo todo, cadauma com um cartão de decisão, em línguas faladas por 96% da população mundial. Os analfabetos são alcançados por mensagens em áudio, eos deficientes visuais, com textos em braile. Mais de 58 milhões desses cartões de decisão retornam aos 80 escritórios globais, e cada remetente recebe um curso bíblico por correspondência dividido em quatro partes. O alvo é que cada contato seja apresentado a um grupo de comunhão cristão.

Outras estatísticas são igualmente impressionantes. Em 1997, quase 2 mil nativos foram empregados em tempo integral, em 80 países, para coordenar cerca de 10 mil distribuidores voluntários no campo durante uma semana. Esses obreiros levaram o evangelho, em média, a 350 mil novas famílias a cada sete dias ou seja, cerca de 50 mil famílias por dia. Baseados numa média global de 5,2 pessoas por família, isso significa que cerca de 250 mil pessoas tiveram algum acesso à mensagem de salvação por meio da atividade do ministério Cada Lar para Cristo a cada dia.

25, M. Barlow, Thompson, all

Nas áreas de atividade em que não há igrejas de qualquer tipo, os convertidos são encorajados a reunir-se em comunhão, para estudo da Bíblica e adoração em pequenos grupos, chamadas Grupos de Cristo. Estes, por vezes, tornam-se congregações bem estruturadas, Até hoje, mas de 100 mil Grupos de Cristo foram estabeleodos ao redor do mundo, a maioria em regiões comoa Índia, Indonésia, Nepal, África, Pacífico Sulea antiga União Soviética. De acordo com um relatório recebido recentemente da África, um Grupo de Cristo perto de Kinshasa, na República do Congo, cresceu tornou-se uma igreja estabelecida com mais de 2 mil membros em menos de dois anos. Numa cidade da Ucrânia, outro Grupo de Cristo chegou a mais de 3 mil membros em apenas 18 meses.

Desde que o ministério Cada Lar para Cristo foi lançado, em 1953, no Japão, a distribuição sistemática, de casa em casa, tem sido feita em mais de 190 países. Destes, 96 tiveram pelo menos uma cobertura nacional completa. Outros, como Cingapura, Hong Kong e Tarwan, tiveram diversas coberturas. Outros ainda, como a Índia e as Filipinas, tiveram duas coberturas é estão sendo percorridos pela terceira vez. Esse ministério é hoje ativo em 80 países, com muitos novos trabalhos na antiga União Soviética, na África de fala francesa, na Ásia e no Pacífico.

É impossível não ficar impressionado com a amplitude dessa visão e seus resultados, ainda que a magnitude de tais números encubra decepções cas falhas. Assim, temos de admitir que, mesmo num país grande e complexo como a Índia, com a maior concentração de pessoas não evangelizadas do mundo, aparentemente quase todas as casas foram visitadas duas vezes! Ministérios de áudio A história de Joy Ridderhof e da Gospel Recordings, missão fundada por ela, éuma dasmaiores sagas missionárias do século XX.2 Forums inovação brilhante planejar meios para gravar

Moody, 1952) Pass

Aa)

a cena

Você pode Gospel Recording Network pela Internet: <http://globalrecordings.net>.

“O número apurado pela Associação Wycliffe de Tradutores da Bíblia de 6.912 línguas conhecidas, também aciona dialetos dessas línguas, acrescentando milhares deles à relação. À diferença língua dialeto é difícil apenas mas e um povo um em outra língua, assim se faz necessária tradução Novo Testamento.

The Touch of Jesus (Orlando: New Life, 1995). Esse livro conta sobre história, lutas, vitórias essa extraordinária de evangelismo.

Patrick Johnston.

e simples registros de mensagens do evangelho em discos, e mais tarde em fitas cassetes e CDs, mesmo em línguas em que ainda não havia crentes ou missionários. O ministério também é capaz de produzir, rápida e regularmente, mensagens do evangelho para uma imensidão de idiomas e dialetos. Esses recursos, associados a um aparelho simples que reproduza essas mídias, permite aos missionários deixar uma mensagem em áudio que pode ser reproduzida repetidamente. O analfabetismo, a falta de crentes locais ou de missionários que falem determinado idioma, não impede que a verdade seja levada aos povos não evangelizados, Essa ferramenta tem sido com frequência o primeiro meio pelo qual os povos não evangelizados ouvem o evangelho pela primeira vez.

A Gospel Recordings cresceu e transformou-se em uma rede internacional de organizações missionárias sob o nome Global Recordings Network, com bases em mais de 40 países. Eles produzem e distribuem materiais de evangelismo em áudio em muitas das línguas faladas em todos os países. A GRN já preparou mensagens evangelísticas em maisde 5.700 idiomas!"

Uma das vantagens desse trabalho é que Os recursos e tempo despendidos são menores, permitindo que se façam gravações para os po"Vos minoritários, que talvez não pudessem ser alcançados senão em muitos anos por outros "meios, como programas de rádio ou tradução da Bíblia. Um tradutor da Bíblia precisa pensar "cuidadosamente antes de comprometer todos Os recursos e de 10 a 15 anos para traduzir o Novo Testamento num idioma falado por 300 pessoas, mas é bem menor a hesitação em preparar uma fita cassete ou uma série delas para povos com 50 falantes.

contatar a os determinada, depende não de fatores linguísticos, com seu vizinho de língua e algumas palavras diferem, ou a dialeto e a

Paul Eshleman, frutos do filme Jesus, ferramenta

O GRN tem um programa chamado Tail-enders —“os últimos a serem servidos, caso sejam servidos”, À Gospel Recordings” Global Recordings Network é comprometida em encontrar e prover a evangelização desses povos ignorados e negligenciados. O mais recente alvo éter uma gravação para cada idioma ou dialeto vivo no mundo, algo em torno de 13 mil,!*

Não há espaço para falar de tantas outras agências de igual valor, que se especializaram em produzir materiais de áudio para evangelismo e discipulado: a Bíblia em cassete, ensino e outros. Quero aqui simplesmente mostrar o poder desse meio e sua contribuição para a evangelização dos povos menos evangelizados na terra, principalmente aqueles deixados por outros ministérios, seja por seu tamanho mínimo, seja por seu grau de isolamento. Esse meio acentua nosso potencial para alcançar cada raça, tribo, povo e língua ainda em nossa geração. O filme Jesus e vídeos O projeto do filme Jesus, a representação literal davida de Jesus de acordo com o evangelho de Lucas, já se tornou uma das ferramentas mais poderosas da atualidade e o filme mais exibido na História.”

À visão era de que, na virada do milênio, pelo menos todos os 300 idiomas falados do mundo por mais de um milhão de pessoas, e quase todos os idiomas falados por mais de 75 mil pessoas, além de muitos outros grupos minoritários, tivessem uma versão do filme disponível. O alvo era produzir mais de mil traduções até 2008.

O esforço em planejar e levantar os recursos necessários para produção desse filme em tantos idiomas são assombrosos. Milhares de obreiros cristãos, em muitas agências, têm trabalhado duramente no preparo de novas versões ou na é mas reentre e de ser também históricos, culturais sociais. Se antipatiza gradação de pronúncia, isso já é o bastante para transformar de outro a as e

Deus está fazendo obra maravilhosa Brasil! A Igreja pelo duas mais rápido população últimos 30 A Região Nordeste apresentou maior taxa de crescimento de evangé-

No Brasil, existem entre 100 mil 140 mil igrejas evangélicas de todos os tipos. Cerca de um terço dos

Nas regiões urbanas, o crescimento é maior que nas áreas rurais. Enquanto as igrejas urbanas tendem a ser maiores, as zonas rurais possuem comunidades pequenas de difícil acesso. Esses fatores implicam a nede mais igrejas, a fim de que cada habitante dessas regiões tenham acesso ao da Igreja pela SEPAL. Ele coleta informações estratégicas sobre povos não no e outros recursos, o um e povos indígenas brasileiros. Atualmente reside na Espanha. Lourenço Kraft é missiólogo pesquisador. Foi diretor de pesquisas da SEPAL-Brasil durante 17 do Projeto Brasil

9 anos. Atualmente reside na Inglaterra, coordenando pesquisas pela SEPAL (OC International).

Extraído do livro Anunciai entre noções (Curitiba: Esperança, 2004). Usado permissão.

(im 538 extensiva exibição desse filme, que se tornou um componente importante para a evangelização mundial, Rádio O ministério da Christian Radio tem uma história extraordinária e alguns resultados impressionantes em quebrar gradualmente o preconceito arraigado contra o evangelho. Também deu uma contribuição essencial ao ministrarensino aos cristãos e seus Jíderes, principalmente onde nenhum outro recurso era acessível.

Os resultados mais dramáticos de evangelismo ocorreram onde os programas de relevância cultural eram transmitidos regularmente emáreas fechadas para a maioria das iniciativas míssionárias. Justin Long, do Global Evangelization Movement [Movimento de Evangelização Global] e da World Christian Encyclopedia (Enciclopédia cristã mundial), calcula que existam cerca de 3 milhões de pessoas que aceitaram a Cristo como resultado dos programas de rádio e televisão, dos quais provavelmente 400 mil estejam isolados. Essas pessoas, com frequência, são cristãos secretos, em áreas onde não existem igrejas. Tais números são quase impossíveis de serem verificados, no entanto, histórias incríveis surgem da Rússia, da China, da Índia PUTAS VE EO ENT ATT PED SÉ DI CASS A situação do Brasil uma no a nos anos. licos na última década.

e evangélicos estão nas igrejas num domingo normal. cessidade Ted Limpic é mobilizador e ao redor do mundo. É autor de diversas publicações de intercessão pelos e 21 durante as

Y cobrindo o pda e de muitas partes do Oriente Médio, onde muitas igrejas estão sendo plantadas nutrídas quase que totalmente por obra de rádios cristãs, Os ministérios da HCJB, no Equador, da Rádio TransMundial, da Far East Broadcasting Company Association, da Radio JBRÃcde muitas outras, geraram frutos além do que 05 detratores acreditavam.

Por exemplo, calcula-se que há alguns anos 15% da população da parte sudeste do Jémen muçulmano ouvisse a estação cristã FEBA, das ilhas Seychelles, no oceano Índico. No entanto, em muitos dos povos remanescentes, as dificuldades parecem praticamente insuperáveis, e serão necessários investimentos financeiros e técnicos, desenvolvimento de ministérios de apoio e uma equipe de locutores nativos cristãos, com maturidade cristã, para fazer os programas. Eis alguns exemplos do desafio;

Os3 milhões de luris no Irásão um dos povos menos evangelizados no mundo. Não se tem conhecimento de cristãos no Irã envolvidos em alcançá-los, e existem poucas comunidades em outros países onde são mais acessíveis. Como fazer programas onde não há cristãos prontos para falar num microfone radiofônico? TINTAS OI EP RE AIR a OT a AT te sinta À

Ted Limpic e Lourenço Kraft cresce menos vezes que a e fácil evangelho.

alcançados Brasd entre eles manual Adote povo 30 dias

7 anos e

ER com

ESEENISEEOTEEET Es ESSSSSESE as populações ribeirinhas. Existem ali mais de 40 mil com população média de 130 habitantes. Em 1999, estimou-se de 90%, isto é, 36 mil dessas nas as igrejas não estão distribuídas de maneira regular entre os As possuem bairros muito alcançados outros alcançados. Uma pesquisa mostrou que as áreas mais plantar entre 100 150 mil igrejas lugares os que ainda não alcançados; motivar a Igreja para plantar igrejas lugares estratégicos; preparar para as e as missões para os grupos que não serão grupos banos, ricos, sertanejos, ribeirinhos outros lugares “fora de mão”).

Osd milhões de camiris no Níger, na Nigéria e no Chade foram evangelizados pelas missões SUM e SIM e por várias outras durante décadas, mas após todo esseesforço os cristãos existentes nesse contingente muçulmano podem ser contados nos dedos das mãos e dos pés. Não há igrejas viáveis nem líderes cristãos capazes de recrutar obreiros para o ministério radiofônico. Mesmo que existissem, esses obreiros essenciais provavelmente teriam de abandonar um ministério-chave para assumira tarefa. Preparar um programa diário de 30 minutos com conteúdo e apelo necessário é um desafio que exige uma equipe de obreiros dedicados aos programas e ministénios de apoio, essenciais para mantê-lo, Comunicação via satélite O rápido desenvolvimento de transmissões via satélites e até mesmo a rápida distribuição de antenas parabólicas afetaram radicalmente nosso mundo. Infelizmente, sempre coma pior programação onipresente, que incita aos instintos mais básicos do homem, mas até mesmo esse veículo tem provado ser um meio extraordinário de proclamação do evangelho em terras até agora praticamente inacessíveis à evangelização. A Regido Norte apresenta uma porcentagem alta peculiaridade dessa região são nhas comunidades ribeirinhas não tinham igreja evangélica Mesmo cidades, e pouco ricas da cidade possuem menos igrejas evangélicas. Para alcançar o Brasil precisamos;

a novas nos identificar lugares foram novas em líderes igrejas já existentes mobilizar e

Para algumas nações, o surgimento da tecnologia de comunicações via satélite é uma dádiva por estar livre da necessidade de provisão de cabos, que custam caro, tanto para o sistema de telefonia quanto para as redes de televisão. Isso significa que até mesmo os países menos desenvolvidos podem adotar tecnologia do século XXI. À pobreza não é necessariamente 0 principal fator no acesso à alta tecnologia de comunicações. Portanto, podemos crer que os programas de televisão cristãos bem gerenciadose transmitidos em espírito de oração podem causar impacto a muitos povos, abrangência que não seria possível por outros meios.

Vários países muçulmanos mobilizaram-se para conter os efeitos “corruptos e subversivos” das crenças religiosas e morais existentes no amplo acesso às programações, sobre as quais não têm nenhum controle. Outros tentaram banir as antenas parabólicas, sem sucesso. Elas tornaram-se cada vez menores com o passar dos anos, e mais facilmente encobertas. Na década de 1900, em Teerã, capital do Irã, mais de 100 mil antenas eram instaladas por mês.

O rápido crescimento da “banda larga” permite transmissões com a possibilidade de programas de discipulado interativo por e-mail, por som ou por vídeo. Essa tecnologia abre caminho de evangélicos, no contexto nacional, porêm uma comunidades ribeirique cerca alguma.

bairros. cidades certos; que irão surgir;

ER RA atingidos naturalmente (tribos, etnicos ur-

David Barrett, Cities and World Evangelization (Birmingham: New Hope, 1986). Barrett define megacidade S que possuem um milhão habitantes, supercidades aquelas 4 milhões supergigantes cidades mais e par o discipulado individual em qualquer língua. As restrições fronteiriças tornam-se cada vez menos relevantes, para qualquer ministério. Um missionário residente na Alemanha pode discipular crentes mantsis, no norte da Sibéria, um curso teológico intensivo a distância pode ser ministrado de Seul, na Coreia, aos mauritanos, em árabe, Um grupo de refugiados hmongs na Guiana Francesa pode manter contato com seus companheiros crentes no Laos! Existe nessa tecnologia um grande potencial para o trabalho missionário significativo até os confins da terra, que pode ser administrado pela congregação local, nas próprias instalações da igreja.

Não devemos ficar deslumbrados com possibilidades tecnológicas e pensar que a necessidade de oração intercessória foi minimizada, quea necessidade do sofrimento e da cruz tenha sido anulada ou que o verdadeiro valor da renúncia do missionário transcultural e sua adaptação à nova cultura tenha se tornado óbvio e nulo. À tecnologia reduz uma única dependência: a da proximidade física e do contato pessoal direto, mas não reduz seu valor. Cada povo na terra deve ser alcançado pelo evangelho e discipulado pelo Reino, mas a flexibilidade e a variedade das ferramentas se multiplicaram. Vamos usálas onde forem adequadas.

Cada veículo abrange uma camada da extensão global. Nem todas as camadas irão atingir cada pessoa igualmente, mas a multiplicidade de meios nos dá motivos para crer que a tarefa pode ser terminada, se mobilizarmos os recursos da Igreja. O DESAFIO URBANO As grandes cidades do mundo são o desafio principal das missões no novo milênio. Ignoramos as cidades perigosas. As grandes cidades do nosso mundo constituem a fonte da maioria das riquezas e também da miséria, da sabedoria e da depravação, das inovações e do pecado.

como c 10 milhões de habitantes, ici £Obrindo O globo O mecanismo para a mudança social está nas cidades, mas, se utilizado sabiamente, poderá ser o dínamo para o crescimento do Reino,

O novo milénio será um mundo urbano, assim como os séculos anteriores do cristianismo transcorreram num mundo rural, O fim do segundo milênio foi também o fim da predominância rural, com mais de 50% da população mundial urbanizada.

Há dois séculos, o mundo era rural. À taxa de urbanização cra de 4%, e existia apenas uma megacidade: Pequim, com 1,1 milhão de habitantes.!” Em 1900, a taxa chegou a 14%, com 18 megacidades e 2 supercidades: Londres e Nova York. No ano 2000, chegou-se a 51%, com cerca de 20 supergigantes (apenas uma está na Europa e América do Norte), 79 supercidades e 433 megacidades, Seguindo essa tendência, em 2100 o número de habitantes rurais provavelmente corresponderá a apenas 10% da população mundial. As cidades são hoje mais importantes para a estratégia missionária que nos dias de Paulo.

Às missões pioneiras no século XX foram caracterizadas pelo desafio de chegar aos povos não alcançados, processo ainda em via de conclusão. O século XXI será caracterizado pela necessidade de missões pioneiras nas grandes cidades do mundo, um caleidoscópio multifacetado de necessidades muito mais complexo. Missões pioneiras no século XX eram rurais. Agora devemos direcionar nossa atenção ao desafio urbano como a fronteira do futuro,

Temos ganhado o campo e perdido as cidades, e durante todo o tempo nossa consistência rural tem escoado para as cidades. O encanto e o romantismo associados às florestas, montanhas, desertos e ilhas remotas parecem ser o “verdadeiro” trabalho de missões para a clientela doméstica, mas viver numa selva de concreto ou na favela esquálida é muito menos atraente para o ministério.

como com e as com

7 Cry of the Urban Poor; Reaching the Slums of Todays Megacities (Montovia: MARC, 1992), 16-9, para diferença faz evangelismo do mundo fato de poder identificar todos importante da tarefa missionária? Por qué?

o

Um dos mais importantes advogados da necessidade do pobre urbano é Viv Orig, Quando encontrei pela primeira vez, ele vivia numa o suja favela em Manila, Caminharnos por entre cheiros e barulhos da área em que ele vivia, os Tivemos de subir uma escada e passar um alçapão para que eu pudesse sentar ao seu lado e beber chá. Suas poucas posses estavam espalhadas ao redor do quartinho quente e abafado, Ele adquiriu o direito de falar apaixonadamente como profeta em nome do pobre urbano, Ele não se perde em rodeios ao falar sobre o desafio de missões:

Devemos enviar grupos semelhantes às dedicadas comunidades dos frades missionários do século XII e dos monges errantes irlandeses, que converteram o norte da Europa entre os séculos V e IX, No nosso caso, devemos enviar comunidades de homens e mulheres, casais e solteiros, com o compro-

The ETIIATLIT TENIS EDDIE TIO EDTA O

Perguntas 1. Que para o de povos? 2. Qual dos avanços do evangelho descritos pelo para a conclusão missa de viver como pobres entre 0% poros para pregar o Reino e estabelecer à Igreja nas grandes favelas Ele acrescenta: Dets está oferecendo missões exidentais a oportunidade de voltar mandamento bíblico acerca do pobre e personificação como primeiro modelo missionário, À necossidade é urgente; milhares de catalisadores nas favelas das cidades do terceiro mundo, que possam gerar mavimentos em cada cidade, Dois bilhões de pessoas dlamatr por isso, Nossas cidades desoladas são um imenso desafio, mas creio que um novo dia para as missõcs urbanas está amanhecendo, O Senhor prometeu que essas cidades serão habitadas pelo seu povo, p, TO DE EEE DEDICO CNO EE nas res) estudo o os grupos autor mais te anima? Qual você considera mais', 76
from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Artigos complementares · Leitura — Luis Bush: A Janela 10/40', 'A Janela 10/40

Bush

Luís

Ê

4 am LUIS BUSH é facilitador internacional de Transform World Connections (Cingapura). Ele liderou o movimento COMIBAM em sua fase inicial e fo diretor de Partners Internotionote do Movimento AD2000 e Além,

Adaptado dá revista Povos, 4. 1,1. 4, por Jamierson Oliveira, Usado com permissão, à!

f ar que se fala de evangelização mundial, algumas perguntas nos vêm à mente: “Será que aínda não evangelizamos o mundo?”; “Se ainda não cumprimos nossa missão, quais são nossos maiores desafios?”; “Como iremos cumprir nossa tarefa suprema?”,

Perguntas como essas têm respostas. Nosso propósito é esctarecer líderes e igrejas, de modo geral, sobre a prioridade a esses desafios mais urgentes. Nosso desafio mais urgente são os povos não alcançados, especificamente a Janela 10/40,

À Janela 10/40 é uma região do globo terrestre considerada, por missiólogos, antropólogos e estrategistas cristãos, o centro do mundo, onde vive um expressivo número de povos não alcançados e onde, também, estão concentrados nossos maiores desafios evangelísticos. Essa faixa de terra se estende do oeste da África até o leste da Ásia, entre os paralelos 10º e 40" acima da linha do equador. Toda essa região é formada pelos países do mundo muçulmano, hindu, budista e comunista, além de outras religiões animistas.

À Janela 10/40 também é conhecida como Cinturão de Resistência, pelo fato de abrigar algumas das culturas mais impenetráveis do mundo. Se estamos realmente comprometidos em apresentar a cada pessoa uma oportunidade real de uma experiência com 2 verdade da Palavra de Deus, não podemos ignorar as constrangedoras realidades dessa região. Analisaremos seis aspectos relevantes, referentes a esse lugar, que indicam que a Igreja deve concentrar esforços na Janela 10/40. Significado bíblico e histórico Os principais episódios narrados na Bíblia ocorreram na área que hoje chamamos Janela 10/40. A Bíblia começa com a explicação de que Adão e Eva foram colocados por Deus no “coração” do lugar que, agora, é a Janela 10/40, e o plano divino para o casal era que tivessem domínio sobre a terra e a preenchessem (Gn 1.26). Todavia, quando Adão e Eva pecaram perante Deus, perderam o domínio rá sobre a terra. O comportamento pecaminoso do homem cresceu muito diante de Deus e, por conta disso, o Senhor interveio e julgou a terra com a catástrofe do dilúvio. Depois.

Os 52 países menos evangelizados Janela 10/40

95% das evangelizadas vivem pessoas menos ESG AA AS “se RE 7/4.

cA o o ê ERES ERES ORA PROCR SRA e É by e) ER <a Vnatd E ESSE ms Es Sen Pora é. oO é ER Pia aiii do DÍA qem RODA pe e DE Rd ESPE E E Ê VA ma RA Países menos E) a o “J|Eo evangelizados bt; co TÉ[ PAÍSES MENOS EVANGELIZADOS is id 52 Países q População Total 3,2 Bilhões EN o Proporção do Mundo: E

61% dos muçulmanos, 96% dos hindus, id 54% dos budistas, 71% dos não-religiosos

53% da População do Mundo A 15% dos Missionários e E a a aqui A

TE casadas

Na ER

AI DIAS 7, é As Ze) É PESA Rai ici. aba io x A dm Es À eme cam

EE Paí pets na janela

E

PAÍSES MENOS EVANGELIZADOS 31 Países E DENTRO DA JANELA População Total 3,1 Bilhões Proporção do Mundo: 58% dos muçulmanos, 96% dos hindus, 53% dos budistas, 68% dos não-religiosos 50% da População do Mundo 10% dos Missionários nas (as) é os homens fizeram, inutilmente, uma tentativa para recuperar o domínio da terra, quando construíram a torre de Babel. Essa obra foi realizada no “coração” da Janela 10/40, como uma provocação a Deus.

Então Deus, mais uma vez, estendeu sua mão para julgar os homens. O resultado foia introdução de diferentes línguas, que serviram para dividir os povos da terra e formar as nações. É na Janela 10/40, mais que em qualquer outro lugar, que podemos ver claramente essa diversidade cultural e linguística. Habitam ali dois terços da população mundial, e são falados dois terços dos idiomas do mundo.

Foi nessa mesma região que Cristo nasceu, viveu uma vida perfeita, morreu sacrificado na cruz e se ergueu triunfante sobre a morte. Foi dessa região que a Igreja primitiva começou a anunciar a salvação em Cristo. Foi por meio das viagens missionárias transculturais de Paulo que a proclamação dessa verdade, a salvação em Cristo, ultrapassou os limites da Janela 10/40 e chegou até nós. O maior número de países não alcançados Embora a Janela 10/40 represente apenas um terço da área total do globo, cerca de dois terços da população do mundo residem nessa região. Com um total de cerca de 4 bilhões de pessoas, a região contém 62 países, Estados soberanos e não soberanos. Esses países, como a maioria de suas terras, encontram-se nessas fronteiras.

Dos 50 países menos evangelizados do mundo, 37 estão na Janela 10/40. Esses 37 países compreendem 97% da população dos 50 menos evangelizados. Países “não evangelizados” ou “não alcançados” são aqueles com o mínimo conhecimento do evangelho ou nenhuma oportunidade de ouvir e conhecer a mensagem de salvação. Isso significa que a Janela 10/40 é um lugar que centraliza os povos menos alcançados pelo evangelho de Cristo.

Em nenhum outro lugar é tão gritante a necessidade de se pregar a verdadeira salvação, que só Jesus Cristo pode oferecer. Se, de fato, levamos a sério o chamado para “pregar o evan-

De dieta mo, gelho a toda criatura e fazer discípulos de tá, os povos”, devemos reconhecer nossa priorida e concentrar nossos esforços na Janela I(yç. A presença das três maiores religiões À maioria dos adeptos do islamismo, do duísmo e do budismo vive na Janela São religiões que representam o maior desss, à evangelização mundial,

Podemos considerar regiões budistas mar(87%),0 Butão (99,9%), o Sri Lanka o Camboja (87%) e a Tailândia (94%). Em to. dos esses países, os budistas detêm o contre, da população. De fato, no Butão, no Sri Lank; e na Tailândia, o budismo é religião estar!

À imagem de tolerância vendida pelo Daly; Lama no exterior é desmascarada pela própria vida dos cristãos no Tibete, onde os lídeze; budistas têm cometido algumas atrocidades chocantes contra os tibetanos étnicos que se atrevem a se converter ao cristianismo. Na tegião onde o hinduísmo impera, o principal tipo de perseguição que vem a público diz respeito às atrocidades perpetradas pelos seguidores dessa religião: estupros de freiras, assassinatos de missionários, espancamentos, incêndios de igrejas, intimidações e assassinatos em geral D; região muçulmana, pouco é preciso comentar A violência contra a minoria cristã é pior que atrocidades praticadas nas outras regiões. Os pobres De cada dez pessoas dentro da Janela oito vivem com um orçamento inferior a 500 dólares. São bilhões de pessoas nessas condições e somente 8% dos missionários atuam no meio desse povo.

Bryant Myers pergunta: Onde estão os perdidos e os pobres?”. Ele mesmo responde: “Os pobres são os perdidos, e os perdidos os pobres” Chegou a essa conclusão após demonstrar que a maioria dos não alcançados vive nos países mais pobres do mundo.

Quando os cristãos de 170 países se encontraram no Lausanne II (Manila, 1989) demonstrou-se grande interesse pelos materna us Bush mente pobres. Na segunda sessão de Manila, esse interesse foi lembrado mediante a seguinte declaração:

Temos sido mais uma vez confrontados com a ênfase de Lucas, segundo a qual o evangelho é as boas novas para o pobre (Lc 4,18;

6.20; 7.22). Temos de perguntar a nós mesmos se isso não significa que a maioria da população do mundo não se encontra destituída, sofrendo e oprimida. Temos sido

Jembrados de que, na Lei, nos Profetas, nos

Livros de Sabedoria e nos ensinamentos e no ministério de Jesus, Deus sempre se interessou pelos pobres materialmente. Nós, como consequência, devemos defendê-los e cuidar deles.

Os cristãos comprometidos com o evangehoe com Deus não podem ignorar a realidade "de que há um paralelo marcante entre os países pobres do mundo e os não evangelizados. As maiores megalópoles não alcançadas Em cada uma delas, há uma população superior aum milhão de pessoas, constituindo-se um gigantesco desafio para as missões urbanas. Das 50 maiores cidades do mundo, quase todas estão na Janela 10/40, e o êxodo dos habitantes das regiões rurais para essas cidades continua modificando diariamente sua demografia. De fato, esses dados apontam para a prioridade de se investirem recursos na propagação do amor e da verdade de Cristo nessas cidades superpopulosas. As fortalezas de Satanás Talvez essa razão esclareça as demais. Os que vivem na Janela 10/40 não estão apenas sujeitos a enfermidades, pobreza, calamidades, perseguição e opressão religiosa, mas também impossibilitados de conhecer o poder transformador do evangelho. São um exemplo claro do que lemos em 2Coríntios 4.4:“O deus deste século cegou o entendimento dos incrédulos, para que lhes não resplandeça a luz do evangelho da glóriade Cristo, o qual é a imagem de Deus”.

545

Não estamos analisando o problema de uma perspectiva fatalista. Ao contrário; estamos sen» do otimistas, pois acreditamos que a situação pode ser revertida. Na passagem citada, capítulos mais adiante, o apóstolo Paulo declara: “As armas da nossa milícia não são carnais, sim poderosas em Deus, para destruir fortalezas (10,4),

Ainda que Satanás estabeleça uma fortaleza na Janela 10/40, não podemos ceder um palmo sequer de terra, muito menos uma pessoa para ele. O evangelho deve avançar sempre!

Um país que exemplifica bem essa batalha do evangelho contra o reino das trevas seu príncipe é o Irã. À antiga Pérsia continua sendo, a exemplo do que diz Daniel 10, uma fortaleza mantida por Satanás.

Curiosamente, o Irã está situado no centro da Janela 10/40, George Otis Jr. concluiu um estudo que diz que as forças demoníacas, com grande significado bíblico, agem diretamente no epicentro do mundo não alcançado, por isso a região é tão obscura. O cristianismo, até agora, mal conseguiu “arranhar” seus muros. Por isso deve também ser penetrada e invadida por uma poderosa onda missionária, por crentes cheios do Espírito Santo (Is 53), para que a luz do evangelho libertador resplandeça na região.

Otis observa ainda que Satanás tem grande poder e irá resistir à nossa investida, para impedir que triunfemos! Se, de fato, estamos em luta no território de Satanás, devemos nos revestir da armadura de Deus e lutar com as armas próprias para a batalha espiritual, conforme descritas em Efésios 6. Depender de outras armas é insensatez.

O alvo das missões mundiais no terceiro milênio deve ser uma igreja para cada povo o evangelho para cada pessoa. Devemos encontrar a melhor maneira de inovar os caminhos e alcançar, com o amor e a verdade de Jesus Cristo, os bilhões de pessoas que vivem nessa região do planeta. Devemos começar com um grande clamor de oração. Concentre-se na Janela 10/40 e lance sobre ela suas súplicas e gemidos inexprimíveis.

EEE AT ET RITA MENDES DORA SPOILER DOT PODRE ça para 2. O aconselha igrejas locais estejam pensando investir Janela

Devemos entender que a concentração na Janela 10/40 não deve fazer cessar o trabalho do Senhor ao redor do mundo, Há muitos outros povos não alcançados que estão geograficas mente fora dessa região, mas nem por Isso é menos urgente a evangelização deles, O Brasil é um exemplo disso, Mesmo fora do que se entende ser a região da Janela 10/40, há no país dezenas de povos indígenas não alcançados, com os desafios da tradução das Escrituras Sagradas e da extrema pobreza,

Os nossos missionários devem se esforçar na evangelização, no treinamento, na ajuda e na implantação de igrejas, cruzando culturas.

Perguntas 1. Diante de tanta necessidade dentro da Janela atuam al?

autor as que

10/40, na qual a realidade que se vive é bem cessário para não esmorecerem?

E nada pode impedi-los! Se, de fato, cremin nas Escrituras, devemos obedecer à ordem de Cristo e não esmorecer, até cumprirmos nos so objetivo: plantar igrejas em todo o lugar, Se agirmos dessa forma, onseguiremos, com certeza, alcançar o centro do mundo; a Jane» la 10/40,

Já estamos vivendo o terceiro milénio das missões cristãs, e é imperativo que todos os nos sos recursos sejam investidos na imensa tarefa da evangelização de todos os povos, Que Deus nos encha de intrepidez, sabedoria e energia, Só assim poderemos assumir nossa parte nesse intenso e urgente desafio, estudo 10/40, por que tão poucos missionários cristãos em seus recursos na diferente, Que tipo de encorajamento seria ne-', 77
from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Artigos complementares · Leitura — Lidório: Novas fronteiras', 'fronteiras 7 Al Ronaldo Lidório

Novas RES E aa RE é

OS e

Vas mummmmm pecado o e edi a dá AMREM: Atuou Goino pladtador de igrejas em Gana, na África, durante nove anos e no presente lidera uma equipe missionária entre diversas etnias indigenas na Amazônia brasileira. É doutor em antropologia cultural e autor de vários livros, dentre ses Missões. 6 desofio contiátio (Belo Horizonte: Betânia, e Com a mão no arado (Belo Horizonte: Betânia, 2006). É também consultor da World Evangelical Alliance, da WEC international e de outras or ganizações e projes ce Cyan EP de igrejas em áreas resistentes.

adaptado da revista Ultimato, n. 272, set-out. 2001. Usado com permissão.

He um incrível avanço missionário nos últimos 30 anos,

É inquestionável o avanço da Igreja, que entre 1999 e 2000 obteve um índice de 6,1% em termos de crescimento global o maior entre as principais religiões mundiais, até mesmo que o islã. Também não podemos desconsiderar o avanço das missões que se puseram a encontrar, estudar e catalogar os grupos ainda não alcançados pelo evangelho, fazendo-nos saber quem eles são, onde estão, quantos são e quais as principais barreiras a vencer para alcançá-los,

E preciso, entretanto, compreender que, enquanto antigas barreiras vão sendo derrubadas, outras novas vão se formando, Não vivemos num mundo estático. Precisamos de uma missiologia mais ágil do que precisávamos dez anos atrás. Além disso, algumas antigas barreiras não têm dado o menor sinal de mudanças. Permita-me citar quatro novas fronteiras com as quais, creio, teremos de lidar nas próximas décadas. A redoma de resistência entre os não alcançados Os povos que já foram alcançados seguiram a regra da menor resistência, e essa é uma regra normal, Ou seja, em regiões onde existiam três grupos não alcançados, havia penetração missionária hos dois que demonstravam menor resistência geográfica, política, religiosa, linguística, cultural ou espiritual. O mais resistente ficava para um segundo momento.

Em linguagem simples, “coamos” os 13 mil povos ainda não alcançados. Portanto, o que temos em nossas mãos não são apenas outros 2 mil PNAs (povos não alcançados), e sim os 2 mil PNAs mais resistentes em toda a história do cristianismo. Consequentemente, precisaremos agora o de POE maior preparo der missiológico, SAR cultural e linguístico que os missionários de 50 anos atrás. Também precisaremos de nova motivação, de pioneirismo e sobretudo da graça de Deus. Podemos chamar essa primeira fronteira “redoma de resistência”.

Quando analisamos o avanço missionário entre os grupos nômades, por exemplo, percebemos que o maior progresso (90%) deu-se ta Seu entre os chamados seminômades, Ron que apresentavam maior tolerância à abordagem missionária. De acordo com David Philips, da AMEM,, existem ainda mais de 150 grupos nômades não alcançados no mundo, Atingimos, em regra, os menos resistentes, Menor resistência funciona em geral como uma lista de oportunidades no mundo missionário, Dessa forma, creio que precisaremos de mais graça divina, energia humana, força missionária, apoio eclesiástico e tempo em potencial para alcançar esses 2 mil PNAs, muito mais do que jamais foi exigido no passado. O desdobramento étnico entre os isolados O desdobramento étnico é uma expectativa comum em boa parte da antropologia mundial, mesmo entre os não cristãos. Ele parte do pressuposto de que a maioria dos 2 mil grupos étnicos não alcançados nunca foram mapeados antropologicamente. Existe grande possibilidade de que cada nome nessa lista corresponda a bem mais que apenas uma etnia. É comum encontrarmos uma nação étnica na qual diversas tribos, falando dialetos similares e possuindo coexistência cultural, dividem o mesmo território. Assim aconteceu com os frafras no Noroeste africano. Descobriu-se que não formavam apenas um povo, e sim dois grupos distintos linguística e culturalmente. O segundo intitulava-se kassena. Os natuis, da Papua Nova Guiné, tidos como um só grupo por pelo menos um século, na verdade constituíam sete diferentes etnias, vivendo em relativa harmonia e compartilhando o mesmo território. Alcançar um não pressupõe alcançar todos.

Esse fenômeno ocorreu em 70% dos grupos estudados cientificamente nos últimos 50 anos, atingindo uma média de desdobramento de 4,2 (de acordo com o Departamento de Antropologia da Universidade de Londres). Ou seja, em 70% dos grupos isolados que sofreram uma abordagem antropológica nas últimas cinco décadas, cada um escondia, em média, outros três grupos. É possível, portanto, que nossos 2 mil PNAs se tornem cerca de 5 mila 8 mil grupos étnicos. Ainda há um bom caminho a percorrer. Ea A incapacidade de evangelização local porigrejas locais Outra nova fronteira com a qual deveremos lidar nas próximas décadas é a da incapacidade de evangelização local por igrejas locais, Nem todos os países do mundo experimentam um bom crescimento da igreja evangélica, como 6 Brasil, a Coreia ou a Nova Zelândia. Segundo David Barrett, há mais de 4 mil grupos étnicos no mundo entre os quais a igreja local não se mostra forte o suficiente para alcançar seu povo, É igualmente alarmante o número de pessoas nascidas em países não cristãos; 48 milhões por ano (Global Report Magazine),

É preciso passar esses 4 mil grupos por uma nova avaliação de avanço missionário. Caso contrário, terminaremos as próximas décadas com um número expressivo de etnias nas quais o evangelho já foi apresentado, mas permanece desconhecido da maioria. Seriam eles alcançados? A vasta diversidade linguística entre grupos minoritários De acordo com a Associação Wycliffe de Tradutores da Bíblia, mais de 4 mil línguas não possuem sequer uma porção da Palavra, sendo que 70% delas podem ser definidas como minoritárias. Aqui lidamos com um fato da cultura cristã: está cada vez mais difícil arregimentar força missionária para alcançar grupos étnicos minoritários. De acordo com o Ethnologue, 4 mil das 6.528 línguas existentes são faladas por apenas 6% da população mundial.

Outro aspecto a ser lembrado é que 2 bilhões de pessoas no mundo não conseguem ler ou escrever, seja por falta de alfabetização, seja por pertencerem a grupos ágrafos. Isso significa que não poderiam ler a Palavra, mesmo que a tivessem em sua língua.

Considerando que um número cada vez menor de missionários tem tido tempo e estrutura suficientes para trabalhar simultaneamente na tradução bíblica e na alfabetização, corremos outro risco: terminar as próximas três décadas com porções da Palavra traduzidas para a maioria das línguas mundiais, ao mesmo tempo em que o índice de leitores nessas línguas diminui sensivelmente. Assim, teríamos mais traduções da Bíblia e menos leitores em potencial nas próximas 2.500 línguas mais necessitadas do evangelho.

cinema CERTO COESO REEVES EA SEN SET ET Ter o os não outras desprincipais obstáculos alcançar de ainda não alcançados mundo? Qual poderá contribuição especial da igreja brasileira

Ronaldo Lidório Desafio Na entrada do milênio, fomos bombardeados com um crescente número de propostas missiológicas para apressar a conclusão do alcance do mundo que ainda desconhece o evangelho. Muitas foram as novas ideias, novas propostas ou novas estratégias. Hesselgrave alerta: Ei Nem todo novo pensamento é dirigido pelo Espírito. Nem tudo que é novo é necessariamente bom. À Bíblia é antiga, o evangelho é antigo ca Grande Comissão é antiga”, Ele defende que, nesse Amenso mar de necessidades no mundo não alcançado, precisamos entender que “o evangelho

Perguntas 1. Qual valor de pesquisas sobre povos tacadas pelo autor? 2. Quais os para dor do ser a obstáculos?

é que nos orienta pois a Palavra precede nossa visão”.

O desafio que temos pela frente Estaiistica- Ros mente pode ser descrito como 2 mil PNAs que poderão ser fragmentados ea e dial ae três aaio: maior; mais de 4 mil línguas e dialetos sem porções da Palavra; cerca de 150 grupos nômades sem presença inisslonárias 118 tribos não alem gadas em nosso país; 72% de todos os grupos inqcados pelo evangelho vivendo em países com fortes limitações políticas e religiosas. É parte de nossa missão, portanto, conhecer tais barreiras, estudá-las e transpô-las, discemindo os tempos cas épocas, para a glória de Deus. para estudo alcançados e necessidades como as os grupos povos ao repara transpor esses', 78
from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Artigos complementares · Leitura — Del Pino: Cidades', 'Cidades Carlos del Pino e é We mm

"ESSE CARLOS DEL PINO é pastor dalgreja Presbiteriana do Brasil e missionário da Agência Presbiteriana de Missões Transculturais (APMT). É Ph.D. em age

Fa diversos seminários no Brasil,

Extraído da revista Alcance, APMT, 2002. Usado com permissão,

Pá Nº há como fugir: vivemos uma realidade urbana! À urbe é hoje o habitat natural de cerca de 80% da população mundial, e o restante vive em função das cidades, Por todos os cantos do planeta, as cidades se tornam para a igreja o campo missionário mais desafiador, Estamos falando em desigualdades econômicas, injustiças sociais, violência absurda nas ruas nas casas, medos inumeráveis, completa instabilidade no trabalho, estética como religião suprema, falta de perspectiva para os jovens é adolescentes, estabelecimento e proliferação de novas doenças, competições escolares, rápidas transformações nas estruturas familiares, seres humanos definidos pelas leis de mercado e consumo, altivez açadêmica nos meios universitários, profunda solidão, relativização da ética e da verdade, compromisso último do indivíduo consigo mesmo, rejeições e abandonos, e assim por diante. Haveria campo missionário mais vasto e desafiador?

Atenas era uma importante cidade do mundo grego, muito orgulhosa de suas conquistas militares e políticas. Era uma cidade “universitária”, que mantinha sua lendária tradição artística, literária e filosófica. Berço de grandes filósofos como Sócrates, Platão e Aristóteles, Atenas era considerada a capital cultural e intelectual do mundo. Era a sede de grandes templos e do vigor religioso dos gregos, porém ao mesmo tempo comprometida com uma sexualidade depravada.

Atenas, como cidade que era, foi palco da presença missionária da Igreja pela atividade de Paulo. Da mesma forma, as cidades de nosso tempo, cada uma com características peculiares, são a fronteira missionária para o povo de Deus hoje. Diante disso, gostaria de destacar algumas atitudes de Paulo em Atenas, conforme Atos 17, que podem servir de referência pastoral-missionária para a igreja hoje. 1. Observar cuidadosamente “Passando e observando os objetos de vosso culto...” (v. 23).

A atitude de Paulo, declarada por ele mesmo, diante da religiosidade ateniense, foi fazer uma cuidadosa observação. Durante

Carlos del Pino ceiciiii asdiade espera em Arenas 16), 0 após= tolo dedicou-se à uma importante caminhada missionária pela cidade; conhecer o melhor possível seu entorno sociorreligioso e, consequentemente, relacionar suas observações 4 fé e À teologia cristãs,

O cuidado em observar, pesquisar e conhe: cer o modo de vida, além de ser umaatitude que exige o manuseio de instrumentos sociológicos e filosóficos, é fundamentalmente uma ação bíblica e teológica, que leva à igreja a uma compreensão adequada da “alma” da cidade, Andar pela cidade, observando-a cuidadosamente, é uma atitude pastoral-missionária, 2. Indignação contra a idolatria “O seu espírito se revoltava em face da idolatria dominante na cidade” (v, 16).

Parece que, durante sua observação, o que mais prendeu a atenção de Paulo foi a idolatria dos atenienses. É como se a cidade estivesse “dominada” por ídolos, imersa na idolatria, dependente dela em tudo. O curioso é que essa cidade idólatra era também a capital cultural do mundo, Isso parece indicar que o intelectualismo pode conviver bem com a idolatria.

Da mesma forma, a marginalidade, a pornografia, a tecnologia, a avareza, as ideologias e a violência, entre outras coisas, mostram-se também parceiros perfeitos da idolatria em nossas cidades, Isso porque os ídolos sustentam e justificam a opressão, uma vez que eles não ouvem o clamor nem interferem na história, nem nos fazem cxigências. Ão contrário, os ídolos nos impedem de ouvir o clamor e de aceitar a demanda pelo Deus verdadeiro,

Paulo ficou profundamente indignado com a situação de idolatria na cidade, mas sua indignação não o condicionou a um “discurso inflamado”, Antes, por ser um sentimento bíblico legítimo, progressivo e ponderado de clamor pela justiça divina, sua indignação o conduziu, bem como deve conduzir a igreja hoje, a atitu-. des missionárias a favor da cidade, É por essa inn razão que o versículo 17 inicia com “por mostrando que Paulo ultrapassou 0 discurso indignado e assumiu posturas práticas decor» rentes de sua santa indignação, Essa indignação, portanto, é uma verdadeira atitude pastoralmissionária em nossas cidades, 3. Arguir e ser arguido “Por isso, dissertava na sinagoga tam»

bém na praça, todos os dias E alguns dos filósofos epicurcus e estoicos contendiam com de” (v, 17,18),

À idolatria observada na cidade e sua indignação levaram Paulo a debater com os atenienses e judeus residentes ali, Ele argumentava a favor da fé cristá e era questionado acerca de sua fé, Na verdade, o que se estabe-Jeceu naquele contexto foi um diálogo argumentativo, em que a fé era apresentada ao mesmo tempo, questionada, Paulo discursava e debatia sobre a fé cristã com judeus e prostlitos nas sinagogas, com transeuntes na praça e com filósofos, Isso mostra a versatilidade e o preparo desse missionário no contexto plural de Atenas,

O processo foi, então, amplamente apologético, À verdadeira apologia não vê a fé como “cristianismo na retranca”, mas como algo que se abre sem medo para ser examinado, que leva o cristianismo a se preocupar com os variados dilemas da cidade e que invade seus centros de vida social (shoppings, escolas, universídades, parques, teatros, restaurantes, televisão, igrejas) com as boas novas de “Jesus e a ressurreição”, Podemos então dizer que, no desafio missionário urbano, a apologética, como diálogo argumentativo, é uma profunda ação pastoral-missionária, 4, Conhecer o pensamento filosófico de seus dias “Nele vivemos, e nos movemos, é existimos, como alguns dos vossos poetas têm dito:

(un

Porque dele também somos geração, Sendo, pois, geração de Deus.” (v, 28,29).

Ao fazer uma citação de Arato (filósofo estoico), Paulo demonstra estar atualizado com a filosofia reinante entre seus ouvintes, Ele era um estudioso e conhecedor do pensamento predominante de sua época. Dessa forma, visto que entendia e manejava bem o pensamento filosófico, podia argumentar com a cidade a respeito do evangelho de Cristo dentro de parâmetros que faziam sentido aos ouvintes. Além disso,o pensamento filosófico serviu como instrumento para a argumentação teológica do apóstolo em sua apresentação da fé cristã,

Nesse sentido, aprendemos com Paulo o valor de conhecer bem o pensamento filosófico de nossos dias e de contextualizá-lo teologicamente para utilização missionária, À utilização da filosofia com sensibilidade teológica é uma atitude pastoral-missionária elementar nas cidades de hoje. 5, Respeito pela religiosidade do outro “Senhores atenienses! Em tudo vos vejo acentuadamente religiosos; porque, passando observando os objetos de vosso culto, encontrei também um altar no qual está inscrito: Ao Deus Desconhecido” (v. 22,23).

Paulo não ataca frontal e agressivamente a idolatria da cidade, que tanto o indignou. Ão contrário, ele elogia a religiosidade dos atenienses, tomando como tema referência em sua mensagem a existência de altares dedicados a deuses que eles não conheciam, possivelmente para aplacar a ira de algum deus que se sentisse ofendido com algo cometido por eles.

À atitude do apóstolo é caracterizada pelo respeito à religiosidade do outro e pela gentileza na abordagem de um tema que era controverso à fé cristã. Aprendemos com o apóstolo que o respeito às opiniões e à religiosidade do outro no contexto da pluralidade religiosa que caracteriza a cidade é uma sábia atitude pasto''al-missionária,

Cidades 6. Anúncio contextualizado “Pois esse que adorais sem conhecer é precisamente aquele que eu vos anuncio” (v, 23),

À contextualização é infinitamente mais que adotar certos costumes (vestuário, alimentação e idioma) do outro, Contextualizar é uma ampla tarefa hermenêutica de compreender a palavra de Deus e transportar seu sentido para o contexto atual ou para o contexto do outro, causando o mesmo impacto que causou aos primeiros ouvintes. O conteúdo da mensagem pregada por Paulo no Arcópago estava muito bem aplicado àquele contexto. Todavia, o que o apóstolo propõe anunciar aos atenienses é um Deus que eles adoravam sem conhecer.

Por um lado, Paulo baseia-se, de forma respeitosa e gentil, na religiosidade ateniense; por outro, demonstra coragem e firmeza ao propor algo desconhecido dos famosos filósofos e intelectuais gregos. Em ambas as atitudes, vemos que Paulo maneja muito bem a arte de contextualizar o sentido da Palavra de Deus. Podemos, então, encarar o anúncio contextual da Palavra de Deus como parte essencial da mensagem pastoral-missionária na cidade. 7. Conteúdo da mensagem (v. 24-31) É muito instrutivo e elucidativo para a igreja em estado de missão nas cidades modernas observar que o conteúdo da mensagem contextualizada de Paulo no Arcópago cumpriu seu objetivo ao abordar temas relevantes para aquele ambiente específico. Alguns pensam que a declaração de Paulo em Coríntios 2.1-5, de que em Corinto sua pregação não consistiu de persuasão ou de sabedoria, mas de demonstração do poder do Espírito, é uma referência à mensagem que pregara dias antes em Atenas. Sua pregação no Arcópago, embora tenha incluído a citação de um filósofo, foi também no poder do Espírito, por causa de sua contextualização ao ambiente filosófico e das conversões que se sucederam. Além disso, sabemos que aos coríntios ele também citou o filósofo Menander (1Co 15.35). et

Spibibi o o Oque devemos observar é que sua mensa“gem procurou apresentar o Deus verdadeiro, em contraste com a imensidão de deuses e da idolatria dos gregos, de forma a atender às de“andas e carências do verdadeiro Deus exis"entes na alma é na mente dos gregos. Assim, qu mensagem apresenta Deus como o Criador "de todo o Universo (“o Deus que fez o mundo e tudo o que nele existe”, v. 24); como o “Senhor desse Universo (“Senhor do céu e da “serra”, 24); como aquele que não se sujeita a senhum tipo de idolatria (“não habita em santuários feitos por mãos humanas”, v. 24; “não devemos pensar que a divindade é semelhante A ao ouro, à prata ou à pedra, trabalhados pelaarte e imaginação do homem”, v. 29); como mantesedor de toda a vida (“ele mesmo é quematoêosdávida, respiração e tudo mais”, v. 25; “nele “vivemos, nos movemos, e existimos”, v. 28);

como governante de todas as nações (“de um sô fez toda a raça humana para habitar sobre todaa face da terra, havendo fixado os tempos previamente estabelecidos e os limites da sua E habitação; para buscarem a Deus...”,v. 26,27);

comoo Pai (Criador) dos seres humanos (“dele também somos geração”, v. 28,29); como oJuiz sapremo (“não levou Deus em conta os tempos E “<a ignorância; agora, porém, notifica aos homens que todos, em toda parte, se arrependam; E porquanto estabeleceu um dia em que há de

Jelgar o mundo com justiça”, v. 30,31); como aquele que encarnou em Jesus Cristo, o ressarreto (“por meio de um varão que destinou À.) ressuscitando-o dentre os mortos”, v. 51). É A mensagem da igreja na cidade, ao responder no o Na EA às suas demandas com fidelidade ao evangelho de Cristo, é 0 mago da tarefa pastoral-missionária do povo de Deus, 8. Formação da comunidade de fé “e Uns escameceram Houve, porém, alguns homens que se agregaram a ele e creram” (v. 32-34),

A mensagem e a presença cristã na cidade exigem respostas claras dos homens e mulheres. Muitos, sem dúvida, dizem “não”, mas outros respondem à voz de Cristo e dizem “sim”, Dessa forma, a comunidade de fé (igreja) irá se formando aos poucos, assumindo a fé nos diámetros histórico-filosóficos de seu entorno e em resposta a ele, servindo a Deus, acolhendo os demais seres humanos, vivendo compartilhando a fé no verdadeiro Deus e seu Cristo ressurreto no contexto conturbado e complexo dos centros urbanos humanos. É aí que a fé e a missão são vividas com plenitude e se desenvolvem. À formação gradativa, relevante e transformadora da comunidade de fé é o alvo imediato da ação pastoral-missionária em nossas cidades.

Ao olhar ao nosso redor e ao redor do mundo, encontramos cidades de todos os tamanhos, com toda espécie de problemas e pecados, com suas muitas artes e belezas, com sua carência infinita de Deus. Lendo a experiência de Paulo, sentimo-nos impulsionados a levar o evangelho a cada dimensão de vida humana que caracteriza nossas cidades. Eis a maior fronteira e o maior desafio para a igreja em missão!', 79
from cursos where slug = 'perspectivas';

commit;
