-- =============================================================
-- Curso: O Discípulo Radical
-- Transcrição na íntegra, dividida em 9 aulas. Atividades = perguntas
-- de reflexão (tipo='reflexao') elaboradas a partir do conteúdo.
-- Cabeçalhos de seção em CAIXA ALTA renderizam como títulos (ehTitulo()).
-- Idempotente.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'o-discipulo-radical';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values ('o-discipulo-radical','O Discípulo Radical','Leitura guiada de O Discípulo Radical, de John Stott. Stott aborda oito características do discipulado frequentemente evitadas — inconformismo, semelhança com Cristo, maturidade, cuidado com a criação, simplicidade, equilíbrio, dependência e morte — convocando a uma entrega total e sem reservas a Jesus. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para um discipulado integral.','/api/og/curso/o-discipulo-radical', false, 0, v_next_ordem, true)
    returning id into v_curso_id;
  end if;


  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 1 — Inconformismo$t$, 1,
$conteudo$A primeira característica que quero considerar sobre o discípulo radical é o “inconformismo”. Deixe-me explicar.

A igreja tem uma dupla responsabilidade em relação ao mundo ao seu redor. Por um lado, devemos viver, servir e testemunhar no mundo. Por outro, devemos evitar nos contaminar por ele. Assim, não devemos preservar nossa santidade fugindo do mundo, nem sacrificá-la nos conformando a ele.

Tanto o escapismo quanto o conformismo são proibidos para nós. Esse é um dos temas principais da Bíblia, ou seja, Deus está convocando um povo para si e o desafiando a ser diferente de todos. “Sejam santos”, diz ele repetidamente ao seu povo, “porque eu sou santo” (Lv 11.45; 1Pe 1.15-16).

Não devemos preservar nossa santidade fugindo do mundo, nem sacrificá-la nos conformando a ele Esse tema fundamental se repete nas quatro principais seções da Bíblia: a lei, os profetas, o ensino de Jesus e o ensino dos apóstolos. Darei um exemplo de cada. Primeiro, a lei. Deus diz ao seu povo por meio de Moisés:

Não fareis segundo as obras da terra do Egito, em que habitastes, nem fareis segundo as obras da terra de Canaã, para a qual eu vos levo, nem andareis nos seus estatutos. Fareis segundo os meus juízos e os meus estatutos guardareis, para andardes neles. Eu sou o Senhor, vosso Deus.

Levíticos 18.3-4 Semelhantemente, a crítica de Deus ao seu povo por meio do profeta Ezequiel é que “não andastes nos meus estatutos, nem executastes os meus juízos; antes, fizestes segundo os juízos das nações que estão em redor de vós” (Ez 11.12).

O mesmo acontece no Novo Testamento. No Sermão do Monte, Jesus fala dos hipócritas e pagãos e acrescenta: “Não vos assemelheis, pois, a eles” (Mt 6.8). Finalmente, o apóstolo Paulo escreve aos romanos: “Não vos conformeis com este século, mas transformai-vos pela renovação da vossa mente” (Rm 12.2).

Aqui está o chamado de Deus para um discipulado radical, para um inconformismo radical à cultura circundante. O convite para desenvolver uma contracultura cristã, para um engajar-se sem comprometer-se.

Assim, quais as tendências contemporâneas que ameaçam nos tragar, às quais devemos resistir? Consideraremos quatro. A primeira delas é o desafio do pluralismo. O pluralismo afirma que todo “ismo” tem seu valor e merece nosso respeito. Portanto, ele rejeita as alegações cristãs de perfeição e singularidade, e entende a tentativa de converter qualquer pessoa (que dirá todas) ao que julga ser simplesmente “nossa opinião”, ou seja, uma atitude de arrogância total.

Como então deveríamos responder ao espírito de pluralismo? Com muita humildade e sem qualquer indício de superioridade pessoal. Porém, devemos continuar a afirmar a imparidade e perfeição de Jesus Cristo. Pois ele é singular em sua encarnação (o único Deus homem); singular em sua expiação (somente ele morreu pelos pecados do mundo); e singular em sua ressurreição (somente ele venceu a morte). E sendo que em nenhuma outra pessoa, a não ser em Jesus de Nazaré, Deus se tornou humano (em seu nascimento), carregou os nossos pecados (em sua morte) e triunfou sobre a morte (em sua ressurreição), ele é singularmente competente para salvar os pecadores. Ninguém mais tem suas qualificações. Assim, podemos falar sobre Alexandre, o grande, Carlos, o grande, Napoleão, o grande, mas não Jesus, o grande. Ele não é o grande — ele é o Único. Não existe ninguém como ele. Ele não tem rival nem sucessor.

A segunda tendência secular muito difundida e à qual os discípulos cristãos devem resistir é o materialismo. O materialismo não é simplesmente uma aceitação da realidade do mundo material. Se assim fosse, todos os cristãos seriam materialistas, pois acreditamos que Deus criou o mundo material e disponibilizou suas bênçãos a nós. Deus declarou a ordem material também por meio da encarnação e ressurreição do seu Filho, na água do batismo e no pão e vinho da Santa Comunhão. Não é de se admirar que William Temple tenha descrito o cristianismo como a religião mais material de todas. Porém, ela não é materialista.

Pois materialismo é uma preocupação com coisas materiais, que podem abafar a nossa vida espiritual. No entanto, Jesus nos diz para não armazenar tesouros na terra e nos adverte contra a avareza. O mesmo faz o apóstolo Paulo, nos impelindo a desenvolver um estilo de vida de simplicidade, generosidade e contentamento, extraindo tal padrão de sua própria experiência de ter aprendido a estar contente em quaisquer circunstâncias (Fp 4.11).

Paulo acrescenta que “grande fonte de lucro é a piedade com o contentamento” (1Tm 6.6) e continua, explicando que “nada temos trazido para o mundo, nem coisa alguma podemos levar dele”. Talvez, de forma consciente, ele estivesse repetindo o que diz Jó: “Nu saí do ventre de minha mãe e nu voltarei” (Jó 1.21). Em outras palavras, a vida na terra é uma breve peregrinação entre dois momentos de nudez. Assim, seríamos sábios se viajássemos com pouca carga. Nada levaremos conosco. (Direi mais sobre materialismo no capítulo 5.) A terceira tendência contemporânea que nos ameaça e à qual não devemos nos render é o espírito pérfido do relativismo ético.

Todos os padrões morais que nos cercam estão se desfazendo. Isso é verdade especialmente no Ocidente. As pessoas se confundem diante da existência de quaisquer absolutos. O relativismo permeou a cultura e tem se infiltrado na igreja.

Em nenhuma esfera esse relativismo é mais óbvio do que na da ética sexual e na revolução sexual vivenciada desde os anos 60. Pelo menos onde a ética judaico-cristã era levada a sério, o casamento era universalmente aceito como uma união monogâmica, heterossexual, amorosa e vitalícia, e como o único contexto dado por Deus para a intimidade sexual. Atualmente, porém, mesmo em algumas igrejas, a relação sexual fora do casamento é largamente praticada, dispensando o compromisso essencial com um casamento autêntico. Além disso, relacionamentos entre pessoas do mesmo sexo são vistos como alternativas legítimas ao casamento heterossexual.

Para combater tais tendências, Jesus Cristo chama seus discípulos à obediência e a se conformarem aos seus padrões. Alguns dizem que Jesus não falou a respeito disso. Mas ele o fez. Citou Gênesis 1.27 (“homem e mulher os criou”) e Gênesis 2.24 (“deixa o homem pai e mãe e se une à sua mulher, tornando-se os dois uma só carne”), dando a definição bíblica de casamento. E depois de citar esses versículos, Jesus deu-lhes seu próprio endosso pessoal, dizendo: “o que Deus ajuntou não o separe o homem” (Mt 19.4-6).

Esse ponto de vista foi avaliado criticamente pelo distinto filósofo moral e social americano Abraham Edel (1908–2007), cujo principal livro chama-se Ethical Judgment.1 “A moralidade é basicamente arbitrária”, escreve ele, complementando em versos livres:

Tudo depende de onde você está, Tudo depende de quem você é, Tudo depende do que você sente, Tudo depende de como você se sente.

Tudo depende de como você foi educado, Tudo depende do que é admirado, O que é correto hoje será errado amanhã, Alegria na França, lamento na Inglaterra.

Tudo depende do seu ponto de vista, Austrália ou Tombuctu, Em Roma faça como os romanos.

Se os gostos acabam coincidindo Então você tem moralidade.

Mas onde existem tendências conflitantes, Tudo depende, tudo depende...

Os discípulos cristãos radicais devem discordar disso. Certamente não devemos ser totalmente inflexíveis em nossas decisões éticas, mas devemos procurar, com sensibilidade, aplicar princípios bíblicos em cada situação. O senhorio de Jesus Cristo é fundamental para o comportamento cristão. “Jesus é Senhor” continua sendo a base da nossa vida.

Assim, a pergunta fundamental para a igreja é: Quem é Senhor? Será que a igreja exerce o senhorio sobre Jesus Cristo, tornando-se livre para alterar e manipular ao aceitar o que gosta e rejeitar o que não gosta? Ou Jesus Cristo é o nosso Mestre e Senhor, de maneira que cremos nele e obedecemos ao seu ensinamento?

Ele nos diz também: “Por que me chamais Senhor, Senhor, e não fazeis o que vos mando?” (Lc 6.46). Confessar Jesus como Senhor, mas não obedecer a ele, é como construir a vida sobre a areia. Novamente: “Aquele que tem os meus mandamentos e os guarda, esse é o que me ama”, disse ele no Cenáculo (Jo 14.21).

Aqui estão duas culturas e dois sistemas de valores; dois padrões e dois estilos de vida. Por um lado, há o estilo do mundo ao nosso redor; por outro, a vontade revelada de Deus, boa e agradável. Discípulos radicais têm pouca dificuldade de fazer suas escolhas.

Chegamos agora à quarta tendência, que é o desafio do narcisismo.

Narciso, na mitologia grega, foi um jovem que viu seu reflexo em um lago, apaixonou-se por sua própria imagem, caiu dentro d’água e se afogou. Assim, “narcisismo” é um amor excessivo, uma admiração desmedida por si mesmo.

Nos anos 70, o narcisismo se expressou por meio do Movimento Potencial Humano, que enfatizava a necessidade da autorrealização. Nos anos 80 e 90, o Movimento da Nova Era imitou o Movimento Potencial Humano. Shirley MacLaine pode ser considerada símbolo do movimento, pois era cega de paixão por si mesma. De acordo com ela, a boa notícia é essa:

Sei que existo; portanto, eu sou.

Sei que a força divina existe; portanto, ela é.

Já que sou parte dessa força, sou o que sou.

Parece uma paródia deliberada da revelação que Deus faz de si mesmo a Moisés: “Eu sou o que sou” (Êx 3.14).

Assim, o Movimento da Nova Era nos convida a olhar para dentro de nós mesmos e nos explorar, pois a solução para os nossos problemas está em nosso interior. Não precisamos que um salvador surja em algum lugar e venha até nós; podemos ser o nosso próprio salvador.

Infelizmente, uma parte desse ensinamento tem permeado a igreja e há cristãos recomendando que devemos não somente amar a Deus e ao próximo, mas também a nós mesmos. No entanto, isso é um erro por três razões. Em primeiro lugar, Jesus falou do “primeiro e grande mandamento” e do “segundo”, mas não mencionou um terceiro. Em segundo lugar, amor próprio é um dos sinais dos últimos tempos (2Tm 3.2). Em terceiro lugar, o significado do amor ágape é o sacrifício próprio em benefício de outros. Sacrificar-se a serviço de si mesmo é, nitidamente, um contrassenso. Então, qual deve ser a atitude para conosco? Um misto de autoafirmação e autonegação — afirmar tudo em nós que vem da nossa criação e redenção, e negar tudo que pode ser ligado à queda.

É aliviador se livrar de uma preocupação doentia consigo mesmo e voltar-se para os saudáveis mandamentos de Deus (incorporados e reforçados por Jesus): amar a Deus de todo o coração e ao nosso próximo como a nós mesmos. Pois a intenção de Deus para a sua igreja é que ela seja uma comunidade de amor, de adoração e de serviço.

Todos sabem que o amor é a maior virtude do mundo, e os cristãos sabem o motivo: é porque Deus é amor.

O cortesão espanhol do século 13, Raimundo Lúlio (missionário entre os muçulmanos no Norte da África), escreveu que “aquele que não ama, não vive”. Pois viver é amar, e sem amor a personalidade humana se desintegra. É por isso que todos procuram autênticos relacionamentos de amor.

Até agora, consideramos quatro tendências seculares que ameaçam subjugar a comunidade cristã. Em face dessas tendências, somos chamados a um inconformismo radical, não a um conformismo medíocre. Diante do desafio do pluralismo, devemos ser uma comunidade de verdade, declarando a singularidade de Jesus Cristo. Diante do desafio do materialismo, devemos ser uma comunidade de simplicidade, considerando que somos peregrinos aqui. Diante do desafio do relativismo, devemos ser uma comunidade de obediência. Diante do desafio do narcisismo, devemos ser uma comunidade de amor.

Não devemos ser como caniços agitados pelo vento, dobrando-nos diante das rajadas da opinião pública, mas tão inabaláveis quanto pedras em uma correnteza. Não devemos ser como peixes que flutuam na corrente do rio (como diz Malcolm Muggeridge, "somente peixes mortos nadam com a corrente"); devemos nadar contra ela, contra a tendência cultural. Não devemos ser como camaleões, que mudam de cor de acordo com o ambiente; devemos nos opor de forma visível ao ambiente em que estamos.

Não devemos ser como caniços agitados pelo vento, dobrando-nos diante das rajadas da opinião pública, mas tão inabaláveis quanto pedras em uma correnteza Então, a que os cristãos devem se assemelhar, se não devemos ser como caniços, peixes mortos ou camaleões? Será que a Palavra de Deus é totalmente negativa, nos dizendo simplesmente para não sermos moldados à forma daqueles que estão no mundo ao nosso redor? Não. Ela é positiva. Devemos ser como Cristo, “conformes à imagem de seu Filho” (Rm 8.29). E isso nos leva ao segundo capítulo.

1. Transaction Publishers, 1955, p. 16.↩ Capítulo 2$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Em que áreas concretas da sua vida você tem percebido que, em vez de nadar contra a corrente cultural, tem deixado o pluralismo, o materialismo, o relativismo ou o narcisismo moldarem silenciosamente suas escolhas, e o que mudaria se você de fato confessasse Jesus não apenas como "o grande", mas como o Único Senhor?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Onde está a linha, hoje, entre o seu engajamento sincero com o mundo e o comprometimento que o descaracteriza como discípulo, e como você sabe, na prática, quando atravessou para o conformismo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se confessar Jesus como Senhor sem obedecer-lhe é construir sobre a areia, em qual mandamento dele você tem chamado "Senhor, Senhor" com os lábios enquanto resiste com a vida, e o que o impede de render essa área ao senhorio dele?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 2 — Semelhança com Cristo$t$, 2,
$conteudo$EM ABRIL DE 2007, COMEMOREI MEU 86O ANIVERSÁRIO E USEI A

oportunidade para anunciar minha aposentadoria do ministério público ativo. Apesar de recusar todos os compromissos subsequentes, já tinha em minha agenda um convite para falar na Conferência de Keswick,1 em julho daquele ano. Este capítulo é baseado no texto daquele último sermão.

Lembro-me claramente da pergunta que mais incomodava meus amigos e eu quando éramos jovens: qual é o propósito de Deus para o seu povo? O que vem depois de nos convertermos?

É claro que conhecíamos a famosa declaração do Breve Catecismo de Westminster, de que o “fim principal do homem é glorificar a Deus e gozá-lo para sempre”. E nos entretínhamos com uma declaração ainda mais breve: “Ame a Deus, ame o seu próximo”.

Porém, nenhuma delas parecia ser totalmente satisfatória. Assim, gostaria de compartilhar o que tem feito minha mente descansar ao me aproximar do fim de minha peregrinação pela terra. É o seguinte: Deus quer que o seu povo se torne como Cristo, pois semelhança com Cristo é a vontade de Deus para o povo de Deus.

Inicialmente, apresentarei um fundamento bíblico para o convite à semelhança com Cristo; depois, darei alguns exemplos do Novo Testamento; e, finalmente, partilharei algumas conclusões práticas.

BASE BÍBLICA

A base bíblica não é um simples texto, pois ela é mais substancial do que podemos resumir em um texto. Consiste de três versículos que será bom mantermos relacionados: Romanos 8.29, 2 Coríntios 3.18 e 1 João 3.2.

O primeiro texto é Romanos 8.29: Deus “predestinou [seu povo] para serem conformes à imagem de seu Filho”. Quando Adão caiu, perdeu muito (apesar de não tudo) da imagem divina à qual ele havia sido criado. Porém, Deus a restaurou em Cristo. Conformidade à imagem de Deus significa ser como Jesus, e a semelhança com Cristo é o propósito eterno para o qual Deus nos predestinou.

O segundo texto é 2 Coríntios 3.18: “E todos nós, com o rosto desvendado, contemplando [ou refletindo], como por espelho, a glória do Senhor, somos transformados [ou mudados], de glória em glória, na sua própria imagem, como pelo Senhor, o Espírito”.

A perspectiva mudou — do passado para o presente; da predestinação eterna de Deus para a transformação que ele realiza em nós no presente por meio do seu Espírito Santo; do propósito eterno de Deus de nos fazer como Cristo para a obra histórica de nos transformar à imagem de Cristo mediante o seu Espírito.

O terceiro texto é 1 João 3.2: “Amados, agora, somos filhos de Deus, e ainda não se manifestou o que haveremos de ser. Sabemos que, quando ele se manifestar, seremos semelhantes a ele, porque haveremos de vê-lo como ele é”. E se Deus está trabalhando com essa finalidade, não é surpresa que ele nos chame para cooperar com ele. “Siga-me”, diz ele, “imite-me”.

Muitos já ouviram falar do livro Imitação de Cristo, escrito no início do século 15 por Thomas à Kempis. Tantas edições e traduções foram publicadas que, depois da Bíblia, ele é provavelmente o best-seller mundial. Na verdade ele não fala sobre imitar a Cristo, pois seu conteúdo é bem mais diverso. Porém, o título se originou das primeiras palavras do livro, e sua enorme popularidade é uma indicação da importância do assunto.

Assim, retornando a 1 João 3.2, nós sabemos e não sabemos; não sabemos com detalhes o que seremos, mas sabemos que seremos como Cristo. E, na verdade, não há necessidade de sabermos mais nada. Estamos contentes com a gloriosa verdade de que estaremos com Cristo e seremos como ele.

Aqui, então, estão três perspectivas (passado, presente e futuro) e todas apontam para a mesma direção: o propósito eterno de Deus (nós fomos predestinados); o propósito histórico de Deus (estamos sendo mudados, transformados pelo Espírito Santo); e o propósito escatológico de Deus (seremos como ele). Tudo isso contribui para a mesma finalidade de semelhança com Cristo, pois esse é o propósito de Deus para o seu povo.

Se afirmamos ser cristãos, devemos ser como Cristo Tendo estabelecido a base bíblica, ou seja, que a semelhança com Cristo é o propósito de Deus para o povo de Deus, quero prosseguir ilustrando essa verdade com vários exemplos do Novo Testamento. Antes, uma declaração geral de 1 João 2.6: "Aquele que diz que permanece nele, esse deve também andar assim como ele andou". Se afirmamos ser cristãos, devemos ser como Cristo.

EXEMPLOS DO NOVO TESTAMENTO

DEVEMOS SER COMO CRISTO EM SUA ENCARNAÇÃO

Alguns podem recuar horrorizados ante tal ideia. “Será que a encarnação foi um evento totalmente único e impossível de ser imitado?”

A resposta é sim e não. Sim, porque o Filho de Deus assumiu nossa humanidade para si mesmo em Jesus de Nazaré, uma vez por todas e sem necessidade de repetição. Não, porque todos nós somos chamados a seguir o exemplo de sua humildade. Assim, Paulo escreve em Filipenses 2.5-8:

Tende em vós o mesmo sentimento que houve também em Cristo Jesus, pois ele, subsistindo em forma de Deus, não julgou como usurpação o ser igual a Deus; antes, a si mesmo se esvaziou, assumindo a forma de servo, tornando-se em semelhança de homens; e, reconhecido em figura humana, a si mesmo se humilhou, tornando-se obediente até à morte e morte de cruz.

DEVEMOS SER COMO CRISTO EM SEU SERVIÇO

Passaremos agora da encarnação para a vida de serviço. Assim, vamos para o Cenáculo, onde Jesus passou a última noite com os discípulos. Durante a ceia, ele tirou a vestimenta de cima, cingiu-se com uma toalha, colocou água numa bacia e lavou os pés dos discípulos. Quando terminou, ele retomou seu lugar à mesa e disse: “Ora, se eu, sendo o Senhor e o Mestre, vos lavei os pés, também vós deveis lavar os pés uns dos outros. Porque eu vos dei o exemplo, para que, como eu vos fiz, façais vós também” (Jo 13.14-15).

Alguns cristãos acatam a ordem de Jesus literalmente e muitas vezes fazem a cerimônia do lava-pés por ocasião da Ceia do Senhor. E talvez eles estejam certos. Porém, a maioria aplica a ordem culturalmente. Isto é, assim como Jesus fez o que, em sua cultura, era o trabalho de um escravo, nós, em nossa cultura, não devemos considerar nenhuma tarefa simples ou humilhante demais.

DEVEMOS SER COMO CRISTO EM SEU AMOR

Como escreve Paulo: “E andai em amor, como também Cristo nos amou e se entregou a si mesmo por nós, como oferta e sacrifício a Deus, em aroma suave” (Ef 5.2). “Andar em amor” é uma ordem para que todo o nosso comportamento seja caracterizado pelo amor. Já “entregar-se” por nós é uma clara referência à cruz. Assim, Paulo está nos incentivando a ser como Cristo em sua morte; a amar com o amor do Calvário.

Percebe o que está acontecendo? Paulo nos está impelindo a ser como o Cristo da encarnação, o Cristo do lava-pés e o Cristo da cruz.

Tais eventos indicam claramente o que significa, na prática, ser semelhante a Cristo. Por exemplo, no mesmo capítulo, Paulo estimula os maridos a amarem as esposas como Cristo amou a igreja e se deu por ela (Ef 5.25).

DEVEMOS SER COMO CRISTO EM SUA LONGANIMIDADE

Aqui consideramos o ensino de Pedro e não de Paulo. Todos os capítulos da primeira carta de Pedro falam do sofrimento de Cristo, pois o contexto da carta é o começo da perseguição.

No capítulo 2, em especial, Pedro incentiva os escravos cristãos (se punidos injustamente) a suportar o sofrimento sem pagar o mal com o mal (1Pe 2.18). Somos chamados a agir assim porque Cristo também sofreu, deixando-nos o exemplo para que sigamos seus passos (1Pe 2.21).

Tal chamado à semelhança com Cristo no sofrimento injusto pode se tornar cada vez mais significante em muitas culturas nas quais a perseguição tem crescido.

DEVEMOS SER COMO CRISTO EM SUA MISSÃO

Tendo observado o ensino de Paulo e de Pedro, observaremos o ensino de Jesus registrado por João (Jo 17.18; 20.21).

Em oração, Jesus diz ao Pai: “Assim como tu me enviaste ao mundo, também eu os enviei ao mundo”; e, ao comissioná-los, ele diz: “Assim como o Pai me enviou, eu também vos envio”. Essas palavras têm um significado profundo.

Não se trata apenas da versão da Grande Comissão registrada no Evangelho de João; é também uma instrução para que a missão dos discípulos se assemelhasse à de Cristo. Em que sentido? As palavras-chave são “enviei ao mundo”. Isto é, como Cristo teve de entrar em nosso mundo, nós também precisamos entrar no mundo de outras pessoas.

Isso foi explicado com eloquência pelo arcebispo Michael Ramsay, que disse: “Nós declaramos e recomendamos a fé à medida que saímos e penetramos nas dúvidas dos duvidosos, nas perguntas dos questionadores e na solidão daqueles que perderam o rumo”.2 Essa entrada no mundo de outras pessoas é exatamente o que queremos dizer por missão encarnacional — e toda missão autêntica é encarnacional.

Aqui estão, talvez, as cinco principais maneiras pelas quais devemos nos assemelhar a Cristo: em sua encarnação, em seu serviço, em seu amor, em sua longanimidade e em sua missão.

TRÊS CONSEQUÊNCIAS PRÁTICAS

Concluiremos agora com três consequências práticas das bases e exemplos de semelhança com Cristo que acabamos de considerar.

SEMELHANÇA COM CRISTO E O MISTÉRIO DO SOFRIMENTO

O sofrimento é um assunto vasto e os cristãos tentam entendê-lo de muitas formas. Porém, a que se destaca é a que diz que o sofrimento é parte do processo de Deus para nos fazer como Cristo. Seja um desapontamento ou uma frustração, precisamos tentar vê-los à luz de Romanos 8.28 e 29.

De acordo com Romanos 8.28, Deus está sempre trabalhando para o bem de seu povo e, de acordo com Romanos 8.29, esse bom propósito é nos fazer como Cristo.

SEMELHANÇA COM CRISTO E O DESAFIO DO EVANGELISMO

Por que nossos esforços evangelísticos são frequentemente desastrosos? Há várias razões, e não posso simplificar, mas uma das principais é que não parecemos com o Cristo que proclamamos.

“Se vocês, cristãos, vivessem como Jesus Cristo, a Índia estaria aos seus pés amanhã”

John Poulton escreveu sobre isso em seu breve, mas perceptivo livro A Today Sort of Evangelism:

A pregação mais eficaz provém daqueles que vivem conforme aquilo que dizem. Eles próprios são a mensagem. Os cristãos têm de ser semelhantes àquilo que falam. A comunicação acontece fundamentalmente a partir da pessoa, não de palavras ou ideias.

É no mais íntimo das pessoas que a autenticidade se faz entender; o que agora se transmite com eficácia é, basicamente, a autenticidade pessoal.3 Semelhantemente, um professor hindu, identificando um dos alunos como cristão, disse: “Se vocês, cristãos, vivessem como Jesus Cristo, a Índia estaria aos seus pés amanhã”.

Outro exemplo é o do reverendo Iskandar Jadeed, um ex-muçulmano árabe, que disse: “Se todos os cristãos fossem cristãos, hoje não haveria mais islamismo”. Não conheço pessoalmente os autores desses dizeres, mas creio serem genuínos.

Semelhança com Cristo e a habitação do Espírito Já falei bastante sobre semelhança com Cristo, mas como ela é possível para nós? Claramente não é pela nossa própria força, já que Deus nos deu o seu Espírito Santo para nos capacitar a cumprir seu propósito.

William Temple costumava ilustrar isso a partir de Shakespeare:

Não adianta me dar uma peça como Hamlet ou Rei Lear e me dizer para escrever algo assim. Shakespeare podia fazer isso, eu não posso. E não adianta me mostrar uma vida como a de Jesus e me dizer para viver como ele. Jesus era capaz, eu não. Porém, se o gênio de Shakespeare pudesse vir morar em mim, então eu poderia escrever peças como as dele. E se o Espírito de Jesus pudesse vir morar em mim, então eu viveria uma vida como a dele.

O propósito de Deus é nos fazer como Cristo. E a forma como ele faz isso é nos enchendo com o seu Espírito Santo.

1. O relato mais recente e rico sobre a Conferência de Keswick é este:

RANDALL, Ian M., PRICE, Charles. Transforming Keswick; The Keswick Convention, past, present and future. Paternoster Press, 2000.↩ 2. RAMSAY, Michael. Images old and new. SPCK, 1963. p. 14.↩ 3. Lutterworth Press, 1972.↩ Capítulo 3$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Se o propósito eterno de Deus para você é torná-lo semelhante a Cristo, em qual das cinco marcas apresentadas (encarnação humilde, serviço, amor sacrificial, longanimidade no sofrimento injusto e missão que entra no mundo do outro) você sente que Deus mais o está convidando a crescer neste momento da sua vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Stott lembra que o sofrimento e as frustrações fazem parte do processo de Deus de nos moldar à imagem de Cristo; que decepção ou dor recente você precisaria reler à luz disso, deixando de perguntar "por que isso comigo?" e passando a perguntar "como Cristo quer me formar nisso?"$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Considerando que a pregação mais eficaz vem de quem vive o que diz e que muitos não veem Cristo porque não nos veem parecidos com ele, o que na sua vida cotidiana hoje desmente ou confirma o Cristo que você diz seguir, e o que você entregaria ao Espírito para que essa diferença diminua?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 3 — Maturidade$t$, 3,
$conteudo$Na década de 90, quando viajava em nome da Langham Partnership International, sempre perguntava aos que me ouviam como eles definiriam o cenário cristão no mundo atual. E recebia uma variedade de respostas. Quando convidado a dar minha opinião, eu a resumia em apenas três palavras: “crescimento sem profundidade”.

Ninguém duvida do crescimento fenomenal da igreja em várias partes do mundo. As estatísticas são surpreendentes. Não é exagero descrever esse crescimento como “explosão”. Por exemplo, a igreja na China cresceu pelo menos cem vezes desde a metade do século 20. Hoje, mais cristãos adoram a Deus todos os domingos na China do que em todas as igrejas da Europa Ocidental juntas.

Ao mesmo tempo, não devemos ceder ao triunfalismo, pois na maioria dos casos trata-se de crescimento sem profundidade.

A superficialidade no discipulado existe em todo lugar, e os líderes eclesiásticos lamentam essa situação. Um líder do sul da Ásia disseme recentemente que, apesar de a igreja em seu país estar crescendo numericamente, “existe um enorme problema de falta de consagração e integridade”. De modo semelhante, um líder africano disseme que, apesar de estar consciente do rápido crescimento da igreja africana, “ele é, em grande parte, numérico [...]. A igreja está sem uma base bíblica e teológica forte que provenha dela mesma”.

Mais impressionante é a declaração feita em abril de 2006, em Los Angeles, por Cao Shengjie, na época presidente do Conselho Cristão Chinês:

Alguns dizem que a igreja está indo bem quando há crescimento numérico [...] e queremos ver pessoas sendo acrescidas à igreja todos os dias. Porém, não estamos buscando apenas números, mas que o aumento nos números corresponda à confirmação de fé da igreja.

Essas três citações de líderes de países em desenvolvimento são suficientes para mostrar que “crescimento sem profundidade”, ou crescimento estatístico sem o desenvolvimento de um discipulado, não é uma conclusão imposta pelo resto do mundo — é a visão dos próprios líderes.

Além disso, a situação é séria porque desagrada a Deus. Ousamos dizer isso porque os apóstolos cujas cartas encontramos no Novo Testamento censuraram seus leitores pela imaturidade deles e os impeliram a se tornarem adultos. Considere, por exemplo, a crítica de Paulo à igreja de Corinto:

Eu, porém, irmãos, não vos pude falar como a espirituais, e sim como a carnais, como a crianças em Cristo. Leite vos dei a beber, não vos dei alimento sólido; porque ainda não podíeis suportá-lo.

Nem ainda agora podeis, porque ainda sois carnais. Porquanto, havendo entre vós ciúmes e contendas, não é assim que sois carnais e andais segundo o homem?

1 Coríntios 3.1-3 Porém, há outra passagem escrita por Paulo sobre maturidade, e são esses versículos que quero destacar neste capítulo:

Anunciamos [Cristo], advertindo a todo homem e ensinando a todo homem em toda a sabedoria, a fim de que apresentemos todo homem perfeito (teleios) em Cristo; para isso é que eu também me afadigo, esforçando-me o mais possível, segundo a sua eficácia que opera eficientemente em mim.

Colossenses 1.28-29 O adjetivo grego teleios ocorre dezenove vezes no Novo Testamento e pode ser traduzido por “perfeito” ou por “maduro”, dependendo do contexto. Raramente significa “perfeito” num sentido absoluto. Em vez disso, o teleios (pessoa) contrasta com a criança ou bebê (por exemplo, 1Co 13.10-11). Assim, é melhor entendermos teleios como “maduro”.

Para entender o significado de um texto, normalmente é bom fazer com ele uma espécie de interrogatório e desafiá-lo com perguntas investigativas. É o que proponho fazer com Colossenses 1.28-29.

A primeira e mais básica pergunta é sobre a essência da maturidade. O que é maturidade cristã? O fato é que ela é algo difícil de ser obtido. A maioria de nós sofre de imaturidades prolongadas. Mesmo no adulto, a pequena criança ainda se esconde em algum lugar.

Além disso, existem diferentes tipos de maturidade. Existe a física (ter um corpo saudável e bem desenvolvido), a intelectual (ter uma mente disciplinada e uma cosmovisão coerente), a moral (aqueles que “têm as suas faculdades exercitadas para discernir não somente o bem, mas também o mal”, Hb 5.14), a emocional (ter uma personalidade equilibrada, capaz de estabelecer relacionamentos e assumir responsabilidades). Porém, acima de tudo, existe a maturidade espiritual. E isso é o que o apóstolo chama de maturidade “em Cristo”, isto é, ter um relacionamento maduro com Cristo.

A forma mais comum usada por Paulo para definir cristãos é dizer que eles são homens e mulheres “em Cristo”— não dentro de Cristo, como roupas em um armário ou ferramentas em uma caixa, mas como os ramos que estão na videira e como os membros que estão no corpo, ou seja, unidos em Cristo. Assim, estar “em Cristo” é estar relacionado a ele de forma pessoal, vital e orgânica. Nesse sentido, ser maduro é ter um relacionamento maduro com Cristo, no qual o adoramos, confiamos nele, o amamos e lhe obedecemos.

A próxima pergunta a fazer é como os cristãos se tornam maduros. O texto nos fornece uma resposta clara. Considere a base do versículo 28: “Nós anunciamos [Cristo] [...] a fim de que apresentemos todo homem perfeito em Cristo”.

Ser maduro é ter um relacionamento maduro com Cristo, no qual o adoramos, confiamos nele, o amamos e lhe obedecemos É lógico que, se maturidade cristã é maturidade em nosso relacionamento com Cristo, no qual o adoramos, confiamos nele e lhe obedecemos, então, quanto mais clara for a nossa visão de Cristo, mais convencidos nos tornamos de que ele é digno de nossa dedicação.

Na introdução do livro O Conhecimento de Deus,1 J. I. Packer escreve que somos “cristãos pigmeus porque temos um Deus pigmeu”. Podemos dizer, igualmente, que somos cristãos pigmeus porque temos um Cristo pigmeu. A verdade é que existem muitos “Cristos” sendo oferecidos nas religiões comerciais do mundo, e muitos deles são falsos Cristos, Cristos distorcidos, caricaturas do Jesus autêntico.

Atualmente, por exemplo, encontramos o Jesus capitalista competindo com o Jesus socialista. Há também o Jesus asceta se opondo ao Jesus glutão. Sem falar nos famosos musicais — Godspell, com o Jesus palhaço, e Jesus Cristo Superstar. Existiram muitos outros. Porém, todos eram distorcidos e nenhum deles merece nossa adoração e culto. Cada um é o que Paulo chama de “outro Jesus”, diferente do Jesus que os apóstolos proclamaram.

Assim, se queremos desenvolver uma maturidade ver-dadeiramente cristã, precisamos, acima de tudo, de uma visão renovada e verdadeira de Jesus Cristo — principalmente de sua supremacia absoluta, da qual Paulo fala em Colossenses 1.15-20. É uma das passagens cristológicas mais sublimes de todo o Novo Testamento. Eis uma simples paráfrase:

Jesus é a imagem visível do Deus invisível (v. 15); assim, quem o vir, terá visto o Pai. Ele é também “o primogênito sobre toda a criação”. Não que ele próprio tenha sido criado, mas ele tem os direitos de um primogênito, e por isso é o “Senhor e cabeça” da criação (v. 16). Por meio dele o universo foi criado. Todas as coisas foram criadas por meio dele como agente e para ele como cabeça. A unidade e a coerência das coisas são encontradas nele.

Além disso, (v. 18) ele é a cabeça do corpo, a igreja. Ele é o princípio e o primogênito de entre os mortos, de tal maneira que em todas as coisas ele possa ter a preeminência. Pois Deus se agradou (v. 19-20) ao fazer habitar toda a sua plenitude em Cristo e também ao reconciliar todas as coisas consigo mediante Cristo, alcançando a paz por meio do sangue de sua cruz.

Foi dessa forma que Paulo proclamou Cristo como Senhor — como Senhor da criação (aquele por meio de quem todas as coisas foram feitas) e como Senhor da igreja (aquele por meio de quem todas as coisas foram reconciliadas). Por causa de quem ele é (a imagem e plenitude de Deus) e por causa do que ele fez (aquele que criou e reconciliou), Jesus Cristo tem uma dupla supremacia. Ele é o cabeça do universo e da igreja. Ele é o Senhor de ambas as criações.

Essa é a descrição exata que o apóstolo faz de Jesus Cristo. Onde deveríamos estar senão com os rostos em terra diante dele? Afastemos de nós o Jesus insignificante, fraco, pigmeu. Afastemos de nós o Jesus palhaço e popstar. Afastemos também o Messias político e revolucionário. Eles são caricaturas. Se é assim que o enxergamos, não surpreende a persistência de nossa imaturidade.

Onde, então, encontraremos o Jesus autêntico? Ele deve ser encontrado na Bíblia — o livro que pode ser descrito como o retrato que o Pai fez do Filho, colorido pelo Espírito Santo. A Bíblia é repleta de Cristo. Como ele próprio diz, as Escrituras “testificam de mim” (Jo 5.39). Jerônimo, o antigo Pai da Igreja, escreve que “ignorância da Escritura é ignorância de Cristo”. Da mesma forma, podemos dizer que conhecer a Escritura é conhecer a Cristo.

Nada é mais importante para um discipulado cristão maduro do que uma visão renovada, clara e verdadeira do Jesus autêntico Se a venda fosse retirada dos nossos olhos, se pudéssemos ver Jesus na plenitude de quem ele é e do que ele tem feito, certamente veríamos o quanto ele é digno da nossa dedicação apaixonada. A fé, o amor e a obediência brotariam de nós e cresceríamos em maturidade. Nada é mais importante para um discipulado cristão maduro do que uma visão renovada, clara e verdadeira do Jesus autêntico.

Agora que já definimos o que é maturidade cristã e vimos como os discípulos se tornam maduros, chegamos à terceira pergunta: para quem esse chamado à maturidade é direcionado? É notável que nesse texto Paulo repete a palavra “todo”: “o qual nós anunciamos, advertindo a todo homem e ensinando a todo homem em toda a sabedoria, a fim de que apresentemos todo homem perfeito em Cristo” (Cl 1.28). O contexto dessa tripla repetição provavelmente é a chamada “heresia colossense”. Os estudiosos ainda debatem sua forma exata, mas é quase certo que foi um gnosticismo embrionário que chegou ao auge na metade do século 2.

Esses primeiros gnósticos parecem ter ensinado que havia duas classes ou categorias de cristãos. Por um lado, havia os hoi polloi, o rebanho comum, que era unido pela pistis, a fé. Por outro, havia os hoi teleioi, a elite, que havia sido iniciada pela gnosis, o conhecimento especial. Paulo ficou horrorizado com esse elitismo cristão e se opôs firmemente a ele. Ao proclamar a Cristo, ele tomou a palavra dos gnósticos, teleios, e aplicou-a a todos. Ele alertou e ensinou a todos, rogou para que pudesse apresentar todos maduros (teleios) em Cristo. A maturidade em Cristo está enfaticamente disponível não somente a um seleto grupo de pessoas, mas a todos. Ninguém precisa fracassar em obtê-la.

É interessante perguntar se na interpretação (ao estudarmos um texto bíblico) nos identificamos com o autor ou com os leitores. Algumas vezes (como em nosso caso) é razoável fazer ambos. É apropriado nos colocarmos no lugar dos cristãos colossenses quando recebiam essa mensagem de Paulo e deixar que ele fale também a nós. Assim, ouviremos o apóstolo com atenção, receberemos sua admoestação sobre crescer em maturidade, tomaremos a decisão de levar a leitura bíblica ainda mais a sério e, ao lermos a Escritura, olharemos para Cristo de modo a amá-lo, confiar nele e obedecer-lhe. Pois o princípio do discipulado é claro: quanto mais pobre for o nosso conceito de Cristo, mais pobre será nosso discipulado. E quanto mais rica for a nossa visão de Cristo, mais rico será nosso discipulado.

Porém, é legítimo também nos colocarmos ao lado do apóstolo Paulo enquanto fala aos cristãos colossenses, especialmente se estivermos em posição de liderança cristã. É verdade que, diferente de nós, ele foi um apóstolo. Assim, não temos sua autoridade. No entanto, temos responsabilidades pastorais comparáveis às dele, quer sejamos líderes ordenados ou leigos.

Assim, precisamos observar o alvo pastoral de Paulo. Popularmente, ele é visto como um evangelista, um missionário pioneiro e plantador de igrejas cujo objetivo era converter pessoas, estabelecer uma igreja e seguir em frente. No entanto, essa é apenas uma de suas descrições. Ele se descreve também como um pastor e mestre. Seu grande desejo, escreve ele, é transpor o evangelismo, chegar ao discipulado e apresentar todos maduros em Cristo. E como esse é o alvo no qual ele gasta suas energias, nós devemos fazer o mesmo. “Para isso é que eu também me afadigo, esforçando-me o mais possível, segundo a sua eficácia que opera eficientemente em mim” (Cl 1.29). Em grego, tanto o verbo “afadigar” quanto o verbo “esforçar-se” expressam metáforas que implicam empenho físico. O primeiro é usado para o trabalhador rural e o segundo, para o competidor nos jogos gregos. Ambos evocam a imagem de músculos enrijecidos e suor escorrendo.

É claro que Paulo poderia lutar contando somente com a força de Cristo. Mesmo assim, ele ainda precisou labutar e se empenhar em oração e estudo. Não pode haver alvo mais alto no ministério. Que lema maravilhoso para qualquer um chamado para a liderança — desejar apresentar todos aqueles por quem, de alguma forma, somos responsáveis, como maduros em Cristo.

Vimos então uma responsabilidade dupla: a maturidade em Cristo é o alvo tanto para nós quanto para o nosso ministério.

Que Deus possa nos dar uma visão completa e clara de Jesus Cristo, primeiro para que possamos crescer em maturidade, e segundo para que, pela nossa proclamação fiel de Cristo em sua plenitude, outras pessoas também possam se apresentar maduras.

1. Mundo Cristão, 2005.↩ Capítulo 4$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Stott resume o cristianismo atual como "crescimento sem profundidade"; olhando para a sua própria caminhada, em que aspectos você reconhece atividade, números e movimento, mas pouca raiz, e o que seria, para você, sair do leite e passar ao alimento sólido?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se carregamos um discipulado pobre quando carregamos um "Cristo pigmeu", que caricatura de Jesus (o conveniente, o domesticado, o que só me serve) você percebe que tem adorado, e como uma visão renovada da supremacia dele sobre todas as coisas mudaria a sua dedicação a ele?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Sabendo que a maturidade não é privilégio de uma elite espiritual, mas está disponível a todos os que se aproximam de Cristo na Escritura, que decisão concreta você precisa tomar a respeito da sua leitura da Bíblia para que ela deixe de ser informação e se torne um encontro que o leve a amar, confiar e obedecer?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 4 — Cuidado com a criação$t$, 4,
$conteudo$Ao identificar os aspectos que considero negligenciados em um discipulado radical, não devemos supor que eles se limitam às esferas pessoais e individuais. Devemos considerar também a perspectiva mais ampla, que é a dos nossos deveres para com Deus e nosso próximo. Este capítulo trata de um deles: o cuidado com o meio ambiente.

A Bíblia nos diz que, na criação, Deus estabeleceu para os seres humanos três tipos fundamentais de relacionamento: primeiro com ele mesmo, pois ele fez o homem à sua própria imagem; segundo entre si, pois a raça humana é plural desde o princípio; e terceiro para com a boa terra e as criaturas sobre as quais ele os estabeleceu.

No entanto, os três relacionamentos foram distorcidos pela queda. Adão e Eva foram banidos da presença do Senhor Deus no jardim, culparam um ao outro pelo que aconteceu e a boa terra foi amaldiçoada devido à desobediência.

É plausível, portanto, que o plano de Deus de restauração inclua não apenas a nossa reconciliação com Deus e com o próximo, mas também, de alguma maneira, a libertação da criação que geme. Podemos afirmar que um dia haverá novo céu e nova terra (2Pe 3.13; Ap 21.1), pois essa é uma parte essencial da esperança de futuro perfeito que nos aguarda no final dos tempos. Porém, enquanto isso, toda a criação está gemendo, passando pelas dores de parto da nova criação (Rm 8.18-23). O que ainda discutimos é o quanto do destino final da terra pode ser vivenciado agora. No entanto, podemos dizer com certeza que, assim como a nossa compreensão do destino final de nosso corpo ressurreto influencia o que pensamos sobre o corpo que temos no presente e a forma como o tratamos, nossa compreensão do novo céu e nova terra deve influenciar e aumentar a consideração que temos pela terra agora.

Qual, então, deveria ser a nossa atitude para com a terra? A Bíblia aponta o caminho ao fazer duas afirmações fundamentais: “Ao Senhor pertence a terra” (Sl 24.1), e “a terra, deu-a ele aos filhos dos homens” (Sl 115.16).

Em maio de 1999, tive o privilégio de participar de uma conferência de um dia em Nairobi sobre “cristãos e o meio ambiente”. Compartilhando o púlpito comigo estavam Calvin De Witt, do Au Sable Institute, em Michigan, e Peter Harris, de A Rocha Internacional. Entre os participantes estavam líderes do governo queniano, representantes de igrejas, organizações missionárias e ONGs. O encontro foi amplamente divulgado. Ficou evidente que o cuidado com a criação não é um interesse egoísta do Ocidente desenvolvido, nem uma singela paixão característica dos ornitólogos ou botânicos, mas uma preocupação cristã crescente.

As afirmações de que “ao Senhor pertence a terra”

e “a terra deu-a ele aos filhos dos homens” se complementam, não se contradizem Logo após a publicação da Declaração Evangélica sobre o Cuidado com a Criação (1999), surgiu, no ano seguinte, um importante comentário organizado por R. J. Berry e intitulado The Care of Creation (o cuidado com a criação).1 As afirmações de que “ao Senhor pertence a terra” e “a terra deu-a ele aos filhos dos homens” se complementam, não se contradizem. Pois a terra pertence a Deus por causa da criação e a nós por causa da delegação. Não significa que, ao delegá-la a nós, ele abdicou de seus direitos sobre ela. Deus nos deu a responsabilidade de preservar e desenvolver a terra em seu favor.

Como então devemos nos relacionar com a terra? Se lembrarmos que ela foi criada por Deus e delegada a nós, evitaremos dois extremos opostos e desenvolveremos um terceiro posicionamento e uma melhor relação com a natureza.

Primeiro, devemos evitar a deificação da natureza. Esse é o erro dos panteístas, que unificam o Criador e a criação, dos animistas, que povoam o mundo natural com espíritos, e do movimento Gaia da Nova Era, que atribui os processos de adaptação, ordem e perpetuação da natureza a ela própria. Porém, todas essas confusões são insultos ao Criador. A compreensão cristã de que a natureza é criação e não criadora foi um prelúdio indispensável a toda iniciativa científica e hoje é essencial para o desenvolvimento dos recursos da terra. Nós respeitamos a natureza porque Deus a fez; não a reverenciamos como se ela fosse Deus.

Segundo, devemos evitar o extremo oposto, que é a exploração exaustiva da natureza. Não significa tratá-la com veneração, como se ela fosse Deus, nem tratá-la com arrogância, como se nós fossemos Deus. A culpa pela irresponsabilidade ambiental tem sido injustamente posta em Gênesis 1. É verdade que Deus comissionou a raça humana para “dominar” sobre a terra e “sujeitá-la” (Gn 1.26-28), e que esses dois verbos hebraicos são enfáticos. Porém, seria um absurdo imaginar que aquele que criou a terra entregou-a a nós para que fosse destruída. Não, o domínio que Deus nos deu deve ser visto como uma mordomia responsável, não como um domínio destrutivo.

O terceiro relacionamento correto entre os seres humanos e a natureza é o de cooperação com Deus. Nós mesmos fazemos parte da criação e somos tão dependentes do Criador quanto todas as criaturas. Porém, ao mesmo tempo, ele se humilhou deliberadamente para fazer a parceria divino-humana necessária. Ele criou a terra, mas disse-nos para sujeitá-la. Ele plantou o jardim, mas colocou Adão nele “para o cultivar e o guardar” (Gn 2.15). Isso é normalmente chamado mandato cultural. Pois o que Deus nos deu foi a natureza, e o que fazemos com ela é cultura. Não devemos apenas conservar o ambiente, mas também desenvolver seus recursos para o bem comum.

É um chamado nobre para cooperar com Deus no cumprimento de seus propósitos, para transformar a ordem criada de forma que agrade e beneficie a todos. Assim, nosso trabalho é ser uma expressão de adoração, já que o cuidado com a criação refletirá o amor pelo Criador.

Porém, é possível exagerar ao enfatizar o trabalho humano de conservação e transformação do ambiente. Em sua excelente exposição sobre os três primeiros capítulos de Gênesis (In The Beginning),2 Henri Blocher argumenta que o clímax de Gênesis 1 não é a criação dos seres humanos como trabalhadores, mas a instituição do sábado para os seres humanos como adoradores. O objetivo final não é nosso trabalho (sujeitar a terra), mas deixar o trabalho de lado no sábado. Pois o sábado coloca a importância do trabalho na perspectiva correta. Ele nos protege de imergir completamente no trabalho, como se ele fosse o objetivo final da nossa existência. Não é. Nós, seres humanos, encontramos nossa humanidade não somente em relação à terra, que devemos transformar, mas também em relação a Deus, a quem devemos adorar; não apenas em relação à criação, mas também, e especialmente, em relação ao Criador. Deus deseja que nosso trabalho seja uma expressão de adoração e que o cuidado com a criação reflita o amor pelo Criador. Somente assim seremos capazes de fazer qualquer coisa, em palavra ou em obra, para a glória de Deus (1Co 10.31).

Esses e outros temas bíblicos são abordados tanto na Declaração quanto em seu comentário. Eles merecem nosso estudo cuidadoso.3 A crise ecológica É à luz desse ensino bíblico irrepreensível que precisamos confrontar a crise ecológica atual. Ela tem sido explorada de várias formas, mas toda análise provavelmente conterá os quatro aspectos a seguir.

Primeiro, o crescimento populacional acelerado do mundo. De acordo com a Divisão de População da ONU, os cálculos começaram em 1804, quando a população mundial chegou a 1 bilhão.4 No começo do século 21, ela já havia chegado a 6,8 bilhões, e estima-se que, em meados do mesmo século, terá alcançado a incrível marca de 9,5 bilhões.

Como é difícil nos lembrar de estatísticas, um simples mnemônico pode ajudar: Passado 1804 1 bilhão Presente 2000 6,8 bilhões Futuro 2050 9,5 bilhões Como será possível alimentar tantas pessoas, especialmente quando cerca de um quinto delas não possui condições básicas de sobrevivência?

Segundo, a depleção dos recursos da terra. Foi E. F. Schu-macher quem, em seu conhecido livro O Negócio é Ser Pequeno,5 chamou a atenção do mundo para a diferença entre patrimônio e renda. Por exemplo, combustíveis fósseis são patrimônio — uma vez consumidos, não podem ser repostos. Os apavorantes processos de desflorestamento e desertificação são exemplos do mesmo princípio. E também a degradação ou poluição do plâncton dos oceanos, da superfície verde da terra, das espécies vivas e dos habitats dos quais elas dependem para terem ar e água puros.

Terceiro, o descarte do lixo. Uma população em crescimento traz consigo um problema em crescimento quando se trata de descartar de forma segura os subprodutos da fabricação, do empacotamento e do consumo.

No Reino Unido, a cada três meses, uma pessoa comum produz o equivalente ao seu próprio peso em lixo. Em 1994, um relatório intitulado Sustainable Development: the UK strategy (desenvolvimento sustentável: a estratégia do Reino Unido) recomendava uma “hierarquia de gerenciamento do lixo” dividida em quatro etapas, num esforço para conter esse problema que se torna cada vez maior.

Quarto, a mudança climática. De todas as ameaças globais que o nosso planeta enfrenta, essa é a mais séria.

A radiação ultravioleta na atmosfera nos protege, e se o ozônio for deteriorado, somos expostos ao câncer de pele e a distúrbios em nosso sistema imunológico. Assim, quando em 1983 um enorme buraco na camada de ozônio apareceu sobre a região Antártica e os países vizinhos, houve um grande alarme público.

Poucos anos mais tarde, um buraco semelhante apareceu sobre o hemisfério Norte. Na época reconheceu-se que a deterioração do ozônio era causada pelos clorofluorcarbonos (CFCs), os compostos químicos utilizados em aparelhos de ar-condicionado, refrigeradores e propulsores de aerossóis. O Protocolo de Montreal convocou as nações a reduzirem pela metade a emissão de CFCs até 1997.

A mudança climática não é um problema isolado. O calor da superfície da terra (essencial para a sobrevivência do planeta) é mantido por uma combinação da radiação do sol e da radiação infravermelha que ela emite no espaço. É o chamado “efeito estufa”. A poluição da atmosfera por “gases da estufa” (especialmente dióxido de carbono) reduz as emissões infravermelhas e aumenta a temperatura da superfície da terra. Esse é o fantasma do aquecimento global, que pode ter consequências desastrosas na configuração geográfica do mundo e nos padrões do clima.6 Refletindo sobre esses quatro riscos ambientais, é impossível não perceber que todo o nosso planeta está ameaçado. Não é exagero falarmos em “crise”. Mas o que deveríamos fazer? Para começar, podemos ser gratos, pois, finalmente, em 1992, a Conferência das Nações Unidas sobre Meio Ambiente e Desenvolvimento (Eco 92) aconteceu no Rio de Janeiro e resultou em um compromisso para um “desenvolvimento global sustentável”. Outras conferências têm afirmado que as questões ambientais merecem a atenção constante das principais nações do mundo.

E lado a lado com essas conferências oficiais várias ONGs têm surgido. Mencionarei apenas as duas organizações explicitamente cristãs que mais se sobressaem, a Tearfund e A Rocha, que recentemente celebraram aniversários de 40 e 25 anos, respectivamente.

A Tearfund, fundada por George Hoffman, é comprometida com o desenvolvimento no sentido mais amplo e trabalha em cooperação com “sócios” nos países em desenvolvimento. A maravilhosa história da Tearfund é relatada por Mike Hollow em seu livro A Future and a Hope.7 A Rocha é diferente e muito menor. Foi fundada em 1983 por Peter Harris, que documentou seu crescimento em dois livros: A Rocha: uma comunidade evangélica lutando pela conservação do meio ambiente (relatando os dez primeiros anos) e Kingfisher’s fire (atualizando a história).8 Seu contínuo desenvolvimento é notável, e atualmente ela atua em dezoito países, estabelecendo centros de estudo de campo em todos os continentes.

É muito bom dar suporte a ONGs ambientais cristãs, mas quais são as nossas responsabilidades individuais? O que o discípulo radical pode fazer para cuidar da criação? Deixarei que Chris Wright responda. Ele sonha com uma multidão de cristãos que se importam com a criação e levam a sua responsabilidade ambiental a sério:

Eles escolhem formas sustentáveis de energia quando é viável.

Desligam aparelhos em desuso. Sempre que possível, compram alimentos, mercadorias e serviços de empresas que tenham diretrizes ambientais eticamente saudáveis. Eles se aliam a grupos de conservação. Evitam o consumo demasiado e o desperdício desnecessário e reciclam o máximo possível.9 O que o discípulo radical pode fazer para cuidar da criação?

Chris deseja também ver um número crescente de cristãos incluindo o cuidado da criação em seu entendimento bíblico de missão:

No passado, os cristãos eram instintivamente interessados nas grandes e urgentes questões de cada geração [...]. Isso inclui os males causados por doenças, ignorância, escravidão e muitas outras formas de brutalidade e exploração. Os cristãos têm defendido a causa das viúvas, dos órfãos, dos refugiados, dos prisioneiros, dos doentes mentais, dos famintos — e, mais recentemente, têm aumentado o número daqueles comprometidos em “fazer da pobreza passado”.

Desejo ecoar a eloquente conclusão de Chris Wright:

É totalmente inexplicável ouvir alguns cristãos afirmarem que amam e adoram a Deus, que são discípulos de Jesus, mas, mesmo assim, não se preocupam com a terra, que carrega seu selo de propriedade. Eles não se importam com o abuso que a terra sofre e, realmente, considerando seus estilos de vida esbanjadores e por demais consumistas, conspiram contra isso. Deus deseja […] que nosso cuidado com a criação reflita nosso amor pelo Criador.10 “Eis que os céus e os céus dos céus são do Senhor, teu Deus, a terra e tudo o que nela há” (Dt 10.14).

1. IVP, 2000.↩ 2. IVP, 1984.↩ 3. Adaptado do meu prefácio em The care of creation. Dois livros úteis e recentes sobre o assunto são: BERRY, R. J., ed. When enough is enough; a christian framework for environmental sustainability (Apollos, 2007) e BOOKLESS, Dave. Planetwise; dare to care for God’s world (IVP, 2008).↩ 4. No Reino Unido “1 bilhão” é usado para representar 1 milhão de milhões.

Atualmente é quase uma cifra universal para mil milhões.↩ 5. Zahar Editores, 1983.↩ 6. Para mais detalhes, veja o capítulo 5 (Cuidando da criação) de STOTT, John. Mentalidade Cristã; o posicionamento do cristão numa sociedade não-cristã. Vinde, 1994.↩ 7. Monarch Books, 2008.↩ 8. HARRIS, Peter. A Rocha; uma comunidade evangélica lutando pela conservação do ambiente. ABU, 2001. Kingfisher’s fire. Monarch, 2008.↩ 9. Essa e as próximas citações foram retiradas de WRIGHT, Chris. The mission of God. IVP, 2008.↩ 10. Citado pot John Stott no prefácio de The Care of Creation.↩ Capítulo 5$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Se a terra pertence ao Senhor e foi delegada a você como mordomo responsável, em que pontos do seu estilo de vida o cuidado com a criação reflete (ou contradiz) o seu amor pelo Criador, e o que precisaria mudar para que o cuidado deixasse de ser discurso e virasse prática diária?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Stott aponta dois extremos a evitar: divinizar a natureza e explorá-la com arrogância, como se fôssemos deus; em qual desses desequilíbrios você mais tende a cair, e como seria, na sua vida, exercer um domínio que serve em vez de um domínio que destrói?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante da crise ecológica que ameaça os mais pobres e da observação de que é inexplicável amar a Deus e desprezar a terra que leva o selo dele, que escolha concreta de consumo, descarte ou voz pública o discipulado radical está pedindo de você hoje?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 5 — Simplicidade$t$, 5,
$conteudo$A quinta característica de um discípulo radical é a simplicidade -especialmente em questões que envolvem bens e dinheiro. Mencionamos algo sobre materialismo no capítulo 1.

Em março de 1980, na Inglaterra, houve a Consulta Internacional Sobre Estilo de Vida Simples. Seu impacto foi pequeno e o assunto não recebeu a devida atenção na época ou desde então. Assim, quero apresentar alguém que participou da consulta e cuja vida foi influenciada por ela.

UMA VIDA SIMPLES

Dan Lam nasceu e cresceu em um lar cristão em Hong Kong. Seu pai morreu quando ele era menino e sua mãe criou a família sozinha. Ela era uma mulher boa e piedosa. Aos domingos, apesar de serem pobres, ela dava algum dinheiro a cada um dos filhos para eles darem de oferta. No entanto, Dan pegava sua parte, saía sorrateiramente da igreja, alugava uma bicicleta e andava pela cidade inteira. Quando o culto terminava, ele aparecia e voltava para casa com a família. De acordo com um de seus ex-colegas de classe, ele era "uma criança muito difícil".

Na adolescência, ele ficou tão doente que quase morreu. Foi então que entendeu que Deus queria o seu “bem, não o seu mal”, e submeteu a vida ao Senhor Jesus Cristo. Ele nunca olhou para trás. Foi uma mudança radical em sua vida, para a surpresa e o alívio da família.

Quando chegou a hora de trabalhar, ele foi empregado pela Corporação Bechtel, uma multinacional dedicada à engenharia pesada. Em momentos diferentes, eles se envolveram na construção de aeroportos e portos, no suporte às vítimas de furacões, na construção do “Chunnel” (o Euro-túnel que liga a Inglaterra à França) e no BART, o sistema de trânsito que cobre a baía de São Francisco. Dan não se envolveu pessoalmente com todos esses projetos, mas chegou a ser responsável por centenas de empregados.

Em 1976, a companhia o transferiu com a família para a Arábia Saudita e, em 1978, para Londres. Foi quando me encontrei com ele e sua esposa, Grace, pela primeira vez, pois se filiaram à Igreja All Souls, Langham Place, da qual eu era reitor. E éramos membros do mesmo grupo de comunhão.

Dan tinha muita preocupação com os pobres e necessitados e era generoso com a família e com a igreja, apesar de seu estilo de vida moderado. Porém, ele estava começando a sentir a pressão dos negócios. Foi nessa época que aconteceu a Consulta Sobre Estilo de Vida Simples. E os desafios surgiram. Apesar de sempre entregar o dízimo do salário, Dan entendeu que deveria simplificar ainda mais seu estilo de vida. Em visita à Índia, ele viu a verdadeira pobreza e observou que uma porcentagem muito elevada dos fundos da missão era gasta com despesas gerais. Ele resolveu não acumular riqueza, mas ofertá-la.

Em 1981, pediu demissão da Bechtel. Não que se sentisse incapaz de servir a Deus em uma corporação multinacional, pois Jesus Cristo era o Senhor de toda a vida. A questão é que ele se sentia especificamente chamado para os países do sudeste da Ásia, à qual ele próprio pertencia: Tailândia, Laos e Camboja, juntamente com Mianmar e Mongólia. Ele compreendeu e aplicou os princípios nativos na missão. Ele cria firmemente no ensino e no treinamento de asiáticos para ganhar asiáticos e prepará-los para missões. Ele ficou motivado ao saber que a maioria da população do mundo vive na Ásia. Além do mais, é muito mais econômico e eficiente para os nacionais asiáticos ganharem asiáticos, já que eles não têm problemas com a cultura, o idioma, a alimentação e as restrições de viagens.

Dan começou a primeira Escola Bíblica da Mongólia; e a Escola Bíblica em Phnom Penh (Camboja) foi registrada em seu nome, apesar de atualmente se chamar Phnom Penh Bible School. As expectativas em torno desse crescimento significativo eram altas. Porém, elas não durariam muito.

Dan foi subitamente tirado da liderança. Em 22 de março de 1994, foi vítima de um acidente aéreo fatal. Ele estava em um voo de um Airbus russo (Aeroflot, voo 593 de Moscou para Hong Kong) que bateu em uma montanha. Os 75 passageiros e a tripulação morreram. O acidente aconteceu porque o filho de um dos pilotos estava na cabine brincando com os controles.

Grace, viúva de Dan, e os dois filhos pequenos (Wei Wei e Justin) ficaram desolados. Porém, a obra do Senhor continuou.

Providencialmente, a irmã mais velha de Dan, Winnie, e o marido, Joseph, estavam em condições de assumir. Eles haviam viajado para os campos da missão na qual Dan trabalhava e conheciam pessoalmente os líderes asiáticos com os quais ele cooperava. E Dan havia estabelecido duas bases — uma particular, que ele começou com fundos próprios, e uma entidade pública de caridade chamada Country Network. Por meio dessas fundações, o trabalho singular do qual ele havia sido pioneiro pôde continuar.

E o legado de Dan continuará na Ásia por meio dos cristãos que ele influenciou, e tudo por causa do estilo de vida simples adotado por ele. “O seminário sobre estilo de vida simples”, disseme Grace em uma carta, “mudou a todos nós”.

Assim, deixe-me apresentar a Consulta Sobre Estilo de Vida Simples e o compromisso evangélico com um estilo de vida simples que tanto influenciou Dan.

COMPROMISSO EVANGÉLICO COM UM ESTILO DE VIDA$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$A história de Dan Lam mostra alguém que decidiu não acumular riqueza, mas ofertá-la; que passo concreto rumo à simplicidade você tem evitado dar, e o que esse adiamento revela sobre onde, de fato, está o seu coração?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se a vida na terra é uma breve peregrinação entre dois momentos de nudez e nada levaremos conosco, como essa verdade reordenaria hoje as suas decisões sobre dinheiro, posses e segurança, e em que você tem confiado em vez de confiar em Cristo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Stott contrasta o materialismo que abafa a vida espiritual com o contentamento aprendido por Paulo em quaisquer circunstâncias; onde a busca por mais tem sufocado a sua comunhão com Deus, e o que seria, para você, aprender o contentamento generoso em vez do acúmulo ansioso?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 6 — Equilíbrio$t$, 6,
$conteudo$ALGUNS DEVEM SE PERGUNTAR POR QUE INTITULEI ESTE CAPÍTULO

“Equilíbrio”. A razão deve ficar clara agora. Seguimos Pedro nas seis ilustrações que se completam para descrever o que é um discípulo. Aqui estão elas novamente: - Como crianças recémnascidas, somos chamados a crescer; - Como pedras vivas, somos chamados à comunhão; - Como sacerdotes santos, somos chamados à adoração; -Como povo de propriedade de Deus, somos chamados ao testemunho; - Como estrangeiros e peregrinos, somos chamados à santidade; - Como servos de Deus, somos chamados à cidadania.

Essa é uma descrição maravilhosamente abrangente e equilibrada. Essas seis responsabilidades parecem se organizar em três pares, cada um apresentando um equilíbrio.

Somos chamados tanto para o discipulado individual quanto para a comunhão corporativa [...]. Adoração e trabalho [...], peregrinação e cidadania Em primeiro lugar, somos chamados tanto para o discipulado individual quanto para a comunhão corporativa. Bebês, apesar de nascerem numa família, têm sua identidade própria. Até os gêmeos nascem separados! Porém, a função fundamental das pedras usadas em construção é ser parte de alguma coisa. Elas cederam sua individualidade ao prédio. Sua importância não está nelas mesmas, mas no conjunto. Então, precisamos enfatizar tanto as nossas responsabilidades individuais quanto as corporativas.

Em segundo lugar, somos chamados tanto para adorar quanto para trabalhar. Como sacerdócio, nós adoramos a Deus. Como povo de propriedade de Deus, testemunhamos ao mundo. A igreja é uma comunidade de adoração e testemunho.

Em terceiro lugar, somos chamados tanto para a peregrinação quanto para a cidadania.

Em cada par, somos chamados ao equilíbrio e não à ênfase de um em detrimento do outro. Assim, somos tanto discípulos individuais quanto membros da igreja, tanto adoradores quanto testemunhas, tanto peregrinos quanto cidadãos.

A razão de quase todas as nossas falhas é a facilidade que temos de esquecer nossa identidade como discípulos. Nosso Pai Celestial está constantemente nos dizendo o que o Rei George 5 sempre dizia ao Príncipe de Gales: “Meu filho querido, você deve sempre se lembrar de quem você é, pois se você se lembrar de sua identidade, se comportará de acordo com ela”.

1. The first epistle of St Peter. Macmillan, 1961. 2. ed.↩ 2. Orval Hobart Mowrer, 1907-1982.↩ Capítulo 7$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Dos três pares que Stott apresenta (discipulado individual e comunhão corporativa, adoração e trabalho, peregrinação e cidadania), qual lado você tende a enfatizar a ponto de negligenciar o outro, e como esse desequilíbrio tem empobrecido o seu seguir a Cristo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Stott diz que a raiz de quase todas as nossas falhas é esquecer quem somos como discípulos; em que situações concretas da sua semana você age como se não pertencesse a Cristo, e o que mudaria se você se lembrasse, ali, da sua identidade nele?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se você é ao mesmo tempo peregrino (de passagem por este mundo) e cidadão (responsável dentro dele), de que forma manter essas duas verdades juntas o livraria tanto do escapismo que foge do mundo quanto do conformismo que se afunda nele?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 7 — Dependência$t$, 7,
$conteudo$OS CHAMADOS “TEÓLOGOS SECULARES” DA DÉCADA DE 60 DEFENDIAM

audaciosamente que a humanidade havia atingido a maioridade e que, nessas circunstâncias, poderíamos dispensar Deus. Todavia, essa chocante declaração durou pouco, pois a verdade é que somos pecadores; somos dependentes de Deus, de sua misericórdia e de sua contínua graça. Tentar viver sem ele é justamente o que significa pecado. Além disso, também precisamos uns dos outros.

Compartilharei uma de minhas recentes experiências que demonstram minha fragilidade e dependência. Era uma manhã de domingo, 20 de agosto de 2006, e eu deveria pregar na Igreja All Souls em Langham Place, Londres. Estava separando a roupa suja quando tropecei no pé de uma cadeira giratória e caí entre minha cama e a estante de livros. Como não podia me mover, muito menos levantar-me sozinho, percebi naquele momento que havia quebrado ou deslocado o quadril. Entretanto, consegui apertar o botão de emergência e alguns amigos vieram imediatamente em meu socorro.

Hugh Palmer, reitor da Igreja All Souls, encontrou meus esboços e de algum modo conseguiu pregar meu sermão. Somente mais tarde notei como ele era apropriado, pois havia preparado uma exposição do Pai-Nosso,1 formada por seis petições: três expressando nossa paixão pela glória de Deus (seu nome, reino e vontade), seguidas por três que expressam nossa dependência de sua graça (pelo pão de cada dia, perdão dos nossos pecados e livramento do mal). Há muito tempo comecei a notar que a segunda metade da oração do Senhor é um resumo do nosso discipulado — nossa consciência da glória de Deus e nossa dependência de sua misericórdia. Dependência é uma atitude fundamental que temos de ter sempre que orarmos o Pai-Nosso.

Ao mesmo tempo em que o sermão sobre dependência estava sendo pregado, ele estava, no mínimo, sendo parcialmente ilustrado. Em pouco tempo, fui imobilizado e transferido do chão para a maca, da maca para a ambulância, da ambulância para a cama do hospital, da cama do hospital para a sala de cirurgia. Acordei e fiquei agradecido por estar com uma prótese de quadril e, no tempo apropriado, estava recuperado.

Assim, no decorrer do capítulo, por favor, não se esqueça da minha experiência matutina, “esparramado” no chão, completamente dependente de outros. Pois este é o lugar onde, de vez em quando, o discípulo radical precisa estar. Deus pode usar a dependência gerada por essas experiências para causar em nós um profundo ama-durecimento.

Há outro aspecto da dependência que vivenciei, mas que era novo pra mim. Fui tentado a evitar falar dele, mas meus amigos de confiança insistiram para que eu não me calasse. É a instabilidade emocional que algumas vezes a enfermidade física traz à tona e que se manifesta pelo choro.

Não sou uma pessoa que chora com naturalidade e, em geral, consideram-me forte. Fui educado na Rugby School, uma daquelas famosas escolas “públicas” em que se aprende a filosofia da “casca grossa”, isto é, não se deve demonstrar qualquer emoção.

Porém, li os Evangelhos e descobri neles o registro de que Jesus, nosso Senhor, chorou em público duas vezes: uma por causa da falta de arrependimento da cidade de Jerusalém (Lc 19.41) e a outra por causa do sepultamento de Lázaro (Jo 11.35).

Deste modo, se Jesus chorou, seus discípulos presumivelmente poderiam fazê-lo.

Mas por que eu deveria derramar lágrimas? Não estava diante da falta de arrependimento nem da morte. Estaria eu afundado na autocomiseração, sob a perspectiva de uma lenta recuperação? Estaria lamentando minha queda e fratura? Estaria vislumbrando ali o fim do meu ministério? Não, na verdade eu não tive tempo de colocar meus pensamentos em ordem.

Tive uma experiência semelhante de lamento com meu amigo John Wyatt, que é professor de ética e perinatologia no hospital-escola da Universidade de Londres, e que se tornou famoso por defender a inviolabilidade da vida humana em debates públicos sobre aborto e eutanásia. Quando ele me visitou no hospital, compartilhamos nossas experiências de fragilidade e dependência e ambos chegamos às lágrimas. Eis a forma como ele descreveu essa situação:

Nos primeiros dias depois da cirurgia, John Stott foi acometido por episódios de desorientação e por distintas e alarmantes alucinações visuais. Além disso, havia a inevitável humilhação de receber os cuidados da enfermagem, e a preocupação com o futuro. Enquanto estávamos no hospital, conversando e compartilhando, lembrei-me da minha própria experiência de doença e caos, alguns anos antes. Lembro que estávamos em lágrimas, dominados por um poderoso sentimento comum de vulnerabilidade e debilidade humana. Foi uma experiência dolorosa, mas libertadora.

A seguir, a segunda e semelhante experiência, dessa vez com a contribuição de Sheila Moore, minha fisioterapeuta e amiga:

Foi logo após o retorno para casa, depois de sua convalescença.

John havia acabado de voltar para descansar em uma cadeira, quando, de repente, estremeceu e suspirou profundamente. Fui ver se ele se sentia mal e percebi que as lágrimas fluíam livremente. Ele estava vivenciando uma arrebatadora liberação de toda a carga emocional e dos desafios dos eventos recentes, que ele havia pacientemente suportado sendo “um paciente”. Não há palavras a serem ditas durante uma experiência tão profunda — somente uma empatia e uma confortante mão firme em seu ombro. Pouco a pouco, enquanto a emoção cedia, assegurei a ele que não se tratava de uma experiência incomum em tais circunstâncias e que as lágrimas são um alívio e uma forma de cura muito valiosa.

Essa experiência completamente “inusitada” aconteceu repentinamente; foi uma surpresa que causou certo choque e dor emocional. Racionalizar tais experiências talvez seja difícil, especialmente para homens, que tendem a vê-las como uma humilhação. Porém, se encaradas com honestidade, podem ser um alívio maravilhoso. É muito valioso encarar esses momentos como uma preparação dada por Deus para as mudanças que se seguiriam à frente e como um presente especial da parte dele.

Deixe-me contar outra ilustração. Quem me levou a Cristo durante os últimos anos na Rugby School foi o reverendo E. J. H. Nash, conhecido por todos os seus amigos como “Bash”. Ele era um homem de notável comprometimento cristão e tinha uma clara visão de como ganhar para Cristo os garotos das melhores escolas públicas. Por meio de acampamentos ou festas domiciliares, ele era notavelmente bem-sucedido. Apesar do sucesso nesse ministério, ele não mostrava sinais de arrogância. Pelo contrário, todos que o encontravam, comentavam sobre sua humildade e muitos de nós que éramos seus amigos estávamos curiosos para descobrir seu segredo. Embora muito reservado pra falar a respeito, ele o revelou a mim.

Um dia, Bash e eu estávamos viajando juntos de trem quando ele me contou sobre sua juventude. Aos vinte e poucos anos, ele foi acometido por uma séria doença. No auge da enfermidade, pensou que estava em seu leito de morte. Ficou tão fraco que mal podia se mexer. Ele nem sequer podia alimentar-se com as próprias mãos e tinha de ser alimentado com uma colher. Foi uma experiência de total dependência e humilhação. De fato, segundo ele, a humilhação era o caminho para a humildade. Depois de adentrar as profundezas da impotência absoluta, seria impossível chegar ao cume da autoconfiança.

Alguns anos depois, essa verdade foi confirmada por Michael Ramsey, arcebispo de Canterbury.

A humilhação era o caminho para a humildade. Depois de adentrar as profundezas da impotência absoluta, seria impossível chegar ao cume da autoconfiança Discursando para um grupo de pessoas na véspera da ordenação delas, ele escolheu a humildade como tema para a ocasião e seu discurso incluía os seguintes conselhos: 1. Agradeça a Deus sempre [...]. Agradeça a Deus, com atenção e admiração por seus privilégios sem fim [...]. Gratidão é um solo no qual o orgulho não cresce facilmente.

2. Interesse-se por confessar seus pecados. Certifique-se de julgar a si mesmo na presença de Deus: isso é o seu auto-exame. Coloque-se sob o julgamento divino: isso é a sua confissão [...].

3. Esteja pronto para aceitar humilhações. Elas podem doer terrivelmente, mas o ajudam a ser humilde. Pode ser que sejam humilhações insignificantes. Aceite-as. Pode ser que sejam humilhações maiores [...]. Tudo isso pode ser uma oportunidade para estar um pouco mais próximo do nosso crucificado e humilde Senhor.

4. Não se preocupe com status [...]. Só existe um status com o qual nosso Senhor nos ordena a estar preocupados: o status de proximidade dele mesmo.

5. Use seu senso de humor. Rir das coisas, rir dos absurdos da vida, rir de si mesmo e de seus próprios absurdos. Nós somos, todos nós, criaturas infinitamente pequenas e insignificantes dentro do universo de Deus. Você tem de ser sério, mas nunca ser cerimonioso, porque se você for cerimonioso sobre qualquer coisa, existe o risco de tornar-se cerimonioso com você mesmo.2 A recusa em ser dependente dos outros não é um sinal de maturidade, mas de imaturidade. Um bom exemplo é o filme Conduzindo Miss Daisy, baseado na peça teatral de Alfred Uhry, vencedor do prêmio Pulitzer.

Apesar de ser propenso a enfatizar a tensão racial, o enredo central é o relacionamento psicológico e progressivo entre os dois personagens principais, Miss Daisy, a inflexível viúva de 72 anos, e Hoke, seu motorista afroamericano.

O filme começa quando Miss Daisy bate o carro por pisar no acelerador e não no freio. Seu filho, Boolie, diz a ela que nenhuma companhia de seguros a aceitará e por isso ela deve contratar um chofer. Ela se recusa, mas ele insiste até encontrar Hoke, que tinha sido motorista de um juiz local até a morte deste.

No início ela não se relaciona com Hoke. Certa ocasião, ela deixa escapar: “Eu não preciso de você, eu não quero você, eu não gosto de você!”. Porém, gradativamente, conforme Miss Daisy e Hoke passam tempo juntos, nasce uma crescente apreciação mútua até que, anos mais tarde, ela diz a ele: “Você é meu melhor amigo. De verdade”, e pega sua mão.

O filme termina em um dia de Ação de Graças na casa de repouso onde Miss Daisy passou a viver. Boolie e Hoke a visitam, mas ela insiste em monopolizar Hoke. Ele observa que ela não comeu sua torta de abóbora, e enquanto ela tenta pegar o garfo, ele gentilmente pega o prato e o garfo dela. “Deixa eu ajudá ocê”, ele diz. Hoke corta a torta em pequenos pedaços e dá a ela. Miss Daisy se delicia. O sabor é bom. Ele dá a ela outro pedaço. E outro.

O filme mostra a transformação no relacionamento deles desde o início, quando ela se recusou a ser dependente dele para qualquer coisa, até o fim, quando ela é dependente de outros para quase tudo.

O envelhecimento é o processo que mudou o relacionamento entre Miss Daisy e Hoke. No final do filme, Hoke tinha 85 anos de idade e Miss Daisy, 97.

Ainda hoje nossos relacionamentos estão sujeitos a mudança. O falecido Paul Tournier (1898–1986), conhecido médico e psicoterapeuta suíço, tornou-se famoso com seu livro The Meaning of Persons,3 e aplicou suas ideias em outro livro, É Preciso Saber Envelhecer:

Essa etapa cultural é a que nos permite ser mais pessoais e nos tornar pessoas capazes de enfrentar a velhice com todos os recursos individuais.

Nossa sociedade pôs as coisas acima das pessoas; nossa civilização é uma civilização de coisas e não de pessoas. Os aposentados são objetos de desprezo porque estão nus, validados apenas por si mesmos e não pelo que produzem.

Na velhice [...] o indivíduo possui o tempo e o conhecimento necessários para exercer um verdadeiro ministério de relação pessoal.4 Porém, não devemos imaginar que a dependência é a única atitude apropriada a ser adotada por um discípulo radical. Existem momentos em que somos chamados ao oposto, isto é, a sermos independentes. De fato, Myra Chave-Jones, que na década de 60 foi em grande parte responsável pela fundação da Care and Counsel, um serviço de aconselhamento cristão em Londres, escreveu que o conflito entre dependência e independência “é uma das curvas mais abruptas de aprendizagem no caminho da vida”.

O próprio Jesus ensinou que a dependência cresce à medida que crescemos. Depois de sua ressurreição, ele disse a Pedro:

Quando eras mais moço, tu te cingias a ti mesmo e andavas por onde querias; quando, porém, fores velho, estenderás as mãos, e outro te cingirá e te levará para onde não queres.

João 21.18 João nos diz que as palavras de Jesus se referiam especificamente a Pedro e sua morte; porém, elas agregam um importante princípio relacionado ao envelhecimento.

Embora a independência seja apropriada em algumas circunstâncias, insisto na dependência como a postura mais característica de um discípulo radical. Cito novamente John Wyatt e sua eloquente declaração sobre a prioridade da dependência: “O plano de Deus para nossa vida é que sejamos dependentes”.

Viemos a este mundo totalmente dependentes do amor, do cuidado e da proteção de outros. Passamos por uma fase na vida em que outras pessoas dependem de nós. E a maior parte de nós deixará este mundo dependendo totalmente do amor e do cuidado de outros. E isso não é nenhum mal ou realidade destrutiva. É parte do plano, da natureza física que nos foi dada por Deus.

Às vezes ouço pessoas idosas — incluindo cristãos, que deveriam ter mais entendimento —, dizerem: “Não quero ser um peso pra ninguém. Estou feliz em continuar vivendo enquanto puder cuidar de mim, mas se eu vier a me tornar um peso, prefiro morrer”. Isso está errado. Todos nós estamos destinados a ser um peso para outros. Você está destinado a ser um peso para mim e eu estou destinado a ser um peso para você. E a vida familiar, incluindo a vida da família da igreja local, deveria ser de “responsabilidade mútua”. “Levai as cargas uns dos outros e, assim, cumprireis a lei de Cristo” (Gl 6.2).

O próprio Cristo provou da dignidade da dependência. Ele nasceu como um bebê, totalmente dependente do cuidado da mãe. Precisou ser alimentado, trocado e apoiado para não cair. Mesmo assim, ele nunca perdeu a dignidade divina. E no final, na cruz, ele mais uma vez tornou-se totalmente dependente, com os membros perfurados e esticados e incapaz de se mover. Assim, na pessoa de Cristo, aprendemos que a dependência não destitui — não pode destituir — uma pessoa de sua dignidade, de seu valor supremo. E se a depen-dência foi adequada para o Deus do Universo, certamente é apropriada para nós.

1. Mateus 6.9-13; Lucas 11.2-4.↩ 2. The christian priest today. SPCK, 1972. Edição revisada, 1985. Capítulo 11: “Divine humility”, p. 79-91.↩ 3. HarperCollins, 1957 (edição de bolso).↩ 4. Traduzido do francês por Yara Tenório da Motta (Editora Ultimato, 2014). p. 20, 52, 55.↩ Capítulo 8$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Stott afirma que o plano de Deus é que sejamos dependentes e que recusar-se a depender dos outros é sinal de imaturidade, não de força; onde a sua autossuficiência tem disfarçado um orgulho que resiste tanto a Deus quanto ao próximo, e o que custaria a você admitir que precisa de ajuda?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se "a humilhação é o caminho para a humildade" e até Cristo abraçou a dependência ao nascer bebê e ao morrer na cruz sem destituir sua dignidade, que humilhação ou fragilidade recente você poderia receber não como derrota, mas como convite de Deus para amadurecer e se aproximar dele?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante da ideia de que estamos destinados a ser "peso" uns dos outros e a levar as cargas mútuas como lei de Cristo, como você tem permitido (ou impedido) que a comunidade de fé o carregue, e que medo precisa morrer para que você se deixe cuidar com sinceridade?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Capítulo 8 — Morte$t$, 8,
$conteudo$A oitava e última característica do discípulo radical é a morte. Deixe-me explicar. O cristianismo oferece vida — vida eterna, vida em abundância. Porém, ele deixa claro que a estrada para a vida é a morte. E enfatiza essa afirmação em, pelo menos, seis áreas, como mostrarei neste capítulo. Vida por meio da morte é um dos mais profundos paradoxos da fé e da vida cristãs.

A vida e a morte sempre fascinaram as pessoas. Não há dúvida de que estamos vivos e de que morreremos. São dois fatos inegociáveis com os quais temos de concordar. No entanto, eles são também misteriosos e difíceis de definir.

Darei um exemplo a partir de uma área do meu interesse, a ornitologia.

Vida por meio da morte é um dos mais profundos paradoxos da fé e da vida cristãs Roger Tory Peterson, que morreu em 1997, foi o decano diplomático dos ornitólogos americanos do século 20 e um artista cujo tema era pássaros. Peterson costumava contar sobre seu ingresso na área. Numa caminhada pelo campo, aos onze anos, ele vislumbrou uma espécie de pica-pau. Parecia ser apenas uma bola de penas marrons, agarrada ao tronco de um carvalho.

Com cuidado, eu o toquei nas costas. Instantaneamente, a coisa inerte virou a cabeça, olhou para mim com olhos espantados, explodiu em um lampejo de asas douradas e voou para a floresta.

Foi como uma ressurreição — o que parecia estar morto, estava muito vivo. Desde então, as aves têm sido, para mim, as expressões mais nítidas de vida [...]. Aves são uma declaração de vida.1 Em outro lugar, Peterson descreve isso como “o momento crucial da minha vida”. “Eu fiquei desarmado”, continuou ele, “pelo contraste entre algo que repentinamente estava tão cheio de vida e algo que eu havia considerado morto”.2 Contudo, meu interesse neste capítulo não é a vida e a morte na natureza, mas a vida e a morte em Cristo. A perspectiva do discípulo radical é ver a morte não como o término da vida, mas como a entrada para ela.

Pois o que a Escritura faz é colocar diante de nós as desejáveis glórias da vida e depois enfatizar que a condição indispensável para experimentá-las é a morte. Resumindo, a Bíblia promete vida por meio da morte, e de nenhuma outra maneira. Assim, o apóstolo Paulo descreve o povo cristão como “ressurretos dentre os mortos” (Rm 6.13). Essa perspectiva é tão diferente das suposições da mente secular, tão atual e tão revolucionária em suas implicações, que precisamos vê-la aplicada em seis situações diferentes nas quais ela opera, de acordo com o Novo Testamento.

SALVAÇÃO

Antes de tudo, vemos morte e vida em relação à nossa salvação, pois frequentemente a salvação é representada em termos de vida. Paulo escreve que o dom de Deus é a vida eterna (Rm 6.23) e João explica que aquele que tem o Filho tem a vida (1Jo 5.12). Fica claro também que a característica distintiva desta vida não é a eternidade, mas sua qualidade como vida do novo mundo. A vida eterna é uma vida vivida em comunhão com Deus (Jo 17.3).

Porém, a morte é a única forma de entrar nessa vida e a razão para isso é clara: a barreira para a comunhão com Deus é o pecado, e “o salário do pecado é a morte” (Rm 6.23). Em toda a Bíblia, o pecado e a morte são igualmente considerados uma ofensa que merece uma punição.

Porém, se tivéssemos de morrer por nossos pecados, seria o fim. Não poderia haver vida dessa forma.

Assim, Deus veio a nós em Jesus Cristo. Ele tomou nosso lugar, se apossou do nosso pecado e morreu a nossa morte. Nós havíamos pecado. Nós merecíamos morrer. Porém, ele morreu em nosso lugar. A simples declaração “Cristo morreu pelos pecados” é suficiente. Ele não possuía pecados próprios pelos quais precisasse morrer; ele morreu pelos nossos pecados.

Porém, sua morte não pode nos trazer nenhum bem a menos que reivindiquemos seus benefícios. É pela fé, interiormente, e pelo batismo, exteriormente, que nos tornamos unidos a Cristo em sua morte e ressurreição. Nós morremos e ressuscitamos com ele. Portanto, agora “considerai-vos [ou avaliai-vos] mortos para o pecado” (Rm 6.11) — não fingindo que estamos imunes ao pecado quando sabemos que não estamos, mas entendendo e lembrando que, sendo um com Cristo, os benefícios de sua morte se tornaram nossos. Estamos “vivos para Deus”, vivos por intermédio de sua morte.

DISCIPULADO

Assim como na salvação, o mesmo princípio de vida por meio da morte opera no discipulado. O próprio Jesus utilizou esse enfático simbolismo:

Então, convocando a multidão e juntamente os seus discípulos, disse-lhes: Se alguém quer vir após mim, a si mesmo se negue, tome a sua cruz e siga-me. Quem quiser, pois, salvar a sua vida perdê-la-á; e quem perder a vida por causa de mim e do evangelho salvá-la-á.

Marcos 8.34-35 Se tivéssemos vivido sob a ocupação romana na Palestina e se tivéssemos visto um homem carregando uma cruz, ou pelo menos o patibulum, não precisaríamos perguntar o que ele estava fazendo. Imediatamente o teríamos reconhecido como um criminoso condenado a caminho da execução, pois os romanos obrigavam os sentenciados a carregar a cruz até o local da crucificação.

Essa, então, foi a imagem dramática que Jesus usou para representar a autonegação. Pois, se estamos seguindo a Jesus, existe apenas um lugar para o qual podemos estar indo: o lugar da morte. Como Dietrich Bonhoeffer escreve em Discipulado,3 “Quando Cristo chama um homem, ele o convida a vir e morrer”. Além disso, de acordo com Lucas, devemos tomar nossa cruz todos os dias (Lc 9.23) e, se não o fizermos, não poderemos ser seus discípulos (Lc 14.27).

Tal ensinamento entra em choque com o Movimento do Potencial Humano e com o Movimento da Nova Era, que o tem imitado. Carl Rogers ensina que as pessoas não são caracterizadas pela patologia (como ensina Freud), mas pelo potencial, e Abraham Maslow enfatiza a necessidade da autorrealização. As palavras “salvar” e “perder” nossa “vida”, utilizadas por Jesus, podem ser aplicadas ao martírio, mas não são, necessariamente, restritas a ele. Pois a nossa “vida” é a nossa psychĕ, nosso eu; e em algumas versões dessa passagem a forma reflexiva é usada, especialmente “a si mesmo”.

Assim, podemos parafrasear o versículo 35 da seguinte forma: “Quem estiver determinado a se apegar a si próprio e a viver por si próprio perderá a si próprio. Porém, quem estiver disposto a morrer, a perder-se, a se entregar à obra de Cristo e ao evangelho se encontrará (no momento do completo abandono) e descobrirá sua verdadeira identidade”. Assim, Jesus promete a verdadeira autodescoberta pelo preço da autonegação, a verdadeira vida pelo preço da morte.

O apóstolo Paulo foi cuidadoso ao trabalhar esse ensino de Jesus. Em Gálatas, ele declara que havia sido crucificado com Cristo (2.20) e que todos que pertencem a Cristo crucificaram sua natureza caída com todas as suas paixões e desejos (5.24). Isso é “mortificação”, ou seja, sentenciar à morte ou repudiar a nossa natureza caída e autopermissiva. A declaração mais clara de Paulo a esse respeito está em Romanos 8.13: “Porque, se viverdes segundo a carne, caminhais para a morte; mas, se, pelo Espírito, mortificardes os feitos do corpo, certamente, vivereis”.

Eis um versículo que define o evidente contraste entre vida e morte. Ele afirma que existe um tipo de vida que, na verdade, conduz à morte, e que existe um tipo de morte que, na verdade, leva à vida. Assim, se queremos viver uma vida de verdadeira realização, devemos sentenciar (rejeitar radicalmente) todo o mal à morte. Como escreve Martyn Lloyd-Jones: “Estou cada vez mais convencido de que a maioria das pessoas vive uma vida cristã problemática porque mimam a si mesmas espiritualmente”.4 Por outro lado, se rejeitarmos o mal, viveremos. A única maneira de vivenciarmos a plenitude da vida é morrendo, ou melhor, sentenciando à morte, crucificando, ou seja, renunciando completamente a nossa natureza autopermissiva e todos os seus desejos.

O puritano John Owen enfatiza essa verdade em seu livro A Mortificação do Pecado (1656): “O ódio ao pecado como pecado, não somente como algo irritante ou desconfortável [...], está presente na base de toda mortificação espiritual” (capítulo 8). Dessa forma, é essencial lutar contra o domínio do pecado e não concordar com ele. Devemos evitar o “grande mal de pregar uma paz ilusória para nós mesmos” (capítulo 13). Além do mais, uma mortificação tão radical só é possível por meio do Espírito Santo. “É mais fácil um homem conseguir ver sem olhos, ou falar sem língua, do que verdadeiramente mortificar um pecado sem o Espírito” (capítulo 7).

MISSÃO

A terceira área na qual o princípio da vida mediante a morte opera é a da missão. Apesar de o sofrimento ser um aspecto indispensável na missão, ele é frequentemente subestimado. Portanto, precisamos compreender sua base bíblica antes de considerar alguns exemplos notáveis.

Observe o admirável perfil do servo do Senhor nos capítulos 42 a 53 de Isaías. Seu chamado é para trazer a luz da salvação às nações; porém, em primeiro lugar, ele deve suportar o escárnio e a perseguição. Antes de poder “causar admiração às nações”, ele será desprezado e rejeitado por outros e oferecerá a sua vida à morte.

Douglas Webster, no livro Yes to Mission, aborda o tema de forma convincente:

Mais cedo ou mais tarde, a missão leva à paixão. Nos padrões bíblicos [...] o servo deve sofrer [...] e isso faz a missão ser efetiva [...]. Toda forma de missão leva a alguma forma de cruz. O próprio formato de missão é cruciforme. Só podemos entender missão nos termos da cruz.5 Jesus tinha convicção de que era aquele que cumpriria as profecias do Servo Sofredor e falou da necessidade do sofrimento na missão. Quando alguns gregos foram até Filipe querendo ver Jesus, o Mestre respondeu:

É chegada a hora de ser glorificado o Filho do Homem. Em verdade, em verdade vos digo: se o grão de trigo, caindo na terra, não morrer, fica ele só; mas, se morrer, produz muito fruto.

Quem ama a sua vida perde-a; mas aquele que odeia a sua vida neste mundo preservá-la-á para a vida eterna.

João 12.23-25.

Aqui, novamente, apesar de não ser no contexto de missão, mas no de discipulado, Jesus usa a linguagem de vida e morte, e enfatiza que a morte é o caminho para a vida. Somente por meio de sua morte o evangelho seria expandido ao mundo gentílico. A morte é o caminho para a frutificação. A menos que morra, a semente permanece sozinha. Porém, se morrer, ela se multiplica. Foi assim com o Messias e com sua comunidade: aquele que “me serve, siga-me” (Jo 12.26).

Nossa base bíblica para o sofrimento missionário seria incompleta sem o apóstolo Paulo. Considere essa extraordinária declaração: “De modo que, em nós, opera a morte, mas, em vós, a vida” (2Co 4.12).

Aqui o apóstolo ousa declarar que, por meio de sua morte, outros viverão. Ele está louco? É isso que ele quer dizer? Sim! É óbvio que seus próprios sofrimentos e sua morte não trarão salvação, como o sofrimento e a morte de Jesus Cristo. Em vez disso, as pessoas recebem vida por meio do evangelho, e os que pregam o evangelho fielmente sofrem por ele. Paulo sabia do que estava falando. A boa nova que ele proclamava é que a salvação estava disponível para judeus e gentios da mesma forma — somente pela fé. Isso gerou a oposição fanática dos judeus — por isso não é exagero dizer que os gentios deviam sua salvação à disposição que Paulo tinha de pregá-la fielmente e de sofrer por ela. Ele estava pronto para morrer para que eles pudessem viver.

A história da igreja cristã tem sido composta por missionários ousados que arriscaram a vida por amor ao evangelho e que, como resultado, viram a igreja crescer. Mencionarei dois exemplos — um relacionado a uma pessoa e outro a um país inteiro.

O primeiro é Adoniram Judson, de Mianmar (antiga Birmânia). Ao pedir sua futura esposa Ann em casamento, ele disse a ela: “Me dê sua mão para ir comigo para as selvas da Ásia e morrer comigo pela causa de Cristo”. Eles chegaram a Rangun em 1813 e imergiram na língua e cultura birmanesas. Somente depois de seis anos Adoniram sentiu-se capaz de pregar o primeiro sermão, e somente depois de sete registraram o primeiro convertido. Ele precisou de vinte anos para traduzir a Bíblia toda para o birmanês. Também escreveu folhetos, um catecismo, uma gramática e um dicionário inglês-birmanês, que ainda está em uso.

Seus sofrimentos foram intensos. Ele ficou viúvo duas vezes e perdeu seis filhos durante a vida. Ele e a família eram constantemente assolados por enfermidades. Durante a guerra anglo-birmanesa, suspeitaram que Adoniram fosse espião e ele ficou quase dois anos preso, suportando as amarras, o calor e as condições precárias. Em 37 anos de serviço missionário, ele voltou ao seu lar, nos Estados Unidos, apenas uma vez.

Apesar disso, como resultado de sua morte e sepultamento em solo birmanês, ele frutificou muito. No primeiro domingo após sua chegada a Mianmar, em 1813, ele e Ann celebraram juntos a Ceia do Senhor porque não havia outros cristãos para convidar à mesa.

Entretanto, quando ele morreu, 37 anos mais tarde, em 1850, deixou mais de 7 mil birmaneses e karens batizados em 63 igrejas. Agora, calcula-se que existam mais de 3 milhões de cristãos em Mianmar.

O segundo exemplo relaciona-se ao vasto país da China. Quando os comunistas assumiram o poder e todos os missionários estrangeiros tiveram de sair, acredita-se que havia aproximadamente 1 milhão de cristãos protestantes. Hoje, estima-se que existam cerca de 70 milhões.6 Como isso é possível? Tony Lambert escreve:

A razão para o crescimento da igreja na China e para o surgimento de um avivamento espiritual genuíno em muitas áreas tem ligação total com a teologia da cruz [...].

A mensagem integral da igreja chinesa é de que Deus usa o sofrimento e a pregação do Cristo crucificado para gerar avivamento e edificar a igreja. Será que nós, do Ocidente, ainda estamos dispostos a ouvir? [...] A igreja chinesa [...] tem andado no caminho da cruz. A vida e morte dos mártires dos anos 50 e 60 produziram ricos frutos.7 A “morte” que somos chamados a morrer como condição para a frutificação talvez seja menos dramática do que o martírio. No entanto, é uma morte real, especialmente para os missionários transculturais. Para eles, pode ser a morte do conforto e da comodidade, da separação do lar e dos parentes; ou a morte da ambição pessoal ao renunciarem à tentação de ascenderem profissionalmente e se contentarem em permanecer num ministério servil e humilde; ou a morte do imperialismo cultural, quando se recusam a exaltar sua cultura herdada (apesar de isso fazer parte de sua identidade) e se identificam com a cultura que adotaram. Dessa e de outras formas, somos chamados a “morrer” para que haja uma vida de frutificação.

PERSEGUIÇÃO

A quarta área na qual a morte é considerada o caminho para a vida é a perseguição física.

O apóstolo Paulo novamente é um exemplo de destaque. Poucos cristãos já sofreram como ele — foram açoites, apedrejamentos, aprisionamentos, linchamentos e naufrágios. Na verdade, o tratamento que recebeu foi tão brutal que algumas vezes ele descreveu essas situações como um tipo de “morte” e o livramento como um tipo de “ressurreição”. “Dia após dia, morro”, escreve ele em seu extenso capítulo sobre ressurreição (1Co 15.31), querendo dizer que continuamente estava exposto a perigos de morte. Eis a declaração completa:

Porque não queremos, irmãos, que ignoreis a natureza da tribulação que nos sobreveio na Ásia, porquanto foi acima das nossas forças, a ponto de desesperarmos até da própria vida.

Contudo, já em nós mesmos, tivemos a sentença de morte, para que não confiemos em nós, e sim no Deus que ressuscita os mortos; o qual nos livrou e livrará de tão grande morte; em quem temos esperado que ainda continuará a livrar-nos.

2 Coríntios 1.8-10 Nem todos os cristãos que são ameaçados pela morte são repetidamente resgatados como Paulo foi. Não existem promessas de imunidade nem de libertação. Em vez disso, mesmo em meio a situações de morte, podemos experimentar vida.

Levando sempre no corpo o morrer de Jesus, para que também a sua vida se manifeste em nosso corpo. Porque nós, que vivemos, somos sempre entregues à morte por causa de Jesus, para que também a vida de Jesus se manifeste em nossa carne mortal.

2 Coríntios 4.10-11 Segundo essa extraordinária afirmação, podemos experimentar a morte e a vida de Jesus simultaneamente. Observe que o substantivo “corpo” e o advérbio “sempre” são repetidos nos versículos 10 e 11. Sempre compartilhamos, em nosso corpo, a vida e a morte de Jesus. Mesmo quando estamos sendo afligidos fisicamente e sendo conscientizados de nossa mortalidade, podemos contar com o vigor espiritual de Jesus. Mesmo antes de a ressurreição acontecer, podemos experimentar a vida ressurreta de Jesus. Assim, “como se estivéssemos morrendo, e, contudo, eis que vivemos” (2Co 6.9).

Seja qual for o espinho na carne de Paulo (alguns acham que era enfermidade, outros, perseguição), certamente era algum tipo de problema físico. E apesar de ter clamado por libertação, Paulo recebeu, em vez disso, o poder de Cristo em sua fraqueza. Realmente, a verdade central das cartas de Paulo à igreja em Corinto é o poder por meio da fraqueza, a glória por meio do sofrimento e a vida por meio da morte.

No final, Paulo não foi liberto, mas executado. Ele selou seu testemunho com o próprio sangue. E no último livro da Bíblia, o povo de Deus é advertido a respeito de perseguição e do martírio. Jesus diz à igreja em Esmirna: “Não temas as coisas que tens de sofrer [...]. Sê fiel até à morte, e dar-te-ei a coroa da vida” (Ap 2.10).

Paul Marshall, do Institute of Christian Studies, em Toronto, escreve em Their Blood Cries Out sobre a “tragédia mundial de cristãos modernos que estão morrendo por sua fé”. Ele calcula que no mundo 200 milhões de cristãos vivem sob repressão governamental e com temor diário da polícia secreta. Em mais de sessenta países, cristãos são assediados, abusados, presos, torturados e executados simplesmente por causa de sua fé. Porém, “apesar da perseguição, o cristianismo está crescendo rapidamente no mundo”.8 Martírio É possível observar que, em minha maneira de tratar o tema “vida por meio da morte”, estou separando martírio de perseguição. Não porque deixei de notar que os dois assuntos se sobrepõem, mas porque, de acordo com a Escritura, uma honra especial será concedida aos mártires no novo mundo (ver Apocalipse 20.4).

Assim, quero apresentar Josif Ton, um seguidor de Jesus Cristo que tem mostrado com sua vida e seu ensino que o sofrimento — e até a morte — é um ingrediente indispensável do discipulado cristão. Josif Ton é um líder cristão romeno, nascido em 1934, que se tornou pastor da Igreja Batista em Oradea, hoje um conhecido Centro Batista. Depois de quatro anos de pastorado fiel, as autoridades ficaram desconfiadas e ele foi preso e interrogado. Foi dada a ele, então, a oportunidade de deixar o país e se estabelecer nos Estados Unidos, onde se dedicou aos estudos e recebeu o título de doutor pela Evangelical Faculty of Belgium. Sua pesquisa, que mais tarde se tornou um livro, foi sobre “sofrimento, martírio e recompensas no céu”.

Durante o regime opressivo de Nicolae Ceauşescu, Josif Ton, em um de seus sermões públicos, contou como as autoridades haviam ameaçado matá-lo. Ele respondeu: “Senhor, sua maior arma é matar. Minha maior arma é morrer”.

“Fiel até a morte” foi Dietrich Bonhoeffer. Ele foi aprisionado no campo de concentração de Flossenburg. No domingo de 8 de abril de 1945, ele dirigiu um pequeno culto de adoração. Ele havia acabado de finalizar sua última oração quando a porta se abriu e dois homens à paisana disseram: “Prisioneiro Bonhoeffer, apronte-se para vir conosco”. As palavras “vir conosco” haviam chegado a todos os prisioneiros com um único significado — o cadafalso. “Esse é o fim”, disse ele, “para mim, o começo da vida”.9 Mortalidade Até aqui consideramos cinco áreas nas quais a morte é a vereda para a vida. Na salvação (Cristo morreu para que tenhamos vida), no discipulado (se sentenciarmos à morte as más ações do corpo, viveremos), na missão (a semente deve morrer para se multiplicar), na perseguição (morrendo para viver) e no martírio. Agora consideraremos a mortalidade e a morte do nosso corpo físico. Tendo chegado, pela graça de Deus, aos 88 anos na época em que este livro foi escrito, os leitores compreenderão que tenho refletido bastante sobre isso. O fim está à vista. Tenho sido encorajado pelo paradoxo da vida mediante a morte.

A morte inspira terror em muitas pessoas [...].

Porém, para os cristãos, a morte não é horrível A morte inspira terror em muitas pessoas. O intenso conflito interno de Woody Allen com a morte é bem conhecido. Ele a vê como uma aniquilação do ser e a considera “absolutamente espantadora em seu terror”. “Não que eu tenha medo de morrer”, graceja ele, “apenas não quero estar lá quando acontecer”.10 Outro exemplo é dado pelo americano Ronald Dworkin, o filósofo de direito que tem ocupado cadeiras nas universidades de Londres, Oxford e Nova York. Ele escreveu:

O mais horrível na morte é o esquecimento — a terrível e absoluta morte da luz [...]. A morte domina porque não é apenas o começo do nada, mas o fim de tudo.11 Porém, para os cristãos, a morte não é horrível. É verdade que o processo da morte pode ser confuso e humilhante, e a decadência procedente não é agradável. Na verdade, a própria Bíblia reconhece isso ao chamar a morte de “o último inimigo a ser destruído” (1Co 15.26). Ao mesmo tempo, afirmamos que “Cristo Jesus [...] destruiu a morte” (2Tm 1.10). Ele a conquistou pessoalmente por sua ressurreição, de tal forma que ela não tem mais autoridade sobre nós. Consequentemente, podemos gritar, em desafio: “Onde está, ó morte, a tua vitória? Onde está, ó morte, o teu aguilhão?” (1Co 15.55).

A derrota da morte é uma coisa; o dom da vida é outra. Contudo, por causa da dificuldade em se definir a vida eterna, os escritores do Novo Testamento tendem a utilizar o recurso da figura de linguagem. O apóstolo João, por exemplo, descreve o povo de Deus tendo seus nomes inscritos no livro da vida (Ap 3.5; 21.27), gozando de acesso contínuo à árvore da vida (Ap 2.7; 22.2), e bebendo livremente da água da vida (Ap 7.17; 21.6; 22.1, 17).

“Mas alguém dirá: Como ressuscitam os mortos? E em que corpo vêm?” (1Co 15.35). A mesma pergunta (uma pergunta tola, de acordo com Paulo) é frequentemente feita hoje. Nós respondemos a ela prestando atenção no relacionamento entre uma semente e sua flor. Há uma ligação básica entre as duas (por exemplo, as sementes da mostarda produzem apenas uma planta de mostarda). Mas a descontinuidade é muito mais impressionante. A semente é simples e feia, mas sua flor é colorida e bela. Assim será com nosso corpo ressurreto. Ele preservará certa semelhança com nosso corpo atual, mas terá poderes novos e nunca sonhados (1Co 15.35-44).

Além do mais, de certa forma, o que é verdadeiro a respeito do corpo ressurreto se aplica ao novo céu e à nova terra. Jesus chamou isso de “regeneração” (palin-genesia, Mt 19.28). Pois se o corpo deve ser ressuscitado, o mundo deve ser regenerado. E como deve haver uma mistura de ligação e descontinuidade entre os dois corpos, também o haverá entre os dois mundos. Toda a criação será liberta da escravidão da decadência (Rm 8.18-25). Essas expectativas são parte da vida eterna que a morte nos trará. E isso é proclamado em muitos cemitérios e lápides: Mors janua vitae — a morte é o portão para a vida.

Ao refletir sobre a morte e buscar me preparar para ela, tenho retornado constantemente ao que pode-se chamar filosofia de Paulo sobre vida e morte:

Porquanto, para mim, o viver é Cristo, e o morrer é lucro.

Entretanto, se o viver na carne traz fruto para o meu trabalho, já não sei o que hei de escolher. Ora, de um e outro lado, estou constrangido, tendo o desejo de partir e estar com Cristo, o que é incomparavelmente melhor.

Filipenses 1.21-23 Numa só palavra, vida, para Paulo, significava Cristo. Era impossível imaginar a vida sem ele. Assim, era realmente lógico que ele quisesse morrer, porque a morte traria lucro, ou seja, mais de Cristo. No entanto, ele sabia que permaneceria um pouco mais, pois havia mais trabalho para ele fazer na terra.

Geralmente é perigoso levantar argumentos a partir de uma analogia. Porém, Paulo parece nos dar permissão para fazer isso. O princípio é claro. Se para nós a vida significa Cristo, então a morte trará ganho. De fato, a vida futura será muito melhor do que a vida na terra.

Assim:

- Se adorar com o povo de Deus na terra já é profundamente satisfatório (o que é verdade), então a adoração com todos no céu será ainda mais emocionante.

- Se nosso coração já queima sempre que as Escrituras são reveladas a nós, a revelação de toda a verdade será ainda mais comovente.

- Se a glória de um pôr-do-sol já nos impressiona, como será quando estivermos diante da beleza do novo céu e nova terra?

- Se a comunhão transcultural já nos toca, ficaremos jubilosos quando finalmente nos juntarmos às multidões de todas as nações, tribos e línguas.

- Se algumas vezes já experimentamos o que é “nos alegrar com um gozo indizível, e cheio de glória”, podemos ter a certeza de que isso acontecerá com mais frequência no lugar onde não haverá tristeza nem lágrimas.

Esses são apenas exemplos da experiência humana. Em cada caso é adequado usar um comparativo, ou seja, “muito melhor”. Na verdade, quando refletimos sobre a vida futura, o comparativo é realmente inadequado; o mais apropriado é usarmos o superlativo. É por isso que, sempre que refletimos sobre o futuro que nos aguarda, podemos dizer: “O melhor ainda está por vir”.

Recapitulando, neste capítulo observamos seis áreas em que encontramos princípios paradoxais da vida por meio da morte: salvação, discipulado, missão, perseguição, martírio e mortalidade. Em cada caso devemos considerar essas duas características: a morte e a vida.

Por um lado, não devemos subestimar a glória da vida que nos é oferecida no evangelho — a vida eterna que é nossa pela fé em Cristo, a vida abundante que é nossa se sentenciarmos à morte os desejos da nossa natureza caída, o vigor interior com o qual contamos em meio à fraqueza física e à mortalidade, os frutos prometidos aos que são fiéis em sua missão, o conforto que nos é oferecido em meio à perseguição ou ameaça de martírio e — principalmente — a ressurreição final na nova criação. De todas essas maneiras, Deus tem prometido que aqueles que morrem, viverão.

Por outro lado, não devemos atenuar o custo da morte que leva à vida — a morte do pecado por meio da identificação com Cristo, a morte de si mesmo ao seguirmos a Cristo, a morte da ambição na missão transcultural, a morte da segurança ao enfrentar perseguição ou martírio e a morte para este mundo ao nos prepararmos para o nosso destino final.

A morte é contrária às leis da natureza e é desagradável. De certa forma, ela nos apresenta uma finitude terrível. Morte é o fim. Mesmo assim, em todas as situações, a morte é o caminho para a vida. Assim, se queremos viver, devemos morrer. E estaremos dispostos a morrer somente quando virmos as glórias da vida à qual a morte leva. Essa é a perspectiva cristã radical e paradoxal. Pessoas verdadeiramente cristãs são descritas com exatidão como “aqueles que estão vivos de entre os mortos”.

1. MACE, Alice E., ed. The birds around us. Ortho Books, 1986. Do capítulo introdutório escrito por Roger Tory Peterson, intitulado “The joy of birds”. p. 19-20.↩ 2. ZINSSER, William. A field guide to Roger Tory Peterson. Audubon, v. 94, n. 6, p. 93.↩ 3. Publicado pela primeira vez em inglês em 1948 (SCM, 1966).

[Discipulado. São Paulo: Mundo Cristão, 2016.]↩ 4. LLOYD-JONES, D. M. Romans 6; the new man. Banner of Truth, 1992.

Comentário sobre o versículo 19, p. 264.↩ 5. WEBSTER, Douglas. Yes to Mission. SCM, 1966. p. 101-102.↩ 6. O Operation World estima que existam 69,2 milhões de membros de igrejas cristãs na China, mas acrescenta que não há estatísticas mais exatas disponíveis. Veja JOHNSTONE, Patrick, MANDRYK, Jason.

Operation world. Paternoster, 2001. p. 160.↩ 7. LAMBERT, Tony. The resurrection of the chinese church. Hodder, 1991.

p. 174, 267.↩ 8. MARSHALL, Paul, GILBERT, Lela. Their blood cries out. W. Publishing Group, Thomas Nelson, 1997. p. 8.↩ 9. BONHOEFFER, Dietrich. Do prefácio de Resistência e submissão; cartas e anotações escritas na prisão. Sinodal, 2003.↩ 10. De um artigo em Esquire, 1977. E em MCCANN, Graham.

Woody Allen, new yorker. Polity Press, 1990. p. 43 e 83.↩ 11. DWORKIN, Ronald. Life’s dominion. HarperCollins, 1993. p. 199.↩ CONCLUSÃO Consideramos oito características daqueles que desejam seguir a Jesus e que juntas descrevem o discípulo radical.

Fui seletivo e minha escolha foi, de certa forma, arbitrária. Apesar disso, existem aspectos do discipulado que eu gostaria de ver em todo discípulo de Jesus e, principalmente, em mim mesmo.

Você, sem dúvida, desejará compilar sua própria lista. Espero que ela seja claramente bíblica, e ainda assim reflita a sua própria cultura e experiência. E que você obtenha êxito ao fazê-la.

Não há melhor forma de concluir do que ouvindo e guardando as palavras de Jesus no Cenáculo:

Vós me chamais o Mestre e o Senhor e dizeis bem; porque eu o sou.

João 13.13 O fundamental em todo discipulado é a decisão de não somente tratar Jesus com títulos honrosos, mas seguir seu ensino e obedecer aos seus mandamentos.

PÓS-ESCRITO: ADEUS!

Ao baixar minha caneta pela última vez (literalmente, pois confesso não usar computador), aos 88 anos, aventuro-me a enviar essa mensagem de despedida aos meus leitores. Sou grato pelo encorajamento, pois muitos de vocês me escreveram.

É claro que, ao olhar para frente, nenhum de nós sabe qual será o futuro das impressões e publicações. Porém, estou confiante de que o futuro dos livros está assegurado e de que, apesar de serem complementados, eles nunca serão totalmente substituídos. Pois há algo singular a respeito deles. Nossos livros favoritos se tornam preciosos para nós e até desenvolvemos com eles um relacionamento quase intenso e afetuoso. Não é estranho o fato de manusearmos, riscarmos e até cheirarmos os livros como símbolo de nossa estima e afeição? Não me refiro apenas ao sentimento de um autor pelo que escreveu, mas também a todos os leitores e suas bibliotecas. Determinei que não citaria um livro a menos que o tenha manuseado anteriormente. Assim, deixe-me encorajá-lo a continuar lendo e a incentivar seus parentes e amigos a fazer o mesmo. Pois esse é um meio de graça muito negligenciado.

Existem milhões de irmãs e irmãos em Cristo ao redor do mundo que amariam ter livros para ler a fim de ajudá-los a crescer em seu discipulado. Ainda assim, eles quase não os têm; enquanto nós, no Ocidente, temos mais do que podemos ler. Essa é a razão pela qual cedi os direitos autorais de todos os livros de minha autoria ao trabalho da Langham Literature: para permitir que mais cristãos e seus pastores nas partes mais pobres do mundo obtenham bons livros cristãos tanto em inglês quanto em suas próprias línguas e assim se fortaleçam em sua fé e pregação. Quem sabe eu o encoraje a considerar esse e outros ministérios da Langham Partnership, os quais são preciosos para mim e dignos de seu interesse e suporte.

Os leitores talvez queiram saber que indiquei em meu testamento um grupo de agentes literários liderados por Frank Entwistle, que está atenciosamente disposto a lidar com quaisquer questões que possam surgir em relação aos meus livros. Um exemplar de cada livro, juntamente com um exemplar de contribuições a outros livros e todos os meus artigos, serão mantidos sob os cuidados da Biblioteca Lambeth Palace, com o generoso consentimento de Richard Palmer, bibliotecário e arquivista, que cordialmente se ofereceu para deixá-los disponíveis a pesquisadores. O endereço do meu escritório continuará a ser 12 Weymouth Street, Londres W1 W 5BY e será supervisionado por Frances Whitehead, a inimitável e incansável.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Se a estrada para a vida verdadeira passa pela morte de si mesmo, e seguir Jesus é tomar a cruz cada dia, o que em você (que ambição, conforto, vontade própria ou pecado mimado) Cristo está pedindo que você sentencie à morte hoje para que possa de fato viver?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Stott mostra que a semente só frutifica se morrer e que toda missão autêntica tem formato de cruz; a que "morte" concreta (de comodidade, de reconhecimento, de segurança) você tem fugido, e como ela poderia se tornar caminho de fruto na vida de outros?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se, como para Paulo, "o viver é Cristo e o morrer é lucro", o quanto a sua esperança no melhor que ainda está por vir tem libertado você do medo da morte e moldado a maneira como você vive agora, e o que mudaria se você cresse, de verdade, que a morte é o portão para a vida?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Pós-escrito — Mais uma vez, adeus!$t$, 9,
$conteudo$CARO LEITOR:

Acesse www.ultimato.com.br e faça seu comentário sobre este livro. Conheça também outros títulos da editora e a revista Ultimato.

O DISCÍPULO RADICAL

Categoria: Vida cristã Espiritualidade Liderança Copyright © J. R. W. Stott 2010 Publicado originalmente por Inter-Varsity Press, Nottingham, Reino Unido Primeira edição: Março de 2011 Coordenação editorial: Bernadete Ribeiro Tradução: Meire Portes Santos Revisão: Paula Mazzini Mendes Diagramação: Editora Ultimato Capa: Ana Cláudia Nunes Produção do arquivo ePub: Booknando Ficha catalográfica preparada pela Seção de Catalogação e Classificação da Biblioteca Central da UFV$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values

    (v_aula_id, 1, $p$Stott convida cada leitor a compilar sua própria lista de marcas do discipulado, claramente bíblica e ao mesmo tempo enraizada na sua cultura e experiência; depois de percorrer estas oito características, quais delas Deus mais destacou para a sua vida, e que lista você escreveria diante dele hoje?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Ele diz que o fundamental em todo discipulado é não apenas dar a Jesus títulos honrosos, mas obedecer aos seus mandamentos; em que ponto da sua vida você tem chamado Jesus de Mestre e Senhor sem fazer o que ele manda, e o que significaria render essa área a ele?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Comovido com o desejo de Stott de que cristãos mais pobres tenham acesso a bons livros e à graça da leitura que faz crescer, como você poderia transformar o que recebeu de Deus (tempo, recursos, conhecimento, fé) em algo que ajude outros a amadurecer no discipulado?$p$, 'reflexao', null);
  end if;

end $migration$;
