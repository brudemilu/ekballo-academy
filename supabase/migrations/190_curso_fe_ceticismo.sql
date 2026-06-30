-- Curso: A Fé na Era do Ceticismo (Timothy Keller) — slug fe-ceticismo. Transcrição integral (PyMuPDF/OCR).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'fe-ceticismo';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('fe-ceticismo','A Fé na Era do Ceticismo','Estudo a partir de A Fé na Era do Ceticismo, de Timothy Keller. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/fe-ceticismo', false, 0, 'ensino', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Introdução$t$, 1,
$conteudo$Acho sua falta de fé — preocupante.

Os dois inimigos têm razão

| Di hoje um grande abismo entre o que convencionamos chamar liberalismo e conservadorismo. Cada corrente exige não apenas que você discorde da outra, mas também que a renegue por ser (na melhor das hipóteses) louca ou (na pior das hipóteses) nociva. Isso é especialmente válido quando religião é o tema em discussão. Os progressistas alardeiam que o fundamentalismo cresce rapidamente e que a incredulidade é estigmatizada. Afirmam que a política deu uma guinada para a direita, apoiada pelas megaigrejas, e mobilizou os crentes ortodoxos. Os conservadores denunciam incansavelmente o que veem, ou seja, uma sociedade cada vez mais cética e relativista. As principais universidades, veículos da mídia e instituições de elite estão altamente secularizadas, dizem eles, e controlam a cultura.

Quem tem razão? Fé e ceticismo encontram-se em ascensão no mundo de hoje? A resposta é sim. Ambos os inimigos têm razão. O ceticismo, o medo e o ódio em relação à religião tradicional adquirem cada vez mais poder e influência, No entanto, ao mesmo tempo, a fé robusta e ortodoxa nas religiões tradicionais também tem aumentado.

As populações americana e europeia que não frequentam igrejas vêm crescendo de forma bastante regular.! Disparou o número de americanos que

!Veja relatório “One in three adults is unchurched” [Um em cada três adultos não frequenta a igreja] (March 28, 2005), do George Barna Group. Na Europa, o número de não praticantes caiu de forma mais acentuada ainda, ficando, no caso da Grã-Bretanha, no meio-termo. Veja Grace Davie, “Europe: the exception that proves the rule?” in: Peter L. Berger, 0rg.; The desecularization of the world: resurgent religion and world politics (Eerdmans, 1999), e Peter Brierly, The tide is running out (Christian Research, 2000).

responde “nenhuma preferência religiosa” nos questoníttos emio esse núme ro dobrado ou triplicado na última década? Um século atras, à pafodiá as universidades americanas trocou uma orientação formalmente cristã por ousa, ostensivamente secular.? Em consequência, OS indivíduos com cr enças religiosas tradicionais detêm pouca influência em qualquer lp rem enslhem ee poderosas. Ainda assim, enquanto cada ai mais gente a a não ter nenhuma preferência religiosa”, algumas igrejas que pega ! oras eupostamente obsoletas como crer em uma Bíblia infalível e em milagres vêm crescendo nos Estados Unidos e explodindo na África, na América LAR e na Ásia. Mesmo em boa parte da Europa verifica-se certo aumento A rbtmero dos gu frequentam alguma igreja* e, a despeito da secularidade vigente na Eraintia das universidades, a fé religiosa cresce em alguns nichos acadêmicos. Estima-se que entre 10% e 25% de todos os professores de filosofia nos Estados Unidos sejam cristãos ortodoxos, ao passo que essa porcentagem ficava abaixo de 1% apenas trinta anos atrás. O famoso acadêmico Stanley Fish talvez tenha se baseado nessa tendência ao dizer: “Quando Jacques Derrida morreu [em novembro de 2004], fui entrevistado por um repórter desejoso de saber o que substituiria a alta teoria e o triunvirato raça-gênero-classe como centro da energia intelectual no meio acadêmico. Respondi de pronto: a religião”.

2Ross Douthat, “Crises of faith”, The Atlantic Monthly (July/ August 2007).

3George Marsden, The soul of the American university: from Protestant establishment to established non-belief (Oxford, 1999).

“Fonte: Peter Berger no Pew Forum Faith Angle Conference, “Religion in a globalizing world”, December 4, 2006, Key West, Florida. Transcrição disponível em: http:// pewforum. org/events/index.php?EventID=136. Veja ainda Douthat, “Crises of faith”, The Atlantic Monthly (July/August, 2007). Douthat utiliza os mesmos dados observados por Berger, demonstrando que, ao contrário da impressão dominante, a Europa vem aos poucos se tornando mais religiosa, enquanto os Estados Unidos se mostram cada vez mais divididos entre a religião e a secularidade. Ambas as tendências, diz ele, significam um conflito cultural e político, bem como um extremismo de ambos os lados.

Douglas Groothuis, “Defending the faith”, Books and Culture (July, August, 2003): 12. Veja Quentin Smith “The metaphilosophy of naturalism”, Philo, vol. 4, n. 2, disponível em: www.philo- Pd di Hoje, a Society of Christian Philosophers [Sociedade dos Filónos Criados nada em 1978) abriga mais de 10% de todos os professores e mestres de filosofia

re eja ie ea em K. Clark, Philosophers who believe (Oxford). ne university under God?”, The Chronicle of Higher Education: Careers, January 7, 2005. | Scanned by CamScanner

Resumindo, o mundo está polarizado no que diz respeito à religião, tornando-se, ao mesmo tempo, mais e menos religioso. No passado já se acreditou piamente que os países europeus secularizados atuassem como precursores para o restante do mundo. À religião, supunha-se, veria suas formas mais robustas e sobrenaturalistas declinarem ou desaparecem por completo. No entanto, a teoria de que o avanço tecnológico acarreta inevitavelmente a secularização está agora sendo questionada ou radicalmente revista.” Até mesmo a Europa talvez não venha a encarar um futuro secular, em face do modesto crescimento do cristianismo e do 4oom do islamismo.

Falo a partir de uma perspectiva especialmente privilegiada a respeito desse fenômeno bilateral. Fui criado na fé luterana, dominante no leste da Pensilvânia. Quando entrei na adolescência, chegou a hora do curso preparatório para a confirmação, que durava dois anos e abordava as crenças, as práticas e a história do cristianismo. O objetivo era dotar os jovens de uma compreensão plena da fé para que pudessem se comprometer com ela publicamente. Meu professor no primeiro ano foi um pastor aposentado. Bastante tradicional e conservador, ele vivia falando do perigo do inferno e da necessidade de termos muita fé. No segundo ano, porém, o orientador foi um jovem pastor, recém saído do seminário. Ativista social, ele nutria profundas dúvidas a respeito das doutrinas tradicionais do cristianismo. A sensação foi quase de aprender duas religiões distintas. No primeiro ano, tínhamos visto um Deus santo e justo, cuja ira poderia ser evitada só com muito custo e grande esforço. No segundo ano, ouvimos falar de um espírito de amor no Universo, que basicamente exigia que batalhássemos pelos direitos humanos e pela libertação dos oprimidos. A principal pergunta que eu tinha vontade de fazer aos orientadores era: “Qual de vocês dois está mentindo?”, mas meninos de catorze anos não são tão destemidos, e por isso fiquei calado. Tempos depois, minha família acabou indo parar em uma igreja mais conservadora de uma pequena denominação metodista. Durante vários anos isso “Para uma boa visão geral, leia a transcrição integral (em inglês) do Pew Forum, dirigido por Peter Berger e mencionado na nota 4.

fortaleceu o que eu chamaria de “Fase do Fogo do Infemofde retina formação religiosa, embora o pastor e Os fiéis fossem as pessoas Ee gentis do mundo. Em seguida entrei em uma boa universidade, uma dessas instituições menores e liberais no nordeste dos Estados Unidos, que logo começou a jogar água no fogo do inferno de minha imaginação. Ná |

Os departamentos de História e Filosofia eram socialmente radicais e muito influenciados pela teoria crítica neomarxista da Escola de Frankfurt. Em 1968, isso era coisa séria. O ativismo social exercia uma atração especial, e a crítica à sociedade burguesa americana era sedutora, mas seus pilares filosóficos me confundiam. Eu tinha a impressão de estar diante de dois campos distintos, e havia algo fundamentalmente errado em ambos. Os indivíduos mais entusiasmados com a justiça social eram relativistas morais, e os moralmente rígidos aparentemente não davam a mínima para a opressão reinante no mundo todo. Emocionalmente, o primeiro caminho me atraía — qual jovem não sentiria atração por ele? Libertar os oprimidos e dormir com quem ) bem entendesse! Mas uma pergunta não me saía da cabeça: “Se a moralidade sexual é relativa, por que a justiça social também não é?”. Parecia haver uma incoerência evidente em meus professores e seus seguidores. Agora, porém, eu conseguia enxergar a clara contradição nas igrejas tradicionais. Como eu poderia voltar para um cristianismo ortodoxo que apoiava a segregação racial no sul dos Estados Unidos e o apartheid na África do Sul? O cristianismo começava a soar muito irreal para mim, embora eu fosse incapaz de vislumbrar um estilo de vida e uma linha de pensamento alternativos que me parecessem viáveis.

Na época eu não sabia, mas essa “irrealidade” espiritual advinha de três barreiras existentes em meu caminho. Durante os anos de faculdade, essas três barreiras ruíram e minha fé tornou-se vital e transformadora. À primeira barreira era intelectual. Uma série de perguntas difíceis a respeito do cristianismo me perseguia: “E as outras religiões? Como ficam o mal e o sofrimento? Como um Deus de amor pode julgar e punir? Por que acreditar em alguma coisa?”. Comecei a ler livros e argumentos das duas correntes que abordavam essas questões; então, aos poucos, mas com clareza, o cristianismo foi ganhando cada vez mais sentido. O restante deste livro explica por que ainda nenso aceim

A segunda barreira era inter; e

pode se apoiar na autoridade de terços = a E, ontem pari surge também a necessidade de uma e : and Pci guto idade adulta “fizesse minhas orações” há anos e gi oo o P Ai sie o

.. o Vezes vivenciasse aquela sensação inspiradora, estética, de admiração diante da bela visão do m d anh jamais experimentei pessoalmente a presença d a pi

. . ça de Deus. Isso demandava não tanto

e Eeçinnesnão im isca de oração, mas um processo pelo qual admitisse minhas próprias necessidades, falhas e dificuldades. Esse processo foi doloroso e, como costuma acontecer, foi desencadeado por decepções e fracassos. Seria necessário escrever outro livro, diferente deste, para abordar essa questão. No entanto, é preciso que se diga que as jornadas de fé não são meros exercícios intelectuais. A terceira barreira era social. Eu precisava desesperadamente encontrar um “terceiro lado”, um grupo de cristãos que se preocupasse com a justiça no mundo, mas que a fundamentasse na natureza de Deus em lugar de baseá-la em sentimentos subjetivos. Quando encontrei esse “grupo de irmãos” — e de irmãs (igualmente importantes!) —, as coisas começaram a mudar para mim. Essas três barreiras não ruíram rapidamente nem em uma ordem predeterminada. O fato é que elas estavam interligadas e dependiam uma da outra. Não as trabalhei de forma metódica. Somente fazendo uma retrospectiva sou capaz de ver como os três aspectos atuavam juntos. Como estava sempre à procura desse terceiro lado, passei a me interessar pela formação e orientação de novas comunidades cristãs, o que me levou ao ministério pastoral, que abracei poucos anos depois de terminar a faculdade.

O enfoque a partir de Manhattan

No final da década de 1980, minha esposa, Kathy, e eu nos mudamos para Manhatttan com nossos três filhos para iniciar uma igreja voltada a uma população que, em grande parte, não frequentava igrejas. Dtewnte a fase de pesquisas, ouvi de quase todo mundo que empreender tal missão era uma tolice. Igreja significava conservadorismo total ou moderado, € Nora York era liberal e inovadora. Igreja significava família, € Nova York está cheia de gente solteira e de lares “não tradicionais”. Igreja significava, RSA de tudo, Eds mas Manhattan é a terra dos céticos, dos críticos e dos cínicos. A classe média, Scanned by CamScanner

mercado convencional para uma igreja, estava fugindo da cidade em razão da criminalidade e do aumento do custo de vida, deixando ali os sofisticados, gente interessada nas últimas tendências, 08 ia e e pobres. À ni parte desse público ria diante da ideia de uma igreja — du o que me Essa As congregações na cidade estavam encolhendo, a maioria lutando até para manter os prédios que ocupavam.

Muitos de meus primeiros contatos afirmaram que as poucas congregações capazes de conservar seus fiéis haviam conseguido isso pi os ensinamentos cristãos tradicionais ao espírito mais pluralista local. “Não lhes diga que precisam crer em Jesus — aqui isso é visto como mentalidade estreita.” A incredulidade era geral quando eu explicava que as doutrinas da nova igreja eram os pilares ortodoxos e históricos do cristianismo — a infalibilidade da

Bíblia, a divindade de Cristo, a necessidade de regeneração espiritual (o no-

| vo nascimento) — doutrinas consideradas decididamente ultrapassadas pela

/ maioria dos nova-iorquinos. Ninguém jamais disse “esqueça isso” com todas as letras, mas o conselho pairava no ar.

Assim mesmo iniciamos a igreja Redeemer Presbyterian Church, e no fim de 2007 já tínhamos mais de cinco mil frequentadores, além de termos criado mais de uma dezena de congregações na região metropolitana imediata. Nossa igreja é bem multiétnica e jovem (idade média de trinta anos) e mais de dois terços dos membros são solteiros. Enquanto isso, dezenas de congregações igualmente ortodoxas em suas crenças nasceram em Manhattan e centenas de outras surgiram nos outros quatro distritos de Nova York. Uma pesquisa mostrou que nos últimos anos mais de cem igrejas foram fundadas na cidade de Nova York só por cristãos da África. Ficamos surpresos diante desses números, assim como qualquer um ficaria.

Nova York não é um caso isolado. Em 2006, a revista The Economist publicou uma matéria com o subtítulo “O cristianismo está ruindo em toda parte, menos em Londres”. O ponto crucial da matéria era que a frequência à igreja € à profissão da fé cristã estavam despencando na Grã-Bretanha e no resto da Europa, mas vários profissionais jovens (e imigrantes recentes) em Londres acorriam às igrejas evangélicas.? É exatamente isso que tenho visto em Nova York.

| “A New Jerusalem”, The Economist , September 21, 2006. Scanned by CamScanner

Isso leva a uma estranha conclusão. Chegamos a um momento cultural em que tanto os céticos quanto os crentes sentem que sua existência se encontra ameaçada, porque tanto o ceticismo secular quanto a fé religiosa estão passando por um crescimento importante e poderoso. Hoje não vemos nem o cristianismo ocidental do passado nem a sociedade secular sem religião que havia sido prevista para o futuro. Vemos algo totalmente diverso.

Três gerações atrás, para a maioria dos indivíduos, a fé religiosa era uma questão de herança, não de escolha. A grande maioria pertencia a uma das igrejas protestantes clássicas, históricas, ou à igreja católica romana. Hoje, porém, as igrejas protestantes rotuladas como “da velha escola”, aquelas de uma fé culturalmente herdada, estão envelhecendo e rapidamente perdendo fiéis. As pessoas vêm optando por uma vida não religiosa, por uma espiritualidade não institucional, construída individualmente ou por grupos religiosos ortodoxos que exigem compromisso e esperam que seus membros passem por uma experiência de conversão. Assim, paradoxalmente, a população vai ficando ao mesmo tempo mais religiosa e menos religiosa.

Como tanto a dúvida quanto a fé estão em alta, o nosso discurso político e público sobre questões de fé e moral transformou-se em um impasse e ficou profundamente dividido. As guerras culturais estão cobrando seu preço. As emoções e a retórica são intensas, até mesmo histéricas. Os que creem em Deus e no cristianismo pretendem “impor suas crenças sobre o restante de nós” e atrasar o relógio para uma época menos esclarecida. Os que não creem são “inimigos da verdade” e “agentes do relativismo e da permissividade”. Não argumentamos com o outro lado usando a lógica, apenas acusamos.

Existe um impasse entre as forças conflitantes da dúvida e da fé, e ele não será solucionado com um mero apelo por mais civilidade e diálogo. As discussões dependem da existência de pontos de referência em comum aos

quais ambos os lados possam se apegar. Quando as maneiras de encarar à realidade entram em conflito, é difícil descobrir alguma coisa a que apelar, Scanned by CamScanner

O título do livro de Alasdair MacIntyre, Whose justice? Which rationality?, já diz tudo. Nossos problemas não desaparecerão tão cedo. Como encontrar um caminho?

Primeiramente, cada lado deveria admitir que tanto a fé religiosa quanto o ceticismo estão em alta. O autor ateu Sam Harris e o líder religioso de direita Pat Robertson deveriam ambos admitir que o grupo de adeptos de cada | um é forte e vem ganhando influência. Isso eliminaria a conversa interna que | grassa nos dois lados, ou seja, de que a extinção do outro se avizinha, provocada pela oposição. Nada do gênero é possível no curto prazo. Se pararmos | de dizer a nós mesmos esse tipo de coisa, talvez seja possível fazer com que | todos sejam mais civilizados e generosos com as opiniões contrárias. | Tal admissão não é só tranquilizadora, mas também infunde humildade. Ainda existe muita gente com uma visão secular do mundo que afirma que a fé ortodoxa vem tentando em vão “lutar contra a maré da História”, embora não haja nenhuma comprovação histórica de que a religião esteja morrendo. Os que têm fé religiosa também deveriam se mostrar menos indiferentes ao ceticismo secular. Os cristãos precisam refletir sobre o fato de que grandes setores da sociedade, antes de maioria cristã, viraram as costas à fé. Decerto isso levaria à autocrítica. O momento de se mostrar elegantemente alheio ao outro lado ficou no passado. Agora se exige algo mais. Mas, o quê? Um segundo exame da dúvida

Quero propor uma coisa que já vi dar muitos frutos na vida de jovens nova- -iorquinos ao longo dos anos. Recomendo que cada lado examine a dúvida de uma maneira radicalmente nova.

Comecemos com os crentes. Uma fé sem algumas dúvidas é como um corpo humano sem anticorpos. Indivíduos que levam a vida contentes, ocupados ou indiferentes demais para fazer perguntas incômodas a respeito do porquê de crerem acabarão se descobrindo impotentes tanto diante da experiência de uma tragédia quanto das perguntas insistentes de um cético inteligente. im = É rata Justiça de quem? Qual racionalidade?, tradução de Marcelo Pimenta

A fé nutrida por alguém pode desmoronar praticamente da noite para O dia, caso, 20 longo da vida, essa pessoa tenha deixado de ouvir com paciência as próprias dúvidas, que devem ser descartadas só depois de muita reflexão. Os crentes devem admitir suas dúvidas — e também as dos amigos e vizinhos — e lutar com elas. Já não basta apegar-se àquilo em que você crê simplesmente porque você o recebeu como herança. Somente se lutar profunda e longamente com os argumentos contrários às suas convicções você será capaz de fornecer os fundamentos de sua fé aos céticos — e a você mesmo —, que sejam plausíveis e não ridículos ou ofensivos. Igualmente importante para nossa situação atual é que tal processo o levará, mesmo depois de chegar ao nível de uma fé robusta, a respeitar e entender os que têm dúvidas. No entanto, assim como os crentes devem aprender a buscar os motivos de sua fé, os céticos precisam aprender a buscar um tipo de fé oculto em seu raciocínio. Todas as dúvidas, por mais céticas e cínicas que pareçam, são, na verdade, um conjunto de crenças alternativas.!? Não é possível duvidar da crença A, a não ser a partir de uma postura de fé na crença B. Por exemplo, se você não acredita no cristianismo argumentando que “$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se uma fé sem dúvidas é como um corpo sem anticorpos, quais perguntas incômodas sobre o que você crê você tem evitado fazer, e o que aconteceria se as enfrentasse com honestidade?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Keller afirma que toda dúvida esconde uma crença alternativa que também exige um salto de fé: quais convicções suas você nunca submeteu ao mesmo nível de prova que cobra do cristianismo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Das três barreiras de Keller (intelectual, interior e social), qual mais pesa hoje no seu caminho até a fé, e o que estaria por trás dela?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Não pode haver somente uma religião verdadeira$t$, 2,
$conteudo$somente uma religião verdadeira”, é preciso admitir que tal afirmação já representa um ato de fé. Ninguém pode comprová-la empiricamente nem se trata de uma verdade universal aceita por todos. No Oriente Médio, se você disser: “Não pode haver somente uma religião verdadeira”, quase todos responderão: “Por que não?”. Você duvida da crença À do cristianismo porque “abraça a crença B, impossível de ser comprovada. Por isso, toda dúvida se ' baseia em um salto de fé.

= Alguns dizem: “Não acredito no cristianismo porque não aceito a existência de uma moral absoluta. Cada um deveria estabelecer a verdade moral para si”. Você é capaz de comprovar tal afirmação para quem dela não compartilha? Não, trata-se de um salto de fé, uma crença profunda na noção de que os direitos individuais valem não apenas na esfera política, mas também na moral. WCostuma haver consenso sobre o que é “fato”: a) algo evidente para praticamente todos (por exemplo: “Há uma pedra na estrada”) ou b) algo que, não sendo evidente para os sentidos, possa ser cientificamente provado. Se nos apegarmos à algo impossível de ser comprovado através das duas | formas citadas, trata-se de uma “crença” ou de um ato de fé. a , Scanned by CamScanner

| Não há como provar empiricamente essa crença. Assim, duvidar (da moral | absoluta) é dar um salto.

| Alguns reagirão dizendo: “Minhas dúvidas não decorrem de um salto de | fé. Não acredito em Deus, seja de que forma for. Não tenho necessidade dele e não estou interessado em pensar nisso”. No entanto, subjaz a esse Sentimento uma crença americana bastante moderna segundo a qual a existência de Deus

é um tema que não desperta interesse, salvo se vier ao encontro das necessidades emocionais de alguém. O indivíduo aposta que não existe Deus algum

que o julgue responsável por suas crenças e comportamentos se não sentir necessidade dele. Isso pode ser verdade ou não, mas, repito, trata-se de um grande salto de fé.!!

4 À única maneira de duvidar do cristianismo com propriedade e Justiça é descobrir a crença alternativa implícita em cada uma de suas dúvidas e, em seguida, indagar de si mesmo os motivos que o levam a defendê-la. Como saber se sua crença é válida? Seria incoerente exigir maior comprovação da crença cristã do que da sua, mas é isso que em geral acontece. Para ser justo, você precisa duvidar de suas dúvidas. Minha tese é que, se identificarmos as crenças nas quais se basciam nossas dúvidas quanto ao cristianismo e buscarmos o mesmo tipo de comprovação para essas crenças que cobramos dos cristãos, descobriremos que nossas dúvidas não são tão sólidas quanto aparentavam ser.

Recomendo dois processos a meus leitores. Insisto para que os céticos lutem com a “fé cega” não examinada na qual se baseia o ceticismo e vejam como é difícil comprovar tais crenças para os que dela não compartilham. Também insisto para que os crentes lutem com suas objeções pessoais e culturais à fé. No fim de cada processo, ainda que continue a ser o cético ou o crente de antes, você defenderá seu ponto de vista com maior clareza e mais humildade. Surgirão assim uma compreensão, uma tolerância e um respeito pelo outro lado, inexistentes: até então. Crentes é incrédulos ascenderão ao patamar da discordância em lugar da simples acusação. Isso acontece quando cada lado aprende a descrever o ponto de vista do outro da forma mais firme €

“Para um bom resumo do porquê de todos sermos “crentes”, veja Christian Smith, “Believing animals”, in: Moral believing animals: human personhood and culture (Oxford: Oxford University Press, 2003).

positiva possível. Só então será seguro e justo discordar. Isso levará à civilidade em uma sociedade pluralista, o que não é pouca coisa.

Uma terceira via espiritual?

O restante deste livro é uma filtragem das muitas conversas que tive ao longo dos anos com indivíduos que têm dúvidas. Tanto em minhas pregações quanto nas interações sociais, tentei respeitosamente ajudar os céticos a examinar os fundamentos das próprias crenças, ao mesmo tempo que oferecia os meus às mais veementes críticas por parte deles. Na primeira parte deste volume revisaremos as sete maiores objeções e dúvidas quanto ao cristianismo que me foram apresentadas ao longo da vida. Identificarei respeitosamente as crenças opostas por trás de cada uma. Na segunda metade do livro, examinaremos os motivos subjacentes às crenças cristãs.

O diálogo respeitoso entre os conservadores tradicionais e os liberais seculares é uma bênção, e espero que este livro venha a promovê-lo. Minha experiência como pastor em Nova York, porém, forneceu-me outro incentivo para escrevê-lo. Assim que cheguei a Nova York, descobri que a situação de fé e dúvida não era aquilo que os especialistas imaginavam. Os americanos mais velhos que dirigiam a vida cultural da cidade eram definitivamente seculares. No entanto, entre os profissionais multiétnicos e os imigrantes da classe trabalhadora, cada vez mais numerosos, havia uma rica variedade de fortes - crenças religiosas que desafiavam a rotulagem, e principalmente o cristianismo crescia rápido nesse meio.

Acredito que esses jovens cristãos representem à vanguarda de alguns dos principais grupamentos religiosos, sociais e políticos capazes de tornar obsoleta a maneira mais antiga de guerra cultural. Depois de lutar com as dúvidas e objeções ao cristianismo, muitos acabam indo parar do outro lado, com uma fé ortodoxa que não se encaixa nas atuais categorias de democratas liberais ou republicanos conservadores. Muitos acham que ambos os lados na “guerra

cultural” priorizam a liberdade individual e a felicidade'pessoal em lugar de Deus e do bem comum. O individualismo dos liberais vem à tona nas posturas quanto a aborto, sexo e casamento. O individualismo dos conservadores vem à tona na profunda desconfiança que nutrem em relação ao setor público e em Scanned by CamScanner

sua avaliação da pobreza como falta de responsabilidade individual. O novo cristianismo ortodoxo, multiétnico, disseminado nas cidades preocupa-se com os pobres e com a justiça social muito mais do que os republicanos jamais se preocuparam e, ao mesmo tempo, está interessado em levantar a bandeira da moral e da ética sexual clássicas do cristianismo muito mais do que os democratas jamais estiveram.

Enquanto a primeira parte do livro apresenta um caminho que muitos desses cristãos escolheram por meio da dúvida, a segunda parte é uma exposição mais positiva da fé que eles vivenciam no dia a dia. A seguir apresento três membros de minha congregação atual.

June formou-se em uma universidade tradicional americana, mora e trabalha em

Manhattan. Tornou-se de tal maneira obcecada pela própria aparência que desenvolveu transtornos alimentares e dependência química. Conscientizou-se de

que caminhava para a autodestruição, mas também se deu conta de que não tinha | nenhum motivo especial para deixar de ser irresponsável. Afinal, que sentido tinha

sua vida? Por que não ser autodestrutiva? Recorreu à igreja e buscou entender a

misericórdia de Deus e vivenciar essa realidade. Uma conselheira da igreja ajudou

June a fazer uma relação entre a misericórdia de Deus e sua necessidade insaciável

de aceitação. Finalmente, ela adquiriu confiança para buscar um encontro com

Deus. Embora não seja capaz de identificar o momento exato, June sentiu-se, pela

primeira vez, “incondicionalmente amada como uma verdadeira filha de Deus” e

pouco a pouco se libertou do comportamento autodestrutivo.

Jeffrey era músico na cidade de Nova York, criado em um lar judeu conservador. Tanto a mãe quanto o pai sofreram horrivelmente com câncer, que acabou por matar a mãe. Por uma série de problemas de saúde na juventude, Jeffrey adotou a prática das artes terapêuticas chinesas, juntamente com a meditação taoísta e budista, tornando-se extremamente focado no bem-estar físico. Não estava em uma situação de “carência espiritual” quando um amigo começou a levá-lo à igreja Redeemer. Ele gostava das pregações “até a hora em que, no final, vinha aquela conversa sobre Jesus”, momento em que parava de escutar. Logo, porém, Jeffrey passou a invejar a alegria e a esperança no futuro que seus amigos cristãos demonstravam, algo que jamais encontrara. Ele então começou a ouvir a parte Scanned by CamScanner

final das pregações e se deu conta de que ali estava um desafio intelectual que ele não se dispunha a encarar. Finalmente, para sua surpresa, descobriu que, durante as meditações, seus “momentos de pura tranquilidade e inação eram constantemente interrompidos por visões de Jesus na cruz”. Jeffrey passou a orar ao Deus cristão e em pouco tempo descobriu que a narrativa dominante em sua vida havia sido a fuga e a absoluta rejeição ao sofrimento. Ele agora conseguia enxergar a futilidade de seu objetivo de vida. Quando entendeu que Jesus havia entregado a própria saúde física e a vida para salvar o mundo — e ele —, Jeffrey ficou profundamente tocado e vislumbrou uma forma de encontrar coragem para enfrentar o sofrimento inevitável do futuro e saber que existiria um meio para superá-lo. Aceitou, então, o evangelho de Jesus Cristo.

Kelly era uma ateia diplomada por uma tradicional universidade americana. Aos doze anos, viu o avô morrer de câncer e a irmã dois anos mais velha passar por uma cirurgia, quimioterapia e radioterapia por causa de um tumor cerebral. Quando entrou na Universidade de Columbia, Kelly já havia perdido a esperança de achar sentido para a vida. Vários colegas cristãos lhe falavam da fé que tinham, mas ela era “um solo pedregoso” para as sementes daqueles testemunhos. No entanto, quando a irmã sofreu um derrame e ficou paralítica aos catorze anos, Kelly sentiuse instigada não a desistir de Deus, mas a iniciar uma busca mais determinada. | Nessa época, morava e trabalhava em Manhattan. Conheceu o futuro marido, Kevin, também formado pela Universidade de Columbia e igualmente ateu, na época trabalhando no J. P. Morgan, em Wall Street. As dúvidas do casal acerca de Deus eram bastante renitentes, mas ambos tinham dúvidas sobre as próprias dúvidas e por isso começaram a frequentar a igreja Redeemer. À peregrinação em busca da fé foi lenta e difícil. Um dos motivos que os fez perseverar, porém, foi o grande número de cristãos que conheceram e que eram tão sofisticados e inteligentes quanto qualquer outro membro do círculo social a que pertenciam. Finalmente, eles não apenas se convenceram da credibilidade intelectual do cristianismo, mas também se sentiram atraídos pela visão de vida nele contida. Kelly escreveu: “Como ateia, eu achava que vivia uma vida moralmente correta, voltada para a coletividade e para à justiça social, mas o cristianismo tem um padrão ainda mais alto — padrão que se aplica a nene pensamentos € ao coração, Aceitei o perdão de Deus e O convidei a entrar em minha vida”, Kevin escreveu:

“Sentado à mesa de uma cafeteria lendo Cristianismo puro e simples, de C. 5.

Lewis, de repente parei de ler e escrevi no meu bloco de notas: “.. as provas que

cercam as afirmações do cristianismo são cabais”. Percebi que minhas conquistas

acabavam sendo insatisfatórias, que a aprovação dos homens é passageira, que

uma vida centrada no carpe diem, dedicada tão somente à aventura, não passa de

uma forma de narcisismo e idolatria. Por isso passei a crer em Cristo”.

Em seu relato, Kelly relembra que, enquanto lutava com a dúvida e com a fé, a passagem sobre Tomé no Novo Testamento lhe trouxe grande conforto. Nela, Jesus exemplifica uma noção de dúvida mais sutil que a dos céticos e dos crentes modernos. Quando confrontou “o incrédulo Tomé”, Jesus o desafiou a não se conformar com a dúvida (“não sejas incrédulo, mas crente!”), porém atendeu a seu pedido de mais provas. Em outro incidente, Jesus encontra um homem que confessa estar cheio de dúvidas (Me 9.24). O homem diz a Jesus: “Ajuda- -me na minha incredulidade” — ajuda-me com as minhas duvidas! Em resposta a essa admissão honesta, Jesus abençoa e cura seu filho. Quer você se considere crente, quer cético, eu o convido a buscar o mesmo tipo de honestidade e a se esforçar para entender a natureza de suas dúvidas. O resultado superará qualquer expectativa que você possa ter.

2Em todas as Páscoas na R ' E

de sua jornada de fé. Esta é uma ser rede ar pe Pad dad

“Como poderia haver somente uma fé verdadeira?”, perguntou Blair, uma jovem | de 24 anos, moradora de Manhattan. “Afirmar a superioridade da sua religião e tentar converter todo mundo é uma postura de arrogância. É claro que todas as religiões são igualmente boas e válidas para satisfazer as necessidades dos respectivos seguidores.”

«A exclusividade religiosa não é apenas ignorância — é um perigo”, acrescentou Geoff, um britânico de vinte e poucos anos também morador de Nova York. “A religião vem causando indizíveis confrontos, divisões e conflitos. Talvez seja a maior inimiga da paz no mundo. Se os cristãos continuarem a dizer que detêm “a verdade! — e se outras religiões fizerem o mesmo — o mundo jamais conhecerá a paz.”

A o LoNGo de minhas quase duas décadas na cidade de Nova York, ' : “ .

tive várias oportunidades de fazer a seguinte pergunta: “Qual é seu maior problema em relação ao cristianismo? O que mais o incomoda . m 24* »

nas crenças cristãs ou na maneira em que elas são postas em prática?”. Uma das respostas mais frequentes que ouço pode ser resumida em uma palavra: exclusividade.

As citações que iniciam os capítulos de 1 a 7 foram extraídas de uma pesquisa por e-mail com - jovens nova-iorquinos de cerca de vinte anos de idade, aos per pediu-se que E suas age DU MESA di tctiani i omes dos remetentes. i

principais dúvidas e objeções 20 cristianismo. Mudei » n gradeço a Nicole Diamond- Austin pela ideia e pela realização aa pesquisa, Scanned by CamScanner

Fui convidado certa vez para ser o representante cristão em um seminário numa universidade local, juntamente com um rabino e um imã (sacerdote muçulmano). Pediu-se aos palestrantes que debatessem as diferenças entre as religiões. O debate foi cortês, inteligente e respeitoso. Cada orador afirmou que havia diferenças significativas e inconciliáveis entre as principais religiões. Uma das questões centrais era a pessoa de Jesus. Todos concordamos quanto à seguinte afirmação: “Se os cristãos estão certos quando dizem que Jesus é Deus, os muçulmanos e os judeus cometem a falta grave de não amar a Deus como ele realmente é. Mas, se os muçulmanos e os judeus estão certos ao dizer que Jesus não é Deus e sim um mestre ou profeta, os cristãos cometem a falta grave de não amar a Deus como ele realmente é”. Trocando em miúdos: não há como todos estarem certos quanto à natureza de Deus.

Essa conclusão incomodou bastante vários alunos. Um deles insistiu

| que o importante era acreditar em Deus e ser uma boa pessoa. Insistir que uma religião detém um maior conhecimento da verdade do que as demais é sinal de intolerância. Outro aluno olhou para nós, clérigos, e disse, frustrado: “Jamais teremos paz na terra se os líderes religiosos continuarem a reivindicar exclusividade!”.

Acredita-se em larga escala que um dos principais empecilhos à paz mundial seja a religião, em especial as grandes religiões tradicionais com suas reivindicações exclusivas de superioridade. Talvez você se espante em saber que - concordo com essa ideia, embora eu seja um pastor cristão. A religião, de maneira geral, costuma criar um terreno escorregadio no coração. Cada religião garante a seus seguidores que eles detêm a “verdade”, o que, naturalmente, leva a uma sensação de superioridade em relação aos adeptos de outras crenças. Da mesma forma, uma religião diz a seus seguidores que estes serão salvos e ie de uma ligação com Deus se aderirem com devoção a tal verdade. da da RS E que rt sa vida ren a ad

dos demais, Uma vez eeiado à Eno religioso ar estereótipos e caricaturas à marginalização de outros individ sou po : daciimente tcabar conduzindo à violência cont uos ou até mesmo à opressão, ao abuso ou

Tendo admitido como a religião é À

ri di jo o de minar a paz na terra, o que po-

| o usadas pelos líderes civis e culturais

NÃO PODE HAVER SOMENTE UMA RELIGIÃO VERDADEIRA 31

do mundo para lidar com o elemento desagregador da religião: torná-la ilegal, condená-la ou, no mínimo, privatizá-la radicalmente.? Muitos nutrem grande esperança de que tais abordagens venham a dar certo. Infelizmente, não acredito na eficácia de nenhuma. Com efeito, temo que apenas agravem a situação. 1. Tornar a religião ilegal

Uma maneira que vem sendo usada para lidar com o elemento desagregador

da religião é controlá-la ou mesmo proibi-la com pulso forte. Houve, no século 20, várias tentativas nesse sentido. A Rússia soviética, a China comunista, o Kmer Vermelho e (de uma forma diversa) a Alemanha nazista se dispuseram a controlar rigidamente a prática religiosa na tentativa de impedir que ela dividisse a sociedade ou minasse o poder do Estado. O resultado, porém, não foi mais paz e harmonia e, sim, mais opressão. A ironia trágica da situação é apresentada por Alister McGrath em sua história do ateísmo: ! O século 20 deu ensejo a um dos maiores e mais incômodos paradoxos da | | história humana: os maiores atos de intolerância e violência desse século foram p " praticados pelos que acreditavam que a religião gerava intolerância e violência? | De mãos dadas com essas tentativas caminhava a crença disseminada no final do século 19 e no início do século 20 de que a religião encolheria e morreria quando a raça humana se tornasse mais avançada tecnologicamente. Essa visão considerava que a religião cumpre um papel na evolução humana. No passado, precisamos da religião para nos ajudar a enfrentar um mundo muito assustador, incompreensível. No entanto, acreditava-se que, à medida que fôssemos ficando mais sofisticados do ponto de vista científico e mais capazes a

ZA onda recente de best-sellers antirreligião de Richard Dawkins, Sam Harris, Daniel Dennett e Christopher Hitchens não recomenda que se proíba a religião, unicamente porque os autores não acreditam que tal estratégia funcione. A maior esperança deles é que a religião seja condenada com veemência, ridicularizada e formalmente particularizada, de modo que acabe se enfraquecendo e ficando marginalizada.

3Alister McGrath, 7he twilight of atheism: the rise and fall of disbelief in the modern world (Oxford, 2004), p. 230; veja ainda p. 187, 235. |

de entender e controlar o ambiente em que vivemos, nossa necessidade de religião diminuiria.

Mas isso não ocorreu, e essa “tese da secularização” perdeu seus adeptos.” Praticamente todas as grandes religiões vêm crescendo. O crescimento do cristianismo, sobretudo no mundo em desenvolvimento, foi explosivo. Hoje existem na Nigéria seis vezes mais anglicanos do que nos Estados Unidos. Existem mais presbiterianos em Gana do que nos Estados Unidos e na Escócia juntos. Na Coreia, a porcentagem de cristãos pulou de 1% para 50% em cem anos, e os especialistas acreditam que o mesmo se dará na China. Se houver meio bilhão de chineses cristãos daqui a cinquenta anos, o curso da história humana será alterado. Na maioria dos casos, o cristianismo que vem crescendo não é o das versões mais secularizadas, de crenças mais flexíveis, previsto pelos sociólogos. Ao contrário, trata-se de uma robusta fé sobrenaturalista, que crê em milagres, na autoridade das Escrituras e na conversão do indivíduo.

Dada a vitalidade da fé religiosa no mundo, as tentativas para suprimi-la ou controlá-la costumam apenas fortalecê-la. Quando expulsaram os missionários ocidentais após a Segunda Guerra Mundial, os comunistas chineses acharam que acabariam com o cristianismo na China. Em vez disso, a manobra conseguiu apenas tornar a liderança da igreja chinesa mais autóctone, fortalecendo-a.

À religião não é algo passageiro que auxiliou nossa adaptação ao meio ambiente, mas um aspecto permanente e central da condição humana. Essa é uma pílula amarga a ser engolida por indivíduos secularizados e não religiosos.

Todos querem achar que fazem parte da corrente predominante, que não são extremistas, mas as crenças religiosas robustas dominam o mundo. Não há motivos para crer que isso mudará.

*Vários pensadores de renome em meados do século 20 acreditavam que, quando seus netos chegassem à sua idade, a maioria das religiões já teria enfraquecido ou desaparecido de todo. Exemplo disso é o que um antropólogo escreveu em 1966: “O futuro evolutivo da religião é a extinção. [...] A crença em poderes sobrenaturais está fadada a desaparecer, no mundo inteiro, em consequência da adequação e da difusão do conhecimento científico”. A. F.C, Wallace, Religion: an anthropological view (Random House, 1966), p. 265.

“Veja alguns relatos de como os sociólogos rejeitaram a tese da secularização em Peter L. Berger, org., The desecularization of the world: resurgent religion and world politics (Eerdmans, 1999).

“Sobre o crescimento do cristianismo no mundo não ocidental, veja Philip Jenkins, 7he next

nm (Oxford, 2002), e Lamin Sanneh, Whose religion is Christianity? (Eerdmans, 2003). Scanned by CamScanner

NÃO PODE HAVER SOMENTE UMA RELIGIÃO VERDADEIRA 33

A religião não desaparecerá, e seu poder não será reduzido por meio do controle do governo, mas será que não poderíamos — por meio da educação e do debate — descobrir caminhos para desestimular socialmente as religiões que reivindicam deter “a verdade” e que tentam fazer convertidos? Será que não poderíamos encontrar formas para convencer todos os cidadãos, quaisquer que sejam suas crenças, a admitir que cada religião ou fé é apenas um dos muitos caminhos igualmente válidos para chegar a Deus e uma das muitas maneiras de viver neste mundo?

Essa abordagem cria um ambiente no qual a reivindicação de exclusividade religiosa, mesmo em conversas, é ofensiva e sinal de ignorância. Isso se deve ao uso reiterado de determinados axiomas que acabam adquirindo o status de senso comum. Os que se desviam de tal conduta são rotulados de tolos ou perigosos. Ao contrário da primeira estratégia, essa abordagem da desagregação causada pela religião vem surtindo efeito. Entretanto, não logrará êxito no final, pois em seu âmago existe uma incoerência fatal, talvez mesmo uma hipocrisia, que acabará levando ao colapso de todo o raciocínio. Veja a seguir uma lista desses axiomas e os problemas inerentes a cada um. “Todas as grandes religiões são igualmente válidas

e ensinam basicamente o mesmo.”

Essa afirmativa é tão comum que um jornalista escreveu recentemente que qualquer um que acredite que “existem religiões inferiores” é um extremista de direita.” Será que queremos realmente dizer que a seita Branch Davidians [Ramo davidiano] ou religiões que exigem sacrifícios de crianças não são inferiores a outras? À grande maioria com certeza diria sim, são inferiores.

Quase todo mundo que defende a semelhança das religiões tem em mente as grandes, e não as seitas dissidentes. Foi assim que um aluno participante do

Toe Klein, “Because I promised and you seemed so darn curious...”, no blog da revista Time,

' disponível em: http://time-blog;com/swampland/2007/03/04/because. i promised. and you. see, acesso em: 7 mar. 2007.

seminário do qual falei formulou seu argumento. Ele defendeu que as ai renças doutrinárias entre o judaísmo, O islamismo, o cristianismo, O budismo | e o hinduísmo são superficiais e insignificantes, que todas creem no mesmo Deus. No entanto, quando lhe perguntei quem era esse Deus, ele o descreveu

“como um Espírito que é inteiramente amor no Universo. O problema im tal

| postura é a incoerência. Ao mesmo tempo em que ela afirma que doutrinas são

+ irrelevantes, pressupõe crenças doutrinárias sobre a natureza de Deus que vão | totalmente contra o que creem todas as grandes religiões. O budismo não crê absolutamente em Deus. O judaísmo, o cristianismo e O islamismo acreditam em um Deus que responsabiliza os seres humanos por suas crenças e práticas e cujos atributos não podem se resumir todos a amor. Ironicamente, a insistência quanto à irrelevância das doutrinas já é, em si, uma doutrina. Ela tem uma visão específica de Deus, apregoada como superior e mais esclarecida do que as crenças da maioria das grandes religiões. Assim, os defensores dessa visão fazem exatamente aquilo que proíbem os outros de fazer.

“Cada religião enxerga uma parte da verdade espiritual,

mas nenhuma delas é capaz de enxergar a verdade integral.” Às vezes esse argumento é ilustrado com a história dos cegos e do elefante. Vários cegos seguiam seu caminho quando encontraram um elefante que os deixou tocá-lo e senti-lo. “Essa criatura é comprida e flexível como uma cobra”, disse o primeiro cego, segurando a tromba do animal. “De jeito nenhum — ela é grossa e redonda como um tronco de árvore”, disse o segundo cego, apalpando a perna do elefante. “Não, ela é grande e chata”, disse o terceiro cego, tocando a barriga do bicho. Cada cego conseguia sentir apenas uma parte do elefante — nenhum deles era capaz de ver o elefante todo. Da mesma maneira, argumenta-se, cada uma das religiões do mundo têm o conhecimento de uma parte da verdade acerca da realidade espiritual, mas nenhuma delas é capaz de ver o elefante todo nem alegar uma visão abrangente da verdade.

Essa ilustração prejudica em vez de ajudar quem a utiliza. A história é contada do ponto de vista de alguém que não é cego. Como saber que cada cego vê apenas parte do elefante, a menos que você afirme ser capaz de ver O elefante todo?

NÃO PODE HAVER SOMENTE UMA RELIGIÃO VERDADEIRA 35

Há uma aparência de humildade na afirmação de que a verdade é muito maior do que a capacidade que qualquer um de nós tem de apreendê-la, mas quando usada para invalidar todas as alegações de conhecimento da verdade, ela é, com efeito, uma afirmação arrogante de um conhecimento superior a [todos os outros ...). Precisamos indagar: “Qual é a perspectiva [absoluta] a partir da qual você alega ser capaz de relativizar todas as afirmações absolutas feitas por essas diferentes escrituras?”.º

Como saber que nenhuma religião consegue enxergar a verdade integral, a menos que você mesmo tenha o conhecimento superior, abrangente, da realidade espiritual que afirma faltar a todas as religiões? “Cultural e historicamente, a crença religiosa está

condicionada demais a ser a “verdade.”

Quando cheguei à cidade de Nova York, há quase vinte anos, o que eu mais ouvia era o argumento de que todas as religiões são igualmente verdadeiras. Agora, porém, ouço mais que todas as religiões são igualmente falsas. O argumento é o seguinte: “Todas as afirmações morais e espirituais são produto de nosso momento histórico e cultural específico e, por isso, ninguém deve afirmar conhecer a verdade, já que ninguém é capaz de julgar se uma afirmativa sobre a realidade espiritual e moral é mais verdadeira que outra”. O sociólogo Peter L. Berger revela a grave incoerência dessa suposição bastante comum.

Em seu livro 4 rumor of angels, Berger relata como o século 20 descobriu “a sociologia do conhecimento”, ou seja, que os indivíduos creem no que creem em grande parte porque são condicionados a isso. Gostamos de pensar que pensamos por nós mesmos, mas não é tão simples assim. Pensamos como aqueles que mais admiramos e dos quais precisamos. Todos pertencem a uma comunidade que reforça a credibilidade de algumas crenças e desincentiva outras. Berger observa que muitos concluíram a partir daí que, por estarmos presos a nossos ambientes históricos e culturais, é impossível julgar a correção ou o equívoco de crenças concorrentes.

BLesslie Newbigin, The gospel in a pluralist society (Eerdmans, 1989), p. 9-10, 170. Scanned by CamScanner

Berger, porém, segue em frente e observa que o relativismo absoluto só pode existir se os relativistas excluírem a si mesmos da própria crítica.” Se inferirmos a partir do condicionamento social de toda crença que “nenhuma

crença pode ser encarada como verdade universal por todo mundo”, só isso já será uma afirmação abrangente sobre todo mundo, produto das condições sociais; logo, não pode ser verdade, com base em seus próprios argumentos. “A relatividade relativiza a si própria”, diz Berger; por isso, não é possível um relativismo “que chegue às últimas consequências”.'º Nosso comprometimento cultural torna, sim, mais difícil pesar alegações concorrentes sobre a posse da verdade. O condicionamento social da crença é um fato, mas ele não pode ser usado como argumento de que toda verdade é completamente relativa, sob pena de o argumento refutar a si mesmo. Berger conclui que não podemos nos esquivar de pesar as afirmações espirituais e religiosas usando como fuga o clichê “não há como conhecer a verdade”. Precisamos encarar a difícil tarefa de indagar: Que afirmativas a respeito de Deus, da natureza humana e da realidade espiritual são verdadeiras e quais são falsas? Precisamos basear nossa vida em alguma resposta a essa pergunta.

O filósofo Alvin Plantinga tem sua própria versão do argumento de Berger. É comum lhe dizerem: “Se tivesse nascido no Marrocos você não seria cristão, mas muçulmano”. E ele responde:

*Peter Berger, 4 rumor of angels: modern society and the rediscovery of the supernatural (Doubleday, 1969), p. 40 [edição em português: Rumor de anjos: a sociedade moderna e a redescoberta do sobrenatural, tradução de Waldemar Boff e Jaime Clasen (Petrópolis: Vozes, 1997)].

“Existem várias críticas sofisticadas que demonstram a natureza autorrefutável do relativismo. Veja um exemplo em H. Siegel, Relativism refuted: a critique of contemporary epistemological relativism (Dordrecht: D. Reidel, 1987). Uma noção muito influente é a de que a “verdade” existe apenas dentro de determinado contexto de crenças, cada uma das quais tem o mesmo valor, pois não há um critério que transcenda o contexto pelo qual seja possível avaliar todas as alegações de verdade. Uma versão mais

pós-moderna disso é a declaração de que a realidade está “vinculada à língua”, e cada alegação de verdade não é senão o insight de determinada comunidade linguística. No entanto, conforme enfatiza Siegel, dizer que todos os relatos de realidade estão vinculados à língua e são relativos às próprias comunidades

linguísticas já é, em si, um relato universal da ação da língua em todas as comunidades; logo, uma alegação da condição humana como tal. A visão de mundo dos relativistas não lhes dá o direito de falar assim. Eles fazem exatamente o que proíbem que outras comunidades façam. “Portanto, [...] o relativismo não pode se autoproclamar, nem mesmo se autorreconhecer, sem derrotar a si mesmo” (p. 43).

NÃO PODE HAVER SOMENTE UMA RELIGIÃO VERDADEIRA 37

Aceitemos a premissa de que, se eu tivesse nascido de pais muçulmanos no Marrocos, / | emvez de nascer de pais cristãos em Michigan, minha crença seria bastante diferente. 4 “O mesmo [porém] se aplica ao pluralista. [...] Se o pluralista tivesse nascido no | [Marrocos], provavelmente não seria pluralista. Será que daí se conclui que [...] suas |

crenças pluralistas decorrem de um processo não confiável de produção de crenças?”

Plantinga e Berger defendem o mesmo pensamento. Não se pode dizer “todas as afirmações referentes às religiões são historicamente condicionadas, salvo aquela que estou fazendo agora”. Se você insistir que ninguém é capaz de identificar as crenças corretas e as equivocadas, por que acreditaríamos no que você está dizendo? Na realidade, todos alegamos ter posse da verdade, e é muito difícil pesar essas alegações de forma responsável, mas não temos alternativa a não ser tentar.

“Insistir que sua religião é a certa e tentar converter

os outros é uma postura arrogante.”

O renomado especialista em religião John Hick escreveu que, quando nos conscientizamos de que existem no mundo várias outras pessoas igualmente boas e inteligentes com crenças diferentes das nossas e de que não seremos capazes de convencê-las do contrário, tentar convertê-las ou insistir que nossa visão é a mais verdadeira torna-se uma postura arrogante.?

Mais uma vez, observa-se uma contradição inerente. À maioria dos indivíduos não pensa que todas as religiões sejam igualmente válidas, como acha John Hick, e vários são capazes e inteligentes tanto quanto ele, bem como improváveis candidatos a mudar seu modo de pensar. Isso torna arrogante e equivocado o próprio argumento de que “todas as religiões são arrogantes e equivocadas em suas alegações de entender melhor as coisas”.

“Alvin Plantinga, “A defense of religious exclusivism”, in: The analytic theist, organização de James F. Sennett (Eerdmans, 1998), p. 205.

2John Hick, The myth of God incarnate (Westminster, 1977) [edição em português 4 metáfora do Deus encarnado, tradução de Luís Henrique Dreher (Petrópolis: Vozes, 2000)], e An interpretation of religion (New Haven: Yale University Press, 1989). Veja uma resposta mais extensa a Hick em Peter Van Inwagen, “Non Est Hick”, in: T. Senor, org. The rationality of beliefand the plurality of faith (Ithaca: Cornell University Press, 1995).

Muitos afirmam ser etnocêntrico reivindicar que à raio que seguimos É : í afirmativa em si já não é etnocêntrica?

é superior às demais. Mas será que essa Wiridiicodelênde A maioria das culturas não ocidentais não nega como ps pi E r a superioridade de sua cultura e religião. A Rica de que a é ps A E pro fundamente enraizada nas tradições ocidentais de autocrítica e irisâdiaalizeno, Acusar outros do “pecado” de etnocentrismo na verdade é uma maneira de dizer que “a avaliação que nossa cultura faz de outras culturas é melhor que a sua”. Em geral, isso equivale a fazer exatamente o que proibimos aos outros.! O historiador C. John Sommerville observou que “uma religião só pode ser julgada a partir da perspectiva de outra”. Não se pode avaliar uma religião salvo com base em algum tipo de critério ético que, no final, consiste em sua própria perspectiva religiosa.!

A esta altura o erro fatal dessa abordagem da religião em geral e do cristianismo em particular deve estar óbvio. Os céticos acreditam que | quaisquer alegações de exclusividade em relação a um conhecimento superior da realidade espiritual são inverídicas. No entanto, tal objeção em si já é uma crença religiosa. Ela parte do princípio de que é impossível conhecer a Deus, ou de que Deus é amoroso, mas não se ira, ou de que Deus é uma força impessoal e não uma pessoa que fala nas Escrituras. Todas essas afirmações são premissas a apresentação sofisticada deste argumento pode ser encontrada em Stanley Fish, “The trouble with tolerance”, edição de 10 de novembro de 2006 de Chronicle of Higher Education. Trata-se da agents de Wendy Brown, Regulating aversion: tolerance in the age ofidentity and empire (Princeton pede o na a que a ideia ocidental de “tolerância com

critério para determinar area a cida a ou não + g ' pias fi ij am seu próprio conjunto de crenças sagradas, questionáveis, am a mm o ne spp Mp Fish argumentam que muitas crenças tradicionais rir É Minas esa 4 da sociedade por causa da nova interpretaçã : N eng eia Ap

dono nie de que os iii ren dae ocidental liberal lhes impõe. “Ela muçulmanos, negros ou gays [...] eles são imunes ao polia re Pas por seem ju Ar valorize sua própria verdade mais que a tolerância é ese mr pie er religião que incapaz de agir racionalmente. “Quando um grupo rejeita a tolerá “Pega a pa , sua cultura € opta, ao contrário, pelos imperativos culturais da igreja ou do rim do ni quiri intolerância, que será exercida em nome da tolerância.” o Mt “C. John Sommerville, The decline of the secular university (Oxford, 2006), p. 63. SS RS CENT ED POSTA SNIS MPE OD NR

NÃO PODE HAVER SOMENTE UMA RELIGIÃO VERDADEIRA 39

de fé que não se sujeitam a comprovações. Além disso, seus defensores acreditam possuir uma forma superior de ver as coisas. Acreditam que o mundo será melhor se todos abandonarem as noções de Deus e da verdade presentes nas religiões tradicionais e adotarem as suas. Se todas aquelas noções devem ser desencorajadas, o mesmo se aplica a esta. Se não considerarmos sinal de ignorância defender essa noção, nada existe de inerentemente ignorante em apegar-se às crenças religiosas tradicionais.

Mark Lilla, professor da Universidade de Chicago, dirigiu as seguintes palavras a um jovem aluno de Administração da Wharton School, que, para espanto de Lilla, havia ido à frente em uma cruzada de Billy Graham para consagrar a vida a Cristo:

Meu desejo era lançar dúvidas sobre o passo que ele estava prestes a dar, ajudá-lo

a ver que há outras maneiras de viver, outras maneiras de buscar o conhecimento,

o amor [...] até mesmo a autotransformação. Meu desejo era convencê-lo de que

sua dignidade dependia da manutenção de uma postura livre e cética em relação

às doutrinas. Meu desejo era [...] salvá-lo [asas

A dúvida, a exemplo da fé, precisa ser aprendida. É uma habilidade. Mas o curioso no ceticismo é que seus adeptos, antigos e modernos, em sua maioria já foram pregadores. Ao lê-los, muitas vezes tive vontade de indagar: “Por que você se importa?” O ceticismo desses indivíduos não oferece resposta alguma a essa pergunta. E eu não tenho nenhuma.!

O sábio autoconhecimento de Lilla revela que suas dúvidas a respeito do cristianismo são uma fé alternativa adquirida. Ele acredita que sua dignidade individual como ser humano se assenta no ceticismo doutrinário — algo que constitui, é claro, um elemento de fé. Mas por que sua doutrina seria a única a não passar por nenhum escrutínio? Conforme admite, ele não pode deixar de pensar que melhor seria se os outros adotassem suas crenças quanto à realidade e à dignidade humanas em lugar das crenças de Billy Graham.

Afirmar que uma religião é a certa revela tanta ignorância quanto alegar que determinada forma de encarar todas as religiões (a saber, que todas são

1sMark Lilla, “Getting religion: my long-lost years as a teenage evangelical”, New York Times Magazine (September 18, 2005), p. 95.

iguais) está correta. Somos todos exclusivistas em noss ças q religiões, só que de maneira diversa.

3. Manter a religião no âmbito totalmente pessoal

Outra abordagem do elemento desagregador da religião é permitir que os indivíduos creiam de forma privativa que sua fé seja a verdadeira e possam “evangelizar”, mas manter fora da esfera pública as crenças religiosas. Pensadores influentes, como John Rawls e Robert Audi, sustentam que em debates públicos e políticos não devemos defender uma postura moral, a menos que ela tenha um fundamento laico, não religioso. Rawls é conhecido por insistir que as noções religiosas que ele chama de “abrangentes” sejam excluídas do discurso público.!º Há pouco tempo, um vasto leque de cientistas e filósofos assinou “A declaration in defense of science and secularism” [Declaração em defesa da ciência e do secularismo], conclamando os líderes do governo americano a “não permitir que leis ou atos do Executivo fossem influenciados por crenças religiosas”."” Entre os signatários figuram Peter Singer, E. O. Wilson e Daniel C. Dennett. O filósofo Richard Rorty, por exemplo, defende que a fé religiosa deve permanecer como questão pessoal e jamais ser introduzida em discussões que digam respeito a políticas públicas. Usar um argumento baseado em uma crença religiosa é apenas um “cala-boca”, algo que o não religioso não pode se permitir. !8 Aos que se queixam de que tal abordagem discrimina a religião, Rorty e a li É a - À

tros pesa que essa política é pragmática." Eles não se epóema jidsola- Icamente à religiã i e

8 dona giao a 9 mem tentam controlar as crenças religiosas, desde ue estas não extr A

q apolem a esfera pessoal. No entanto, na seara pública, ficar “Robert Audi, “The separation of Church

. 4 and State and th ont au m

Philosophy and Public Affairs 18 (1989): 296; John Rawis, Political a of citizenship”, Press, 1993) [edição em português: O liberal; ia j teratism (Columbia University , guês: O liberalismo polis ã : jo

Fontes, 2011)) p.212-54, político, tradução de Álvaro de Vita (São Paulo: Martins vn); , : F

isperiível em: http://www .cfide.org/declaration.htm, acesso em: 28 fev. 20) “Richard Rorty, “Religion as a conversation-stopper”, in: Phj/ | . Dz. 1999), p. 168-9. HDS Cbmlosophy and social hope (Penguin, “Veja Richard Rorty, Conse :

5 quences of pragmat doadas 7

PI66I, f pragmatism (University of Minnesota Press, 1982), Scanned by CamScanner

NÃO PODE HAVER SOMENTE UMA RELIGIÃO VERDADEIRA 41

discutindo religião é correr o risco de causar cisões e perder tempo. As posturas baseadas na religião são vistas como sectárias e polêmicas, ao passo que o raciocínio laico aplicado a posturas morais é encarado como universal e acessível a todos. Assim, o discurso público precisa ser laico, jamais religioso. Sem referir-se a nenhuma revelação divina ou tradição confessional, temos de trabalhar juntos na solução dos grandes problemas de nosso tempo — como a AIDS, a pobreza, a educação etc. Devemos guardar para nós mesmos nossa visão religiosa e nos unir em torno de políticas que “funcionem” melhor para a maioria. Stephen L. Carter, de Yale, argumenta que é impossível deixar de lado as noções religiosas quando embarcamos em qualquer raciocínio moral. Tentativas para criar uma esfera pública da qual esteja ausente o debate religioso, É independentemente dos cuidados que se tomem, sempre acabarão por dizer . aos membros da religião organizada que somente eles, ao contrário dos demais, para participarem do diálogo público, precisam deixar para trás essa parte de si | mesmos que talvez considerem a mais vital.?0 ares

Como explicar essa afirmação de Carter? Comecemos indagando o que é religião. Alguns dizem que é uma forma de crença em Deus. Mas isso ” não se aplicaria ao zen-budismo, que não acredita absolutamente em Deus. Outros dizem que se trata da crença no sobrenatural, mas isso não se aplica ao | hinduísmo, que não crê em uma esfera sobrenatural além do mundo material, | mas apenas em uma realidade espiritual dentro do conhecimento empírico. | Assim, o que é religião? Um conjunto de crenças que explicam o que é a vida e | quem somos, bem como as coisas mais importantes nas quais os seres humanos | deveriam empregar seu tempo. Por exemplo, alguns acham que existe somente | este mundo material, que estamos aqui por acidente e quando morremos apenas apodrecemos; logo, o importante é escolher aquilo que nos faz felizes sem permitir que outros nos imponham suas crenças. Observe que, embora não seja uma religião explícita, “organizada”, ela contém uma narrativa-mestra, uma avaliação do sentido da vida juntamente com recomendações acerca de como levar a vida com base em tal avaliação.

%Stephen L. Carter, The dissent ofthe governed (Harvard University Press, 1999), p. 90. L

Alguns chamam isso de “cosmovisão”, enquanto para outros se trata de “identidade narrativa”. Em ambos os casos, existe um conjunto de premissas sustentadas pela fé a respeito da natureza das coisas. Trata-se de uma religião implícita. No sentido mais amplo, a fé em alguma visão do mundo e da natureza humana está presente na vida de todos. Todo mundo vive e age a partir de uma identidade narrativa, quer seja elaborada e objeto de reflexão, quer não. Todos os que dizem “você deve fazer isso” ou “não deve fazer aquilo” raciocinam a partir de uma postura moral e religiosa implícita. Os pragmáticos dizem que deveríamos deixar de lado nossas cosmovisões mais profundas e entrar em consenso sobre “o que funciona” — mas nossa noção do que funciona é determinada por aquilo que acreditamos ser a finalidade das pessoas. Qualquer retrato de uma vida humana feliz que “funcione” resultará necessariamente de crenças cristalizadas sobre o propósito da vida humana.” Mesmo os pragmáticos mais seculares chegam ao debate com compromissos profundos e avaliações narrativas do que significa ser humano.

) Rorty insiste que as crenças bascadas na religião são “cala-bocas”, mas todas as nossas convicções mais fundamentais sobre as coisas são crenças praticamente impossíveis de justificar para os que delas não compartilham.

“Linda Hirshman, por exemplo, critica o fato de as mulheres ficarem de fora do mercado de trabalho para criar os filhos em casa. Ela afirma ser errado fazer isso, ainda que seja fruto de livre escolha. “A família — com seu trabalho braçal repetitivo, socialmente invisível — é uma parte necessária da vida, mas, em comparação com os setores público e privado, oferece menos oportunidades para o pleno desenvolvimento. Essa esfera menos estimulante não é uma responsabilidade natural ou moral de competência exclusiva das mulheres. [...] O fato de as mulheres a assumirem é [ul injusto.” (“Homeward bound”, The American Prospect, vol. 16, n. 12, December, 2005). Repare que 9 argumento se baseia em uma avaliação de “desenvolvimento humano” que jamais pôde ser provada empiricamente. Está enraizado em noções de dignidade e sociedade humanas que, à primeira vista, parecem seculares, mas que certamente não se sujeitam a verificação, são polêmicas e, no final das contas, estão fincadas em pressupostos de fé inerentes a uma cosmovisão. David Brooks questiona Linda Hirshman: “[Ela afirma] que empregos com altos salários levam a um desenvolvimento humano maior que o desenvolvimento possibilitado pela educação de filhos. Observe sua vida e faça a

he, nO p a vida no escritório?”, Veja “The Year of Domesticity , New tor

NÃO PODE HAVER SOMENTE UMA RELIGIÃO VERDADEIRA 43

Conceitos seculares como “autorrealização” e “autonomia” são impossíveis de provar e tão “cala-bocas” quanto o recurso à Bíblia.

Declarações que aparentam pertencer à esfera do senso comum para quem as faz têm, mesmo assim, quase sempre uma profunda natureza religiosa. Imagine que a senhora A defenda que todos os programas de assistência aos pobres devam ser cancelados, em nome da “sobrevivência do mais apto”. À senhora B poderia argumentar: “Os pobres têm direito a um padrão de vida decente — eles são tão humanos como nós!”. À senhora À talvez revidasse com o fato de que muitos bioeticistas atualmente consideram o conceito de “humano” artificial e impossível de definir. Talvez prosseguisse dizendo que não há possibilidade de tratar todos os organismos como fins em vez de meios e que alguns precisam morrer para que outros vivam. É assim que a natureza funciona. Se a senhora B respondesse com um argumento pragmático — que devemos ajudar os pobres porque isso faz a sociedade funcionar melhor, a senhora A poderia contrapor vários argumentos pragmáticos semelhantes para reiterar que a morte de alguns pobres seria ainda mais eficaz. Isso começaria a irritar a senhora B, que, inflamada, revidaria dizendo que matar os pobres de fome é antiético, mas a senhora A poderia retrucar: “Quem disse que a ética tem de ser a mesma para todos?”. Finalmente, a senhora B explodiria: “Não quero viver em uma sociedade como a que você está descrevendo!”.

Nesse debate, a senhora B tentou seguir John Rawls e encontrar argumentos universalmente acessíveis, “neutros e objetivos”, que convenceriam a todos de que não podemos matar de fome os pobres. Ela fracassou porque esses argumentos não existem. No final, a senhora B afirma a igualdade e dignidade dos indivíduos porque acredita que isso seja verídico e correto. Ela assume como elemento de fé que as pessoas valem mais do que rochas ou árvores — embora não possa provar cientificamente. Suas propostas de políticas públicas se baseiam, no final das contas, em um ponto de vista religioso.”

2Gary Rosen, “Narrowing the religion gap?”, New York Times Sunday Magazine, February 18,

“Adaptado de C. John Sommerville, “The exhaustion of secularism”, The Chrônicle Review (July 9, 2006).

Isso leva um jurista, Michael J. Perry, a concluir que se mina de um ao

“quixotesco, sob todos os aspectos, tentar criar uma barreira inexpugnável entre o discurso moral religiosamente fundamentado [...] e o discurso [laico] no debate de políticas públicas”.?* Rorty e outros afirmam que o paca religioso é demasiado polêmico, mas Perry rebate em Under God? Rehgtous faith and liberal democracy [Sob a égide de Deus? Fé religiosa e Ainda Há, dizendo que os fundamentos laicos para as posturas morais são tão polêráicos quanto os fundamentos religiosos, € é possível demonstrar ego ótimos argumentos que todas as posturas morais são, no mínimo, Amplicicamets religiosas. Por ironia, a exclusão do raciocínio religioso da esfera pública é, em si mesmo, um ponto de vista polêmico e “sectário”.”

- Quando o indivíduo chega à esfera pública, é impossível deixar de lado “suas convicções relativas aos valores fundamentais. Examinemos as leis sobre | casamento e divórcio, por exemplo. Será possível elaborar leis cujo “funciona- ' mento” convença a todos, numa relação de independência dos compromissos

pessoais com determinada cosmovisão? Não acredito que isso seja possível.

As opiniões pessoais sobre o que é certo se basearão naquilo que cada um

encara como o propósito do casamento. Se você acha que o casamento se

destina basicamente à criação de filhos para o bem da sociedade como um todo, você colocará muitos obstáculos ao divórcio. Se acredita que o propósito do casamento seja primordialmente promover a felicidade e a realização emocional do casal, você tornará o divórcio bem mais fácil. A primeira opinião se assenta em uma visão do desenvolvimento e bem-estar humanos na qual a família é mais importante que o indivíduo, como acontece nas tradições morais do confucionismo, do judaísmo e do cristianismo. A segunda abordagem é uma postura mais individualista da natureza humana baseada numa cosmovisão própria do Iluminismo. As leis de divórcio que você considere funcionais Bonito Pi pr El Religious faith Ei liberal democracy (Cambridge University

aa » Perry afirma com razão que o discurso público fundado na religião medida do possível, procurar tornar seu mp a contemplar, debater e, na

PVeja o capítulo 3 de Perry: “Why political aimé polia cimeira ity illegitimate in a liberal democracy”, in: Under God? dd

NÃO PODE HAVER SOMENTE UMA RELIGIÃO VERDADEIRA 45

dependerão de crenças anteriores com relação àquilo que significa ser feliz e plenamente humano.” Não existe consenso objetivo e universal quanto a isso. Embora muitos continuem a exigir a exclusão das visões religiosas da esfera pública, um número cada vez maior de pensadores, tanto religiosos quanto laicos, admite hoje que tal exigência em si já é uma postura religiosa.”

O cristianismo pode salvar o mundo

Demonstrei a ineficácia de todas as principais tentativas de tratar da desagregação provocada pela religião no mundo atual. No entanto, o propósito dessas tentativas me agrada. À religião realmente pode ser uma das maiores ameaças à paz mundial. No início do capítulo, falei do “terreno escorregadio” que toda religião costuma instalar no coração humano. Esse terreno escorregadio leva todos com grande facilidade à opressão. No entanto, dentro do cristianismo — o cristianismo robusto, ortodoxo — existem fartos recursos capazes de transformar seus seguidores em agentes da paz no mundo. O cristianismo possui em si mesmo um poder notável de explicar e expurgar as tendências às divisões presentes no coração humano.

O cristianismo fornece uma base firme para o respeito aos indivíduos que professam outras religiões. Jesus parte do princípio de que os incrédulos na cultura à sua volta terão boa vontade para admitir que grande parte do comportamento cristão é “bom” (Mt 5.16; cf. 1Pe 2.12). Isso pressupõe algumas zonas de coincidência entre a constelação cristã de valores e os valores de qualquer cultura específica? e de qualquer outra religião.” Qual é a razão dessas zonas

%Veja John Witte Jr. “God's joust, God's justice: an illustration from the history of marriage law”, in: M.McConnell; R. Cochran; A. Carmella, Christian perspectives on legal thought (Yale, 2001), p. 406-25.

“Stanley Fish, “Our faith in letting it all hang out”, New York Times, February 12, 2006.

*Miroslav Volf, “Soft difference: theological reflections on the relation between Church and culture in 1 Peter”, Ex Auditu 10 (1994): 15-30.

Veja o apêndice de C. S. Lewis, “Illustrations of the Tao”, in: The abolition of man (Macmillan, 1947) [edição em português: 4 abolição do homem, tradução de Remo Mannarino Filho (São Paulo: Martins Fontes, 2005)]. O argumento de Lewis é que existem zonas importantes de coincidência entre as religiões no que toca à ética — como devemos viver no mundo. As diferenças profundas entre as religiões surgem em outra área — a “soteriologia”. O que diferencia as religiões são as instruções sobre como se ligar com Deus e conseguir poder espiritual para viver da maneira recomendada.

.«tãos acreditam que todos Os seres humanos são criados

de coincidência? Os crista tencial de bondade e sabedoria. À doutrina à de Deus e com poten o

à semelhança «versal de Deus, assim, leva OS cristãos a ter esperança de bíblica da imagem universal de , É

dul ser melhores que qualquer coisa que EE SAE

que os incrédulos p do a ser. A doutrina bíblica do pecado universal equivocadas OS tenham levado a ser. . d

istã nsciência de que os crentes, nã prática, podem

também leva os cristãos a ter co a pm silo

ser piores que qualquer coisa que suas € : ão respeitosa a cooperação '

ser. Dessa forma, existe um vasto terreno para p ç ídãos d E iE di Dê tar que os indivíduos de

O cristianismo não só leva seus adeptos a acreditar q "

outras religiões possuam bondade e sabedoria para oferecer, a também a esi . ior à vida de muitos cristãos.

perar que muitos levem uma vida moralmente superior à ae A maioria das pessoas em nossa cultura acredita que, se existe um Deus, podemos nos relacionar com ele e ir para o.céu desde que levemos uma vida correta. — . »” pitas o É: su

[mesmo isso de visão do “aperfeiçoamento moral”. O cristianismo ensina exa | tamente o contrário. No entendimento cristão, Jesus não nos diz como viver de | modo que mereçamos a salvação. Em vez disso, sua vinda teve como propósito | nos perdoar e nos salvar por meio de sua vida e morte em nosso lugar. À graça | de Deus não é dada aos que superam moralmente seus semelhantes, mas aos que / “ grama . A

| admitem o próprio fracasso e reconhecem a necessidade que têm de um Salvador. “ Os cristãos, assim, devem considerar a possibilidade de encontrar incrédulos muito mais bondosos, gentis, sábios e melhores do que eles. Por quê? Os crentes não são aceitos por Deus por seu desempenho moral, sua sabedoria ou virtude, mas em virtude da obra de Cristo realizada em favor deles. A maioria das religiões e filosofias de vida supõe que a condição espiritual. da pessoa depende de suas realizações religiosas. Isso leva naturalmente seus adeptos a se sentir i ; :

em superiores àqueles que não creem nem se comportam como eles. O evangelho cristão não deveria provocar tal efeito.

; tod que o “fundamentalismo” leva à violência, mas, como já vimos, todos nós possuí : : à E

; É i possuimos compromissos fundamentais de fé, não sujeitos verificação, que imaginam : .

aid õ E os serem superiores aos dos outros. Assim, a peré: Que funda ; ;

fundamentos da fé levariam aqueles que a professam a ser mais afetuosos erecepírvos em relação aos que nã :

] que não compartilham da mesma fé? Que con

junto de crenças inevitavelmente exclusiv: o

isso des ora as nos conduziria a um comporta

NÃO PODE HAVER SOMENTE UMA RELIGIÃO VERDADEIRA 47

Um dos paradoxos da História é a relação entre as crenças € práticas dos primeiros cristãos em comparação com as crenças e práticas da cultura que os cercava. |

As posturas religiosas do mundo greco-romano eram abertas e aparentemente tolerantes — todos tinham seu próprio deus. As práticas da cultura, porém, eram bastante cruéis. No mundo greco-romano, altamente estratificado do ponto de vista econômico, havia uma enorme distância entre ricos e pobres. Os cristãos, ao contrário, insistiam na existência de um único Deus verdadeiro, Jesus Cristo Salvador, morto por nós. Suas vidas e práticas, | contudo, eram incrivelmente receptivas com relação aos indivíduos marginalizados pela cultura vigente. Entre os primeiros cristãos havia gente de diferentes raças e classes, o que parecia escandaloso para os que os cercavam. O mundo greco-romano costumava desprezar os pobres, mas os cristãos se mostravam generosos não apenas com seus próprios pobres, como também com aqueles de outras religiões. Na sociedade em geral, as mulheres desfru- 1 tavam de uma condição bem inferior, sujeitas a altos índices de infanticí- . dio de meninas, casamentos impostos e carência de igualdade econômica. O | cristianismo proveu as mulheres de uma segurança e uma igualdade muito | maiores que as existentes até então no antigo mundo clássico.” Durante as », %Esta declaração pode surpreender muitos leitores que ouviram dizer que religiões mais antigas e o paganismo tinham uma visão da mulher mais positiva que a do cristianismo. Era extremamente comum no mundo greco-romano livrar-se de bebês do sexo feminino deixando-os morrer por exposição às intempéries, dada acondição inferiorizada das mulheres na sociedade. A igreja proibiu seus membros de praticar tal ação. À sociedade greco-romana não valorizava as mulheres sem marido, e era ilegal uma viúva levar mais de dois anos para casar-se novamente. O cristianismo, porém, foi a primeira religião a não obrigar as viúvas a se casarem. Elas eram sustentadas e respeitadas dentro da comunidade para que não sofressem pressão exagerada para achar outro marido. As Ú viúvas pagãs perdiam todo o controle sobre o patrimônio dos maridos falecidos quando voltavam a | se casar, mas a igreja permitia que as viúvas mantivessem o patrimônio do marido falecido. Final- | mente, os cristãos não endossavam o concubinato. Se um homem quisesse viver com uma mulher, | era obrigado a casar-se, o que provia muito mais segurança a ela. Igualmente, a dupla moral pagã de | Permitir aos homens casados praticarem sexo extraconjugal e ter amantes era proibido pela igreja. | Com todas essas diferenças, as mulheres cristás desfrutavam de segurança e igualdade muito maiores que aquelas da cultura ao redor. Veja Rodney Stark, “The role of women in Christian growth” (cap. | 5), The rise of Christianity (Harper, 1996) [edição em português: O crescimento do cristianismo: um | sociólogo reconsidera a história, tradução de Jonas Pereira dos Santos (São Paulo: Paulinas, 2006)]. / = ad

terríveis pestes urbanas dos dois primeiros séculos, os cristãos cuidavam de todos os doentes e moribundos das cidades, com frequência pagando com a própria vida.”

Por que um sistema de fé tão exclusivista levaria a um comportamento tão receptivo em relação aos demais indivíduos? Porque o sistema de fé cristã possuía em seu âmago o recurso mais forte possível para estimular a prática do sacrifício, da generosidade e da conciliação. No próprio núcleo de sua visão da realidade estava um homem que havia morrido pelos inimigos, implorando que eles fossem perdoados. Refletir sobre isso só poderia levar a uma forma radicalmente diversa de lidar com a diferença. Significava que os cristãos não poderiam agir com violência e opressão sobre seus opositores.

Não há como nos esquivar do fato de que a igreja cometeu injustiças em nome de Cristo, mas quem é capaz de negar que a força das crenças mais fundamentais dos cristãos pode constituir um poderoso estímulo para a paz em nosso mundo conturbado?

“Um ótimo resumo de como o cristianismo triunfou sobre o pensamento pagão mais antigo através da prática da compaixão e da justiça pode ser encontrado em Rod E ge ; E Christianity (Harper, 1996) capítulos 4, 6 e 7. ney Stark, The rise of id ,$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se afirmar que "todas as religiões são igualmente válidas" é, ela mesma, uma convicção que ninguém consegue provar empiricamente, por que tantas vezes a tratamos como neutra e óbvia em vez de como um ato de fé?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando dizemos que defender a verdade da própria fé é arrogância, não estaríamos assumindo, em segredo, uma posição superior sobre o que todas as religiões "realmente" são?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você já parou para perguntar se rejeitar Jesus por causa da exclusividade não o impede de examinar honestamente se as afirmações dele sobre si mesmo são verdadeiras?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Como um Deus bondoso pode permitir o sofrimento$t$, 3,
$conteudo$“Simplesmente não acredito na existência do Deus do cristianismo”, disse Hillary, estudante universitária de inglês. “Deus permite sofrimentos terríveis no mundo. Ou ele é todo-poderoso, mas não bondoso o bastante para pôr fim ao mal e ao sofrimento, ou ele é todo-bondoso, mas não poderoso o bastante para pôr fim ao mal e ao sofrimento. Seja como for, o Deus todo-bondoso e todo-poderoso da Bíblia não existe.” “Para mim não se trata de uma questão filosófica”, acrescentou Rob, namorado de Hillary. “É uma questão pessoal. Não creio em um Deus que permita o sofrimento, ainda que ele exista. Talvez Deus exista. Talvez não. Mas, se ele existe, não é confiável.”

P ARA muita gente, o maior problema não está no exclusivismo do cristianismo, mas na presença do mal e do sofrimento no mundo. Alguns consideram o sofrimento injusto um problema filosófico que desafia a própria existência de Deus. Para outros, trata-se de uma questão profundamente pessoal. A estes não interessa a pergunta abstrata quanto à existência ou inexistência de Deus — eles se recusam a confiar ou crer em qualquer Deus que permita que a história e a vida se desenrolem do jeito que conhecemos. "Este argumento revestiu-se de sua forma mais clássica pela mão de David Hume em Dialogues concerning natural religion, edição de Richard Popkin (Indianapolis: Hackett Pub, 1980). “As velhas Perguntas de Epicuro continuam sem resposta. Será que [Deus] gostaria de impedir o mal, mas é incapaz? Nesse caso, ele não é poderoso. Será que é capaz, mas não está disposto a impedi-lo? Então, ele é mau. Será que ele tanto gostaria quanto é capaz? Por que, então, existe o mal?” (p. 63). Scanned by CamScanner

Em dezembro de 2004, um terrível tsunami matou mais de duzentas € cinquenta mil pessoas na costa do Oceano Índico. Errata as semanas seguintes, jornais € revistas circularam cheios de cartas e artigos perguntando: “Onde estava Deus?” Um repórter escreveu: “Se Deus é Deus, ele não é bom. Se Deus é bom, ele não é Deus. Não é possível acreditar nas duas coisas, principalmente após a catástrofe no Oceano Índico”.? Apesar da afirmação segura do colunista, a tentativa de demonstrar que O mal comprova a inexistência de Deus “é hoje reconhecida em (quase) todos os segmentos como totalmente | fracassada”? Por quê?

O mal e o sofrimento não são provas contra Deus

O filósofo . L. Mackie defende sua posição contra Deus no livro The miracle of theism [O milagre do teísmo] (Oxford, 1982). Ele declara: se existisse um ) Deus bondoso e poderoso, ele não permitiria a existência do mal sem sentido, mas visto que no mundo existe muito mal sem sentido e injustificado, o Deus tradicional, bondoso e poderoso, não pode existir. Talvez haja outro deus ou não exista deus algum, mas o Deus tradicional não existe.* Vários outros filósofos identificaram uma falha grave nesse raciocínio. Juntamente com a afirmativa de que o mundo está cheio de mal sem sentido há também uma premissa oculta, a saber, o mal parece sem sentido para mim e, portanto, ele deve ser sem sentido.

Esse raciocínio logicamente é uma falácia. O fato de alguém não conseguir enxergar ou imaginar um motivo para Deus permitir que algo aconteça ?Ron Rosenbaum, “Disaster ignites debate: was God in the tsunami?” New York Observer, January 10,2005. Claro que Mackie estava apenas repetindo uma pergunta muito antiga, feita desde Epicuro até David Hume. Veja nota 1.

pegas Emp ao e Ni ne the human repito condition”, Pilosapiiéal argumento ateológico sobre o mal em Daniel

Howard-Snyder, org., The evidential argument from evil (Indiana University Press, 1996). ce e a E

de Howard-Snyder é um excelente resumo e mostra por st a ap pé confiantes entre os filósofos de que o mal e o sofrimento iam a na = dd Rad o o livro de Mackie (1982) talvez seja a última obra importante a ii eps cair Scanned by CamScanner

COMO UM DEUS BONDOSO PODE PERMITIR O SOFRIMENTO? 51

não significa que esse motivo inexista. Novamente detectamos no ceticismo supostamente objetivo uma enorme fé nas faculdades cognitivas de quem fala. Se nossa mente não é capaz de explorar as profundezas do universo atrás de boas respostas para o sofrimento, então, ora, elas não existem! Trata-se de uma fé cega de primeira linha.

A falácia no núcleo de tal argumento foi ilustrada pelos “maruins” de Alvin Plantinga. Se você procurar um São Bernardo dentro de sua barraca de camping e não encontrar um, é válido supor que não exista um São Bernardo lá. Mas, se você procurar um “maruim” (inseto extremamente pequeno com uma picada desproporcional a seu tamanho) e não vir nenhum, não é válido supor que ele não esteja dentro da barraca de camping, porque, afinal, ninguém é capaz de vê-lo. Muita gente supõe que, se houvesse bons motivos para a existência do mal, eles seriam acessíveis à mente humana, mais como São Bernardos do que como maruins; mas por que isso deveria ser assim?

Esse argumento contra Deus não se sustenta, não apenas do ponto de vista lógico, mas também do ponto de vista da experiência. Como pastor, várias vezes preguei sobre a história de José em Gênesis. José era um jovem arrogante odiado pelos irmãos. Furiosos com ele, os irmãos o prenderam em um buraco e depois o venderam como escravo. José foi para o Egito e sofreu horrivelmente. Sem dúvida, pediu a Deus que o ajudasse a fugir, mas não obteve ajuda alguma e permaneceu na escravidão. Apesar dos anos de sofrimento, o caráter de José se aperfeiçoou e se fortaleceu através das provações, e ele acabou alçado ao

- posto de primeiro ministro do Egito, salvando milhares de vidas e evitando até mesmo que sua família morresse de fome. Se Deus não houvesse permitido que José sofresse tantos anos, talvez ele não se transformasse em um agente tão poderoso de justiça social e cura espiritual.

Sempre que utilizo esse texto, muitos vêm me dizer que se identificaram com a história. Muitas pessoas são obrigadas a admitir que a maior parte do que realmente precisavam para alcançar o sucesso na vida lhes chegou por meio das

“O argumento do maruim e questões relativas ao problema do mal são abordados em Alvin Plantinga, Warranted Christian belief (Oxford: 2000), p. 466-7 [edição em português no prelo; Crença cristã avalizada (São Paulo: Vida Nova, s.d.)]. Veja também Alvin Plantinga, “A Christian life Partly lived”, in: Kelly James Clark, org., Philosophers who believe (IVP, 1993), p. 72,

experiências mais difíceis e dolorosas. Algumas recordam uma doença e reconhecem que aquele momento marcou uma época insubstituível de crescimento pessoal e espiritual. Sobrevivi a uma luta contra o câncer, e minha mulher sofreu do mal de Crohn durante anos. Ambos somos testemunhas disso.

Conheci um homem na minha primeira paróquia que havia perdido a maior parte da visão depois de levar um tiro no rosto durante uma briga por causa de drogas. Ele me disse que havia sido uma pessoa extremamente egoísta e cruel, mas sempre culpava os outros por seus constantes problemas legais e de relacionamento. A perda da visão o deixou arrasado, mas também contribuiu profundamente para torná-lo humilde. “Quando meus olhos físicos foram fechados, meus olhos espirituais se abriram. Finalmente percebi como eu vinha tratando os outros. Mudei e, agora, pela primeira vez na vida, tenho amigos, amigos de verdade. Paguei um preço altíssimo, mas devo dizer que valeu a pena. Até que enfim tenho aquilo que dá sentido à vida.”

Embora nenhuma dessas pessoas se sinta grata pelas tragédias em si, elas não trocariam as lições, o caráter e a força que extraíram delas por nada neste mundo. Com o tempo e o distanciamento, a maioria de nós é capaz de ver boas razões ao menos para algumas tragédias que ocorrem na vida. Por que, então, não seria possível, da perspectiva privilegiada de Deus, haver boas razões para todas elas?

Se você tem um Deus grande e transcendente do qual se ressente porque ele não impede o mal e o sofrimento no mundo, então também tem (no mesmo momento) um Deus grande e transcendente o bastante para encontrar bons motivos, que você desconhece, para permitir que o mal e o sofrimento continuem a existir. Com efeito, não dá para negar ambas as coisas.

O mal e o sofrimento podem ser (até)

provas da existência de Deus

O ns horrendo e inexplicável, embora não prove a inexistência de ne constitui, ainda assim, um problema para os que creem na Bíblia. da crueldade da vida. Depoi ERR oezuação dif [os pm rag

E Vida. Lepois, acabou concluindo que o mal era ainda mais

problemático sob à perspectiva de seu novo ateísmo. F;

o. Finalmente, deu-se conta

COMO UM DEUS BONDOSO PODE PERMITIR O SOFRIMENTO? 53

de que O sofrimento oferecia um argumento que servia mais para confirmar a existência de Deus do que para negá-la.

Meu argumento contra a existência de Deus era que o universo parecia muito cruel e injusto. No entanto, de onde tirei essa ideia de “justo” e “injusto”? [...] Com o que eu comparava o universo quando o rotulava de injusto? [...] Obviamente eu podia » desistir da ideia de justiça dizendo que ela não passava de uma noção pessoal. Se o, fizesse, porém, meu argumento contra a existência de Deus também iria por água ; abaixo — pois ele dependia da afirmação de que o mundo era realmente injusto, | não simplesmente de que as coisas não aconteciam para satisfazer minha imaginação. [...] Como consequência, o ateísmo acaba ficando simplista demais. Lewis admitiu que as objeções modernas à existência de Deus se baseiam | em uma noção de fair play e justiça. Acreditamos que os indivíduos não devem sofrer, ser excluídos, morrer de fome ou suportar opressão. O mecanismo evolucionista da seleção natural, contudo, depende da morte, da destruição e da violência dirigida pelos fortes contra os fracos — essas coisas são perfeitamente naturais. Então, com base nisso, será que o ateu considera o mundo natural horrivelmente errado e injusto? Quem não crê em Deus não possui uma boa base para ficar furioso diante da injustiça, o que, conforme observa Lewis, constitui o motivo primordial para negar a existência de Deus. Se você tem certeza de que este mundo natural é injusto e tomado pelo mal, está admitindo a realidade de algum padrão extranatural (ou sobrenatural) a partir do qual elabora seu juízo. O filósofo Alvin Plantinga expressou-se assim: Seria realmente possível existir uma maldade aterrorizante [se Deus não existisse e apenas tivéssemos evoluído]? Não vejo como. Algo assim só é possível caso haja uma maneira segundo a qual as criaturas racionais supostamente devam viver, sejam obrigadas a viver. [...] Uma forma [secular] de enxergar o mundo não abre espaço para nenhum tipo de obrigação moral genuína [...] e assim não há como dizer que exista uma maldade genuína e estarrecedora. Por conseguinte, se você SC. S. Lewis, Mere Christianity (New York: Macmillan, 1960), p. 31 [edição em português: Cristianismo puro e simples, tradução de Álvaro Oppermann; Marcelo Brandão Cipolla (São Paulo: Wimfimartinsfontes, 2009)].

acha que existe mesmo essa maldade aterrorizante ([...] e não meramente uma ilusão), você tem um argumento poderoso [em favor da realidade de Deus].”

Trocando em miúdos, a questão das tragédias, do sofrimento e da injustiça

é um problema para todos. No mínimo, trata-se de um problema tão grande para a fé quanto para a incredulidade na existência de Deus. Assim, é errado, embora compreensível, pensar que, abandonando a crença em Deus, você terá

mais facilidade para lidar com o problema do mal.

Uma sENHORA da minha igreja certa vez me questionou sobre os sermões em que acontecimentos ruins acabavam sempre se mostrando benéficos. Ela havia perdido o marido durante um assalto. Tinha vários filhos com problemas mentais e emocionais graves. Insistiu comigo que para cada história em que o mal acaba trazendo o bem, existe uma centena de outras em que não há sequer como pensar em dourar a pílula. Da mesma forma, boa parte do que temos ) discutido até agora neste capítulo pode parecer fria e irrelevante para alguém que sofre na vida real. Alguém nessa situação poderia perguntar: “E daí, se o sofrimento e o mal não provarem logicamente a inexistência de Deus?”, “Continuo com raiva. Todo esse papo filosófico não livra da responsabilidade o Deus cristão por todo mal e sofrimento do mundo!” O filósofo Peter Kreeft observa em resposta que o Deus cristão veio deliberadamente à terra para assumir a responsabilidade pelo sofrimento humano. Em Jesus Cristo, Deus vivenciou a dor mais profunda. Assim, embora não forneça o motivo para cada experiência dolorosa, o cristianismo fornece recursos profundos para enfrentar o sofrimento com esperança e coragem em lugar de amargura e desespero. Comparando Jesus aos mártires

as as histórias do evangelho mostram que Jesus não encarou a morte iminente er rua que se compare à frieza e ao destemor que seria de esperar de um ia espiritual. Os conhecidos mártires macabeus, que sofreram sob o domínio sírio de Antíoco Epifânio, foram os paradigmas de coragem 7 q . “« or É

hill : ria Christian life partly lived”, in: Kelly James Clark, org,, Philosophers who o Scanned by CamScanner

COMO UM DEUS BONDOSO PODE PERMITIR O SOFRIMENTO? 55

espiritual diante das perseguições. Ficaram famosos por falar desafiadora e confiantemente de Deus mesmo ao ter os membros amputados. Comparemos isso com o comportamento de Jesus, retratado como alguém profundamente abalado por seu iminente destino adverso: “... então começou a afligir-se e a angustiar-se. E disse-lhes: “A minha alma está tão triste que estou a ponto de morrer” (Mc 14.33-34). Lucas descreve Jesus antes da morte em um estado de “agonia”, um homem com todos os sintomas de estar fisicamente em choque (Lc 22.44). Marcos e Lucas mostram Jesus tentando evitar a morte, perguntando ao Pai se havia alguma forma de evitá-la (“Afasta de mim este cálice; todavia não seja o que eu quero, mas o que tu queres”; Mc 14.36; Lc 22.42). Finalmente, na cruz, ao contrário dos mártires macabeus, Jesus não surge confiante, conclamando os espectadores a serem fiéis a Deus. Em vez disso, ele grita que Deus o havia abandonado (Mt 27.46).

Na cruz, Jesus enfrentou um processo de três horas que o levou à morte por asfixia e hemorragia. Por mais terrível que tenha sido, houve mortes bem mais dolorosas e terríveis enfrentadas pelos mártires com confiança e calma bem maiores. Dois exemplos famosos são os de Hugh Latimer e Nicholas Ridley, queimados na fogueira em Oxford em 1555 em virtude de suas convicções protestantes. À medida que era devorado pelas chamas, ouviu-se Latimer calmamente dizer: “Console-se, Mr. Ridley, e seja forte! Neste dia, pela graça de Deus, acenderemos na Inglaterra uma vela que, garanto, jamais será apagada”.

Por que Jesus se mostrou tão mais afetado pela morte do que outros, mais afetado que seus próprios seguidores?

Para entender o sofrimento de Jesus no final dos Evangelhos, piano nos lembrar como ele é apresentado no início. O Evangelista J e RR a ii Capítulo, nos apresenta ao conceito misterioso, passa crucial, entao como Trindade, O Filho de Deus não foi criado, mas participou da rogo e vive por toda a eternidade “ao lado do Pai” (Jo 1.18), ou seja, A inficgõo a re intimidade e amor. No entanto, no final da vida, ele foi separado do Pai.

Provavelmente não existe maior agonia interior do que a pera e mo relacioname . er com todas as forças. Talvez seja possível vislumbrar

o grau de seu sofrimento, abandono e rejeição. Se um mero Etapa se volta op tra você com reprovação € críticas, dizendo que jamais quer vê-lo novamente, isso causa dor Se um namorado ou namorada faz o mesmo, a dor é qualitativamente maior. Mas se seu cônjuge age assim com você, ou se seu pai ou sua mãe o trata assim ainda durante a infância, o dano psicológico é infinitamente superior.

Não podemos, contudo, imaginar o que seria perder não apenas o amor conjugal ou paternal que durou vários anos, mas o amor infinito de Pai do qual Jesus desfrutou durante toda a eternidade. O sofrimento de Jesus teria sido eternamente insuportável. A teologia cristã sempre admitiu que Jesus suportou, em nosso nome e lugar, a exclusão infinda de Deus que a raça humana fez por merecer. No jardim do Getsêmani, até mesmo o início e a antevisão dessa experiência começaram a deixar Jesus em estado de choque. Bill Lane, especialista em Novo Testamento, escreve: “Jesus esteve com o Pai durante um intervalo antes de sua traição, mas descobriu que o inferno, e não o céu, se abriu diante dele, e titubeou”.º Na cruz, o grito de abandono de Jesus, “Deus meu! Deus meu! Por que me desamparaste?”, é uma profunda declaração relacional. Lane diz: “O grito tem uma autenticidade cruel. [...] Jesus não morreu negando a Deus. Mesmo no inferno do abandono, ele não abriu mão de sua fé em Deus, mas expressou sua oração angustiada em um grito de afirmação, Deus meu! Deus meu!”.º Jesus utiliza a linguagem da intimidade, “Deus meu!”, até mesmo ao passar pela experiência da absoluta separação do Pai.

a pato de Jesus foi qualitativamente diversa de qualquer outra morte. A dor física não foi nada comparada à experiência espiritual de abandono cósmico."

“William Lane, The Gospel according to Mark (Eerdmans, 1974), p. 516.

único enfrentado por ele, não poderíamos conceber que a st antevisã E rena pica o vocasse tal efeito em Cristo. Muitos mártires sofreram torturas físicas di pis nes: ui [...] contudo, a alma desses mártires não foi tão afetada.” “Christ's agony”, “a a ar ema

Edwards, edição de E. Hickman (Banner of Truth, 1972), vol. 2. ii Scanned by CamScanner

COMO UM DEUS BONDOSO PODE PERMITIR O SOFRIMENTO? 57

Somente o cristianismo entre todas as religiões do mundo afirma que Deus se tornou plenamente humano em Jesus Cristo e, dessa forma, conheceu em primeira mão o desespero, a rejeição, a solidão, a pobreza, a perda, a tortura e a prisão. Na cruz, seu sofrimento foi maior que o pior sofrimento humano, e ele vivenciou a rejeição cósmica e uma dor que supera a nossa de forma tão absoluta quanto seu conhecimento e poder extrapolam os nossos. Na morte de Jesus, Deus sofre por amor, identificando-se com os abandonados e excluídos.” Por que ele fez isso? A Bíblia diz que Jesus veio ao mundo em uma missão de resgate da criação. Teve de pagar por nossos pecados para um dia eliminar o mal e o sofrimento sem precisar nos eliminar.

Vejamos o que isso nos trouxe. Se fizermos novamente a pergunta: “Por que Deus permite que o mal e o sofrimento continuem a existir?” e olharmos para a cruz de Jesus, ainda assim não obteremos resposta. No entanto, agora sabemos qual não é a resposta. A resposta não pode ser que Jesus não nos ama. Não pode ser que ele é indiferente à nossa condição. Deus leva £ão a sério nossa dor e sofrimento que se dispôs a levá-los sobre si. Albert Camus entendeu essa mensagem quando escreveu:

[Cristo] o deus-homem também sofre, com paciência. O mal e a morte não

mais podem lhe ser inteiramente imputados, já que ele sofre e morre. À noite no

Gólgota tem tamanha importância na história do homem tão somente porque,

em suas sombras, a divindade abandonou visivelmente seu privilégio tradicional

e viveu até o fim, inclusive em seu desespero, a agonia da morte. Assim se explica

o “lamá sabactani” e a dúvida assustadora do Cristo agonizante.!?

“Na história da teologia já houve muita discussão sobre a possibilidade de um Deus infinito e eterno ter “fortes emoções” e vivenciar alegria, dor e tristeza. Uma corrente defende a “impassibilidade” de Deus e insiste que toda a linguagem bíblica desse tipo é meramente metafórica. Outros, como Jiirgen Moltmann (O Deus crucificado), argumentam com veemência em favor da “passividade” de Deus. Uma visão equilibrada é apresentada por Don Carson, em 7he difficult doctrine of the love of God (IVP, 2000) [edição em português: 4 difteil doutrina do amor de Deus, tradução de Degmar Ribas (Rio de Janeiro: CPAD, 2007)), p. 66-73. Carson defende que Deus de fato sente tristeza e dor, mas mantém tal postura com cautela nas qualificações e afirmações equilibradas.

2Essais (Paris: Gallimard, 1965), p- 444. Traduzido e citado por Bruce Ward em “Prometheus or Cain? Albert Camus's account of the Western quest for justice”, Faith and Philosophy (April, 1991), Pp. 213,

“tão de que Jesus é Deus e mor-

Ee i fortados e fortes para enfrentar as reareu na cruz, haveremos de n Deus é realmente Emanuel

lidades brutais da vida na terra. Podemos saber que A

— Deus conosco —, mesmo em meio P

A ressurreição € O sofrimento

Acho que é preciso algo mais do que saber que Deus está soneto e Pa é p : osso sofrimento não

dificuldades. Também precisamos da esperança de que n E

seja em vão”. Você já reparou como as famílias que perderam entes queridos necessitam afirmar isso? Elas batalham para alterar leis ou fazer mudanças nas condições sociais que levaram à morte. Elas precisam acreditar que a morte de seus entes queridos conduziu a uma nova vida, que a injustiça conduziu a uma justiça maior.

Para aquele que sofre, a fé cristã provê como recurso não apenas seu ensinamento sobre a cruz, mas também o fato da ressurreição. A Bíblia ensina que j o futuro não é um “paraíso” imaterial, mas um novo céu e uma nova terra. Em Apocalipse 21, não vemos seres humanos serem levados deste mundo para o céu, mas, sim, o céu se instalando na Terra para purificar, renovar e aperfeiçoar (o) ; isã é ã . E

o mundo material. À visão secular, é claro, não admite nenhuma restauração tura apó 4 istóri ta . : .

pós a morte ou após a história. E as religiões orientais acreditam que perdemos nossa individualidade e retornamos à Grande Alma, de modo que . , >

nossa vida material neste mundo termina por completo. Mesmo as religiões me creem em um paraíso celeste consideram-no uma compensação pelas peras e dores desta vi :

panda ria e por todas as alegrias que deixamos de ter.

visão da Bíblia é a ress LT

som . vi urreição nao um futuro que seja apenas uma

pensação pela vida que Jamais tivemos .

sempre desejamos ter. Isso signifi 788 UMa restauração da vida que - ÍSsO significa que A

só será desfeita e reparada com t x b a qualquer realidade terrível não , O também, de algu

felicidade futura serem ainda maiores. Ri

into anos atrás, tive um pesadelo tenebroso no qual ;

mília havia morrido. Quando acorde; meu alívio f qual toda a minha fa- : , ívio foi ;

muito mais que mero alívio. Meu apreço por cad mt Rr; ER GTA : a é

imensamente. Eu olhava para cada um eme d membro da família cresceu e dava

COMO UM DEUS BONDOSO PODE PERMITIR O SOFRIMENTO? 59

por tê-lo, o quanto amava todos eles. Por quê? Minha felicidade havia sido incrivelmente aumentada pelo pesadelo. Minha alegria ao acordar absorveu O terror, de modo que, no final, meu amor por eles cresceu por tê-los perdido e recuperado. À mesma dinâmica entra em ação quando perdemos algo que nos parecia eterno. Quando o recuperamos (depois de considerá-lo perdido para sempre), nós o valorizamos de uma forma muito mais profunda.

Na filosofia grega (especificamente na estoica), havia uma crença de que a história era um ciclo sem fim. Acreditava-se que, de tempos em tempos, o universo se retraía e era totalmente queimado pelo fogo em uma enorme con- Aagração chamada palingenesia, depois da qual a história, então purificada, começava de novo. No entanto, em Mateus 19.28, Jesus falou de sua volta à terra como a palingenesia. “Em verdade digo a vós que me seguistes que, na regeneração (gr., palingenesia), quando o Filho do homem se assentar em seu trono glorioso...” Esse conceito era radicalmente novo. Jesus insiste que sua volta se dará com tamanho poder que o próprio mundo material e o universo serão purificados de toda decadência. Tudo será curado e tudo que poderia ter sido será.

Logo após o clímax da trilogia O Senhor dos anéis, Sam Gamgi descobre que seu amigo Gandalf não está morto (como ele supunha), mas vivo. Ele grita: “Achei que você estava morto! Depois pensei que eu mesmo estava morto! Será que toda tristeza será desfeita? Jº À resposta do cristianismo a essa pergunta é: “Sim, será”. Toda tristeza será desfeita e, de alguma forma, será melhor justamente porque um dia houve destruição e perda.

A profissão das doutrinas cristãs da encarnação e da cruz traz profundo conforto diante do sofrimento. A doutrina da ressurreição nos enche de esperança, pois promete que teremos a vida pela qual mais ansiamos, mas o mundo será infinitamente mais glorioso do que seria se não houvesse necessidade de Coragem, persistência, sacrifício ou salvação.!*

“J. R.R. Tolkien, “The field of Cormallen”, The return of the King (várias edições) [edição em Português: “O campo de Cormallen”, O retorno do Rei, tradução de Lenita Maria Rimoli Esteves; Almiro Pisetta (São Paulo: Martins Fontes, 1994)).

“Talvez seja por isso que George MacDonald afirma: “Não sabemos quantos prazeres da vida devemos às tristezas que a permeiam. À alegria [sozinha] não é capaz de revelar as verdades mais Profundas, embora a verdade mais profunda deva ser à mais profunda alegria”. Phantastes: a faerie remance (Eerdmans, 1981), p. 67.

Dostoievsky escreve com brilhantismo sobre isso:

Acredito, como uma criança, que o sofrimento será curado e compensado, pois

todo o absurdo humilhante das contradições humanas desaparecerá como uma

lamentável miragem, como a inominável invenção da mente euclidiana impotente

e infinitamente pequena do homem, que no fim do mundo, no momento de

harmonia eterna, algo muito precioso surgirá e bastará a todos os corações para

aplacar todo ódio, para a expiação de todos os crimes da humanidade, de todo

o sangue derramado; algo que tornará possível não só perdoar, mas também

justificar tudo que aconteceu.!5

De forma mais sucinta, C. S. Lewis escreve:

Há quem diga sobre o sofrimento temporal que nenhuma bem-aventurança futura será capaz de compensá-lo, desconhecendo que o Céu, uma vez alcançado,

retroagirá e transformará em glória até mesmo essa agonia. !é

Essa é a derrota definitiva do mal e do sofrimento. Eles não só terão fim, como também serão vencidos de forma tão radical que o que aconteceu servirá apenas para tornar nossa vida e felicidade futuras infinitamente maiores.

YFyodor Dostoievsky, The Brothers Karamazov, cap. 34 [edição em português: Os irmãos Karamázov, tradução, posfácio e notas de Paulo Bezerra; desenhos de Ulysses Bóscolo (São Paulo: Ed. 34, 2009)]. Creio que é preciso observar que Dostoievsky não diz ser Possível justificar o mal em si. O mal pode ser usado por Deus para promover um bem maior que não existiria na ausência desse mal, mas, ainda assim, ele continua sendo mal e, por isso, indesculpável e injustificável em si mesmo.

CS. Lewis, The great divorce (Macmillan, 1946), p. 64 [edição em Português: O grande abismo, tradução de Anna Schiffer (São Paulo: Vida, 2006)].$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se você não consegue enxergar um motivo para Deus permitir certa dor, isso prova que tal motivo não existe, ou apenas que sua mente, como na imagem do maruim, não alcança o que está oculto?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$A história de José, que só pôde salvar milhares por causa dos anos que sofreu, faz você reconsiderar algum sofrimento da sua vida que talvez ainda não tenha revelado seu sentido?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante da cruz, onde o próprio Deus entrou no sofrimento humano, o cristianismo deixa de ter um Deus distante da sua dor e passa a ter um Deus que a carrega com você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O cristianismo é uma camisa de força$t$, 4,
$conteudo$Os cristãos acreditam possuir a verdade absoluta na qual todo mundo precisa acreditar, senão...”, disse Keith, jovem artista morador do Brooklyn. “Essa postura ameaça a liberdade de todos.”

“Isso mesmo”, concordou Chloe, outra jovem artista. “Uma abordagem do tipo “verdade tamanho único” é restritiva demais. Os cristãos que conheço não parecem livres para pensar por si próprios. Acho que todo indivíduo precisa estabelecer qual é a sua verdade.”

o que a crença em uma verdade absoluta é inimiga da liberdade? À maioria das pessoas que conheci em Nova York acredita que sim. O cristianismo rotula de “heresia” certas crenças e de “imorais” algumas práticas. Ele exclui de sua comunidade os que transgridem seus preceitos doutrinários e morais. Para os observadores contemporâneos, isso parece uma ameaça à liberdade civil, pois divide a população em vez de unir. O cristianismo também passa a impressão de ser culturalmente ignorante, não reconhecendo que culturas distintas têm perspectivas diversas sobre a realidade. Por fim, ele parece escravizar ou,no mínimo, infantilizar seus adeptos, determinando aquilo em que eles têm de crer e o modo que devem agir em todas as circunstâncias. M. Scott Peck comentou ter orientado uma mulher chamada Charlene, que assim se manifestou quanto ao cristianismo: “Não há lugar para mim nisso. Eu morreria! [...] Não quero viver para Deus. Não You viver para Deus. Quero viver para [...] mim mesma”! Charlene acreditava 'M. Scott Peck, The people of the lie: the hope for healing human evil (Simon and Schuster, 1983) [edição em português: O povo da mentira: a esperança humana para a cura do mal, tradução Scanned by CamScanner

que o cristianismo sufocaria sua criatividade e seu Si , o. . é ii 4 Emma Goldman, que chamou o

pensava a ativista social do início do século 20 E] É casca atant : truidor da vonta

cristianismo de “nivelador da raça humana, des o -

ousar e agir [...) uma cerca de ferro, uma camisa de força que não p q »2

homem se expanda e cresça . Ed

No final do filme Eu, Robô (2004), o robô Sonny cumpriu os objetivos para os quais havia sido criado. Mas então ele se dá conta de não ter outros propósitos para cumprir. O filme termina com um diálogo entre Sonny e o outro protagonista, o detetive Spooner.

Sonny: Agora que cumpri meu propósito, não sei o que fazer.

Detetive Spooner: Acho que você vai ter de descobrir seu caminho como

todos nós, Sonny... Isso é o que significa ser livre.

Segunda essa visão, “liberdade” significa a inexistência de um propósito supremo para o qual fomos criados. Se ele existisse, seríamos obrigados a adotá-lo e cumpri-lo, o que seria equivalente a uma limitação. A genuína liberdade é a liberdade de criar seu próprio sentido e propósito. A Suprema Corte americana cristalizou juridicamente essa noção ao dar o parecer de que « Z , ”

o núcleo da liberdade” está em cada um “definir o próprio conceito de existência, de sentido do universo”. Stephen Jay Gould concorda: de Maria Regina Nogueira [Rio de Janeiro: Imago, 1992], cap. 4, p. 168. Peck utiliza Charlene como exemplo da falta de saúde mental que domina uma pessoa que não tem na vida nada mais importante que a realização de suas necessidades e desejos individuais. “A saúde mental exige que a vontade humana se sujeite a algo que lhe seja superior. Para funcionar de forma razoável neste mundo, temos de nos sujeitar a algum princípio que tenha precedência sobre o que desejamos, seja em que momento for” (p. 162). ra

2Emma Goldman, “The failure of Christianity”, publicado pela primeira vez em 1913 em Mother Earth, periódico de Goldman. Disponível em: http://dwardmac.pitzer.edu/Anarchist Archives/goldman/failureofchristianity.html, acesso em: 26 dez. 2005 E “Extraído da declaração conhecida como “Sweet mystery of life” [O doemenddidnio da did ] vida

presente na famosa sentença da Suprema Corte dos Estados Unidos em Planned Parenthood , “ A : . e... re: A

Casey: “No núcleo da liberdade reside o direito de definir o próprio conceito de existênci E E E ; a sata ; cia, -

ficado do universo e do mistério da vida humana.” Repare que não se diz que somos simpl o ar : « E) 2 Implesmente

livres para “descobrir” a verdade por nós mesmos, mas, sim, para “definir” e criá-la Ê Scanned by CamScanner

O CRISTIANISMO É UMA CAMISA DE FORÇA 63

Estamos aqui porque um grupo estranho de peixes tinha determinada anatomia que tornou possível a transformação de guelras em patas de criaturas terrestres; porque cometas atingiram a Terra e exterminaram os dinossauros, dando assim aos mamíferos uma oportunidade até então inexistente. [...] Podemos ansiar por uma resposta “mais nobre”, mas ela não existe. Essa explicação, embora levemente perturbadora, ou até mesmo aterrorizante, acaba sendo libertadora e estimulante.

Não é possível ler o sentido da vida passivamente nos fatos da natureza. Temos

de elaborar sozinhos tais respostas...

O cristianismo parece inimigo da coesão social, da adaptabilidade cultural

e até mesmo da personalidade humana autêntica. No entanto, essa objeção se baseia em equívocos sobre a natureza da verdade, da comunidade, do cristianismo e da própria liberdade.

O filósofo francês Foucault escreve: “A verdade é algo deste mundo. Só se produz por múltiplas formas de restrição, aí incluídos os efeitos habituais do poder”.é Inspirados em Foucault, muitos afirmam que todas as alegações de verdade são exercícios de poder. Quando afirma ser dono da verdade, você está tentando exercer poder e controle sobre terceiros. Foucault foi discípulo de Nietzsche, e ambos usavam essa análise tanto em relação à esquerda quanto à direita. Se você afirmasse diante de Nietzsche: “Todos devem tratar com justiça os pobres”, ele indagaria se essa afirmativa se baseava no fato de você realmente amar a justiça e os pobres ou se sua intenção era promover uma revolução que lhe desse poder e controle.

No entanto, o argumento de que toda verdade é um exercício de poder padece do mesmo problema presente no argumento de que toda verdade é culturalmente condicionada. Se alguém tentar justificar todas as definições de verdade como uma coisa ou outra, chegará a uma posição insustentável. C. S. Lewis escreve em The abolition of man:

“Extraído de David Friend e dos organizadores de Life, the meaning of life: reflections in words and Pictures on why we are here (Little, Brown, 1991), p. 33.

“Extraído de “Truth and power”, in: Michel Foucault, Power/knowledge: selected interviews and other writing 1972-1977, edição de Colin Gordon (Pantheon, 1980), p. 131.

Mas você não pode sair por aí “justificando” para sempre, pois vai acabar justificando a própria justificativa. Não é possível sair por aí “vendo através” de tudo para sempre. O sentido de ver através de algo está em enxergar para além desse algo,

É bom que a janela seja transparente, pois a rua ou o jardim por trás dela não

é. Como é possível ver também através do jardim? [...] Um mundo totalmente

transparente é um mundo invisível. “Ver através” de tudo é o mesmo que não veré

Se você afirmar que toda alegação de posse da verdade é um exercício de poder, então sua afirmação também é um exercício de poder. Se você afirmar (como Freud) que toda alegação de posse da verdade sobre religião e Deus não passa de uma projeção psicológica para lidar com a culpa e a insegurança, então sua afirmação também não passa disso. Ver através de tudo não é ver.

Foucault impunha a terceiros a verdade de sua própria análise mesmo negando a própria verdade como categoria. Assim, alguns tipos de alegações de posse da verdade parecem inevitáveis. A incoerência de lutar contra a opressão quando nos recusamos a admitir que a verdade existe é o motivo pelo qual a “teoria” pós-moderna e a “desconstrução” talvez estejam em declínio.” G. K. Chersterton defendeu essa postura há quase cem anos:

O novo rebelde é um cético e em nada confia [... mas] dessa forma jamais

poderá ser realmente um revolucionário, pois toda denúncia implica algum

tipo de doutrina moral. [...] Assim, o homem moderno rebelado tornou-se

praticamente inútil para todos os fins de uma rebelião. Ao rebelar-se contra

tudo, ele perdeu o direito de rebelar-se contra o que quer que seja. [...] Existe

um pensamento que interdita o pensamento. Esse é o único pensamento que

*€. 8. Lewis, The abolition of man (Collins, 1978) [edição em português: 4 abolição do homem, tradução de Remo Mannarino Filho (São Paulo: Martins Fontes, 2005)], p. 48.

"Emily Eakin, “The latest theory is that theory doesn't matter”, New York Times, April, 9, 2003, e “The theory of everything, RIP”, New York Times, October 17, 2004. Veja também Dinitia Smith, “Cultural theorists, start your epitaphs”, New York Times, January 3, 2004.

8G. K. Chesterton, em Orthodoxy: the romance offaith (Doubleday, 1990) [edição em português: Ortodoxia, tradução de Almiro Pisetta (São Paulo: Mundo Cristão, 2008)], p. 33, 41-2.

O CRISTIANISMO É UMA CAMISA DE FORÇA 65

A comunidade não pode ser totalmente inclusiva

O cristianismo exige crenças específicas para que um indivíduo faça parte da comunidade. Não está aberto a todos. Segundo os críticos, isso é socialmente desagregador. As comunidades humanas, em vez disso, deveriam ser totalmente inclusivas, abertas a todos com base em nossa humanidade compartilhada. Os defensores de tal visão observam que vários bairros urbanos abrigam moradores de raças e crenças religiosas diversas que, apesar disso, vivem e trabalham juntos como comunidade. Tudo o que se exige para essa vida comunitária é que cada um respeite a privacidade e os direitos dos outros e trabalhe para que todos tenham o mesmo acesso à educação, ao emprego e à tomada de decisões políticas. Em uma “democracia liberal” não é necessário partilhar princípios morais, dizem eles.

Infelizmente, esse pensamento é extremamente simplista. À democracia liberal se baseia em uma abrangente lista de pressupostos — a primazia dos direitos individuais sobre os coletivos, a separação entre a moralidade pública e a privada e a escolha individual como direito sagrado. Todas essas crenças são estranhas a várias outras culturas.” Assim, uma democracia liberal se baseia (como acontece em qualquer comunidade) no compartilhamento de um conjunto de crenças bastante específicas. A sociedade ocidental se baseia na comunhão de compromissos com à razão, com os direitos e com a justiça, embora não exista nenhuma definição universalmente reconhecida para esses princípios.!º Toda noção de justiça e razão está entranhada em um conjunto de crenças específicas acerca do significado da vida, crenças das quais nem todos compartilham.!! A ideia de uma comunidade totalmente inclusiva é, portanto,

Para um bom resumo dos compromissos de fé subjacentes a qualquer “democracia liberal”, veja Michael J. Perry, Under God?, p. 36. Veja também o artigo de Stanley Fish, “The trouble with tolerance”, Chronicle of Higher Education, November 10, 2006. =

“Alasdair Maclntyre, After virtue: à study in moral theory, 2. ed. (Notre Dame, 1984) [edição em português: Depois da virtude, tradução de Jussara Simões (São aro RES, 2001)], e Hess justice? Which rationality? (Notre Dame, 1988) [edição em português: Justiça de quem? Qual racionalidade?, tradução de Marcelo Pimenta Marques (São Paulo: Loyola, 1991).

“Há ótimos livros sobre esse assunto, dentre 98 quais Stephen L. Carter, 7he mi are governed (Harvard University Press, 1999), p- 90. Veja também Alisdair Maclntyre, Ea id Which rationality? (London: Duckworth, 1987); Richard John Neuhaus, 7he naked public square:

uma ilusão. 2 Qualquer comunidade humana tem em gu $

. “am barreiras, incluindo em seu círculo alguns indivíque obrigatoriamente criam ,

duos e excluindo outros. 4 bros d

. j m dos membros do conse-

Consideremos alguns exemplos. Imagine que u E

lho local da comunidade LGBT proclame: Tive uma experiência religiosa e . £ » .

agora acredito que a homossexualidade é pecado”. Passadas semanas, ele continua insistindo nisso. Imagine que um membro da Aliança contra o Casamento de Pessoas do Mesmo Sexo proclame: “Descobri que meu filho é gay e acho à . »” a

que ele tem o direito de se casar com o companheiro”. Por mais educados e flexíveis que sejam os membros de cada um dos grupos, chegará o dia em que ambos terão de dizer: “Você vai ter de pedir demissão do conselho porque já não compartilha de nosso compromisso”. A primeira das comunidades citadas tem a fama de ser inclusiva e a segunda de ser excludente, mas, na prática, ambas funcionam praticamente da mesma maneira. Cada uma delas se baseia em crenças compartilhadas que atuam como barreiras, incluindo alguns e excluindo outros. Nenhuma das duas está sendo “ignorante”, mas apenas se comportando como comunidade.

Qualquer comunidade que não cobrasse dos membros a adoção de crenças e práticas específicas deixaria de ter identidade coletiva e não seria, de fato, 1 13 Na F:

uma comunidade.” Não podemos considerar excludente um grupo apenas por religion and democracy in America, 2. ed (Eerdman -

secularism”, The Wilson Quarterly a 2000) Vei ) due MeClay, ur FE die Wei é , - Veja um diálogo sofisticado sobre o tema em

dieta , a E a the public square: the place of religious convictions in political ebate am: Rowman a i ' : S

o. o. nd Littlefield, 1997). Veja no capítulo 8 mais detalhes sobre o solo de cosmovisão necessário ao desenvolvimento dos direitos humanos 2Michel Foucault obse ê : a

pe R ro: dad aa do a ênfase da sociedade ocidental sobre os direitos individuais equentemente, de “inclusão” inori

page. de En Do en j amd as, mulheres etc. é acompanhado por uma “narrativa- - ; car ã i :

de privacidade? R ltob amos aqueles que não aceitam os conceitos de direitos individuais € Ivacidader Foucault o 1 i Ea

x vd tornara di que os que hoje questionam as visões da modernidade quanto aos Irei razão estigmatizados não co “ is” & ”

ey já a , e imorais ou “hereges” (como no período medieval), mas como “irracionais” e “não civilizados”. Veja um bom resumo da crítica de Foucault à chamada “inclusividade” ocidental em Miroslav Volf, Exclusion and embrace: a theological exploration of identit otherness, and reconciliation (Abingdon, 1996), p. 58-64. cá 3A “indeterminação radical [...] é correlato de um impulso constante de inclusão que elimina todas as fronteiras que desunem. [Mas será que isso...) não desgasta de dentro para fora a ideia de Scanned by CamScanner

O CRISTIANISMO É UMA CAMISA DE FORÇA 67

impor padrões a seus membros. Será, então, que não existe uma forma de julgar se uma comunidade é aberta e solidária em vez de ignorante e opressora? Existe, sim. Consideremos um conjunto bem melhor de testes: Que comunidade defende crenças que levam seus membros a tratar os indivíduos de outras comunidades com amor € respeito, a lhes ser úteis e atender suas necessidades? Que comunidade, em razão de suas crenças, costuma demonizar e atacar aqueles que desrespeitam suas fronteiras em lugar de tratá-los com carinho, humildade e gentileza? Devemos criticar os cristãos quando eles são censores e descorteses com os incrédulos,!* mas não devemos criticar as igrejas por manterem padrões para a admissão de membros em conformidade com suas crenças. Qualquer comunidade precisa fazer o mesmo.

O cristianismo não é culturalmente rígido

O cristianismo também tem fama de ser uma camisa de força cultural. Supostamente força indivíduos de culturas diversas a se adaptarem a um único molde de ferro e é visto como inimigo do pluralismo e do multiculturalismo. Na verdade, o cristianismo mostrou-se mais adaptável (e talvez menos destrutivo) em relação a culturas diversas do que o secularismo e várias outras cosmovisões.

O padrão de expansão do cristianismo difere daquele de qualquer outra religião. O núcleo e a maioria da população islâmica continua a habitar seu inclusão? Sem fronteiras, seremos capazes de saber apenas contra o que lutamos, mas não pelo que lutamos, A luta inteligente contra a exclusão exige categorias e critérios normativos que nos per- Mitam distinguir entre práticas repressivas [...] e não repressivas [...] Fronteira echo significa [Ja impossibilidade de identificar tanto a felicidade e o prazer quanto liberdade e justiça”. Volf, Exclusion and embrace, p. 61.

“Um exemplo óbvio foi a observação de Jerry Falwell em 7he 700 tds de Pat a, tea dos ataques de 11 de setembro. “Acredito reglmente que os ac De y “uittas e os gays e lésbicas que tentam fazer de suas práticas um est o pi ER .

Não Americana pelas Liberdades Civis (sigla em inglês, ACLU), a organização +6opie na e (etican Way, todos vêm tentando secularizar os Estados Unidos. E o ar ces pa a Ro ajudaram isso tudo a acontecer'.” A indignação : as a pesos E leg Saram Falwell a se retratar, horas depois, com relação a essa declaraç ja http Tncom/2001/U8/09/ 14/Falwell.apology, acesso em: 5 mar. 2007.) le a

local de origem — o Oriente Médio. Os territórios que originalmente foram os centros demográficos do hinduísmo, do budismo e do confucionismo continuam a sê-lo. Ão contrário, o cristianismo foi primeiramente dominado pelos judeus e concentrado em Jerusalém. Depois, passou a ser dominado pelos helenistas e concentrou-se no Mediterrâneo. Mais tarde, os bárbaros do norte da Europa foram convertidos e o cristianismo veio a ser dominado pelos povos da Europa ocidental e, em seguida, pelos da América do Norte. Hoje, a maioria dos cristãos do mundo vive na África, na América Latina e na Ásia. Em breve, o cristianismo se concentrará nos hemisférios sul e leste.

Há dois exemplos esclarecedores: em 1900, os cristãos representavam 9% da população africana e eram superados pelos muçulmanos na proporção de quatro para um. Hoje, os cristãos representam 44% da população,“ e na década de 1960 ultrapassaram em número os muçulmanos.!é Essa explosão de crescimento está agora começando na China.” O cristianismo vem crescendo não só entre os camponeses, mas também dentro do establishment social e cultural, incluindo o Partido Comunista. No ritmo atual de crescimento, em trinta anos os cristãos representarão 30% da população chinesa de um bilhão e meio de habitantes.'º

Por que o cristianismo cresceu de forma tão explosiva nesses lugares? O especialista africano Lamin Sanneh fornece uma resposta deveras interessante. Os africanos, diz ele, tinham uma longa tradição de crenças no mundo sobrenatural de espíritos bons e maus. Quando começaram a ler a Bíblia em seu idioma, vários começaram a ver em Cristo a solução definitiva para seus anseios e aspirações como africanos.! Sanneh escreve:

“Lamin Sanneh, Whose religion is Christianity? (Eerdmans, 2003), p. 15.

“Philip Jenkins, Christendom: the coming of global Christianity (Oxford, 2002), p. 56. The next Christendom: the coming of global Christianity (Oxford, 2002), p. 56.

E a 3 o - eijing: bow Christianity is transforming China and changing the global , Pp. 285.

ns con a io y voiblidade do cristianismo. Nascido em Gâmbia e e-muçulmano de tradução. Para efetivamente cai EG E Do. em o renas Apoio ma ana privilegiar uma língua significa privilegiar uma cultura, pois 4. ao er árabe. No entanto us . à, pois as palavras-chave em qualquer língua

possem um Meuifcádo arraigado nas tradições e formas de pensar da cultura. Em contraste com 0 islamismo, o cristianismo (segundo Atos dos Apóstolos) nasceu 1 X : jo no milagre de Pentecostes, quan

O CRISTIANISMO É UMA CAMISA DE FORÇA 69

O cristianismo respondeu a esse desafio histórico por meio de uma reorientação da visão de mundo. [...] As pessoas sentiram no coração que Jesus não zombava do respeito que elas tinham pelo sagrado nem do clamor por um Salvador invencível; por isso, rufaram os tambores sagrados em sua honra até fazer as estrelas dançarem no céu. Depois dessa dança, as estrelas deixaram de ser pequenas. O cristianismo ajudou os africanos a se tornarem africanos renovados, não europeus recriados.”?

Sanneh defende que o secularismo com seu antissobrenaturalismo e individualismo é muito mais nocivo para as culturas locais e para a “africanidade” do que O cristianismo. Na Bíblia, os africanos leram que Jesus tem poder sobre o mal sobrenatural e espiritual e os venceu na cruz. Quando os africanos se convertem ao cristianismo, sua africanidade é convertida, integralizada e resolvida e não substituída por um europeísmo ou outra coisa qualquer.” Por meio do cristianismo, os africanos se distanciam o bastante para criticar suas próprias tradições, porém sem abandoná-las.?

Um exemplo interessante de adaptação cultural é minha própria igreja, a Redeemer Presbyterian Church, em Manhattan. Seu crescimento nesse ambiente surpreendeu e até mesmo chocou os observadores. Eles vivem me perguntando: “Como você consegue atingir milhares de jovens em um lugar tão secularizado?”. À resposta é que O cristianismo faz em Nova York o mesmo que fez em todos os outros lugares onde cresceu. Adaptou-se significativa e positivamente à cultura local sem comprometer seus principais pilares. todos puderam ouvir o evangelho, cada um em sua língua nativa. Assim, nenhuma língua ou cultura tem precedência sobre outra. A Bíblia é traduzida para todas as culturas e línguas. Veja Lamin Sanneh, “Translatability in Islam and Christianity, with special reference to Africa”, in: Transtating the message: the missionary impact on culture (Orbis, 1987), p- 211ss.

?Lamin Sanneh, Whose religion is Christianity? (Eerdmans, 2003), p. 43.

“2 Whose religion is Christianity? p. 43-44, 69-70.

2Sanneh e Andrew F. Walls não negam que os missionários de uma cultura (por exemplo, a “Uropeia) costumam impor aos novos convertidos a forma de cristianismo de sua própria cultura. No “tinto, quando leem a Bíblia em sua língua nativa, 05 convertidos percebem elementos na Palavra Sujo impacto foi “reduzido” pelos missionários (como, por exemplo, o exorcismo), bem como ntria

cai ve a um pessgia de reação exacerba dições — rejeitando algumas partes, confirmando sia s ni reconciliam com suas aitiana etra ig coa das Escala, modificando outras ainda, tudo à luz da leitura que aum

As doutrinas básicas da Redeemer — a divindade de Cristo, a infalibilidade da Bíblia, a necessidade de um novo nascimento espiritual por meio da fé na morte expiatória de Cristo — estão em sintonia com as crenças ortodoxas, sobrenaturalistas, das igrejas evangélicas e pentecostais da Africa, da Ásia, da América Latina e do Sul e Meio-Oeste dos Estados Unidos. Essas crenças às vezes nos põem em conflito com as ideias e práticas de muita gente na cidade. Ao mesmo tempo, temos uma enorme satisfação em absorver vários outros aspectos da cultura urbana e pluralista. Enfatizamos as artes, valorizamos a diversidade racial, sublinhamos a importância de lutar pela justiça para íodos os moradores da cidade e nos comunicamos na língua e com a sensibilidade de nossa cultura urbana. Acima de tudo, sublinhamos a bênção de um Salvador que se sentava à mesa com pessoas que o sistema rotulava de “pecadoras” e amava os que se opunham a ele. Tudo isso é muito importante para o povo de Manhattan.

O resultado é que a igreja Redeemer atrai e atinge um público muito

) diverso e urbano. Em um culto dominical, minha esposa Kathy foi apresentada a um homem sentado à sua frente, levado à igreja por John DeLorean. Era o redator de discursos de um candidato à presidência pelo Partido Republicano (conservador). Pouco depois, uma senhora sentada atrás dela bateu em seu ombro, querendo lhe apresentar outro visitante. Ela havia levado à igreja alguém que, na época, era o principal compositor da cantora Madonna. Kathy ficou encantada por estarem ambos ali, mas torceu para que os dois não se encontrassem antes do fim do sermão.

Alguns anos atrás, um homem de um estado americano do Sul visitou nossa igreja. Ele ouvira dizer que embora professássemos a doutrina cristã ortodoxa, havíamos crescido em meio a uma cidade cética e secularizada. Imaginava descobrir que vínhamos atraindo público com música moderna, monitores de televisão e videoclipes, dramatizações retumbantes, um ambiente altamente fashion e outros tipos de espetáculo chamativo. Para sua surpresa, encontrou um culto simples e tradicional que, à primeira vista, parecia idêntico aos de sua cidade, mais conservadora. No entanto, também percebeu que a plateia abrigava muita gente que jamais compareceria às igrejas que ele conhecia. Após o culto, ele me procurou e disse: “sso é um mistério para mim. Cadê os ursos bailarinos? Cadê o truque? Por que essa gente vem aqui?”,

O CRISTIANISMO É UMA CAMISA DE FORÇA 71

Encaminhei-o a alguns “artistas urbanos” que frequentavam a igreja há algum tempo. Estes sugeriram que ele procurasse além das aparências. Um deles disse que a diferença entre a igreja Redeemer e outras igrejas era profunda e consistia em “ironia, caridade e humildade”. Afirmaram que a nossa não utilizava a linguagem pomposa e altamente sentimental de outras igrejas, algo que lhes parecia manipulador. Em vez disso, o pessoal da Redeemer se dirigia aos fiéis com uma ironia fina e disposto a fazer piadas sobre si mesmos. Além disso, ali se professavam as crenças com amor e humildade, fazendo o nova-iorquino de Manhattan sentir-se incluído e bem-vindo, mesmo quando discordava de algumas ideias. Eles afirmaram que, acima de tudo, a pregação e a comunicação na Redeemer mostravam inteligência e respeito, sendo sensíveis às suscetibilidades dos ouvintes.

Todos esses aspectos ressaltados foram bem recebidos em Manhattan, mas cada um deles se baseia na doutrina cristã histórica. Por exemplo, a ênfase na diversidade étnica salta aos olhos na epístola de Paulo aos efésios, capítulo 2, onde ele afirma que a diversidade étnica da igreja é um importante testemunho da veracidade da mensagem cristã. Outro exemplo disso é dado por Reinhold Niebuhr, que observa que a ironia, ou seja, achar engraçado ver como os seres humanos fracassam ao tentar ser como Deus, é uma forma muito cristã de enxergar as coisas. Visto que essa ênfase na flexibilidade tem profundas raízes na pregação cristã histórica, não se trata meramente de uma técnica de marketing.

Por que o cristianismo, mais que qualquer outra religião no mundo, foi capaz de se infiltrar em tantas culturas radicalmente distintas? Existe, é claro, um núcleo de ensinamentos (O Credo Apostólico, o Pai-Nosso, os Dez Mandamentos) com o qual todas as formas de cristianismo têm compromisso. Ainda assim, há uma boa parcela de liberdade na maneira como esses fundamentos se expressam dentro de determinada cultura. Por exemplo, a Bíblia instrui os

cristãos a se unirem em atos de louvor musical, mas não determina a métrica, 9 ritmo, o nível de expressão emocional nem os instrumentos que devem ser utilizados. Tudo isso pode assumir diversas formas de expressão cultural. O historiador Andrew Walls escreve:

“R, Niebuhr, “Humour and faith”, in: R. M. Brown, org., The essential Reinhold Niebuhr (Yale, 1986), P. 49ss., apud Sommerville, 7he decline of the secular university, p. 129. Be. Es

ig à fé cristã Atos 15, que declara

A diversidade cultural foi incorporada à fé cristã [...] em 2 que os novos cristãos gentios não precisavam adotar a cultura judaica. [...] Os convertidos tinham de desenvolver [...] uma forma helenística de ser cristão. E Rem ia ; « PEDE)

[Assim] ninguém é dono da fé cristã. Não existe uma “cultura cristã” nos moldes da “cultura islâmica”, que pode ser reconhecida desde o Paquistão até o Marrocos, passando pela Tunísia...”

Textos como Isaías 60 e Apocalipse 2122 retratam um mundo futuro a e . “ .

renovado, perfeito, no qual mantemos nossas diferenças culturais (“toda tribo, língua, povo e nação”). Isso significa que cada cultura humana possui qualidades e pontos fortes (dados por Deus) capazes de enriquecer a raça humana. Como sugere Walls, embora toda cultura tenha distorções e elementos que serão criticados e revistos pela mensagem cristã, toda cultura também possui elementos bons e ímpares compatíveis com o cristianismo e aos quais ele se adapta. | Assim é que, ao contrário do que supõe o imaginário popular, o cristia- | nismo não é uma religião ocidental que destrói culturas locais. Pelo contrário, /º cristianismo assumiu formas mais culturalmente diversas do que qualquer | Outra religião” e possui profundos estratos de noções herdadas das culturas hebraica, grega e europeia, e ao longo do próximo século será ainda mais transformado pela África, pela América Latina e pela Ásia. O cristianismo | - , Gotas E

| talvez se torne a mais genuína “visão católica do mundo”,% tendo tornado | sua liderança acessível ao longo dos séculos a indivíduos de todas as línguas, | tribos, povos e nações.

Andrew F. Wall, “The expansion of Christianity: an interview with Andrew Walls”, Christian Century, August 2-9, 2000, p. 792,

O cristianismo é a religião de mais de duas mil línguas diferentes no mundo. Mais gente ora e adora em mais línguas do que em qualquer outra religião do mundo. [...] Obviamente, esse pioneirismo cultural e linguístico entra em conflito com a reputação do cristianismo de ser um colosso de intolerânci Está

e Em pra cultural, o Re pda nos cristãos um profundo complexo de culpa, contra O qual todas as provas parecem vãs. É importante, porém, levar as pessoas a repensarem tudo isso, pois O cristianismo-padrão praticado hoje é um fragmento cultural desgastado de algo muito maior e mais novo.” Whose religion is Christianity?, p. 69-70.

“Expressão extraída de A.J. Conyers, “Can postmodernism be used as a template for Christian theology?”, Christian Scholars Review, 33 (Spring, 2004): 3, Scanned by CamScanner

O CRISTIANISMO É UMA CAMISA DE FORÇA 73

O cristianismo supostamente representa uma limitação ao crescimento e ao potencial dos indivíduos porque restringe nossa liberdade de escolher a própria crença e as próprias práticas. Immanuel Kant definiu um ser humano refinado como aquele que confia em seu poder de raciocinar, em vez de confiar na autoridade ou na tradição.” Essa resistência à autoridade em questões morais é hoje uma corrente profunda em nossa cultura. A liberdade para estabelecer nossos próprios padrões morais é vista como indispensável à plenitude humana.

Nisso, porém, há um excesso de simplificação. A liberdade não pode ser definida estritamente em termos negativos, como a ausência de restrição e limitação. Com efeito, em muitos casos, restrição e limitação acabam sendo um caminho para a libertação.

Se você tem talento musical, deve se dedicar aos estudos de piano durante vários anos. Essa é uma restrição, uma limitação à sua liberdade. Você terá de se abster de fazer várias outras coisas no espaço de tempo que estiver investindo nesses estudos. Se, porém, houver talento, a disciplina e a limitação libertarão uma habilidade que, de outra forma, permaneceria inacessível. O que fazer? Abrir mão voluntariamente da liberdade para dedicar-se a alguma coisa que viabilize um tipo mais rico de liberdade para outras realizações.

Isso não significa que restrições, disciplina e limitação sejam intrínseca e automaticamente forças libertadoras. Por exemplo, um jovem de 1,65m de altura e 56kg não deve decidir tornar-se um jogador de futebol americano. Mesmo toda disciplina e esforço do mundo não conseguirão senão frustrá-lo € esmagá-lo (literalmente). Ele estará dando murro em ponta de faca, pois não tem potencial para isso. Em nossa sociedade, muita gente se sacrifica para Seguir algumas profissões com altos salários, em vez de buscar alternativas adequadas ao talento e interesses próprios. Essas profissões tornam-se “camisas de força” que, no longo prazo, sufocam e desumanizam.

Disciplina e restrições, assim, nos libertam apenas quando se encaixam na Tealidade de nossa natureza € capacidade. Um peixe, porque absorve oxigênio

Y kevin Vanhodze r,“Pilgrim's digress: Christian thinking on and about the post/modern way”, m: Myron B. Penner, org., Christianity and the postmodern turn (Brazos, e Á

da água e não do ar, só é livre quando limitado e restrito à água. Se o pusermos num gramado, sua liberdade para movimentar-se e até para viver não aumentará, mas, ao contrário, será destruída. O peixe morrerá se não respeitarmos à realidade de sua natureza.

Em muitas áreas da vida, a liberdade está mais relacionada com a descoberta das restrições libertadoras do que com a ausência de restrições. As que se encaixam na realidade de nossa natureza e do mundo geram maior poder e abrem o leque de nossas capacidades, resultando em felicidade e realização mais profundas. Experiências, riscos c erros produzem crescimento tão somente se ao longo do tempo nos mostrarem nossos limites, bem como nossas capacidades. Se crescemos intelectual, vocacional e fisicamente apenas sob restrições criteriosas, por que o mesmo não seria válido para o crescimento espiritual e moral? Em lugar de insistir na liberdade para gerar a realidade espiritual, não deveríamos tentar descobri-la e usar de disciplina para viver de acordo com ela?

O conceito vigente de que cada um deve estabelecer sua própria moral baseia-se na crença de que a esfera espiritual nada tem que ver com o restante do mundo, Será que alguém acredita realmente nisso? Durante muitos anos, depois do culto no domingo pela manhã, eu Permanecia no auditório por mais uma hora a fim de responder às Perguntas que me eram dirigidas. Centenas de fiéis participavam desses debates. Uma das afirmações que eu mais ouvia era: “Todo o mundo precisa definir o que é certo e errado para si mesmo”. Eu sempre respondia perguntando: “Existe alguém neste momento fazendo algo que você acha que não devia ser feito embora essa pessoa considere correto seu comportamento?”. A resposta sempre era “sim”. Então, eu indagava: “Será que isso significa que você acredita que existe um tipo de moral que “se impõe”, que não é definida por nós, mas que precisa ser seguida, não importa o que pensemos ou sintamos?”. Quase sempre a resposta vinha na forma de silêncio, em sinal de reflexão ou de irritação.

O amor, a liberdade absoluta, é mais

Qual é, então, a realidade moral-espiritual que Precisamos reconhecer para prosperar? Qual é o ambiente que nos liberta quando nos Testringimos a ele, Scanned by CamScanner

O CRISTIANISMO É UMA CAMISA DE FORÇA 75

à semelhança do peixe na água? O amor. O amor é a perda de liberdade mais libertadora que existe.

Um dos princípios do amor — seja ele a base de uma amizade ou de uma relação romântica — é a necessidade de abrir mão da independência para alcançar uma intimidade maior. Se você deseja as “liberdades” do amor — a realização, a segurança e a sensação de dignidade que ele traz —, terá de limitar sua liberdade de várias maneiras. Não é possível desenvolver um relacionamento profundo e tomar decisões unilaterais ou impedir que o outro opine com relação à maneira como você leva a vida. Para desfrutar da felicidade e da liberdade do amor, é preciso abrir mão da autonomia individual. A escritora francesa Françoise Sagan expressou muito bem esse conceito em uma entrevista ao Le Monde. Ela afirmou estar satisfeita com a forma em que tinha levado a vida e disse não ter nenhum arrependimento.

Entrevistador: Então a senhora teve a liberdade que queria?

Françoise Sagan: Sim [...] logicamente, eu tinha menos liberdade quando estava

apaixonada por alguém. [...] Mas ninguém passa o tempo todo apaixonado. Afora isso, sou livre.?

Françoise Sagan tem razão. Um relacionamento afetivo limita nossas opções individuais. Mais uma vez, estamos diante da complexidade do conceito de “liberdade”. Os seres humanos se sentem mais livres e vivos quando se encontram em um relacionamento afetivo. É só no amor que nos tornamos Nós mesmos, mas os relacionamentos afetivos saudáveis implicam entrega mútua, altruísta, uma perda mútua de independência. C. S. Lewis manifestou- Sé com eloquência a esse respeito:

Ame o que quer que seja — seu coração certamente vai se apertar € poderá se )

desfazer pela dor. Se quiser garantir que ele permaneça intacto, não o entregue — à ninguém, nem mesmo a um animal. Cubra-o cuidadosamente com hobbies e | Pequenos luxos; evite qualquer envolvimento; mantenha-o seguro no caixão de | ” Mi John Stott, The contemporary Christian (IVP, 1992). A tradução em inglês da entrevista cada no Guardian Weekly, June 23, 1985.

seu egoísmo. Mas nesse caixão — seguro, escuro, imóvel e pa ii pn mudará. Não se desfará pela dor, mas se tornará duro, impenetrável, Peres, A

alternativa para a tragédia ou, no mínimo, para o risco da tragédia, é o inferno.”

Assim, liberdade não significa ausência de limitações e restrições, mas q descoberta das limitações e restrições certas, aquelas que se encaixam em nossa natureza e nos libertam.

Para que uma relação afetiva seja saudável, é preciso que haja perda mútua de independência. Não pode existir mão única. Ambos os lados têm de dizer ao outro: “Vou me adaptar a você. Vou mudar por sua causa. Vou servi-lo, mesmo que isso signifique sacrifício para mim”. Se somente um lado fizer sacrifícios e concessões e o outro apenas exigir e receber, o relacionamento será de exploração e haverá de oprimir e distorcer a vida de ambos.

À primeira vista, então, um relacionamento com Deus parece inerentemente desumanizador. Por certo terá de ser um relacionamento “de mão única”, do jeito de Deus. Deus, o ser divino, detém todo o poder. Preciso me ajustar a Deus, pois não há como Deus se ajustar e se entregar a mim.

Embora isso possa ser válido para outras formas de religião e de crença em Deus, não vale para o cristianismo. Deus ajustou-se a nós — em sua encarnação e na expiação. Em Jesus Cristo, ele se tornou um ser humano limitado, vulnerável ao sofrimento e à morte. Na cruz, sujeitou-se à nossa condição — como pecadores — e morreu em nosso lugar para nos perdoar. Da forma mais profunda, Deus nos disse em Cristo: “Vou me adaptar a você. Vou mudar por sua causa. Vou servi-lo, mesmo que isso signifique sacrifício para mim”. Se ele fez isso por nós, podemos e devemos dizer o mesmo a Deus e ao próximo. Paulo escreve “... o que nos motiva é o amor de Cristo” (QCo 5.14).

Perguntaram certa vez a um amigo de C. S. Lewis: “É fácil amar a Deus”,

ao que ele respondeu: “É fácil para aqueles que o amam”.3º O paradoxo não é tão grande quanto parece. Quando nos apaixonamos profundamente, que” remos agradar o ser amado. Não esperamos que ele nos peça algo, corremos PC. S. Lewis, The four loves (Harcourt, 1960), p. 123 [edição em português: Os quatro amores tradução de Paulo Salles (São Paulo: Wmfmartinsfontes, 2009).] “O “antigo autor” anônimo é citado em C.S. Lewis, The four loves (Harcourt, 1988), p- 140. Scanned by CamScanner

O CRISTIANISMO É UMA CAMISA DE FORÇA 77

para descobrir tudo o que possa lhe dar prazer e damos um jeito para que ele o tenha, por mais que nos custe, seja em dinheiro, seja em trabalho. “Seu desejo é uma ordem” — é o que sentimos — e nada há de opressor nisso. Quem vé de fora, pode pensar que estamos sendo comandados pelo outro, mas por dentro sentimos estar nas nuvens.

Para um cristão acontece o mesmo com relação a Jesus. O amor de Cristo motiva. Quando nos damos conta de como Jesus mudou por nossa causa e se entregou por nós, não temos medo de abrir mão de nossa liberdade, pois nele haveremos de encontrá-la.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se toda comunidade, e até toda relação de amor, exige que abramos mão de certas liberdades, por que esperamos que só o cristianismo não tenha fronteiras para ser considerado libertador?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando dizemos "cada um estabelece a sua verdade", essa frase é mesmo uma crença sua livremente escolhida, ou também foi herdada de uma cultura específica que a impôs a você?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você já considerou que a liberdade plena talvez não seja a ausência de toda restrição, mas a entrega às restrições certas, como o peixe que só é livre dentro da água?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A igreja é responsável por muitas injustiças$t$, 5,
$conteudo$“Só posso desconfiar de qualquer religião que congregue tantos fanáticos e hipócritas”, insistiu Helen, estudante de Direito. “Tanta gente não tem religião e é bem mais bondosa e até moralmente mais correta do que muitos cristãos que conheço.” “A igreja tem um histórico de apoio à injustiça, de destruição da cultura”, acrescentou Jéssica, outra estudante de Direito. “Se o cristianismo é a religião verdadeira, como isso pode acontecer?”

ME Lilla, professor da Universidade de Chicago, escreveu um relato para a revista New York Times sobre sua experiência de “novo nascimento” na adolescência. Durante a faculdade ele se “desconverteu” e abandonou a fé cristã. Como isso aconteceu? Ao se mudar de Detroit para Ann Arbor, em Michigan, Mark entrou em uma comunidade famosa em todo o país por sua vitalidade espiritual, mas que acabou se revelando uma “decepção deprimente”. A comunidade era autoritária e hierárquica, e seus membros, “dogmáticos [...] ansiosos por me colocar doutrinariamente na linha”. Desiludido com à forma agressiva e exploradora como à comunidade utilizava a Bíblia para Controlar a vida de seus membros, “encasquetei a ideia de que à Bíblia pudesse

er errada [...] Foi o primeiro passo para largar 0 mundo da fer = / Muita gente que adota uma postura intelectual it (o) Re EO º (faz a partir de um histórico de decepção com cristãos e tgrejas. Todos nós Magoo Lilla, “Getting religion: my long-lost years as à teenage evangelical”, New York Times

» September 18, 2005, p. 94-5.

manifestamos predisposições intelectuais baseadas Et experiências ue . o “sãos generosos, inteligentes, sensíveis

tivemos. Se você conheceu vários cristãos gb TS 2 k .

e esclarecidos ao longo dos anos e frequentou igrejas pie aa, porém de mente aberta e solidária, achará muito mais plausível A dleinsá intelectual do cristianismo. Em contrapartida, se sua experiência foi p e Elsie ne cristãos nominais (os que se dizem cristãos, mas não premeato A fé) ou com fanáticos donos da verdade, os argumentos em favor do cristianismo terão de ser extremamente fortes para convencê-lo de que são irrefutáveis. À conclusão de Mark Lilla de que “a Bíblia talvez esteja errada” não foi um mero ato de reflexão filosófica. Mark se ressentia do jeito como determinada pessoa, em nome do cristianismo, vinha tentando exercer poder sobre ele.

Assim, é preciso abordar o comportamento de indivíduos e grupos cristãos que comprometem à credibilidade do cristianismo para tanta gente. Três problemas se destacam. Primeiro, temos O problema das falhas gritantes de caráter em muitos cristãos. Se o cristianismo é a verdade, por que tantos não cristãos levam uma vida melhor que a dos cristãos? Em segundo lugar, vem o problema da guerra e da violência. Se o cristianismo é a verdade, por que a igreja institucional apoiou tantas vezes a guerra, a injustiça e a violência? Finalmente, temos o problema do fanatismo. Ainda que os ensinamentos cristãos tenham muito a oferecer, por que iríamos querer nos misturar com tantos fanáticos presunçosos, arrogantes e perigosos?

Copalques um que participe da vida de uma igreja logo descobrirá falhas de caráter em boa pi dos indivíduos que professam o cristianismo. As igrejas parecem se caracterizar por desentendimentos e espírito partidário maiores a ê das pa cpariações voluntárias. Igualmente, os fracassos morais

os líderes cristãos são bastante conhecidos. Talvez, seja verdade que a mídia a A ERR, ii em torná-los públicos, mas ela não os cria. As autotiffdes eclesiásticas são aparentemente tão corruptas (se não mais) quanto os líderes do mundo em geral.

Ao rena PaRDo, existem indivíduos formalmente não religiosos que levam uma vida mais exemplar do ponto de vista moral. Se o cristianismo é tudo

A IGREJA É RESPONSÁVEL POR MUITAS INJUSTIÇAS RE

o que diz ser, os cristãos não deveriam se mostrar, como um todo, melhores que os demais?

Essa suposição se baseia em uma crença equivocada relativa ao que O cristianismo de fato ensina a seu próprio respeito. A teologia cristã sempre ensinou o que se conhece como graça comum. Lemos em Tiago 1.17: “Toda boa dádiva e todo dom perfeito vêm do alto e descem do Pai das luzes”. Isso significa que, não importa o agente, todo ato de bondade, sabedoria, justiça € beleza é promovido por Deus. Ele distribui os dons de sabedoria, talento, beleza e capacidade “gratuitamente”, ou seja, sem questionar em absoluto o mérito. Ele os concede a todos os seres humanos, independentemente de convicções religiosas, raça, Sexo ou qualquer outro atributo, a fim de enriquecer, iluminar e preservar o mundo.

A teologia cristã também fala da grave falha de caráter de cristãos verdadeiros. Uma das ideias centrais da Bíblia é que só podemos nos relacionar com Deus por meio de graça pura. Nossas iniciativas morais são tão ineficazes e falsamente motivadas, que jamais nos farão merecer a salvação. Jesus, por meio de sua morte e ressurreição, viabilizou nossa salvação, que recebemos como uma dádiva. Todas as igrejas creem nisso de uma forma ou de outra. O aperfeiçoamento do caráter e as mudanças de comportamento ocorrem em um processo gradual depois da conversão. A crença equivocada de que é preciso “purificar” nossa vida a fim de merecer a presença de Deus não é cristianismo. Isso significa, contudo, que a igreja está cheia de gente imatura e ferida que tem pela frente um longo caminho para crescer emocional, moral e espiritualmente. É como diz o ditado: “A igreja é um hospital para pecadores, não um museu para santos”.

Bom caráter é algo que a grande maioria atribui a um ambiente familiar e social acolhedor, seguro e estável, condições pelas quais não somos responsáveis. Muitos, em vez disso, têm um histórico familiar instável, modelos falhos “Um passado de tragédias e decepções. Em consequência, carregam o peso de inseguranças profundas, hipersensibilidade e falta de autoconfiança. É possível de, em virtude disso, precisem lutar contra a raiva descontrolada, a timidez, Vícios e outras dificuldades.

Imagine agora que alguém com um passado muito conturbado se converta 20 cristianismo e seu caráter melhore consideravelmente. Ainda assim, essa

pessoa talvez continue a ser menos segura é autodiscip TE que aiguém que, por ser muito ajustado, não sinta necessidade especial de pertencer a religião alguma. Suponha que você seja apresentado à ambas na mesma semana. A menos que conheça o ponto de partida e a jornada de vida de cada uma, você poderá facilmente concluir que o cristianismo não é lá essas coisas, e que os cristãos são incoerentes com seus próprios padrões elevados. E comum “É . . . o: “e 1 1

que indivíduos cuja vida foi mais dura e se encontram “mais abaixo na escala de caráter” tenham maior probabilidade de reconhecer sua necessidade de Deus e de se voltar para o cristianismo. Assim, pode-se esperar que a vida de muitos cristãos não pareça melhor quando comparada à de outros sem religião? (exatamente como a saúde dos pacientes em um hospital é comparativamente pior que a dos visitantes de museus).

Será que a religião ortodoxa não conduz inevitavelmente à violência? ai Hitchens, autor de God is not great: how religion poisons everything; iz que sim. í “Religiã j isódi iolênci

a dies No capítulo “Religião Mata”, ele relata episódios de violência e . “=

a nada o religião que testemunhou pessoalmente em Belfast, Beirute, ombaim, Be - Á é ioj

, Belgrado, Belém e Bagdá. Seu argumento é que a religião agrava as Se o que você quer é um argument istiani

did g o contra o cristianismo [...] poderá facilmente encontrar algum cristão tolo e medíocre e dizer [...] Então aí está E 9 .. aí está seu alardeado novo homem! Prefiro O

velho”. Mas se já começou a ver que o cristiani

bes io ismo sobre outros fundamentos é viável, no fundo

você saberá que isso significa apenas fugir do assunto. O ê sobre a alma das outras pessoas — suas t õ dedo pr

Emo s tentações, oportunidades e lutas? Há uma alma que você conhece de verdade em toda a criação: ela é a única cujo desti á [5 E jo destino está em suas mãos. Se existe um

eus, você se encontra, em certo sentido, sozinho com ele. Nã Psi A ele. Não pode afastá-lo com especulações

peito de seus vizinhos nem com lembranças do que leu em liv ã essas conversas e boatos quando a bruma anestésica que cham a hora o indo real se dissipar e a Presença Divi oi O

p nça Divina na qual você sempre estev imedi

E TUvaDO, fé Levi Mio Ea e se tornar palpável, imediata

PC > , e Christianity (Macmillan, 1965) p. 168 [ediçã li ERA & . Á dá

Cristianismo puro e simples, tradução de Álvaro Oppermann e Marcelo É Ed ia . á i é i

Paulo: Wmfmartinsfontes, 2009)]. ias Pg ai

3Edição em português: Deus não é grande: como a religiã

; gtão envenena tudo, t ã dre

Martins (Rio de Janeiro: Ediouro, 2007). PR

A IGREJA É RESPONSÁVEL POR MUITAS INJUSTIÇAS 83

diferenças raciais € culturais. “A religião não é diferente do racismo”, escreve. «Jma versão dela inspira e provoca a outra. A religião tem sido um enorme À L e . .

multiplicador de desconfiança e ódio tribais...”.*

f O argumento de Hitchens é justo. A religião “transcendentaliza” as t - .

diferenças culturais comuns, fazendo as partes sentirem que travam uma j batalha cósmica entre O bem e o mal. Por isso, Hitchens defende que a o » E - . ma . . . .

“religião envenena tudo”. É o que parece. As nações cristãs institucionalizaram + o imperialismo, à violência e a opressão, por meio da Inquisição e do comércio t de escravos africanos. O império totalitário e militarista japonês de meados do ha)

' século 20 brotou de uma cultura profundamente influenciada pelo budismo k e o xintoísmo. O islã é o terreno de boa parte do terrorismo atual, enquanto as forças israelenses quase sempre se mostram violentas em sua reação. Os nacionalistas hindus, em nome da religião, executam ataques sangrentos contra igrejas cristás e contra mesquitas muçulmanas. Todas essas provas parecem indicar que a religião agrava as diferenças humanas até que estas explodem em u guerra, violência e opressão das minorias.

» “Christopher Hitchens, God is not great: hoxw religion poisons everything (Hachette, 2007), p. 35-6. U “Hoje, alguns pensadores laicos insistem na ideia de que toda religião possui em si as sementes n$ da opressão. Essa visão, contudo, deixa de levar em conta as enormes diferenças entre as religiões e seus conceitos de conversão. O budismo e o cristianismo, por exemplo, exigem profunda transformação interior baseada na decisão individual. A obediência forçada a regras externas é considerada ” espiritualmente letal. Assim, essas religiões têm uma probabilidade muito maior de buscar uma ' sociedade que valorize a liberdade religiosa, de modo que os indivíduos possam aprender a verdade x e se entregar livremente a ela. Max Weber e outros demonstraram que as doutrinas cristãs, princiy palmente em sua forma protestante, fornecem uma base para direitos e liberdades individuais, que a” pica nda

A conduz ao crescimento tanto da democracia quanto do capitalismo. Outras filosofias e religiões Ui e . 4 . . . “

A valorizam menos a liberdade de escolha individual. Exemplo disso é a diferença entre o cristianismo e € 0 islamismo quanto ao significado da conversão. A conversão cristã implica passar do estágio de LA “conhecer a respeito” de Deus para o estágio de “conhecer pessoalmente” a Deus. A maioria dos mu- TÁ gulmanos rotularia como arrogância falar em conhecer a Deus de modo íntimo e pessoal. Todavia, / alguém criado em um lar cristão pode falar da sua conversão aos dez, aos quinze ou aos vinte anos. EA Alguém criado em um lar muçulmano jamais falaria que se converteu ao islamismo. Essa diferença É de entendimento significa que os cristãos não consideram muito útil exercer pressão social sobre os À Ê indivíduos a fim de convertê-los ou de mantê-los na fé cristã. O islamismo, contudo, não vê problema algum na aplicação de pressão legal ou social a fim de manter os cidadãos em harmonia com seus / Compromissos muçulmanos. (Meu agradecimento à Don Carson por esse insight.) Scanned by CamScanner

Essa visão, porém, apresenta problemas. Os regimes e da E “da China e do Camboja no século 20 rejeitaram ia e qualquer e 6180 e a crença em Deus. Precursora disso foi a Revolução ia que Fejettou q religião tradicional por razões humanísticas. Essas oa eram racionais e laicas, mas todas produziram uma violência maciça contra a população mesmo sem a influência da religião. Por quê? Alister McGrath observa que, uma vez eliminada a noção de Deus, à sociedade “transcendentaliza” outra coisa, algum outro conceito, à fim de parecer moral e espiritualmente superior. Os marxistas transformaram o Estado em um ente absoluto, ao passo que os nazistas fizeram o mesmo com à raça € o sangue. Mesmo os ideais de liberdade e igualdade podem ser usados dessa forma para justificar a violência contra os oponentes. Em 1793, quando foi parar na guilhotina em razão de denúncias forjadas, Madame Roland curvou-se diante da estátua que personificava a liberdade na Praça da Bastilha e disse: “Liberdade, quantos crimes são cometidos em teu nome”.º

A violência cometida em nome do cristianismo é uma realidade terrível e precisa ser vista e revista. Nada a desculpa. No século 20, porém, a violência se inspirou tanto no secularismo quanto no absolutismo moral. As sociedades que se despojaram de todo tipo de religião foram tão opressoras quanto as que dela se imbuíram. Só nos resta concluir que existe um impulso violento tão profundamente enraizado no coração humano, que ele se expressa independentemente das crenças manifestas em qualquer sociedade, seja ela socialista ou capitalista, religiosa ou laica, individualista ou hierárquica. No final das contas, e presença de violência e espírito bélico em uma sociedade não refuta necessariamente as crenças que ali predominam.

Tila ê maior empecilho ao cristianismo para o cidadão médio hoje seja mais a sombra do fanatismo do que a violência ou o espírito bélico. SAlister McGrath, The Dawkins delusion? Athei :

(InterVarsity, 2007), p.81 [edição em português: ri ns Peça fado ee ateísta de Richard Dawkins, tradução de Sueli Saraiva (São Paulo: Mundo E re À

A IGREJA É RESPONSÁVEL POR MUITAS INJUSTIÇAS 85 |

Muitos incrédulos têm amigos ou parentes que “nasceram de novo” € perderam as estribeiras, de imediato passando a expressar desaprovação à vários grupos e setores da sociedade, principalmente a filmes e programas de televisão, ao Partido Democrata, aos homossexuais, aos evolucionistas, ativistas, membros de outras religiões e aos valores ensinados nas escolas públicas. Quando defendem a verdade da própria fé, quase sempre esses indivíduos se mostram intolerantes e arrogantes. Isso é o que muita gente chamaria de fanatismo.

Muitos tentam entender os cristãos dentro de um espectro que vai do «mominalismo” em um extremo ao “fanatismo” no extremo oposto. Um cristão nominal é aquele que apenas se autodenomina cristão, que não pratica a religião e pouco acredita nela. Fanático é o cristão cujas fé e prática vão além do razoável. Dentro desse espectro, o melhor tipo de cristão ficaria no meio termo, ou seja, alguém que crê mas não exagera em sua devoção. O problema de tal abordagem é a suposição de que a fé cristã é basicamente uma forma de aperfeiçoamento moral. Assim, cristãos fervorosos seriam moralistas fervorosos ou, como chamados no tempo de Jesus, fariseus. Os fariseus acreditam estar em paz com Deus em resultado de sua moral e obediência doutrinária. Isso leva, naturalmente, a uma sensação de superioridade em relação aos que não compartilham de sua religiosidade, decorrendo daí várias formas de abuso, exclusão e opressão. Essa é a essência do que consideramos fanatismo. Mas, e se considerarmos que à essência do cristianismo é a salvação pela graça, uma salvação que não decorre do que fazemos, mas do que Cristo fez por nós? Crer que Deus nos aceita por pura graça nos deixa profundamente contritos. Por isso o fanatismo não deriva do excesso de compromisso com o evangelho e, sim, da falta de compromisso com ele.

Pense naqueles que você considera fanáticos. São todos insolentes, donos da verdade, obstinados, insensíveis € duros. Por quê? Isso não se deve a um excesso de cristianismo, mas à falta dele. Eles são fanaticamente zelosos e Corajosos, mas não fanaticamente humildes, sensíveis, acolhedores, solidários, tolerantes ou compreensivos como Cristo. Por encararem o cristianismo como Um programa de autoaperfeiçoamento, eles imitam o Jesus das repreensões aos vendilhões do templo, mas não o Jesus que disse “Quem dentre vós estiver sem Pecado seja o primeiro a atirar uma pedra...” (Jo 8.7). O que nos impressiona » Á

como claro sinal de fanatismo é, de fato, a falta de um pleno compromisso com Cristo e com seu evangelho.

A crítica bíblica da religião

O extremismo e o fanatismo, que conduzem à injustiça e à opressão, representam perigo constante dentro de qualquer comunidade religiosa. Para os cristãos, contudo, o antídoto não consiste em baixar o tom e moderar a própria fé, mas, sim, em abraçar uma fé em Cristo mais plena e verdadeira. Os profetas bíblicos entendiam muito bem isso. Com efeito, o acadêmico Merold Westphal documenta como a análise da religião elaborada por Marx como instrumento de opressão foi antecipada por profetas hebreus como Isaías, Jeremias, Amós e até mesmo pela mensagem dos Evangelhos no Novo Testamento. Marx, segundo Westphal, não mostrou originalidade em sua crítica da religião — a Bíblia se antecipou a ele!”

Jesus faz uma crítica de peso à religião. Seu famoso Sermão da Montanha (Mt 5—7) não reprova os indivíduos sem religião, mas, sim, os religiosos. Em seu famoso discurso, ele censura aqueles que oram, dão esmolas aos pobres e procuram viver conforme a Bíblia, mas fazem tudo isso para obter louvor e poder. Acreditam que terão influência sobre os outros, até mesmo sobre Deus, graças a seu desempenho espiritual (“... pensam que serão ouvidos pelo muito falar”; Mt 6.7). Isso os torna juízes e censores, sempre prontos a fazer críticas, mas não dispostos a aceitá-las. São fanáticos.

a Em 2 o esus Fria vezes diz Fio respeitáveis e virtuosos: Eae Tg go publicanos e as prostitutas estão entrando antes de vós no reino de Deus” (Mt 21.31). Usando uma linguagem veemente, Jesus EsnnE ni o sa gd própria, o preconceito, bem como o apego à riqueza e ao poder (... limpais o exterior do copo e ato: so interior está cheio de cobiça e maldade [...] rt a

'Merold Westphal, Suspicion and faith: the religious uses of modern atheism (Eerdmans, 1993), caps. 32-34. Veja página 203: “Eu gostaria de [...] acusar Marx de Plágio. Sua crítica do capitalismo é, basicamente, a preocupação bíblica com as viúvas e os órfãos, despida de seu fundamento teológico e aplicada às condições da modernidade”.

A IGREJA É RESPONSÁVEL POR MUITAS INJUSTIÇAS 87

fardos difíceis de carregar, mas vós nem com um dedo tocais esses fardos. [...] E devoram as casas das viúvas, simulando longas orações”; Lc 11.39-46; 20.47). Não deveria nos causar surpresa a descoberta de que Jesus foi condenado à morte pelo sistema religioso vigente, que cria na Bíblia. Conforme observa o teólogo suíço Karl Barth, foi a igreja, e não o mundo, que crucificou Cristo.* Jesus seguiu o exemplo de profetas hebreus como Isaías, que diziam ao povo da época:

Ainda assim eles me procuram todo dia; têm prazer em conhecer os meus caminhos, como se fossem um povo que pratica a justiça e que não abandonou a ordenança do seu Deus. Pedem-me juízos corretos, têm prazer em se chegar a Deus! Por que jejuamos, dizem eles, e não atentas para isso? Por que nos humilhamos, e tu não o sabes? No dia em que jejuais, cuidais dos vossos negócios e exigis que se façam todos os vossos trabalhos. Jejuais para brigas e rixas, para ferirdes com punho pecador! Se quiserdes que a vossa voz se faça ouvir no alto, não jejueis como fazeis hoje. Seria esse o jejum que escolhi? Um dia para que o homem se humilhe, incline a cabeça como o junco e deite-se em pano de saco e cinza? Chamarias isso jejum e de dia aceitável ao SENHOR? Por acaso não é este o jejum que escolhi? Que soltes as cordas da maldade, que desfaças as ataduras da opressão, ponhas em liberdade os oprimidos e despedaces todo jugo? Não é também que repartas o pão com o faminto e recolhas em casa os pobres desamparados? Não é que vistas o nu, o cubras [...)? (Is 58.2-7) O que os profetas e Jesus Cristo criticavam? Eles não se opunham à oração e ao jejum nem à obediência às orientações que a Bíblia dá para a vida. A tendência dos indivíduos religiosos, porém, é de usar à obediência espiritual e Ética como trunfo para obter poder sobre os demais e sobre Deus, agradando à ele por meio de rituais e boas obras. Isso leva tanto a uma ênfase sobre as Manifestações externas de religiosidade quanto à ganância, ao materialismo e à opressão no âmbito social. Os que acreditam que agradaram a Deus graças à Qualidade de sua espiritualidade e à retidão moral decerto sentem que, juntamente com seu grupo, merecem ser tratados com deferência pelos demais e Westphal, Suspicion and faith, p. 205.

rofetas, contudo, salva plenaexercer poder sobre eles. O Deus de Jesus € ai , ae ' Plena una mpenho religioso e m

mente pela graça. Ele não € manipulado pelo dese x E e oral, i endimento e da desistênci

mas pode ser alcançado somente por meio do arrep ea

do poder. Se somos salvos unicamente pela graça, Bratos e ercam. Je ;

procurar servir espontaneamente à Deus e aos que nos cer a md e 4 i -se grande, será

rou os discípulos: “Antes, quem entre vós quiser tornar-se & , Será esse o = . ê 4 4 »

que vos servirá; e quem entre vós quiser ser o primeiro, será servo de todos (Mc 10.43-45).

Na crítica de Jesus e dos profetas, a religião da justiça própria vem sempre marcada pela insensibilidade com relação a questões de justiça social, ao passo que a fé verdadeira é marcada por uma preocupação profunda com os pobres e marginalizados. O teólogo suíço João Calvino, em seus comentários sobre os profetas hebreus, diz que Deus se identifica de tal forma com os pobres que o clamor deles expressa a dor divina. A Bíblia nos ensina que à maneira como os tratamos equivale à maneira como tratamos à Deus.”

Embora de vez em quando a igreja tenha participado da opressão aos povos e isso seja indesculpável, é importante reconhecer que a Bíblia fornece no âmbito da fé instrumentos para análise e para crítica inflexível à injustiça apoiada pela religião. O historiador C. John Sommerville afirma que até os E religiosos que fazem críticas ferrenhas ao cristianismo usam recursos

o próprio cristiani a : sia nica

P 4 Ed smo para denunciá-lo.!º Muitos criticam a igreja por sua sede de poder e i : ari

que ab j k pela falta de humildade, mas existem várias culturas em

usca de poder e respeito é i ; z

ra E speito é considerada uma virtude. De onde, então,

mmerville, surgiu essa li : '

identificar os pecad d E seo Rg pre pena RE

E greja? Na verdade, ela surgiu dentro da fé crista.

o exemplificar essa ideia para seus al À o É

realizar ia unos, Sommerville os convida º

uma experiência de raciocínio. Ele ob Ê

da Europa pré-cristã pu PERA ums ms REA do norê

P à, como os anglo-saxões, tinha i das no

conceito de h , m sociedades baseadas

o de honra. Tratava-se de culturas ali

em queena funil icerçadas na aversão pela vergonha,

que era fundamental conquistar e exigir : ;

gir respeito de terceiros. Os mongº

Veja Provérbios 14.31; 19.17; Mateus 25.31-46. A obs ã

comentário sobre Habacuque 2.6 e é mencionada em Wes e is is EA A

“C. John Sommerville, The decline of the secular univ : » Suspicion and faith, p. 200.

ersity (Oxford University Press, 2006), P- 63.

A IGREJA É RESPONSÁVEL POR MUITAS INJUSTIÇAS 89

cristãos que tentavam convertê-las tinham um conjunto de valores baseados na caridade, no desejo do melhor para o próximo. Para identificar a diferença, 5 ommerville pede aos alunos que imaginem uma velhinha caminhando pela pua à noite com uma bolsa enorme. Por que não derrubá-la e tirar-lhe a bolsa? A resposta de uma cultura adepta do binômio honra-vergonha é que você não lhe tira à bolsa porque abusar do mais fraco faz de você um indivíduo ignóbil. Ninguém o respeitará e você também não se respeitará. À ética, claro, é autocentrada. Seu foco está voltado para a mancira como a ação afetará sua honra e reputação. Existe, porém, outra linha de raciocínio. Você pode imaginar como seria doloroso ser assaltado e como o prejuízo financeiro seria nefasto para quem depende da vítima. Por isso você não rouba a bolsa da velhinha porque deseja o melhor para ela e para seus dependentes. Trata-se de uma ética altruísta, segundo a qual você pensa apenas no próximo.

Ao longo dos anos, Sommerville descobriu que a maioria de seus alunos raciocinava conforme a segunda ética, a altruísta. Como historiador, ele então lhes mostrou como a postura moral que demonstravam tinha raízes cristãs. O cristianismo modificou essas culturas baseadas na honra, em que o orgulho valia mais que a humildade, em que dominar valia mais que servir, em que a coragem era preferível ao pacifismo, a glória à modéstia e a lealdade à própria tribo superava o respeito equânime por todos.»

As críticas que os não religiosos costumam fazer à opressão e às injustiças da igreja cristã brotam, na verdade, dos próprios recursos da autocrítica do cristianismo, As falhas da igreja podem ser historicamente entendidas como a adoção imperfeita da prática dos princípios do evangelho cristão. Sommerville afirma que, quando ouviram pela primeira vez a mensagem do evangelho cristão, os anglo-saxões se mostraram incrédulos. Não conseguiam entender Como uma sociedade seria capaz de sobreviver sem O medo e o respeito pela força, Quando se converteram, estavam longe de ser coerentes e tinham a tendência de misturar a ética altruísta cristã com seus antigos conceitos. Apoiaram as Cruzadas como forma de proteger à honra de Deus e de si Próprios, Permitiam que monges, mulheres e servos cultivassem à virtude da Caridade, mas não consideravam essa prática apropriada aos homens honrados

: : exista tanta coisa condenável na história da

tivos. Não é de admirar que : :

e ativos. = ão dos padrões cristãos equivaleria a nos deixar sem igreja. No entanto, abrir mão os p

e cui 01 tadoras ao currículo

Qual é a resposta, então, à críticas muito justas e devastad ioçã E aa 4 cristã, pois isso nos deixari

da igreja cristã? A resposta é 7140 abandonar a fé cristã, Po a, Agra s para fazer correções. Em

ao mesmo tempo, sem 08 padrões e sem ; h e profunda o que é ; ais plena é

vez disso, deveríamos tentar entender de forma mais P a q ae di : ve a religião cometesse

o cristianismo. À própria Bíblia nos ensinou a esperar q e one p : istória cristã

abusos e também nos disse o que fazer nesses casos. Por isso, a a crista nos dá vários exemplos notáveis de autocorreção. Examinemos dois casos que talvez sejam os principais.

A justiça em nome de Jesus

Uma profunda mácula na história cristã é o comércio de escravos africanos. Como o cristianismo prevalecia nas nações que compravam € vendiam escravos naquela época, as igrejas, juntamente com o restante da sociedade dessas nações, têm de assumir a responsabilidade pelo ocorrido. Embora a escravidão o» alguma forma fosse praticamente universal em todas as culturas ao longo os séculos, coube aos cristãos, antes dos demais, concluir que a prática era errada. O historiador social Rodney Stark escreve:

' omum negá-lo, as doutrinas antiescravagistas começaram a apare” cer na teologia cristã lo á ini

E go após o declínio de Roma, acompanhadas pelo desaparecimento da escravidão do

Da : em quase toda a Europa cristã. Quando posteriormente ituíram a escravidão no

mente oposiçã re Novo Mundo, os europeus foram de encontro à vet” sição pa at ianci ;

ja papal, fato que, por conveniência, “sumiu” da história até pouco tempo atrás. Finalmente, a abolição da esc :

vida e conquistad o. ravatura no Novo Mundo foi promo”

quistada por ativistas cristãos.!3

; ney Stark, For the glory of God: how monot ep E 3

the end of slavery (Princeton University Press 2003), p.29 o reformations, science, witch-hunts, O? os movimentos abolicionistas. *P-291. Veja nas Pp. 338-53 uma visão geral sobre Scanned by CamScanner

A IGREJA É RESPONSÁVEL POR MUITAS INJUSTIÇAS 91

Os cristãos começaram a atuar em prol da abolição não por uma compreensão disseminada dos direitos humanos, mas porque eles a viam como violação da vontade de Deus. Às formas mais antigas de servidão dos tempos bíblicos quase sempre foram duras, mas os abolicionistas cristãos concluíram que à escravidão baseada na raça e na propriedade vitalícia de outro ser humano, estabelecida por meio de sequestro, não era compatível com os ensinamentos bíblicos nem do Antigo nem do Novo Testamento.'* Ativistas cristãos, como William Wilberforce, na Grã-Bretanha, e John Woolman, nos Estados Unidos, e muitos outros dedicaram toda a vida, em nome de Cristo, a abolir a escravidão. O comércio de escravos era tão lucrativo que havia grande incentivo dentro da igreja para justificá-lo. Muitos líderes eclesiásticos defendiam a instituição. A batalha em prol da autocorreção foi colossal.”

Quando os abolicionistas finalmente conseguiram preparar a sociedade britânica para a abolição da escravatura no império britânico, os agricultores nas colônias previram que a emancipação custaria enormes quantias aos investidores e que os preços das mercadorias dispararia catastroficamente. Isso não deteve os abolicionistas na Câmara dos Comuns. Eles concordaram em indenizar os agricultores por todos os escravos libertos, uma soma assombrosa que chegava à metade do orçamento anual do governo britânico. A lei de emancipação foi promulgada em 1833, e os custos para o povo inglês foram de tal ordem que um historiador chamou a abolição britânica da escravatura de “econocídio voluntário”.

Rodney Stark observa como os historiadores têm tentado desesperadamente entender por que os abolicionistas se dispuseram a sacrificar tanta coisa para abolir a escravidão. Ele cita o historiador Howard Temperley, que diz que à história da abolição é estranha, pois a maioria dos historiadores acredita que

“Veja Deuteronômio 24.7 e 1Timóteo 1.9-11, que proíbe o sequestro. Muita gente (tanto dentro quanto fora da igreja cristã) supõe que a Bíblia apoie a escravidão. Veja mais detalhes no Capítulo 6.

“Veja em The Civil War as a theological crisis, de Mark Noll (University of North Carolina, 2006), um debate amplo de como os cristãos discutiram à escravidão por meio de diferentes inter- Pretações das Escrituras. O livro de Noll demonstra como alguns líderes da igreja utilizaram textos da Bíblia relativos à escravidão para justificar o comércio de escravos. Estavam, no entanto, cegos às diferenças entre a escravidão africana caracterizada pela propriedade vitalícia de outro ser humano e à escravidão de que trata a Bíblia (para pagamento de dívida e não vitalícia).

tamento político é :nteresseiro. No entanto, p

todo comporta do ao longo dos últimos cinquenta anos alguma de especialistas terem buscado ao long ea À trar que o

T ley diz que “ ninguém conseguiu perpicas qq

expiação, py y vidão [...) acabaram ganhando algo tangível [...] nem , elo fim da escra :M k Du ds

pd ã ão onerosas para O país”. A escravidão foi

que essas medidas não foram sena a cadê dizê-lo.1º O à

stã rimeiros a dizê-lo. aabolida porque era errada, e os cristãos foram Os P inda E . Edita íti tos de injustiça apoiados

relho de autocorreção do cristianismo, SUá crítica aos à ERAS igiã ja se imposto.

pela religião, havia o = .

Outro caso clássico é o movimento dos Direitos Civis nos Estados Unidos em meados do século 20. Em um importante histórico do movimento dos Direitos Civis, David L. Chappell demonstra que, em princípio, ele não foi político, mas religioso e espiritual. Os liberais brancos do Norte, aliados aos líderes dos direitos civis afro-americanos, não propuseram a desobediência civil nem algum ataque direto à segregação. Dada a crença laica na bondade da natureza humana, eles acharam que a instrução e a educação acabariam levando inevitavelmente ao progresso social e racial. Chappell argumenta que os líderes negros se apoiavam muito mais na compreensão bíblica da pecaminosidade do coração humano e nas denúncias de injustiça que liam nos profetas hebreus. Chappell também mostra que a fé vibrante dos afro-americanos comuns foi o que lhes conferiu poder par insistir na predomínio da justiça apesar da violenta oposição a tais ideias.

ssim, afirma Chappell, não há como entender o que aconteceu enquanto não encararmos o movim irei vi : a

nd 0 : ento dos Direitos Civis como um avivamento religioso.” uando contronto Í irei -

cao u o racismo nas igrejas dos brancos no Sul, Martin

SENTO Ç “9 Pp as igrejas sulistas a serem mais laicas. Basta ler seus mões ea Carta da Prisão irmi »

Ele invocou a lei moral de D de Birmingham” para constatar seus argumentos eimor

eu si e Deus e as Escrituras. Conclamou os cristãos brancos à s às su

Ea as crenças e a se darem conta do que a Bíblia de fato ensina. Ele não disse “ , que a Bíblia de fa

O disse “a verdade é relativa e todo indivíduo é li : ue é certo ou errado para si Pai MORA a

para os brancos do Sul abrirem mã ir e

ão do poder que detinham. Em vez disso;

o For the glory of God (Princeton, 2002), p. 350ss

: avid L. Chappell, 4 stone of hope: prophetic religi ' e orth Carolina Press, 2003). g1on and the death ofJim Crow (University Scanned by CamScanner

A IGREJA É RESPONSÁVEL POR MUITAS INJUSTIÇAS 93

Luther King invocou o profeta Amós, que disse: “Corra porém a justiça como as águas, € à retidão, como O ribeiro perene” (Am 5.24). O maior defensor da justiça de nossos tempos sabia que o antídoto para o racismo não era menos csistianismo, mas um cristianismo mais profundo e verdadeiro.

Wilberforce € Luther King não foram, em absoluto, os únicos líderes que combateram à injustiça em nome de Jesus Cristo. Depois da eliminação do apartheid na África do Sul, todos esperavam um banho de sangue entre as exvítimas prontas a se vingar de seus perseguidores e os ex-opressores dispostos ase defender utilizando a força. Em vez disso, líderes cristãos como Desmond Tutu instalaram a notável Comissão Sul-Africana da Verdade e Reconciliação em meados da década de 1990. O título expressa seus princípios e missão. As vitimas eram convidadas a contar publicamente suas histórias. Também os responsáveis por atos de violência e opressão foram convidados a contar a verdade e pedir anistia. Nenhum dos lados foi dispensado de comparecer perante a comissão, que ouviu relatos de violações dos direitos humanos e ponderou a concessão de anistia sob todos os ângulos, tanto da parte dos ex-defensores do apartheid quanto do Congresso Nacional africano. O comitê, embora não isento de falhas e críticas, ajudou na transição para o regime de maioria com um derramamento de sangue muito menor que O esperado.

No final do século 20, a igreja católica do Leste europeu se recusou à morrer sob o regime comunista. Por meio de “paciência, velas e cruzes”, deu início a uma cadeia de acontecimentos que derrubou todos aqueles regimes totalitários, O padre polonês Jerzy Popieluszko, por meio de pregação e ati- Yismo, liderou o movimento em prol de um sindicato de livre comércio na Polônia comunista no início da década de 1980. Quando foi assassinado pela E secreta, 250 mil pessoas compareceram a seu enterro, incluindo Lech

visa, cujo movimento Solidariedade ajudaria à derrubar o governo comuus in compareceram af, rmárcháraro em ia inte a

movie, cia secreta com a faixa “Nós perdoamos . Os pilares cristãos do o de resistência foram inequívocos.

“Um relato da resistência da igreja católica ao comunismo nas décadas de 1970-80 consta 7 Capítulo 17 a o » in: Charles Colson e Ellen Vaughn, 7he bod! (Momas Ns sob o título “Between two crosses”, in: Charles Yaughn, !y

Existe uma longa lista de mártires que cerraram fileiras em favor dos oprimidos em nome de Jesus Cristo, como o arcebispo Oscar Romero, de | Salvador. Romero foi nomeado arcebispo em virtude de sua visão doutrinária conservadora e ortodoxa. No novo cargo, viu provas irrefutáveis de abuso crônico e violento dos direitos humanos por parte do governo. Começou falar destemidamente contra isso e por esse motivo foi morto a tiros em 1980 enquanto celebrava uma missa.

O famoso mártir luterano Dietrich Bonhoeffer era pastor de duas igrejas de língua alemã em Londres quando Hitler assumiu o poder. Recusou-se a manter essa distância segura e voltou a seu país para presidir um seminário clandestino da Igreja Confessante, formada pelas congregações que se negaram a assinar um juramento de fidelidade aos nazistas. Bonhoeffer escreveu seu clássico The cost of discipleship,!º no qual critica a religião e a igreja da época. Lembrando Jesus e os profetas, Bonhoeffer revelou a apatia espiritual e a complacência que tornavam possível a tanta gente cooperar com Hitler e fingir não enxergar aqueles que os nazistas marginalizavam e destruíam de forma sistemática. Bonhoeffer acabou preso e enforcado.

Em suas últimas cartas, escritas na prisão, Bonhoeffer revela como à fé cristã lhe fornecera recursos para abrir mão de tudo em prol do próximo. Marx defendia que se você acredita em outra vida depois desta não se importará em fazer deste mundo um lugar melhor. Também é possível defender o oposto: Se este mundo é tudo que existe, e se o amor, o conforto e a riqueza que aqui desfruto serão os únicos que jamais terei, por que sacrificá-los em prol de terceiros? Bonhoeffer, contudo, depositava tamanha alegria e esperança em Deus que foi capaz de fazer o que fez:

O cristão não é produto de um ato religioso, mas da participação nos sofrimem

tos de Deus na vida secular. Isso é metanoia [arrependimento]; não pensa” em

primeiro lugar nas necessidades, nos problemas, pecados e temores pessoais, mas permitir-se ser levado pelo caminho trilhado por Jesus Cristo. [...] O sofrimento

é um anjo santo. [...] Por meio dele os homens têm crescido mais que po” ue

de todas as alegrias do mundo. [...] A dor da ansiedade, muitas vezes sentida

“Edição em português: Discipulado, tradução de Ilson Kayser (São Leopoldo: Sinodal, ad

A IGREJA É RESPONSÁVEL POR MUITAS INJUSTIÇAS 95

sicamente há que estar presente, e não devemos nem precisamos afastá-la, mas sic , .

erá-la sempre que necessário, e para isso existe um anjo ainda mais santo que sup

o do sofrimento, à saber, o anjo da alegria em Deus.”

Por que mencionar todos esses exemplos? Eles comprovam que O pr Luther King estava certo. Quando alguém comete injustiças em nome L . 4.

de Cristo não está sendo fiel ao espírito daquele que morreu como vitima e ,

da injustiça e pediu que seus inimigos fossem perdoados. Quando alguém dá a vida para libertar o próximo, como Jesus fez, está pondo em prática o verdadeiro cristianismo ao qual Martin Luther King, Jr. Dietrich Bonhoeffer e outras vozes cristãs conclamaram.

1 Djoni nã ition, edição de Eberhard

Ret Dietrich Bonhoeffer, Letters and papers from prison: enlarged edi dat q o ' ge (Macmillan 1971), p. 418 [edição em português: Resistência e submissão: cartas e anotações cri , » Pai

“sn prisão, tradução de Nélio Schneider (São Leopoldo: Sinodal, 2003)) Scanned by CamScanner$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Quando condenamos a hipocrisia e a violência cometidas por cristãos, em nome de qual padrão de justiça estamos julgando, e de onde vem a autoridade desse padrão?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se o próprio Jesus denunciou os religiosos hipócritas com mais dureza do que qualquer cético, será que as falhas da igreja contradizem o cristianismo ou justamente confirmam o que ele já dizia sobre o coração humano?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você permitiu que a decepção com algum cristão ou alguma igreja fechasse a porta para examinar a pessoa de Cristo, que não se confunde com quem o representou mal?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Como pode um Deus de amor mandar alguém para o inferno$t$, 6,
$conteudo$Como pode um Deus de amor mandar

“Duvido da existência de um Deus que julga e exige sangue para aplacar sua ira”, comentou a confusa Hartmut, uma universitária alemã. “Alguém precisou morrer para que o Deus cristão nos perdoasse. Por que ele não pode simplesmente erdoar? Além disso, existem todas aquelas passagens no Antigo Testamento em Pp q passag: 8

que Deus ordena o massacre de seres humanos.”

“Tudo isso é desconcertante, concordo”, comentou Josie, funcionária de uma galeria de arte no Soho. “Mas meu maior problema é a doutrina do inferno. O único Deus em quem consigo crer é um Deus de amor. O Deus da Bíblia não passa de uma divindade primitiva que precisa ser aplacada com dor e sofrimento.” | ja 2005, Rick Warren, pastor de uma megaigreja e autor do best-seller The purpose-driven life! falou a importantes jornalistas em um seminário Patrocinado pela Pew Foundation. Alguns dos presentes mostraram incômodo diante das implicações de uma doutrina cristã específica, a saber, que Deus condena certos indivíduos à punição eterna. Um participante disse a Rick Warren: Talvez o senhor possa lidar com a seguinte contradição: Wendy [uma repórter não cristã presente] é uma cidadã americana merecedora da mesma proteção que O membro mais antigo da sua igreja merece. Mas, quando morrer, ela irá para o inferno porque não é salva. Eu lhe pergunto: O senhor acha que seus seguidores p 'Edição em português: Uma vida com propósitos, tradução de James Monteiro dos Reis (São aulo: Vida, 2003).

— ou aqueles que frequentam a igreja, os que leem seus livros, os que ouvem Suas

palestras em todo o mundo — são intelectualmente sofisticados a ponto de lidar

Warren respondeu que sua igreja não via contradição alguma nisso, mas não convenceu boa parte dos jornalistas, que alegaram que qualquer cristão que ache que existem pessoas destinadas ao inferno deve considerá-las des;. guais da perspectiva de dignidade e valor. Com essa alegação, eles refletiram as profundas dúvidas de muita gente hoje com relação ao conceito de um Deus que julga os seres humanos e os manda para o inferno. Essa crença, insistiram os jornalistas, leva à exclusão, ao abuso, à desunião e até mesmo à violência,

Em nossa cultura, o julgamento divino é uma das doutrinas mais ofensivas do cristianismo. Como ministro e pregador, frequentemente me vejo abordando textos bíblicos que falam da ira de Deus, do juízo final e da doutrina do inferno. Durante muitos anos realizei sessões de perguntas e respostas logo apóso encerramento de cada culto. Nela os nova-iorquinos costumavam me crivar de perguntas sobre esses ensinamentos. Considero perfeitamente compreensíveis as profundas dúvidas que eles demonstravam com relação a esse aspecto da religião cristã histórica. Embora essa objeção ao inferno e ao juízo final possi parecer mais uma sensação de repulsa do que uma dúvida, é possível encontrar subjacente a ela uma série de crenças bem específicas. Examinemos uma à um. Não é possível que exista um Deus que julga

A obra de grande influência Habits of the heart [Hábitos do coração), de Robert Bellah, fala de um “individualismo expressivo” que domina à cultur americana. Em seu livro, Bellah observa que 80% dos americanos concorda” com a afirmação de que “um indivíduo deve chegar às suas crenças religios independentemente de qualquer igreja ou sinagoga”.* Sua conclusão é que Key

?Conferência bianual Faith Angle sobre religião, política e vida pública do Pew Forum e” s West, na Flórida, em 23 de maio de 2005. Transcrição disponível em: petp://pevrforum org!" index.php?EventID=80, acesso em: 5 set. 2005. e:

“Robert Bellah et al., Habits of'the heart: individualism and commitment in American lifes ) (University of California Press, 1985), p. 228.

como PODE UM DEUS DE AMOR MANDAR ALGUÉM PARA O INFERNO? 99 crença mais básica ia entar ienieana é que a verdade moral guarda relação com à consciência individual. até, a cultura americana não vê problema em um Deus de amor que nos apoia, não importando a forma como vivemos. No entanto, ela se opõe profundamente à ideia de um Deus que pune os indivíduos por causa de suas crenças sinceras, mesmo que equivocadas. Essa objeção, porém, carrega um histórico cultural.

Em seu clássico The abolition ofman, C. S. Lewis apresenta o que considera uma diferença importante entre as visões antiga e moderna da realidade. Lewis ataca nossa crença esnobe de que os antigos acreditavam em magia e que mais tarde isso foi superado com o surgimento da ciência moderna. Como especialista em Idade Média e no processo que abriu caminho para a modernidade, Lewis sabia que houve bem pouca magia na Idade Média e que o auge da magia situou-se nos séculos 16 e 17, exatamente na época em que se desenvolvia a ciência moderna. A mesma causa, defendeu ele, deu origem a ambas.

As ações sérias da magia e as ações igualmente sérias da ciência são gêmeas: uma

estava doente e morreu, a outra era forte e vicejou. No entanto, são gêmeas. Nas-

Lewis descreve esse impulso — uma nova abordagem da realidade moral € espiritual.

Existe algo que une a magia e a ciência aplicada ao mesmo tempo em que as separa da “sabedoria” dos primeiros tempos. Para os sábios de antigamente, o problema crucial era como conciliar alma e realidade, e a solução foi o conhecimento,

à autodisciplina e a virtude. Tanto para a magia quanto para à ciência aplicada,

9 problema é como sujeitar a realidade aos desejos dos homens: a solução é uma

técnica, e ambas, no exercício dessa técnica, estão dispostas a fazer coisas até então consideradas repugnantes e ímpias.º

im português: 4 abolição do homem, tradução de Remo Mannarino Filho (São Paulo,

sido oo na . Ilins, 1978), p. 46. Sobre esse assunto, veja também da É “ S. demão, Rb ata of man (Co pra Fada api

Engl, Clos nglish Mirra m the sixteenth eapacar g

Leis et (Oxford University Press, 1953), p: 134.

Na antiguidade, acreditava-se haver uma ex moral transcendente ex terna, embutida na trama do universo. di violasse essa or Heim Metafisio, sofreria consequências tão sérias como se violasse a realidade física pondo q mão no fogo. O caminho da sabedoria era aprender a viver em conformidade com essa realidade inflexível. Tal sabedoria dependia em grande parte do de. senvolvimento das virtudes do caráter como humildade, compaixão, Coragem, prudência e lealdade.

A modernidade reverteu esse quadro. À realidade absoluta passou a se vista não tanto como uma ordem sobrenatural mas como o mundo natural e este era maleável. Em lugar de tentar moldar nossos desejos para ajustá-los à realidade, procuramos agora controlar e moldar a realidade para ajustá-la nossos desejos. Os antigos olhavam para um indivíduo ansioso e prescreviam uma mudança de caráter espiritual. A modernidade, em vez disso, recomenda técnicas de controle do estresse.

Lewis sabia que os leitores poderiam achar que ele fosse contrário ao método científico como tal, mas insistia que não. No entanto, ele queria que percebêssemos que a modernidade nasceu em “sonhos de poder”. Escrevendo durante a Segunda Guerra Mundial, Lewis se encontrava em meio a um dos frutos mais amargos do espírito moderno. Seu amigo J. R. R. Tolkien escreveu O senhor dos anéis, sobre as consequências da busca do poder e do controle em lugar da sabedoria e da alegre fruição da “dádiva” da criação de Deus.”

O espírito de modernidade, então, nos atribuiu a responsabilidade de determinar o certo e o errado. Nossa nova confiança de que é possível controlar o meio físico extrapolou, de modo que agora também nos achamos capazes & remodelar o reino metafísico. Portanto, parece-nos injusto ter de determini que é certo ter relações sexuais fora do casamento e depois descobrir que exist? um Deus que vai nos punir por isso. Acreditamos tão piamente em nossos di reitos individuais nessa esfera que a simples ideia de um juízo final divino nos parece impossível. No entanto, como nos mostra Lewis, essa crença está ligada

7Em sua biografia de Lewis, Alan Jacobs observa que ele se esforçou para deixar claro E nada tinha contra o método científico per se, Esse método, com efeito, pressupõe a uniformida . da natureza, e vários acadêmicos observaram que foi a cosmovisão cristã que forneceu tal e Lewis, porém, enfatiza que a ciência io nasceu com “sonhos de poder”. Veja Jacobs,

Narnian: the life and imagination of C. 8. Lewis (Harper San Francisco, 2005), p. 184-7. | | Á

COMO PODE UM DEUS DE AMOR MANDAR ALGUÉM PARA O INFERNO? 101 a uma busca de controle e poder que gerou consequências terríveis na história mundial recente. Nem toda a raça humana hoje aceita a visão moderna da realidade. Por que deveríamos agir como se ela fosse inevitável?

Em um de meus debates após o culto, uma mulher me disse que a simples ideia de um Deus que julga lhe parecia ofensiva. Respondi: “Por que você não se sente ofendida pela ideia de um Deus de perdão?”. Ela se mostrou confusa. Prossegui: “Com todo respeito, peço a qualquer um que considere ofensivo o ensinamento cristão sobre o inferno que reflita sobre seu ambiente cultural”. Acrescentei em seguida que os ocidentais secularizados se sentem incomodados pelas doutrinas cristãs sobre o inferno, mas apreciam o ensinamento bíblico que recomenda oferecer a outra face e perdoar os inimigos. Pedi-lhe, então, que refletisse sobre a maneira como alguém de uma cultura muito diferente encara o cristianismo. Nas sociedades tradicionais, “oferecer a outra face” não faz sentido algum, pois é um ensinamento que se choca com as noções mais profundas do que é certo. Para estes, porém, a doutrina de um Deus que julga não apresenta problema algum. Essas sociedades veem com repulsa os aspectos do cristianismo que os ocidentais apreciam, mas são atraídas pelos aspectos que os ocidentais secularizados não toleram.

E concluí: por que a suscetibilidade cultural ocidental deve ser o foro decisivo para julgar a validade do cristianismo? Perguntei com delicadeza à mulher se ela considerava sua cultura superior às culturas não ocidentais. Imediatamente ouvi um “não”. “Então, por que as objeções que sua cultura faz ao cristianismo devem se impor às objeções de outras culturas?”

Imaginemos, hipoteticamente, que o cristianismo não seja o produto de qualquer cultura, mas, com efeito, a verdade transcultural de Deus. Nesse caso, Seria de esperar que ele contradissesse e ofendesse toda e qualquer cultura em algum momento, pois as culturas humanas são mutáveis e imperfeitas. Se 9º Cristianismo fosse a verdade, teria de ser ofensivo e corrigir suas ideias em algum ponto. Talvez o ponto esteja aí, na doutrina cristã do juízo divino.

Um Deus que julga não pode ser um Deus de amor

Segundo O cristianismo, Deus é ao mesmo tempo um Deus de amor e de *

—  Stiça, Muita gente resiste a essa ideia e acredita que um Deus de amor não “4 «á

: maioria dos outros ministr epode ser um Deus de justiça. Como à rgunta: “Como é hi

lho em nossa sociedade, já ouvi milhares de vezes a E gu: a E possível ; : io de ira e fúria? de ele é amoque um Deus de amor também seja um Deus cheio re AR mo

roso e perfeito, deveria perdoar e aceitar todo mundo. Não ar irado”,

Sempre começo minha resposta observando que todas as pessoas amorosas às vezes ficam iradas exatamente por causa do amor e não apenas a despeito dele. Se você ama alguém e descobre que este alguém está sendo destruído — ainda que por si mesmo —, você fica com raiva. Nas palavras de Rebecca Pippert em seu livro Hope has its reasons [À esperança tem suas razões]:

Imagine como nos sentimos quando vemos alguém que amamos ser consumido

por ações ou relacionamentos imprudentes. Reagimos com a mesma tolerância

benigna que teríamos com um desconhecido? De jeito algum. [...] A raiva não é

o oposto do amor. O ódio, sim, e a pior forma de ódio é a indiferença. [...] A ira

de Deus não é uma explosão de mau humor, mas sua oposição firme ao câncer

[...] que devora as entranhas da raça humana que ele ama com todo o seu ser

A Bíblia diz que a ira de Deus flui de seu amor e deleite por sua criação. Ele se ira diante do mal e da injustiça porque estes destroem a paz e a integridade da criação.

O SENHOR é justo em todos os seus caminhos e bondoso em todas as suas obras.

O SenHor preserva todos os que o amam, mas destrói todos os ímpios.

E neste ponto que muitos se queixam de que os que creem em um Deus de justiça não se aproximam dos inimigos com desejo de reconciliação. Se voce crê em um Deus que pune os malfeitores, é bem provável que considere jus”

tificável você mesmo puni-los um pouco. O croata Miroslav Volf, teólogo d Ea a ia "uízo

Yale que testemunhou a violência nos Bálcãs, não encara a doutrina do ju? de Deus dessa maneira. Ele escreve:

Rebecca Pippert, “What kind of God gets angry? (cap. 4), in: Hope has its reasons (Harp 1990).

COMO PODE UM DEUS DE AMOR MANDAR ALGUÉM PARA O INFERNO? 103

Se Deus não se irasse diante da injustiça e do engodo e não pusesse um ponto final na violência, este Deus não mereceria ser louvado. [...] O único meio de impedir que recorramos à violência é insistir que ela é legítima apenas quando emana de Deus. [...] Minha tese de que a prática da não violência exige a crença na vingança divina desagradará muita gente [...] no mundo ocidental. [...] [No entanto] é necessário um lar num bairro residencial muito tranquilo para que nasça a tese de que a não violência humana [resulta da crença na) recusa de Deus em julgar. Em uma terra esturricada pelo sol e encharcada de sangue de inocentes, essa tese invariavelmente morrerá [...] [juntamente com] outros agradáveis grilhões da mente liberal.”

Nesse trecho fascinante, Volf argumenta que a falta de fé em um Deus que toma para si a vingança “alimenta secretamente a violência”. O impulso humano para fazer os que cometem violências pagarem por seus crimes é quase incontrolável, e não pode ser superado com frases de efeito do tipo “Você não está vendo que a violência não resolve?”. Se você viu sua casa ser incendiada e seus parentes, mortos e estuprados, esse argumento é ridículo e não demonstra nenhuma preocupação com a justiça. No entanto, as vítimas da violência são atraídas para muito além da justiça, para a vingança que diz: “Você cegou um de meus olhos e por isso vou cegar seus dois olhos”. Elas são tragadas inexoravelmente para um ciclo interminável de violência, de golpes e contragolpes alimentados e justificados pela lembrança de males terríveis.

Será que nossa paixão por justiça pode ser satisfeita, mas de uma forma que não alimente nosso desejo de vingança sangrenta? Volf afirma que o único Tecurso para tornar isso possível é a crença no conceito da justiça de Deus. Se não acreditarmos que existe um Deus que no final vai reparar tudo, havereema de desembainhar a espada e seremos sugados pelo redemoinho da retaliação, Apenas se tivermos certeza de que existe um Deus que reparará todos OS erros e acertará com perfeição todas as contas seremos capazes de refrear esse impulso.

“Miroslay Volf, Exclusion and embrace: a theological exploration of identity, otherness, and recon- “liation (Abingdon, 1996), p. 303-4.

» Exclusion and embrace, p

Czeslaw Milosz, poeta polonês ganhador do Prêmio Nobel, escreveu o

notável ensaio The discreet charms of nibilism [Os encantamento discreto do

niilismo]. Nele, o autor recorda que Marx chamou a religião de “ópio do povo” porque a promessa de uma vida após a morte (segundo Marx) levava os pobres e a classe operária a suportar condições sociais injustas. No entanto, prossegue Milosz:

E agora testemunhamos uma transformação. O verdadeiro ópio do povo é a crença no nada após a morte — o enorme consolo de imaginar que nossas traições,

ganância, covardia e assassinatos não serão julgados [...] [mas] todas as religiões reconhecem que nossos feitos são imperecíveis.”

Muitos se queixam de que a crença em um Deus de justiça levará a uma sociedade mais cruel. Milosz comprovou pessoalmente, tanto no nazismo

como no comunismo, que a perda da crença em um Deus de justiça pode levar

à crueldade. Se formos livres para moldar a vida e a moral da forma como desejarmos sem ter de prestar contas no final, isso poderá levar à violência. Volf e Milosz defendem que a doutrina do juízo final de Deus é um suporte necessário aos nossos atos de amor e de promoção da paz.

Um Deus de amor não permitiria a existência do inferno

Ora”, você talvez diga, “combater o mal e a injustiça no mundo é uma coisa, mas mandar gente para o inferno é outra. A Bíblia fala de punição eterna. Como isso pode ser compatível com o amor de Deus? Não consigo aceitar nem sequer a ideia de inferno com um Deus de amor”. Como lidar com essa objeção compreensível?

O indivíduo moderno acha inevitavelmente que o inferno funciona assim: Deus nos dá um tempo, mas se não fizermos as escolhas corretas até o final da vida, ele condena nossa alma ao inferno por toda a eternidade. Enquanto despenca no espaço, a pobre alma implora piedade, mas Deus lhe diz; “Tarde demais! Você teve sua oportunidade! Agora vai sofrer!”. Essa caricatura

UCzeslaw Milosz, “The discreet charm of nihilism”, in: New York Review of Books, Novembe!

coMO PODE UM DEUS DE AMOR MANDAR ALGUÉM PARA O INFERNO? 105 interpreta de modo equivocado a própria natureza do mal. A imagem bíblica equeo pecado nos afasta da presença de Deus, que é a fonte de toda a alegria e com efeito, de todo amor, de toda sabedoria e de todo tipo de coisas boas. Conto no início fomos criados para estar próximos de Deus, só diante de sua Arce crescemos, florescemos e realizamos plenamente nosso potencial. Perder por completo sua presença é o inferno — a perda de nossa capacidade de dar ou receber amor ou alegria.

Uma imagem comum do inferno na Bíblia é o fogo.'? O fogo desintegra. Mesmo nesta vida somos capazes de ver a desintegração da alma causada pelo egocentrismo. Sabemos como o egoísmo e o narcisismo levam à amargura aguda, à inveja nauseante, à ansiedade que paralisa, aos pensamentos paranoicos e às negações e distorções mentais que acompanham tudo isso. Faça agora a si mesmo a seguinte pergunta: “E se quando morrermos não desaparecermos, se nossa vida continuar eternamente?”. O inferno, assim, é a trajetória de uma alma que leva uma vida narcisista e autocentrada para todo o sempre.

A parábola de Jesus sobre o rico e Lázaro em Lucas 16 respalda a noção de inferno aqui apresentada. Lázaro é um homem pobre que mendiga no porão de um rico cruel. Ambos morrem, e Lázaro vai para o céu, ao passo que o fico vai para o inferno. De lá, o rico vê Lázaro no céu, “Junto de Abraão”.

E, clamando, disse: Pai Abraão, tem misericórdia de mim e envia-me Lázaro,

Para que molhe na água a ponta do dedo e me refresque a língua, pois estou

atormentado nestas chamas. Abraão, porém, disse: Filho, lembra-te de que

em tua vida recebeste bens, mas Lázaro, por sua vez, recebeu males; agora ele aqui é consolado, e tu, atormentado. Além disso, há um grande abismo entre nós e vós, de forma que os que quisessem passar daqui para vós não

P Oderiam, nem os daí passar para nós. Então ele disse: Eu te imploro, ó pai,

ia descrições e gás a ne e ei na Bíblia a parar ria

5, ag Passo nes ii o Aperttneiá do as ne es lica a forma alguma que o céu to inferno em é trevas na ara e Pera sso g pads RA mi

“Queça) ão céu he De Eai a E são realidades, mas também indica

| alinguagem íblia afirma claramente que seu ein em

kh que os descreve é alusiva, metafórica e parcial.

que O mandes à família de meu pai, porque tenho cinco jmios ter para 08 advertir, a fim de que eles também não venham para este lugar de

tormento. Abraão lhe disse: Eles têm Moisés e os Profetas; que : ousam

Ele respondeu: Não, pai Abraão! Se alguém dentre a mortos for ; E com

eles, irão se arrepender. Abraão, porém, lhe disse: Se não erp nem

os Profetas, tampouco acreditarão, mesmo que alguém ressuscite dentre os

O impressionante é que mesmo diante da inversão de situações, O rico parece cego ao que está acontecendo. Ele ainda espera que Lázaro seja seu servo € o trata como menino de recados. Ele não pede para sair do inferno, mas dá a entender claramente que Deus nunca lhe deu, nem à sua família, informações suficientes sobre a vida após a morte. Comentaristas observam a incrível dose de negação, de transferência de culpa e de cegueira espiritual nesta alma no inferno. Observam ainda que o rico, ao contrário de Lázaro, jamais é citado pelo nome, mas chamado apenas de “homem rico”, insinuando

nitidamente que já que sua identidade se apoiava na riqueza e não em Deus, uma vez perdida a riqueza, perde-se toda a noção de identidade. Em resumo, o inferno é a escolha voluntária de uma identidade separada de be Rngna pesjetsiia rumo à eternidade. Vemos esse processo “em pequena cede nos dios em drogas, álcool, jogo e pornografia. Primeiro ocorre à uma satisfação cada vez menor isa j Esma sensação, o que conduz à viciado culpa cada vez mais rias as à . 'sofa a à medida quê o seu comportamento. “Ninguém entende! rã : Fim as Just

pronunciada com uma dose cada vez euos F oco par ao pune Quando construímos nossa vida com base ro pede . epreentaiáio. | Ema coisa — apesar de boa — transforma-se ão “EA que não seja Lis | desintegração pessoal ocorre em uma escala mais um vício que escraviza. | desintegração prossegue indefinidamente. Cresce Ia Na eternidade, tal | ilusão e a auto-obsessão. Quando se pé for cor O isolamento, a negação, à | se o contato com a realidade. Ninguém jamais a lefo a humildade, perde- | própria ideia de céu passa a parecer tapeação Ea fm fi fl Scanned by CamScanner

coMo PODE UM DEUS DE AMOR MANDAR ALGUÉM PARA O INFERNO? 107

Em sua alegoria The great divorce,º C. S. Lewis descreve um ônibus cheio

de gente que, vindo do inferno, chega à fronteira com o céu. Os passageiros

ão instados à deixar para trás os pecados que os condenaram ao inferno, mas

se recusam a fazê-lo. As descrições das personagens são impressionantes, pois

nelas reconhecemos o autoengano e o narcisismo presentes em “pequena escala” em nossos próprios vícios.

O inferno começa com um humor ranzinza, sempre queixoso, sempre imputando culpa aos outros [...] mas você ainda consegue se distinguir no meio disso, pode até criticar esse comportamento em si mesmo e desejar livrar-se dele. No entanto, talvez chegue o dia em que isso já não seja possível. Então, não existirá mais este você para criticar o humor ou até para desfrutá-lo, restando apenas as queixas, repetidas indefinidamente como uma máquina. Não se trata de “sermos mandados” por Deus para o inferno. Em cada um de nós existe algo que está crescendo, que virá a SER o inferno, a menos que o cortemos pela raiz."

Os seres no inferno sofrem, mas Lewis nos mostra por quê. Tão destruidoras quanto chamas incontroláveis, vemos sua arrogância, sua paranoia, a autopiedade e a certeza de que todos os outros estão errados, todos os outros são idiotas! A humildade se perdeu por completo, assim como a sanidade. Eles estão encarcerados para sempre na prisão do egocentrismo, e seu orgulho cresce aos poucos até se tornar uma nuvem em forma de cogumelo cada vez maior. Para sempre continuarão a se despedaçar, culpando qualquer um que não seja eles mesmos. Em grande escala, isso é O inferno.

Portanto, a imagem de Deus lançando seres humanos em um abismo onde eles imploram: “Sinto muito, me deixe sair!” não passa de uma imagem

«Edição em português: O grande abismo, tradução de Ana Schiffer (São Eri ari So mil delta sobre a semelhança do pecado com f vita em == no : e dl e

: addiction” (cap. 8), in: Not the way it3 supposed a be: a breviary cs k o E e 1964) —omplação de citações de Lewis a part de três Dão a - ei, à E Marcel B Ledição sa português: Cristianismo paper E ok as great divoree (Macmillan, 1963), p. pa e a DR ge eradução de Ana Schiffer (São Paulo: Vida,

» — 200), « [edição em portuguis: er ideia o Hheology and ethics (Eerdmans, 1970), po 1 i a uble with X”, in: God in the dock: essays om 8) Scanned by CamScanner

eiros do ônibus do inferno na parábola de preferem

caricata. Os passag Ka bter a salvaçã

“l; de”, conforme eles próprios definem, a O vação,

ficar com sua “liberdade , co f dá

; Deus, de alguma forma perderiam

Têm a ilusão de que, se glorificassem a f8, lh f

j trágica ironia, a escolha que fizeram

poder e liberdade, mas em uma suprema € s a LL mo di Lo.

. k nham. inferno, co 1Z Lewis

arruinou o potencial de grandeza que Ea E , R > ;

é “o maior monumento à liberdade humana. Como se lê ci ormos 24,

Deus “os entregou [...] ao desejo [...] de seus oorngEs nal e está apenas concedendo aos seres humanos o que eles mais desejam, incluindo a liberdade em relação a ele próprio. O que poderia ser mais justo? Lewis escreve:

Existem apenas dois tipos de indivíduos — os que dizem a Deus “seja feita a

vossa vontade” e aqueles a quem Deus diz no fim “seja feita a vossa vontade”,

Todos os que estão no inferno escolheram estar lá. Sem esse livre arbítrio não

haveria inferno. Uma alma que, com seriedade e constância, deseje a alegria

jamais deixará de tê-la”.16

O inferno e a igualdade humana

Voltemos aos jornali éti .

T ' eoalstas céticos do Pew Forum com Rick Warren. A preocupação que eles dem fire :

sm são q monstravam era que qualquer cristão que acredite que ; pessoas estão destinadas ao inferno necessariamente as considera inferiores, menos merecedoras Di h

pação dt de uma int de ter seus direitos respeitados. Essa preocu-

E , Pretação equivocada do ensinamento bíblico sobre

a natureza da salvação e da condenação.

ereta -S. Lewis, a jornada até o inferno é um processo que pode m 2 , go RA tão inofensivo quanto um humor ranzinza.

caso Do di e tficar em meio aos fiéis em um culto dominical, s reunidos no Yankee Stadium ou entre os apreciadores de ópera na i :

p é EA do Metropolitan quem acabará no céu ou no inferno. O crente convict: j i . :

o de hoje talvez seja o apóstata de amanhã, e o incrédul a” , ulo convicto

Extraído de C. S. Lewis, The problem ofpain (Macmillan 1961) . . O problema do sofrimento, tradução de Alípio Franca (Sã o »P. 116 [edição em português: (Macmillan, 1963), p. 69. ão Paulo; Vida, 2006)]; The great divorce Scanned by CamScanner

coMO PODE UM DEUS DE AMOR MANDAR ALGUÉM PARA O INFERNO? 109

hoje, O convertido de gba, Não esnA como julgar de forma decisiva o stado OU o destino espiritual de alguém.

e Depois de falar sobre a fé cristã a um grupo reunido em uma residência em Manhattan, fui de ado por pie mulheres que tinham ouvido minha palestra. Ambas me isseram pe eredicar no juízo eterno fazia de mim uma pessoa bem ignorante. seguem es então: “Vocês acham que estou errado sobre essas questões religiosas e eu acho que vocês estão erradas. Por que isso não as torna tão ignorantes quanto eu?”. Uma delas respondeu: “É diferente. Para você, estamos perdidas para sempre! Não pensamos o mesmo sobre você, e isso O torna mais ignorante do que nós”. Não concordei com elas e usei o seguinte argumento:

Tanto o cristão quanto o indivíduo secularizado acreditam que o egocentrismo e a crueldade geram consequências bastante prejudiciais. Por acreditarem que a alma é imortal, os cristãos igualmente creem que os erros morais e espirituais afetam a alma para sempre. Indivíduos secularizados e liberais também acreditam na existência de graves erros morais e espirituais, como a exploração e a opressão, mas por não crerem na vida após a morte, não acreditam que as consequências das transgressões se estendam eternidade afora. Acreditar que as transgressões geram consequências com duração infinitamente mais longa torna os cristãos mais ignorantes que os não cristãos?

Imagine dois indivíduos discutindo a natureza de um biscoito. Jack acha que o biscoito é venenoso, e Jill não concorda com ele. Jack acha que a noção equivocada de Jill sobre o biscoito acabará, na melhor das hipóteses, levando-a Para o hospital, enquanto Jill acha que a visão equivocada de Jack sobre o biscoito o impedirá de saborear uma deliciosa guloseima. Será que Jack é mais Snorante que Jill apenas por achar que as consequências do Equiraço dela “ão mais graves? Creio que ninguém diria que sim. Ora, os pera não são ini por acharem que o raciocínio € O comportamento equivocados

qt meu tempo de faculdade, quando tinha vinte e poucdê rá sei €1, como muitas outras pessoas, à religião cristã na qual fui criado. Havia da e”

razões subjetivas para meu questionamento. 10) eiigfiandsnTo o ne parecia real do ponto de vista empírico. Eu não havia desenvolvido m ' ito de pa e jamais tinha vivido uma experiência pessoal com Deus. Além disso, eu vinha tendo problemas intelectuais com O cristianismo, patients estes que abordo em outros pontos deste livro. De um deles, porém, tratarei agora mesmo.

Incomodavam-me os cristãos que enfatizavam o fogo do inferno e a condenação. Como muitos de minha geração, eu acreditava que, se existe uma essência em todas as religiões, essa essência é um Deus de amor. Eu queria acreditar em um Deus de amor que aceita os seres humanos independentemente de suas crenças e práticas. Comecei à estudar as outras grandes religiões do mundo — budismo, hinduísmo, islamismo, confucionismo e judaísmo. Até hoje tiro proveito desses estudos. No entanto, minha pesquisa sobre as outras religiões provou que eu estava errado quanto a esse ponto específico da centralidade de um Deus de amor.

Não encontrei nenhum outro texto religioso, exceto a Bíblia, que dissesse que Deus criou o mundo inspirado por amor e aprazimento. A maioria das antigas religiões pagãs acreditava que o mundo foi criado por meio de lutas e batalhas violentas entre deuses que se opunham uns aos outros e forças sobrenaturais. Decidi examinar com mais profundidade o budismo, a religião que mais me agradava na época. Entretanto, apesar de sua grande ênfase no altruísmo e no serviço abnegado prestado aos outros, o budismo não acreditava em nenhum Deus pessoal, e o amor é um ato pessoal.

Mais tarde, após me tornar pastor, durante vários anos fui preletor e debatedor em um programa mensal de debates na Filadélfia entre uma igreja cristá e uma mesquita. Todo mês um preletor da igreja e outro da mesquita apresentavam as perspectivas da Bíblia e do Alcorão sobre algum tema. Quando tratávamos do amor de Deus, a diferença entre nossas convicções revelava-Se impressionante. Várias vezes ouvi de preletores muçulmanos que Deus realmente era amoroso no sentido de ser misericordioso e bondoso conosco. No entanto, quando os cristãos referiam-se ao Senhor como nosso cônjuge; falavam de conhecer a Deus íntima e pessoalmente e de experimentar o poder do derremarmento desse amor em nosso coração por meio do Espírito Santo, nos” sos amigos muçulmanos fechavam a cara. Em sua opinião, era falta de respeito dizer que alguém pudesse conhecer pessoalmente a Deus. |

coMO PODE UM DEUS DE AMOR MANDAR ALGUÉM PARA O INFERNO? 111 Hoje, muitos céticos com quem falo dizem, como já fiz um dia, que são incapazes de acreditar no Deus da Bíblia, que pune e julga as pessoas, porque acreditam em um Deus de amor”. Pergunto agora: o que os faz pensar que Deus é amor? Será que podem olhar para a vida no mundo atual e dizer: “Tal coisa prova que o Deus deste mundo é um Deus de amor”? Será que podem olhar para a história e dizer: “Tudo isso demonstra que o Deus da história é um Deus de amor”? Será que podem ler os textos religiosos de todo o mundo e concluir que Deus é um Deus de amor? O amor não é, de modo algum, o atributo divino dominante conforme se depreende de qualquer das religiões principais. Sou forçado a concluir que a fonte da noção de que Deus é amor seja a própria Bíblia. E ela nos diz que o Deus de amor é também um Deus de justiça que, no final, reparará todas as coisas neste mundo. Crer em um Deus de puro amor — que aceita todos e não julga ninguém — é um grande ato de fé. Não apenas nos faltam provas disso na ordem natural, como também não há apoio para essa ideia em nenhum texto histórico ou religioso fora do cristianismo. Quanto mais examinamos tal noção, menos Justificada ela parece.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se o inferno é, em parte, Deus respeitando para sempre a escolha de quem insiste em viver longe dele, ele ainda lhe parece uma imposição arbitrária ou o desfecho de uma liberdade levada a sério?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Um Deus que nunca se indignasse com a crueldade, a opressão e o mal do mundo seria mais amoroso ou seria simplesmente indiferente ao sofrimento das vítimas?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando você diz que só consegue crer num Deus de puro amor sem juízo, não estaria, sem perceber, desejando um Deus que jamais o confronte com a verdade sobre si mesmo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A ciência desacreditou o cristianismo$t$, 7,
$conteudo$A ciencia desacreditou o cristianismo

“Minha formação científica torna difícil, se não impossível, aceitar os ensinamentos do cristianismo”, disse Thomas, jovem asiático residente de medicina. “Como evolucionista, não posso aceitar os relatos pré-científicos da Bíblia sobre a origem da vida.”

“E a Bíblia está cheia de relatos de milagres”, acrescentou Michelle, estudante de medicina. “Simplesmente não é possível que tenham acontecido.” P Pp q

0) Best-serLERS de Richard Dawkins, Daniel C. Dennett e Sam Harris partem do princípio de que a ciência em geral e a ciência evolucionista em particular tornaram desnecessária e obsoleta a crença em Deus. Dawkins fez a famosa afirmação de que “embora, antes de Darwin, o ateísmo possa ter sido embasado pela lógica, Darwin tornou possível ser um ateu intelectualmente "alizado”! Em The God delusion ele vai além. Defende que é impossível ser um pet científico sério e nutrir crenças religiosas. Uma coisa exclui a outra. “ta fundamentar essa tese, ele observa que um estudo em 1998 mostrou que a . , A

Penas cerca de 7% dos cientistas americanos da Academia Nacional de Ciências acred; ci :

Creditam em um Deus pessoal.? Isso prova que quanto mais inteligente, racional Ecient i :

tificamente orientado alguém for, menos capaz sera de crer em Deus. Ip: + cm

Portu Riehard D awkins, he blind watchmaker (New York: W. W. Norton, 1986), p. 6 pipi am Mom tee O relojoeiro cego: a teoria da evolução contra 0 desígnio divino, tradução de Laura Teixeira Sã

m pe pus iflin, 2006), p. 100 [edição em portigês 1) ard Dawkins, The God delusion (Boston: Houghton great is ds Mi “US: um delírio, tradução de Fernanda Ravagnani (São Paulo: Comp ; Scanned by CamScanner

Será que Dawkins tem razão? Terá a ciência iptenapennão desacreditado as crenças cristãs? Somos obrigados a optar entre pensar cientificamente e crer em Deus?

Os milagres são cientificamente impossíveis?

O primeiro motivo por que muita gente pensa que a ciência desacreditou q religião tradicional é que a maioria das principais religiões crê em milagres, ou seja, na intervenção de Deus na ordem natural. O elemento miraculoso tem importância especial na fé cristã. Os cristãos celebram a cada Natal o milagre da Encarnação, o nascimento de Jesus, e a cada Páscoa, o milagre da ressurreição de Jesus. O Novo Testamento está cheio de relatos de milagres realizados por ) Jesus ao longo de seu ministério. A desconfiança científica em relação à Bíblia começou com a crença iluminista de que os milagres não são compatíveis com uma cosmovisão moderna e racional. Munidos dessa pressuposição, os especialistas se voltaram para a Bíblia e afirmaram: “Os relatos bíblicos não são confiáveis, pois contêm descrições de milagres”. À premissa dessa afirmação é que a “ciência provou que milagres não existem” 3 No entanto, há um salto de fé embutido nessa declaração.

Uma coisa é dizer que a ciência se encontra equipada para verificar somente causas naturais e não pode se manifestar a respeito das outras. Coisa bem diferente é insistir que a ciência comprova ser impossível a existência de outras causas. John Macquarrie escreve: “A ciência segue com base na premissa de que todos os eventos no mundo podem ser explicados da perspectiva de outros eventos [...] igualmente imanentes e terrenos. [Por isso] [zé milagres são incompatíveis com nosso entendimento moderno tanto da ciência quanto da história”.

“Van Harvey, por exemplo, diz que as defesas de acontecimentos miraculosos jamais podem ser levadas a sério pelo historiador crítico, pois esse tipo de raciocínio é uma violação “do que agora chamamos de cosmovisão do senso comum”. Van Harvey, The historian and believer (Macmillan, 1966), p. 68. Veja também seu ensaio “New Testament scholarship and Christian belief”, in: R- Joseph Hoffman; Gerald A. Larue, orgs., Jesus in history and myth (Prometheus, 1986).

“John Macquarrie, Principles of Christian theology (Scribner, 1977,) p. 248, apud Plantingb Warranted Christian belief; p. 394 [edição em português no prelo: Crença cristã avalizada (São P aulo: Vida Nova, s.d.)].

A CIÊNCIA DESACREDITOU O CRISTIANISMO 115

Macquarrie está correto quando afirma que, ao estudar um fenômeno, o centista tem dmcdo de in à existência de uma causa natural, porque as causas naturais são o mim “q de causa com o qual sua metodologia é capaz de lidar. Outra coisa as que a ciência comprovou que não existem causas de outro tipo. Não há modelo experimental para verificar a declaração « impossível existir uma causa sobrenatural para algum fenômeno natural”. Assim, trata-se de uma pressuposição filosófica e não de uma descoberta científica. No final das contas, o argumento de Macquarrie é circular. Ele diz que, por natureza, à ciência não é capaz de identificar ou verificar a existência de causas sobrenaturais; logo, tais causas não existem.

O filósofo Alvin Plantinga responde:

Macquarrie talvez queira dizer que o próprio exercício da ciência exige que se

rejeite a ideia (por exemplo) de Deus ressuscitar alguém. [...] [Esse] argumento

[...] pode ser comparado a um bêbado que perdeu as chaves do carro e teima

em procurá-las apenas sob o poste de luz com base na afirmação de que o local

é mais bem iluminado. Na verdade, o argumento supera a conduta do bêbado

ao insistir que por ser difícil encontrar as chaves no escuro, elas têm de estar

A outra premissa oculta na declaração “milagres não acontecem” é que “Não pode haver um Deus que faça milagres”. Se existe um Deus criador, não há nada de ilógico na possibilidade de ocorrerem milagres; afinal, se do nada “e criou tudo o que existe, dificilmente ele teria dificuldade para reontenas Partes da criação se e quando lhe aprouvesse. Para ter certeza de que milagres a “Contecem, você precisaria estar absolutamente convencido de que Deus agi € isso é um elemento de fé. A existência de Deus não pode ser prom desacreditada pela experiência científica.

do ig Warranted Christian belief; p. 406. pias mis pp que ce Creia que Des NR Ato, que defende ser inda os realiza. Veja “Divine action: ncia Or Ubstance;» ra Di ho acts: philosophical and theological explorations Pensa “» in: Thomas F. Tracy, org., The God who

Mia State University Press, 1994), p- 49-50.

A ciência conflita com o cr

Hoje em dia é comum acreditar que ciência € religião vivem em guerra. Um . inata É a mídia precisa publicar not.

dos motivos por que percebemos isso é pre Pp E notí

cias como se fossem histórias com protagonistas € rn a dá ampla cobertura às batalhas entre indivíduos secularizados e religiosos no que diz respeito ao ensino da evolução nas escolas, quanto às pesquisas com células- -tronco, à fertilização in vitro e a várias outras áreas da medicina e da ciência, Essas batalhas emprestam credibilidade aos argumentos de Dawkins, Harris e outros que afirmam não ser possível ser inteligente e racional e, ao mesmo tempo, religioso.

Ao longo dos anos na igreja Redeemer, conversei com muitas pessoas formadas em ciências e biologia que nutriam grande desconfiança em relação à fé cristã ortodoxa. Um jovem estudante de medicina me disse que “a Bíblia rejeita o evolucionismo, algo que a maioria das pessoas instruídas aceita. Sintome profundamente incomodado ao ver tantos cristãos, em virtude da crença na Bíblia, adotarem uma posição tão anticientífica”. Esse incômodo é bastante compreensível. Respondi-lhe o seguinte:

A ciência e ioni inicini j

; "luclonista parte do princípio de que as formas mais

complexas de vida evoluí i

: p e oluíram de formas menos complexas por meio de

m processo de seleção Í istã ;

ns Te ção natural, Muitos cristãos acreditam que Deus fez a vida dessa maneira. À igrei li tor igrej

E siri ral A igreja católica, por exemplo, a maior igreja emitiu declaraçõ iai ani

; 9 Tações oficiais afirmando que o evolucionismo

é compatível com a fé cristã. No entant istã j

Er nto, Os cristãos podem acreditar nã

volução como um processo, sem acredi % i áfico”

E E itar no “naturalismo filosófico”, ou

Ja, à noção de que tudo deriva de um : âni

E usa a causa natural e que a vida orgânica

produto exclusivo de forças aleatóri ,

seja. Quando o evolucioni "as sem a direção de quem quer qu

inclusiva e explica corso To Se transforma em uma teoria totalmente rodut a

que acreditamos, tudo o que o da seleção natural absolutamente tudo em , sentim ,

Os e tudo o que fazemos, saímos da sear?

“Veja a Message to the Ponti

ontifical Academy of Sci ia de

Ciências], de João Paulo II, October 22 1996 A Sciences [Mensagem à Academia Pontifícia E for it involves conception of mar”. ” — SB Sterium is concerned with question of evoluto o |

A CIÊNCIA DESACREDITOU O CRISTIANISMO 117

ER ciência para entrar na esfera da filosofia. O evolucionismo como teoria sotalmente inclusiva apresenta dificuldades incontornáveis como visão de

undo. Examinaremos essas dificuldades no capítulo 9.

? Dawkins defende que se você acredita na evolução como mecanismo biológico também precisa acreditar no naturalismo filosófico. Mas por quê? No mesmo ano em que foi lançado The God delusion, de sua autoria, Francis Collins publicou The language of God. Collins é um eminente pesquisador científico e chefia o Projeto Genoma Humano. Ele acredita na ciência evolucionista e crítica O movimento do Desígnio Inteligente, que rejeita a transmutação das espécies. Collins, porém, crê que ainda assim a sintonia, a beleza e a ordem da natureza apontam para um criador divino e descreve sua conversão do ateísmo para O cristianismo. Assim, aí está o que Dawkins afirma não poder existir: alguém com uma crença firme na evolução como mecanismo biológico, mas que rejeite por completo o naturalismo filosófico. Naturalmente, Collins não é o único a pensar assim.”

Contrários ao esquema simplista de Dawkins, existem vários modelos distintos sobre a relação de Deus com o desenvolvimento das formas de vida que vemos hoje. Ian Barbour mostra que ciência e religião podem se relacionar de quatro maneiras diferentes: conflito, diálogo, integração e independência. No extremo do “conflito”, se encaixam os defensores da “ciência da criação” é, ironicamente, pensadores como Dawkins. Cada lado está convencido de que a relação entre ciência e fé deve seguir o modelo de guerra declarada. A Visão que muitos criacionistas têm de Gênesis 1 inviabiliza qualquer tipo de Processo evolutivo, ao passo que o naturalismo filosófico de Dawkins invalida totalmente qualquer crença religiosa. No outro extremo estão os que acreditam Quea fé é basicamente algo privado e subjetivo e, como tal, não guarda nenhuma 'elação com a esfera da experiência empírica. Sob essa visão, ciência e religião "ada têm a dizer uma à outra. O próprio Barbour acha que essa visão abre mão am ha, The language of God: a ii presents erica for fot nã mes 108) de Giorgio a Mig linguagem de Deus: um cientista apresento A NA e pa aa ução “é em um : appell en Paulo: Gente, 2007)1. ao ee prai oc rano e que da Evolução o Prop pe dE, ns : nirs un a a t na a ne

Serevey “ima de filosofia materialista, é Owen Gingerich, astr que

S universe (Belknap Press, 2006).

de muita coisa e prefere as abordagens mais moderadas e rum nas quais a ciência e a fé religiosa reconhecem suas esferas de autorida = l

No entanto, o modelo de conflito é o que Pa mais nd ri da mídia. Felizmente, essa visão vem perdendo credibilidade qua a um EN cada vez maior de acadêmicos. À história da secularização das instipiições americanas é tratada em um livro importante e influente organizado por Christian Smith.” Nele, Smith sustenta que o modelo de conflito da relação entre ciência e religião foi um exagero proposital utilizado por cientistas e líderes do ensino no final do século 19 para minar O controle da igreja sobre essas instituições e fortalecer seu próprio poder cultural.!º O modelo de guerra declarada da ciência e da razão não foi tanto produto de alguma necessidade intelectual, mas uma estratégia cultural específica. Muitos cientistas não veem incompatibilidade alguma entre a fé em Deus e o trabalho que desenvolvem.

Em 1916 e 1997 realizaram-se dois estudos famosos que servem de base para essa disputa. O psicólogo americano James Leuba conduziu a primeira pesquisa com cientistas, na qual indagava se eles acreditavam em um Deus que se dispõe a se comunicar com a humanidade, ao menos por meio da oração. Quarenta por cento responderam “sim”, 40%, “não” e 20% disseram não ter certeza. Em 1997, Edward Larson e Larry Witham repetiram a pesquisa, fazendo a mesma pergunta aos cientistas, e publicaram o resultado na revista científica Nature. Os números não haviam se alterado muito em oitenta anos. Como fica, então, a afirmativa de Dawkins de que quase todos os cientistas importantes não acreditam em Deus? Em 7h God delusion, ele cita a n lan Ent When iam meets religion: enemies, strange or partners? (Harper, 2000) [edição ele chama de “integração” é o melhor. Veja ti e ir a; peida np di

Christian Smith, org., The secular revolution: ac pa pare o ; si Areia public life (Berkeley: University of California Press 2003) arq | id., p. 1i é , ú : |

and the dida ris rio Dr fá am E Ee pá

tulo de Rodney Stark, “God's handiwork: the ias sá - mer ipi e | (Princeton University Press, 2004). Bins of science”, in: For the glory ur | “Edward Lars iii: Bete |

1997). Veja também Set Poço = a still keeping the faith”, Nature (April 3, | Scanned by CamScanner

A CIÊNCIA DESACREDITOU O CRISTIANISMO 119

correspondência de avaliação complementar de Larson e Witham na Nature, am 200 mais tarde. Nela, eles ii que quando as mesmas perguntas sobre à crença em Deus foram feitas aos membros da Academia Nacional de Ciências, apenas 7% responderam “sim”.!” Dawkins usa esse resultado para provar que O raciocínio Hermihco inteligente quase sempre leva à conclusão de que Deus não existe. Existem, porém, sérios problemas na forma como

Dawkins, e mesmo Larson e Witham, interpretam os dados desses estudos. Em primeiro lugar, lembre-se da pergunta feita inicialmente aos cientistas nas duas pesquisas. Perguntou-se se eles acreditavam em um Deus que se comunica em nível pessoal com a humanidade. Acreditar que um Deus transcendente criou o universo não basta para classificar alguém como “crente”. Qualquer cientista da Academia Nacional de Ciências que acredite em um Deus que não se comunica diretamente com a humanidade vai de imediato para a categoria de “incrédulo”. As pesquisas foram elaboradas somente com o intuito de detectar os cientistas com uma fé conservadora, tradicional. Os que nutrem uma crença mais geral em Deus são excluídos em virtude da maneira como a pergunta é formulada. Em segundo lugar, Dawkins interpreta os dados como se eles estabelecessem uma relação causal entre a mente científica e o ateísmo. Ele parte da premissa de que os cientistas da Academia Nacional de Ciências são incrédulos porque pensam cientificamente. No entanto, o estudo não prova e não tem como provar qual é realmente o motivo que leva os cientistas da Academia a não crer em Deus. Alister McGrath, teólogo com doutorado em biofísica pela Universidade de Oxford, escreve que a maioria dos vários cientistas incrédulos que conhece são ateus por outros motivos € Nr por causa da ciência que praticam. Vários fatores complexos conduzem crença ou à descrença em Deus. Alguns são de ordem pessoal, outros, de ordem intelectual e até mesmo social. Sociólogos de renome como Peter “erger demonstraram que o grupo em que atuamos e os relacionamentos mais Próximos moldam nossas crenças com muito mais força do que nos dispomos Pia Os cientistas, à semelhança dos nos indi são gps fis tados pelas crenças e posturas dos indivíduos pelos quais querem ser a Larson e Larry Witham, “Leading scientists still reject God”, Nature 394, n. 6691

respeitados. Na experiência de McGrath, a maioria de seus colegas ateus levou para a ciência as ideias que eles já tinham sobre Deus, em vez de fundamentálas na ciência.!

Além disso, Dawkins dá aos leitores a impressão de que todos os cientistas ateus compartilham de seu ponto de vista de que nenhuma mente racional e científica pode crer em Deus. No entanto, não é esse o caso. Stephen Jay Gould, cientista ateu e evolucionista de Harvard já falecido, tinha pleno conhecimento de todos esses estudos, mas não compartilhava com Dawkins da conclusão de que a ciência obrigatoriamente colide com a fé cristã. Ele escreveu:

Ou metade de meus colegas é incrivelmente burra ou a ciência do darwinismo é

plenamente compatível com as crenças religiosas convencionais — e igualmente

compatível com o ateísmo.!4

Quando fala de “metade de seus colegas”, é provável que Gould não esteja pensando estritamente nos dados da pesquisa. Ele sabia que um bom número de colegas, cientistas dos mais respeitados, nutria crenças religiosas tradicionais em relação a Deus. Um dos motivos por que Gould não concorda com Dawkins é sua disposição bem maior para admitir que a ciência talvez não seja capaz de explicar todas as coisas a respeito da existência humana de tal modo que satisfaça todos os pensadores.

Outro acadêmico que defende essa postura é o filósofo Thomas Nagel, que criticou a abordagem de Dawkins em uma resenha de The God delusion para o periódico The New Republic. Nagel também é ateu, mas acha que Dawkins está errado ao insistir que, para ser minimamente científico, é preciso adotar O “naturalismo fisicalista [...] que a explicação definitiva de tudo necessariamente reside na física das partículas, na teoria das cordas ou quaisquer outras leis puramente extensionais que regem os elementos que compõem o mundo material”. Ele indaga, por exemplo, se realmente acreditamos que nossas

“Alister McGrath, The Dawkins delusion? (InterVarsity, 2007), p. 44 [edição em português: (9) delírio de Dawkins: uma resposta ao fundamentalismo ateísta de Richard Dawkins, tradução de Sueli Saraiva (São Paulo: Mundo Cristão, 2007)].

“Extraído de Stephen Jay Gould, “Impeaching a self-appointed judge”, Scientific American

267,n.1 (1992), apud Alister McGrath, The Dawkins delusion?, p. 34. Scanned by CamScanner

A CIENCIA DESACREDITOU O CRISTIANISMO . 121

instituições morais, como a de dade o genocídio é moralmente errado, não são reais 6 SIM, resultado da CUSTE mor instalada em nós. Será que y física é capaz de fazer justiça à realidade vivenciada pelos seres humanos? Nagel duvida. E escreve:

O projeto reducionista tenta em geral reivindicar alguns dos aspectos originariamente excluídos do mundo, analisando-os em termos físicos, ou seja, comportamentais ou neurofísicos, mas se recusa a reconhecer como real o que não pode ser

reduzido dessa forma. Acredito que o processo esteja fadado ao fracasso, que a

experiência consciente, o pensamento, os princípios etc. não são ilusões, embora

não se possa identificá-los como fatos da física. '5

É por isso que até muitos ateus acham que Dawkins está errado, que a ciência não é capaz de explicar tudo e que o pensamento científico pode ser compatível com a crença religiosa.

Ainda que o conceito de conflito entre a ciência e a religião continue a convencer muita gente, devemos nos despojar da noção de que é preciso escolher entre as duas, ou seja, quem quer ser cristão estará sempre em conflito com à ciência. A maioria dos cientistas se considera profunda ou moderadamente religiosa e esse número vem crescendo nas últimas décadas.!º Não existe, obrigatoriamente, um descompasso entre a ciência e a fé religiosa.

O evolucionismo não desacredita a Bíblia?

O que dizer da questão mais específica de como conciliar a ciência evolucio- “Sta com o relato bíblico da criação em Gênesis 1 e 2? E claro que existe aqui “ma colisão frontal. Não, não é esse o caso.

á Diferentes pensadores cristãos encaixam-se em um ou outro doe resgéas rã pi ciência e fé propostos por nao pi oia

ncia o a ca. Apud cristãos 19 perpinare= e jr em afirmar que Ca Hacionista adotam o modelo de con a ua peida

Is 1 ensina que Deus criou todas as formas de vida € P

o Nagel, “The fear of religion”, The New Republic (October 23, 2006). or the glory of God, p. 192-7.

seis dias de 24 horas, vários milhares de anos atrás. No outro pa da escala se situam cristãos que lançam mão do modelo de independência ) afirmam que Deus foi a causa primordial do começo do mundo e, em seguida, causas naturais deram prosseguimento ao processo. Outros pensadores ocupam posições intermediárias. Alguns defendem que Deus criou a vida e depois orientou a seleção natural para desenvolver todas as formas complexas de vida a partir das mais simples. Nessa visão, Deus atua como uma causa suprema sem violar o processo evolutivo. Outros, acreditando que existem lacunas no registro fóssil e insistindo que as espécies parecem “surgir”, em vez de se desenvolver a partir de formas mais simples, acreditam que Deus realizou atos criativos de ampla escala em diferentes momentos ao longo de períodos mais extensos de tempo.

A relação da ciência com a Bíblia depende não só da leitura do registro científico como também da interpretação de certas passagens-chave da Bíblia, como Gênesis 1. Os cristãos que aceitam a autoridade da Bíblia concordam que o objetivo primordial da interpretação bíblica é descobrir o sentido original do autor bíblico que procurava ser entendido por seu público. Isso também sempre significou interpretar os textos de acordo com o gênero literário de cada um. Por exemplo, quando leem os salmos, os cristãos os veem como poesia. Ao ler Lucas, que pretende ser um relato de testemunhas oculares (veja Lc 1.1-4), eles o entendem como história. Qualquer leitor é capaz de ver que a narrativa histórica deve ser encarada como história e as imagens poéticas, como metáforas.

A dificuldade surge nas poucas passagens da Bíblia em que o gênero não é facilmente identificável e nos falta certeza quanto à maneira como o autor pera ser lido. Gênesis 1 é uma passagem cuja interpretação é objeto de debate entre os cristãos, mesmo entre aqueles que creem piamente na inspiração das Escrituras.” Pessoalmente, considero que Gênesis 1 e 2 estão interligados da mesma forma que Juízes 4 e 5 e Êxodo 14 e 15. Em cada dupla de capítulos; um descreve um acontecimento histórico e o outro é um cântico ou poemê sobre o sentido teológico do acontecimento. Quando lemos Juízes 4, fica óbvio que se trata de um relato sóbrio do que ocorreu na batalha, mas, ao ler Juize* 5)

YVeja Gordon Wenham, Genesis 1-1 5 (Word, 1987).

A CIÊNCIA DESACREDITOU O CRISTIANISMO 123

ajoprde Débora solte a batalha, deparamos com uma linguagem poética e e a Quando Débora canta que as estrelas no firmamento guerrearam ua israelitas, percebemos aí um rentido Prieto, Acho que Gênesis 1 P O características e poesia, sendo; por 80; um cântico” sobre as maravilhas E sentido da criação de ppp 2 é nm relato de como isso ocorreu. sempre haverá debates à a uná e como interpretar essas passagens, in- Juindo Gênesis 1, mas a uma falácia afirmar qu se uma parte das Escrituras não pode ser levada ao pé da letra o mesmo se aplica a todas as outras. Isso não svílido para nenhum tipo de comunicação humana.

Então, o que podemos concluir? Como os cristãos adotam posições diversas quanto ao sentido de Gênesis 1 e quanto à natureza da evolução, os que consideram o cristianismo um todo não podem permitir que esse debate terno os distraia. O cético que busca respostas não precisa aceitar nenhuma dessas posições a fim de abraçar a fé cristã. Ele deve, sim, concentrar-se nas alegações centrais do cristianismo e ponderá-las. Somente depois de tirar conclusões sobre a pessoa de Cristo, sobre a ressurreição e sobre os pilares da mensagem cristã, é que a pessoa deveria examinar as várias opções com relação à criação e à evolução.

Os representantes dessas correntes diversas costumam insinuar que sua visão é a única postura cristã genuína sobre a evolução.!! Com efeito, tenho certeza de que muitos leitores ficarão irritados porque não faço uma pausa po na Pinte impressão em cia tanto dentro quanto fora pa ria TOA de je não foi ; resposta Esc pa protestantes ppa ces e E m a Cine ia a teoria de Darwin veio a público. Houve e ai E pon R A or rita se referindo a eg eras em ep o c Er dp

temo "ndamenta: arrasa pr ', rr si na infalibilidade da Bíblia Sainda àssim, ser o Ei e Eu poi Aee o À ie Mark Noll Evangelical American Oriianity, ani dp ica pod Seda field, de Pisa (falecido em 2), te dogo néroduction [Blackwells, 2001], p. 171). E, B. War A , ld *rvido de ão " definiu a doutrina da inerrância da Bíblia, E = 's perna Poderma ncia do, . o qu proa vi : n ps: the evolution of scientific “ationism (Kn à criação é feito por Ronald L. Numbers, The creationis na o ue sia! da E lia Ng £, 1992). Veja também Mark Noll, se about a : pa e DL, “tura, is (Eerdmans, 1994), e Mark Noll e David Livingstone, 5. D

aqui para escolher entre às visões concorrentes. Confesso que acho que Teus orientou algum tipo de processo de seleção natural, mas rejeito O conceito de : i i entaris ênesi

evolução como uma teoria totalmente inclusiva. Um comentarista de Gênesis capta com muita propriedade tal equilíbrio:

Se a “evolução” for [...] elevada ao nível de cosmovisão de como são as coisas, haverá um conflito direto com a fé bíblica. No entanto, se à “evolução” permanecer no nível de hipótese biológica da ciência, parece não haver motivo para conflito entre as implicações da crença cristã no Criador e as investigações científicas sobre a forma pela qual — no nível da biologia — Deus conduziu seus processos de criação."

Não quero ser duro demais com aqueles que se debatem com a ideia da intervenção de Deus na ordem natural. É difícil crer em milagres, e é assim que deve ser mesmo. Em Mateus 28 somos informados de que os apóstolos encontraram Jesus ressusci é ilei i

; J suscitado ao pé de um monte na Galileia. “Quando o viram, a -no; j

ipi no mas alguns duvidaram” (v. 17). Trata-se de uma admissão notável. Is O autor i istã -

Eder e um antigo documento cristão nos dizendo que alguns fundadores o cristianismo não ; i :

acre conseguiram acreditar no milagre da ressurreição, mesmo ando diretamente para Jes e nri

º : para Jesus e tocando-o com as próprias mãos. Não existe pro para que isso conste do relato a não ser a historicidade do fato trecho nos mo ári i Ê

ed e, ERA stra a coisas. E um alerta para não pensarmos qu as nós, indivíduos modernos ioctni

com a ideia do elemento miraculoso, ao paca, . os de is primitivos não tinh + 980, 0 passo que os povos antigos e mais P* ão tinham a mesma dificuldade. Os apóstolos reagiram como qualquer grupo de indivíduos modernos — alguns acreditaram no que viram, mas outros, não. Vemos também nessa Passagem um estímulo à paciência. Todos os apóstolos se tornaram grandes líderes da igreja, mas alguns tiveram mais . 2 ij

dificuldades para crer que outros.

» The message of Genesis 1-11 (InterVarsity, 1990), p.31. Scanned by CamScanner

A CIÊNCIA DESACREDITOU O CRISTIANISMO 125

No entanto, o aspecto mais esclarecedor do texto é o que ele diz a respeito do propósito dos milagres bíblicos. Eles não apenas levam à fé cognitiva, mas também, principalmente, ao /ouvor, ao espanto e à admiração. Os milagres de Jesus, em especial, nunca foram truques de mágica que serviam apenas para impressionar € eagle ção es Jesus dizer algo assim: “Estão vendo aquela árvore? Vou fazê-la se incendiar!”. Em vez disso, ele utilizou o poder dos milagres para curar Os doentes, alimentar os famintos e ressuscitar os mortos. Por quê? Nós, indivíduos modernos, pensamos em milagres como a suspensão da ordem natural, mas Jesus queria que eles fossem a restauração da ordem natural. A Bíblia nos diz que no início Deus não pretendia criar o mundo para que houvesse doença, fome e morte. Jesus veio para redimir onde houvesse erro e curar o mundo onde houvesse tristeza. Seus milagres não são apenas provas de que ele detém poder, mas também uma maravilhosa amostra do que ele fará com esse poder. Os milagres de Jesus não são um simples desafio para nossa mente, mas também uma promessa para nosso coração de que o mundo que desejamos está a caminho.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$A ciência observa como a natureza funciona quando age sozinha: ela tem mesmo competência para afirmar que um Deus jamais agiu de fora, ou estaria ultrapassando os limites do próprio método ao negar todo milagre?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Se aceitar que Deus criou através de processos naturais não anula a fé de muitos cientistas crentes, será que o verdadeiro conflito é entre ciência e fé ou entre duas visões de mundo, uma das quais já parte do princípio de que o sobrenatural não existe?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você descartou os milagres da Bíblia por evidência ou por uma pressuposição prévia de que eles "simplesmente não podem ter acontecido"?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A Bíblia não deve ser interpretada literalmente$t$, 8,
$conteudo$“Considero boa parte dos ensinamentos bíblicos historicamente imprecisos”,

disse Charles, um banqueiro de investimentos. “Não sabemos com certeza se a

Bíblia realmente relata o que de fato aconteceu.”

“Você tem razão, Charles”, respondeu Jaclyn, uma moça que trabalha na área

financeira. “Meu maior problema com a Bíblia, porém, é o fato de ela ser culturalmente obsoleta. Grande parte de seus ensinamentos sociais (sobre as mulheres,

por exemplo) é socialmente retrógrada. Por isso é impossível aceitar a Bíblia como autoridade absoluta, a exemplo do que fazem os cristãos.”

UANDO eu cursava à universidade no final da década de 1960, fiz alguns cursos sobre a Bíblia como expressão literária e me vi diante da sabedoria vigente na época. Meus professores ensinavam que 08 Evangelhos eram qivados das tradições orais de várias comunidades eclesiásticas nas redono E ia As histórias sobre Jemus Cams mia ndaç

Cada er A pi ii e ni O histórias, fundamentas-

“as o o a pratos as tradições orais foram

tansmit; no e crenças de suas comunida es. ea ' ae vo ei lendo idas ao longo dos anos, sofrendo acréscim os Evangelhos

“tio. Finalmente, bem depois dos acontecimentos reais, . ; fora ; dd P E icamente impossível

m Tepistrad, À) A essa altura, já era pratica

Saber até o ADE MAEDA E + que correspondiam, aos acontecimento que ponto eles correspondiam, se € q

Quem foi, então, o Jesus original? Os acadêmicos cujas cbn li sustentavam que o verdadeiro Jesus, o “Jesus histórico”, havia sido um carismático mestre de justiça e sabedoria que despertou oposição e acabou executado. Após sua morte, diziam eles, surgiram entre seus seguidores várias correntes e pontos de vista sobre quem, afinal, havia sido Jesus. Alguns afirmavam que ele era divinoe havia ressuscitado dos mortos; outros diziam que ele não passava de um mestre humano que continuava espiritualmente vivo no coração de seus discípulos. Depois de uma luta de poder, a corrente “do Jesus divino” venceu e produziu textos que promoviam seus pontos de vista. Seus adeptos supostamente suprimiram e destruíram todos os textos alternativos que mostravam um Jesus diferente. Nos últimos tempos, alguns desses pontos de vista alternativos e suprimidos sobre Jesus vieram a lume — como os evangelhos “gnósticos” de Tomé e de Judas. Isso mostra, segundo dizem, que o cristianismo primitivo era muito diversificado em suas crenças doutrinárias.

Se essa visão das origens e do desenvolvimento do Novo Testamento fosse verídica, nossa compreensão do conteúdo e do significado do próprio cristianismo sofreria uma mudança radical. Significaria que ninguém é capaz de saber realmente o que Jesus disse e fez e que a Bíblia não pode ser a autoridade normativa a reger nossa vida e nossas crenças. Significaria ainda que a maior parte dos ensinamentos cristãos clássicos — a divindade de Jesus, a expiação € a ressurreição — está equivocada e se baseia em lendas.

Como aluno, no início fiquei abalado. Como achar que todos aqueles famosos especialistas estavam errados? Ao longo dos anos, à medida que realizava minhas próprias pesquisas, fiquei surpreso ao descobrir que as evidências usadas para essas reconstituições históricas eram escassas. Para meu alívio, às evidências dessa visão mais antiga e mais cética da Bíblia vêm desmoronando sistematicamente nos últimos trinta anos, apesar de receber promoção da mi dia popular por meio de livros e filmes como O código Da Vinci.

Anne Rice foi uma das pessoas que ficaram perplexas ao descobrir como é frágil o argumento em favor de um “Jesus histórico” meramente humano. Anne Rice ficou famosa como autora de Entrevista com o vampiro e outras obras que podem ser rotuladas de “terror erótico”. Criada no catolicismo, ela perdeu a fé em uma universidade secular, casou-se com um ateu e enriquece! escrevendo romances sobre Lestat, que é, ao mesmo tempo, vampiro e astro de

A BÍBLIA NÃO DEVE SER INTERPRETADA LITERALMENTE 129

ck A mídia c O mundo literário se mostraram chocados quando Anne Rice -m sua volta ao cristianismo.

Que motivo à fez voltar? No posfácio de seu último romance, Christ the Gard: out of Egypt [Cristo, o Senhor: a saída do Egito], ela explica que havia - começado sua ampla pesquisa sobre o Jesus histórico lendo o trabalho de especialistas em Jesus das mais respeitadas instituições acadêmicas. A principal tese defendida por eles era que os documentos bíblicos que temos não são historicamente confiáveis. Anne espantou-se com a fragilidade de tais argumentos. Alguns livros não passam de pressuposições em cima de pressuposições. [...] As conclusões baseiam-se em pouquíssimos dados e às vezes em dado algum. [...] Todo o argumento em favor de um Jesus não divino, que apareceu em Jerusalém e por algum motivo foi crucificado [...] toda essa imagem que pairava sobre os P gem que p

círculos liberais que frequentei como ateia durante trinta anos não convencia. Não só não convencia, como também descobri nesse campo alguns dos piores e mais preconceituosos trabalhos acadêmicos que já li na vid A fé cristã exige que se creia na Bíblia.? Essa é uma grande pedra no sapato de muita gente. Conheci vários nova-iorquinos por ocasião da primeira visita que faziam à igreja Redeemer para participar do culto. O ato central de cada : Citado em uma resenha de Christ the Lord: out of Egypt, de George Sim Johnston, 7he Wall tr

“eJturnal, November 12-13, 2005.

| Por exemplo, o conhecido argumento em defesa da divindade de Cristo — “Mentiroso, mady

a Senhacr — não Bandioha a:mendé que se possa demonstrar que Jesus realmente afirmou er divi a ,

a Nino.C.S, Lewis deu ao argumento sua forma clássica. “Um homem que fosse meramente um me, : k ê apio aho M€ dissesse o tipo de coisas que Jesus dizia não seria um grande mestre de moral. Seria a tá Am Equiparável àquele que declara ser um ovo cozido — ou o demônio do infeério. Você pese igm “Ua escolha. Ou ele era (e é) o Filho de Deus, ou era um maluco ou algo ainda pior. Você pode Orá- « , o: as nã

io 1o por considerá-lo um tolo ou prostrar-se a seus pés € chamá-lo Senhor e Deus. a ola rom com bobagens condescendentes dizendo que ele é um grande mestre tunar e não eixo ão? E áias SUL Jê icã tuguês: Cristianismo puro e

“imp A opção” (Mere Christianity, livro 2, cap+ 3 [edição em a 8 un id s das ' incíDi ue os re

Plavras Problema desse argumento é que ele parte do principio ii q ci rec À me de Jesus são precisos. Isso exige que se demonstre que a Bíblia é rito fis, Nos a E im; de duas uma: jesus € um

Men; de modo geral. O argumento estaria mais bem expresso àSS Cri Toso,um M : Senhor”. Até que Se demonstre que o retrato de Cristo ha Biba a aluco, uma Lenda, ou ele é Senhor . Até q Rs

20 é totalmente lendário, o famoso argumento não t ç

culto é um sermão baseado em um texto bíblico. O visitante médio se surpreende, e até mesmo fica chocado, ao nos ver atentar para a Bíblia com tamanha dj. ligência. A maioria diria estar ciente de que existem ótimas histórias na Bíblia, mas que hoje “não se pode interpretá-la Jiteralmente. O que querem dizer é que a Bíblia não é inteiramente confiável, pois algumas partes — talvez muitas ou a maioria — são cientificamente impossíveis, historicamente duvidosas e culturalmente retrógradas. Examinamos no capítulo anterior a primeira dessas questões, sobre a ciência e a Bíblia. Examinaremos agora as outras duas. | “Não se pode confiar na Bíblia de

uma perspectiva histórica”

Muitos são os que creem que a Bíblia é uma coletânea de lendas, historicamente não confiável. Um fórum bastante divulgado de especialistas conhecido como Seminário Jesus (The Jesus Seminar) afirma que não mais que 20% das palavras e atos de Jesus presentes na Bíblia podem ser historicamente validados. Como respondemos a isso? O exame da precisão histórica de cada parte da Bíblia está fora do escopo deste livro. Assim, perguntaremos se é possível ter certeza de que os Evangelhos, os relatos do Novo Testamento sobre a vida de Jesus, são historicamente confiáveis.! Falo dos Evangelhos “canônicos” —

"O Seminário Jesus utiliza o “critério da dupla diferença” como meio de avaliar a validade histórica de um texto bíblico, ou seja, segundo eles, podemos ter certeza da veracidade histórica de uma passage” dos Evangelhos somente se seu ensinamento não tiver origem no judaísmo do primeiro século nem na igreja primitiva. É preciso, assim, que ela não se harmonize com o que sabemos a respeito das crenças dominantes do judaísmo ou do cristianismo do primeiro século (do contrário, não poderemos ter certeza de que a passagem não foi criada para sustentar a crença dominante). No entanto, esse critério parte E princípio de que Jesus não seria influenciado por seu legado judaico e que não teria deixado marcas em seus seguidores. Graças à improbabilidade disso, cada vez mais especialistas bíblicos vêm criticando O erbalho do Seminário Jesus por ser desnecessariamente negativo e preconceituoso com relação aos Evangelhos

“Não estou aqui tentando defender a completa confiabilidade da Bíblia, mas apenas que º ni que ela faz da vida e dos ensinamentos de Jesus é historicamente preciso. Sendo assim, podemos a Pç sobre ii é Jesus a partir das informações que ela nos dá. Se, no final, pusermos nossa e ' ! ne equi conceito que ele tinha da Bíblia se toda o nosso, Pessoalmente, encaro toda à ja em

, a eu possa de alguma forma provar” que tudo seja verídico. Aceito-a porque e Jesus, e essa era sua visão da Bíblia, |

A BÍBLIA NÃO DEVE SER INTERPRETADA LITERALMENTE 131

ateus; Marcos; Lucas e João —, que a igreja muito cedo reconheceu como fênticos € autorizados.

Afirma-se com frequência que os Evangelhos do Novo Testamento foram escritos tantos anos após os acontecimentos, que os relatos sobre a vida de fes feitos por seus autores não são confiáveis, foram profundamente altecado; quando não totalmente inventados. Muitos acreditam que os Evangelhos canônicos representam apenas quatro de uma série de outros textos e foram escritos para fundamentar o poder hierárquico da igreja, enquanto os demais (incluindo os chamados “evangelhos gnósticos”) acabaram omitidos. Essa crença adquiriu nova credibilidade no imaginário popular a partir da publicação do best-seller O código Da Vinci. Nesse romance, o Jesus original é retratado como um mestre extraordinário, porém claramente humano, que muitos anos após a própria morte foi transformado em um Deus ressuscitado pelos líderes eclesiásticos que assim agiram para ganhar prestígio no Império Romano. No entanto, existem vários bons motivos para considerar os relatos dos Evangelhos historicamente confiáveis e não meras lendas. “Uma resposta acadêmica porém acessível a0 código Da Vinci é apresentada por Ben tg, The Gospel code (IVP, 2004) [edição em português: O fim do conflito, tradução de e Medeiros Caldevilla (São Paulo: Landscape, 2005)]. A refutação que ele faz das premissas históricas dO código Da Vinci é arrasadora.

E um amplo e crescente grupo de acadêmicos de primeira linha que defendem a credibilidade ca dos Evangelhos. Para uma visão mais detalhada do que a que seria possível fornecer aqui, ça a seguintes livros importantes: Richard Bauckham, Jesus and the eyerwitnesses (Eerdmans, ceulor ledição em português: Jesus e as testemunhas oculares: 05 Evangelhos como testemunhos de destomanhas f Ri ma de Paulo Ferreira Valério (São Paulo: Paulus, 2011)]; N. T. Wright,Jesus and the “= Pesumy Ortress, 1998) e The resurrection of the Son of God (Fortress, 2003) [edição em português: De mo do Filho de Deus [Santo André/São Paulo: Academia Cristã/Paulus, 2013); C. Blomberg, de kal veiabiity of the Gospel (IV, 1987) e The bistorizal reliabiity of Jobni Gospel (IVA, AND), Rigo º mais popular e mais antigo E F. Bruce, The New Testament documents: are they reliable? ans, relan et ioht) [edição em português baseada na 5.

Boa ss de 1965: Merece confiança 7) Novo Testamento?, 3. ed. rev. (São Pa e N cosa as a s.. x 1 istó 1 3

temente *º críticas mais céticas da Bíblia alega apoiar-se em nus nor Para uma análise des apoi influenciada por pressuposições filosóficas (isto é, ne alterna : (Oxford, 1996) “Alvin pp Tosóficos, veja C. Stephen Evans, 7he historical Christ and the Jesus offa ni o , Ouro “tinga, “PR euro Scholarship”) in: Warranted Christian belief “rd, 200; wo (or More) Kinds of Scripture : São Paulo: Vida Nova s.d.)). 2) [edição em português no prelo: Crença cristá avalizada (São Paulo: [6 ESSES DR

As datas de composição dos Evangelhos são tão remotas

que eles não poderiam ser lendas

Os Evangelhos canônicos foram escritos, no máximo, entre 40 e 60 anos após a morte de Jesus.” As cartas de Paulo, escritas entre 15 e 25 anos apenas após à morte de Jesus, fornecem um esboço de todos os acontecimentos da vida de Cristo presentes nos Evangelhos — seus milagres, suas afirmações, crucifcação e ressurreição. Isso significa que os relatos bíblicos da vida de Jesus já circulavam na época em que ainda estavam vivas centenas de testemunhas dos acontecimentos de seu ministério. O evangelista Lucas afirma que seu relato sobre a vida de Jesus baseia-se no que ouviu de testemunhas oculares que ainda estavam vivas (Lc 1.1-4).

Richard Bauckham, em seu notável livro Jesus and the eyewitnesses, reúne um grande volume de provas históricas para demonstrar que, na época em que os Evangelhos foram escritos, muitas e importantes testemunhas oculares da vida e dos ensinamentos de Jesus ainda estavam vivas. Essas lembranças guardadas na memória permaneceram vivas no dia a dia das igrejas durante o tempo de vida dessas testemunhas, funcionando como

7Hoje praticamente todos os historiadores concordam quanto a esses dados. No século 18 é começo do 19, os acadêmicos na Europa foram profundamente influenciados pelo racionalismo do Iluminismo e, portanto, encaravam os textos bíblicos a partir da premissa de que os elementos miraculosos nos Evangelhos haviam sido acrescentados muito mais tarde aos relatos originais “verídicos”. Como sabiam que relatos lendários de acontecimentos históricos eram formulados somente muito tempo depois dos acontecimentos, postulavam que os Evangelhos haviam ido escritos no mínimo cem anos ou mais depois da morte de Jesus. No entanto, ao longo do a

século, as evidências dos manuscritos obrigaram até mesmo os acadêmicos mais críticos a cont” : : k rário

que todos eles foram escritos muito antes. Veja um relato acessível de como datar 08 * 1! men

documentos do Novo Testamento (incluindo os Evangelhos) em F. F. Bruce, The New DT À documents: are they reliable? com uma nova introdução do respeitado especialista N.T. mira? a . o à

também Paul Barnett, 7he New Testament. A maioria diria que Marcos foi escrito por volta ndo 70, Mateus e Lucas, cerca do ano 80, e João, na última década do primeiro século. Isso faz s e , : ad E ; mui

tendo em vista que eles teriam sido redigidos na época em que os apóstolos e outras teste erem . : Rr “não para

oculares estavam começando a morrer, mas muitos ainda se encontravam à disposição P* consultados (veja o que afirma Lucas em Lc 1.1-4). deste”

Edição em português: Jesus e as testemunhas oculares: os Evangelhos como testem unhos “é |

nhas oculares, tradução de Paulo Ferreira Valério (São Paulo: Paulus, 2011). | Scanned by CamScanner

BÍBLIA NÃO DEVE SER INTERP

nentes e avalistas da veracidade p

fontes permã genti d rpgs dos relatos. Bauckham também

o vale de prova ; próprios Evangelhos para mostrar que seus ã es às fontes no texto, a : .

tores dão nome: ,à fim de garantir aos leitores a autenidade da narrativa.

Marcos, por ct d , Ai q : homem que ajudou Jesus a carregar a cruz o

ári ai de Alexandre e » do LÊ ;

até O Calvário era Pp de Rufo” (Mc 15.21). Não há motivo para O autor incluir esses nomes à menos que os leitores os conhecessem ou a eles tivessem acesso. E como se ele estivesse dizendo: “Alexandre e Rufo aalizam à veracidade do que estou contando a vocês; perguntem a eles, . E) 4 .

se quiserem. Paulo também esperava que seus leitores consultassem as estemunhas oculares caso desejassem confirmar a veracidade do que ele diz a respeito dos acontecimentos da vida de Jesus (1Co 15.1-6).º Paulo menciona um grupo de quinhentas testemunhas oculares que viram o Cristo ressurreto a mesmo tempo. Ninguém escreve isso em um documento destinado à leitura pública a menos que realmente haja testemunhas ainda vivas, cujos depoimentos coincidam e sejam capazes de confirmar as palavras do autor. Tudo isso decididamente refuta a ideia de que os Evangelhos eram tradições 8 ç

orais anônimas, coletivas e que iam aos pouco se desenvolvendo. Em vez disso, eram, sim, histórias obtidas da boca de testemunhas oculares vivas que preservaram as palavras e os feitos de Jesus com riqueza de detalhes. Não eram apenas os seguidores de Jesus que continuavam vivos, mas também vários observadores, autoridades e opositores que efetivamente o dlyiram ensinar, viram-no agir e assistiram à sua morte. Estes seriam os mais Nteressados em contestar quaisquer relatos inventados. Para que um relato Muito alterado, fictício, de um acontecimento se sustente no imaginário Opular é men:

: dm é preciso que as testemunhas oculares (bem como seus filhos e netos) en . A, A . : a para que

am morrido há muito tempo. É preciso que estejam fora de cena para q Oy ; a i história.

enham a contradizer ou desmascarar as alterações e mentiras da 9: ,

faz Richard Bauckham, Jesus and the eyewitnesses, caps. 2,3 e 6. Além disso, no capt y Uma análi . nas histórias dos Evangelhos. Ele

Concly; Se exaustiva dos nomes das pessoas que aparecem nã a ” Ui que el , a Palestina antes da destruição de Jerusalém tm 7 es refletem o tipo de nomes de judeus na Fate » .

dias nham os judeus da Diáspora após 70

de » & não os nomes próprios bem diferentes que tinha j Ear à “À cone ão é; ««rórias dos Evangelhos tenham tido origem em Omi — “São é que é muito improvável que as histórias dos 8 Posteriores fora da Palestina.

Os Evangelhos foram registrados por escrito cedo demais para que alterações dessa natureza pudessem se consolidar.

Assim, se Jesus nunca tivesse dito ou feito o que os relatos dos Evangelhos mencionam, seria impossível a nova fé se disseminar da forma como aconteceu. Paulo pôde confiantemente assegurar às autoridades do governo que os acontecimentos da vida de Jesus eram de conhecimento público: “... porque essas coisas não aconteceram em algum canto, às escondidas” (At 26.26). 0 povo de Jerusalém havia estado lá — nas multidões que ouviram e viram Jesus. Os documentos do Novo Testamento não poderiam dizer que Jesus foi crucificado se milhares de indivíduos ainda vivos poderiam ter confirmado ou não o fato. Se Jesus não tivesse feito suas aparições após a morte, se não houvesse um túmulo vazio, se ele não tivesse afirmado essas coisas, e esses documentos públicos declaravam que elas aconteceram, o cristianismo jamais decolaria. Esses relatos provocariam gargalhadas nos ouvintes.

) Os quatro Evangelhos canônicos também foram escritos muito antes dos chamados evangelhos gnósticos. O Evangelho de Tomé, o mais conhecido dos documentos gnósticos, é uma tradução do siríaco, e os especialistas demonstraram que as tradições siríacas sobre Tomé podem ser rastreadas até uma data não anterior a 175 d.C., quando os Evangelhos canônicos já vinham sendo amplamente usados há mais de cem anos. Adam Gopnik escreveu em The New Yorker que os evangelhos gnósticos vieram tão depois, que “... não ameaçam a base da fé da igreja assim como a descoberta de um documento do século 19 escrito em Ohio em defesa do rei George não ameaçaria a base da democracia americana” 11 Os Evangelhos de Mateus, Marcos, Lucas € João, contudo, foram reconhecidos como relatos autorizados por testemunhas oculares quase imediatamente, e por isso Ireneu de Lião em 160 d.C. declarou que eles eram quatro e apenas quatro. A ideia disseminada, promovida em O código Da Vinci, de que o imperador Constantino definiu o cânon do rim Wiighe, Simply Christian (Harper, 2006), p. 97 [edição em português: Simplesmente cristão (Viçosa: Ultimato, 2008)).

“Gopnik acrescenta; “Não existem novas “rtenças, nenhum argumento novo e, decerto, pr Yorker, April 17, 2006. “Esto O Evangelho de Judas. Veja “Jesus laughed”, 14º Scanned by CamScanner

A BÍBLIA NÃO DEVE SER INTERPRETADA LITERALMENTE 135

Novo Testamento, dra de Mis os evangelhos gnósticos, mais antigos e nte mais autênticos, não é verdadeira.!?

Quanto à O código Da Vinci, todos sabem que a trama do livro e do filme é fctícia, mas muitos consideram plausível o cenário histórico que o autor, Dan Brown, afirma ser verídico. O livro mostra Constantino em 325 d.C. decretandoa divindade de Jesus e suprimindo todas as provas de que ele era apenas um mestre humano. No entanto, mesmo em um documento como a Epístola de Paulo aos Filipenses, que todos os historiadores garantem não datar de mais de vinte anos após a morte de Cristo, vemos que os cristãos adoravam Jesus como Deus (Fp 2). À crença na divindade de Cristo fez parte desde o início da dinâmica do crescimento da igreja primitiva. Um historiador comenta: [Dan Brown diz] que o imperador Constantino impôs uma interpretação | totalmente nova do cristianismo no Concílio de Niceia em 325, ou seja, decretou | a crença na divindade de Jesus e omitiu todas as provas de sua humanidade. Isso significaria que o cristianismo venceu a competição religiosa no Império - Romano por meio do exercício de poder e não pela atração que exercia. O fato histórico é que a igreja venceu tal competição muito antes dessa época, antes que detivesse qualquer poder, quando ainda sofria perseguições esporádicas. Um historiador cínico diria que Constantino escolheu o cristianismo porque este já havia vencido, e o imperador queria apoiar um vencedor." x conteúdo é tão contraproducente que os

Yangelhos não poderiam ser lendas >

À teoria hoje em vi i diz que os Evangelhos foram escritos gor para muita gente diz q

Pelos líderes da igreja primitiva a fim de promover suas políticas, consolidar as fortalecer seu movimento. Essa teoria em nada é compatível com amente encontramos nos Evangelhos.

breve E E New Testament: its origin, Li e a E Edo isodidga Ctgs,, Hermenenção o em David G. Dunbar The E o, ,

ol pd aca and ii (Zon ervam ip. 105

erville, The decline of the secutar u

Se essa visão popular estivesse correta, veríamos Jesus, em vários trechos dos Evangelhos, tomando partido nos debates que aconteciam na igreja, Dessa maneira (argumenta-se), os Evangelhos foram moldados pelos líderes cristãos para apoiar seu partido. No entanto, não é isso que vemos. Sabemos, por exemplo, que uma das grandes controvérsias na igreja primitiva opunha os que achavam que os cristãos gentios deviam ser obrigados a passar pela circuncisão e os que achavam que a circuncisão não era necessária. Em face de um conflito dessa grandeza, é curioso que em nenhum lugar nos relatos dos Evangelhos encontramos Jesus dizendo o que quer que seja a respeito da circuncisão. À razão mais provável de seu silêncio é que a igreja primitiva não se sentia à vontade para inventar coisas e pôr na boca de Jesus palavras que ele jamais pronunciou,

À. Por que teriam os líderes do movimento cristão primitivo inventado a história da crucificação se ela não tivesse ocorrido? Quem quer que ouvisse ) a mensagem do Evangelho, fosse da cultura grega, fosse da judaica, desconfiaria automaticamente de que o crucificado era culpado de crime, ainda que lhe dissessem o contrário. Por que um cristão inventaria um relato em que Jesus, no jardim do Getsêmani, pede a Deus que o dispense de sua missão? Ou por que inventaria uma estória em que, na cruz, Jesus pergunta a Deus por que este o abandonou? Essas coisas só haveriam de ofender ou confundir profundamente os candidatos à conversão no primeiro século, que concluiriam que Jesus era um fraco e infiel ao seu Deus. Por que inventar que as mulheres foram as primeiras testemunhas da ressurreição em uma sociedade em que elas eram tão inferiorizadas, que os tribunais não admitiam seus depoimentos?! Faria mais sentido (se você fosse inventar a história) contar com o testemunho de homens influentes da comunidade quando Jesus saísse do túmulo. O único motivo plausível para a inclusão de todos esses incidentes é eles terem de fato ocorrido.

Além disso, por que retratar constantemente os apóstolos — futuros líderes da igreja primitiva — como mesquinhos e invejosos, pouco inteligentes e, no final, como covardes, que ativa ou passivamente faltaram ao Mestre? | Richard Bauckham apresenta argumentos semelhantes referindo-se à negação “No capítulo 12 daremos mais atenção a esse elemento das narrativas dos Evangelhos. | Scanned by CamScanner

| A BÍBLIA NÃO DEVE SER INTERPRETADA LITERALMENTE 137

de Jesus por parte de P edro, que chega ao ponto de amaldiçoar o Mestre (Me 14.71). Por que E nos pel tempos da igreja haveria de querer ressaltar sm ermiveis racassos de Ff ditar mais importante? Ninguém inventaria uma história apta e, embora seja verdade, Bauckham deduz que ninguém além do próprio Pedro ousaria contá-la, a menos que ele mesmo fosse a fonte e tivesse autorizado a preservação e a propagação de seu relato.!S Mais uma vez, uma comparação com os “evangelhos gnósticos” é esclarecedora. O Evangelho de Tomé e documentos semelhantes expressam uma filosofia chamada “gnosticismo”, segundo a qual o mundo físico é um lugar sombrio, mau, do qual nosso espírito precisa ser resgatado pela iluminação secreta ou “gnosis”. Isso se encaixa muito bem na cosmovisão de gregos e romanos, mas é absolutamente distinto da visão de mundo do judaísmo do primeiro século, do qual fazia parte Jesus.!º Portanto, ao contrário de dO código Da Vinci e de relatos afins, não foram os Evangelhos canônicos que “bajularam” o “poder instituído” no mundo antigo, mas, sim, os textos gnósticos. Os Evangelhos canônicos, com uma visão positiva da criação material e ênfase nos pobres e oprimidos, é que ofendiam a visão dominante no mundo greco-romano. Os Evangelhos canônicos não só nos apresentam uma imagem do Jesus original historicamente muito mais digna de crédito, mas também encerram um corajoso desafio à cosmovisão de seus leitores gregos e romanos. Dá O gênero literário dos Evangelhos é tão detalhado

que eles não poderiam ser lendas

Cs, Lewis foi um crítico literário de renome mundial. Ao ler os Evangelhos, observou:

Tenho lido poemas, romances, literatura visionária, lendas e mitos à vida o a Como são. Sei que nenhum desses gêneros é assim. Existem Ms uas “sões possíveis com relação a este texto (do Evangelho): ou sé Me nem "Portagem, ou algum escritor [antigo] desconhecido [...] sem antecessores | Pauckham, Eyervitmesse 170-8

sucessores conhecidos, de repente antecipou toda a técnica da moderna Narrativa

Lewis quis dizer que a ficção antiga em nada se parece com a ficção moderna. A ficção moderna é realista. Contém detalhes e diálogos e passa a sensação de um relato feito por uma testemunha ocular. Esse gênero de ficção, porém, desenvolveu-se há menos de trezentos anos. Na época antiga, romances, épicos ou lendas eram intangíveis e remotos — havia escassez de detalhes, incluídos apenas se promovessem a evolução da personagem ou conduzissem a trama. É por isso que quando lemos Beowulf ou 4 ilíada não vemos as personagens se dando conta da chuva ou adormecendo com um suspiro. Nos romances modernos, os autores acrescentam detalhes a fim de criar uma aura de realismo, mas isso jamais acontecia na ficção antiga.

Os relatos dos Evangelhos não são ficção. Em Marcos 4, descobrimos que Jesus adormeceu sobre uma almofada na popa de um barco. Em João 21, tomamos conhecimento de que Pedro estava no mar, a 200 côvados da praia, quando viu Jesus na areia; ele então pulou do barco. A passagem ainda relata que, juntos, os discípulos pescaram 153 peixes. Em João 8, enquanto escutava os homens que haviam flagrado uma mulher na prática de adultério, descobrimos que Jesus escrevia no chão com o dedo. Não sabemos o que ele estava escrevendo nem o porquê desse ato. Nenhum desses detalhes é relevante para a trama ou para o desenvolvimento das Personagens. Se inventássemos hoje uma história emocionante sobre Jesus, faríamos menção desses elementos para dar ao relato um tom de realismo, o que pressupõe a existência de um gênero desconhecido no século primeiro. A única explicação para um escritor antigo mencionar uma almofada, 153 peixes e alguém escrevendo com o dedo no chão é que 05 Eai ficaram guardados na memória das testemunhas oculares.

Richard Bauckham compilou muitas Pesquisas realizadas por psicólogos sobre as características da memória recordativa. Ele observa as características de disp testemunhais de acontecimentos e como estes diferem de relatos prensa ou ia bem como de Teconstituições históricas. A me mória recordativa é seletiva, concentra-se em acontecimentos individuais º

VC. 5. Lewis, Christian reflections, edição de Walter H ooper (Eer dmans, 1967), p.155.

A BÍBLIA NÃO DEVE SER INTERPRETADA LITERALMENTE 139

conseguenciais, preserva detalhes irrelevantes (conforme observa Lewis), parte do ponto de vista privilegiado de um Participante e não da np do narrador onisciente e apresenta sinais de frequente Tecapitulação.!8 Bauckham, em seguida, Apa essas es características nas narrativas dos Evangelhos. Acontecimentos vibrantes e importantes podem ficar em nossa lembrança durante décadas se forem recapitulados e/ou narrados vez após vez. Acrescente o fato de que, no mundo antigo, esperava-se que os discípulos memorizassem ensinamentos dos mestres e que muitas declarações de Jesus são apresentadas de uma forma que, de fato, destina-se a ser memorizada, e você terá todas as razões para confiar nesses relatos.

Bauckham também buscou na antropologia provas de que os autores dos Evangelhos não se sentiriam à vontade para modificar ou inventar palavras ou acontecimentos na vida de Jesus. Acadêmicos críticos do início do século 20 concluíram que os primeiros cristãos utilizaram um processo relativamente flexível para transmitir histórias populares baseadas em tradições orais e que se sentiram à vontade para modificá-las a fim de ajustá-las à realidade e situação correntes. Bauckham, contudo, cita o estudo de Jan Vansina sobre tradições orais nas culturas africanas primitivas, segundo o qual as lendas e os relatos históricos se distinguem claramente entre si e observa-se um cuidado muito maior na preservação precisa dos relatos históricos. Tal descoberta derruba cem anos de crítica acadêmica aos Evangelhos.

Acadêmicos especializados nos Evangelhos, com início nos críticos a o aee

ditavam] que os primeiros cristãos, ao transmitir a tradição de Jesus, no N.

tinção alguma entre o passado da história de Jesus e o tempo presente : Ê x

: e resasçãa ipo. Isso não é verdade.

Pois as sociedades orais não fazem distinções desse tipo. a do que David

y No Momento em que escrevo, assistimos » De E as á pan de Das Pã a ni SR rperd pare = recentes alegações de que

0 Mane do Tai código Pa de; y e ve ele se casou com Maria Mindalaná teve E e Jesus foi enpondem oedeq it Then alegando novas visões os. Outros especialistas escreve

“Bauckham Eyewitnesses, p. 324-46.

semelhantes com base nos evangelhos gnósticos. Muita coisa, sem dúvida, ainda vem por aí. Van Biema cita a editora chefe de religião da Publishers Weekly, Lynn Garrett, que fala do que ela rotula de “efeito código Da Vinci”. Ela diz: “Livros especulativos sobre o assunto já circulavam antes de Dan Brown escrever o dele, mas não chegavam às listas dos mais vendidos, e seus autores não compareciam a programas de televisão”.

Todas essas histórias revisionistas ignoram por completo o número cada vez maior de especialistas meticulosos que demonstram que muitas testemunhas oculares da vida de Jesus continuaram vivas durante muitos anos. Conforme observou o acadêmico britânico Vincent Taylor, se os céticos em relação à Bíblia estiverem certos, “os discípulos devem ter sido arrebatados ao céu imediatamente após a ressurreição” 2! Somente assim os elementos lendários poderiam ser incorporados à história de Jesus na época em que os Evangelhos foram escritos, mas isso por certo não ocorreu. Assim, por ironia, enquanto a mídia popular promove relatos da vida de Jesus baseados numa avaliação altamente cética de especialistas em Bíblia surgida um século atrás, os verdadeiros alicerces de tal avaliação vêm sendo rapidamente solapados.”?

*David Van Biema, “Rewriting the Gospels”, Time, March 7,2007.

2Vincent Taylor, The formation of the Gospel tradition, 2. ed. (Macmillan, 1935), p. 41. Também | citado e comentado em Bauckham, p. 7. |

2Em seu livro, Bauckham conclama os especialistas em Novo Testamento a romper de uma vez | por todas com a antiga abordagem extremamente cética da Bíblia chamada crítica da forma, vinculada sobretudo a Rudolph Bultmann. Se isso virá a acontecer logo ou não é questão de opinião, mas livros de autores como Bauckham e Wright estão abrindo as portas para muitos jovens acadêmicos mais receptivos às evidências de que a Bíblia é confiável. Para um relato interessante sobre as origens históricas da crítica cética da Bíblia, veja Hans Frei, 7he eclipse of biblical narrative (New Haven: Yale University Press, 1974). Para uma introdução a respeito de como o academicismo recente vem duvidando da historicidade dos Evangelhos bem menos que o academicismo mais antigo, veja Craig Blomberg, vi do we start studying Jesus?”, in: M. J. Wilkins; J. P. Moreland, orgs., Jesus under fire: modern gia reinvents the historical Jesus (Zondervan, 1995). O melhor relato do academicismo recente sobre e se encontra em Ben Witherington, The Jesus quest, 2. ed. (InterVarsity, 1997). Um exemplo paira de como a academia está demonstrando maior respeito pela Bíblia é John P. Meier, autor da volu a

noi jnal Jew: rethinking the historical Jesus. Ele é um acadêmico moderado, de ani rt íbli or considerá-los historicamente duvidosos, No entanto, faz uma cri? iei s tex a da

pi so . iso pisca e mostra que todas as linhas básicas da visão tradicional acercà das pa Ee Jesus apresentam credibilidade com base em meticulosa pesquisa histórica. , Scanned by CamScanner

A BÍBLIA NÃO DEVE SER INTERPRETADA LITERALMENTE 141

“Não se pode confiar na Bíblia

de uma perspectiva cultural”

Quando me mudei P ara Nova Tod há quase vinte anos, o principal problema que OS indivíduos viam sa Bíblia residia nas áreas que acabamos de discutir — ciência e história. Hoje, de certa maneira, isso mudou. Agora encontro mais pessoas especialmente incomodadas com aquilo que chamam de ensinamentos bíblicos retrógrados, que parecem apoiar a escravidão e a submissão das mulheres. Essas posturas soam tão infames aos cidadãos contemporãneos, que eles encontram dificuldade para aceitar qualquer outra parte da mensagem bíblica.

Nos primeiros dias da igreja Redeemer, passei um bom tempo com gente que estava lendo a Bíblia pela primeira vez. O resultado é que eu sempre me via respondendo às dúvidas de quem se engasgava com um versículo especialmente indigesto. Lembro-me de um jovem artista, vestido de preto, que me procurou após um culto. Ele tinha acabado de descobrir o versículo “escravos, obedecei a vossos senhores” (Ef 6.5 ) e estava enfurecido. Meu conselho para ele e para outros sobre como lidar com um texto das Escrituras que lhes parecesse ofensivo ou contrário às suas convicções foi o seguinte:

Muita gente foge automaticamente de qualquer ponderação sobre a Bíblia depois de encontrar uma passagem bíblica desse tipo. Aconselho-os, em vez disso, a ir com calma e examinar várias perspectivas diferentes quanto à questão que os incomoda. Assim, vocês serão capazes de ler, ap a “usufruir da Bíblia ainda que continuem à % debater com alguns de “Us conceitos

aa que pensem na possibilidade de pr a capa criei

a Não ensine o que parece estar engin é tm comentário razoável i "ia por alguns podem ser esclarecidos c Tomemos como exemplo [o) E * à questão em seu contexto o É compreensível que O leitor Médio isa dooiã pia o comércio de escravos africanos dos éculos 13 js pp vos e escravas brancos praticado em

Muitos lu o uno de e leitor pensa que O texto ensina que à SScray; q atualmente. Assim, €SS vel

idão é permissível, até mesmo descjá

Esse é um caso clássico de falta de conhecimento da distância cultural « histórica entre nós e o autor e leitores do texto original. No Império Romano do primeiro século, quando o Novo Testamento foi escrito, não havia grande diferença entre os escravos e a média dos indivíduos livres. Os escravos não se diferenciavam dos demais por raça, maneira de falar ou roupas. Tinham a aparência e a vida da maioria dos outros indivíduos e não eram em absoluto segregados do restante da sociedade. Sob o ponto de vista financeiro, OS egcravos recebiam os mesmos salários dos trabalhadores livres €, por isso, não costumavam ser pobres. Além disso, os escravos podiam juntar ca ital 5 Pital pessoal

suficiente para comprar a própria liberdade. Mais importante ainda era o fato de que poucos escravos viviam para sempre na escravidão. A maioria podia nutrir uma esperança razoável de adquirir a liberdade depois de dez ou quinze anos ou, no máximo, próximo aos quarenta anos de idade.

| Em termos comparativos, a escravidão no Novo Mundo foi homogênea € sistematicamente muito mais cruel. Nela o escravo era uma “coisa” que pertenci =. i

- sa totalmente ao senhor podia ser estuprado (fosse homem ou mulher), aleijado ou morto ao bel-prazer do dono. Na antiga servidão contratual, apenas a produtividade dos escravos — seu tempo e suas habilidades — pertencia temporariamente ao idã i é

' p a senhor. À escravidão africana, porém, baseava-se na raça ; orm mente era perpétua. Também vale a pena recordar que o comércio e escravos afri : : j

dad rum Começou e prosseguiu por meio de sequestros. A Bíblia condena de modo incondici 4 ;

E DE) Ag dicional o Sequestro e o tráfico de escravos (1Tm 1.9-11; cf. 7). Assim ime; dus ir:

» embora os primeiros cristãos não levantassem bandeiras PVeja Murray J. Harri ; 1

(IVP, 1999), p. 44 E Vej : rm Y Christ: a New Testament metaphor for total devotion to Ch ed , Pp , a tam m . já ,

- 416-7: “Os leites modermos [da ti Lincoln, Epbhesians, Word Bible Commentary, 190,P caga íblia] precisam se libertar de uma série de pressupostos sobre à escravidão do primeiro século, incluindo OS pressupostos d i i edad a condição de escravo e de cidadão livre [le ri nboels grande nur ten Edir os ici dae grilhão. [..] Havia Rod na OS OS que se encontravam escraviza mem ' “ €s 1cô

livre tanto na sociedade Fomana quanto na pre E Pietro de condições entre escravo é ireito à iedade, incluind é S%: Os escravos de senhores gregos tinham direi propriedade, incluindo a propriedade de escravos, e podiam ob ieçã regar em outro lugar, paralelamente a seus deveres de escravos. [...] M a Permissão para se ei resse de É Ê és PR u inha c

libertá-los, já que o trabalho que executavam podia custar m Itas vezes o senhor tinha ” aaa sem dúvida existisse um número muito alto de casos dis da se ig fossem lites Less aqu mava haver um clima geral de agitação entre os escravos” eldade, violência e injustiça, ná Scanned by CamScanner

A BÍBLIA NÃO DEVE SER INTERPRETADA LITERALMENTE 143

em prol da completa abolição da escravatura no primeiro século, isso foi feito | pelos cristãos que vieram depois, quando depararam com o estilo de escravidão do Novo Mundo, que não podia de forma alguma ser conciliado com os ensinamentos bíblicos.

Alguns vemos talvez não ensinem O que, à primeira vista, parecem ensinar. No entanto, existem pessoas que, depois de estudar com cuidado determinados textos bíblicos e conseguir entender o que eles ensinam, continuam a achá-los ultrajantes € retrógrados. O que, então, elas deveriam fazer?

Insisto para que vejam que a oposição que elas fazem a alguns textos pode decorrer de uma crença irrefletida na superioridade do momento histórico em que vivem em relação a todos os outros. Não devemos universalizar nossa época assim como não devemos universalizar nossa cultura. Pensemos na implicação do termo “retrógrado”. Rejeitar a Bíblia como retrógrada é partir do princípio de que chegamos ao momento histórico decisivo que serve de referência para detectar tudo o que é retrógrado e tudo o que é progressista. É claro que essa crença é ignorante e exclusivista, tanto quanto as ideias da Bíblia que a pessoa considera ofensivas.

Imaginemos a visão do cidadão britânico contemporâneo e como ela difere da visão de seus ancestrais, os anglo-saxões, de mil anos atrás. Suponhamos que ambos estejam lendo a Bíblia e deparem com o Evangelho de Marcos, capítulo 14. Primeiramente, os dois leem que Jesus afirma ser o Filho do homem que virá com os anjos no final dos tempos para julgar toda a humanidade conforme sua justiça (v. 62). Em seguida, leem que Pedro, o líder dos apóstolos, nega o Mestre três vezes e chega a amaldiçoá-lo para salvar a própria pele (v. 71). No entanto, Pedro depois é perdoado, e sua liderança, restaurada

*“Embora seja comum negá-lo, as doutrinas antiescravagistas começaram à aparsoçe na teologia cristã logo após o declínio de Roma, acompanhadas pelo desaparecimento da escravidão em quase toda a Europa cristã. Quando posteriormente instituíram a escravidão no su Mundo, s europeus foram de encontro à veemente oposição papal, fato que, por conveniência, degeço da história até pouco tempo atrás. Finalmente, à abolição da enpuRutaDa no Novo Minie foi Promovida e conquistada por ativistas cristãos. [...] No passado, à escravidão era quase fel em todas as sociedades capazes de sustentá-la, e apenas no Ocidente levantou-se Nua pn El importante que acabou levando à abolição” (Rodney Stark, For the glory of God, Princeton aaa Press, 2004, p. 291).

(Mc 16.7: Jo 21.15ss.). A primeira história E a ria

porâneo estremecer: parece ser muito arbitrária e em ' F e ag ele adoraria a passagem em que até mesmo Pedro po e nd a dj O € teintegrado a seu posto. À primeira história a percatiátia ni = a os “nel: -saxões, que sabem tudo a respeito do Juízo Fi “ gostar tam ' obter mais informações sobre ele! No entanto, a segunda situação os deixaria chocados, Em sua visão, deslealdade e traição como as praticadas por Pedro jamais podem ser perdoadas. Pedro não merece viver, muito menos tornar-se o líder dos discípulos. Tamanho desapontamento provavelmente os levaria a deixar à Bíblia de lado e nunca mais voltar a lê-la.

Naturalmente achamos que os anglo-saxões eram primitivos, mas um dia outros acharão o mesmo de nós e dos conceitos dominantes de nossa cultura, Como, então, podemos usar como parâmetro a referência atual sobre o que é “progressivo” para decidir quais partes da Bíblia são válidas e quais não são? Muitas crenças de nossas avós e bisavós parecem hoje tolas e chegam a nos envergonhar. Esse processo não parará agora. Nossos netos também rotularão de ultrapassadas várias noções que temos. Não seria trágico descartar a Bíblia com base em uma crença que logo parecerá frágil ou equivocada? Manter- -se longe do cristianismo porque parte dos ensinamentos bíblicos lhe parece ofensiva é uma postura que pressupõe que, se Deus existe, ele não pode ter nenhuma visão que incomode você. Será que isso faz sentido?

Tenho mais um pequeno conselho para quem resiste a alguns ensinamentos bíblicos. Devemos ter certeza de que sabemos distinguir entre os principais temas e mensagens da Bíblia e seus ensinamentos menos essenciais. A Bíblia fala da pessoa e da obra de Cristo e também ensina como as viúvas devem ser testador na igreja. O primeiro tema é muito mais fundamental. Em sua

Posso aceitar o que a Bíblia af assunto que está na moda. Se você diz lim

rma sobre os Papéis masculino e feminino»

procure se lembrar de que os próprios cristã di qu

de alguns textos, como também diver a — J8em quanto ao significa todos professam com as 8em em várias outras coisas. No entanto, dos mortos Ei Ra pi avras do Credo Apostólico que Jesus ressurglU ao terceiro dia. Não deixe que algo co e da

A BIBLIA NÃO DEVE SER INTERPRETADA LITERALMENTE 145

mulher O incomode E você não decidir o que pensa sobre os ensinamentos centrais da fé. ;

Talvez você Extrena Mas não Posso aceitar a Bíblia se o que ela diz a respeito dos sexos está ultrapassado”. Eu responderia com esta pergunta: “E por não gostar do que a Bíblia diz a respeito dos papéis de homem e mulher, você nega que Jesus ressuscitou dos mortos?”. Garanto que você não teimaria em uma conclusão tão desprovida de lógica. Se Jesus é o Filho de Deus, precisamos levar a sério seus ensinamentos, incluindo a confiança que ele depositava na Bíblia como um todo. Se ele não é quem afirma, por que iríamos nos importar com o que a Bíblia diz a respeito do qualquer outro assunto?

Veja o seguinte raciocínio: se você mergulhar na parte rasa da piscina bíblica, onde existem muitas controvérsias em torno de questões de interpretação, talvez se machuque. Se, porém, mergulhar no centro da piscina bíblica, onde existe consenso — sobre a divindade de Cristo, sua morte e ressurreição —, você sairá ileso. Por isso é importante levar em conta as afirmações essenciais da Bíblia sobre quem é Jesus e se ele ressuscitou ou não dos mortos, antes de rejeitá-la com base em seus ensinamentos menos essenciais e mais polêmicos.

Uma Bíblia confiável ou um Deus de Stepford?

Se Permitirmos que nossas crenças irrefletidas sabotem nossa confiança na Bíblia, O preço poderá ser mais alto do que imaginamos. =

Se você não confia na Bíblia o bastante para deixá-la desafiar e qui “la maneira de pensar, como poderá um dia ter um Dt a pena o Deus? Em qualquer relacionamento perdas sá ls pensar

“ Pensar diferente do outro. Por exemplo, se uma espo dirtdado Você diferente do marido, a relação entre os dois nunca par de prio ductos % lembra d dois!) filmes “As Esposas de Stepford ? Em uma cidê America da Aa E s decidem transformar as esposas em

tobôs que º tarada eg qi o di maridos. As esposas de End “am lind Jomais contrariam i o o» ém descreveria um casamento assim como Uma re e obedientes, is

ação pessoal ou de intimidade. » elimina da Bíblia tudo o que ndo RR qu a quando Ade? Se escolher aquilo em que

Sua sensibilidade ou contraria sua

deseja crer e rejeitar o restante, como será possível ter um Deus que venha à contradizer você? Não será possível! Você acabará com um Deus de Stepford, basicamente um Deus criado por você e não um Deus com quem você possa se relacionar e interagir verdadeiramente. Somente se o seu Deus puder dizer coisas que o façam se sentir ultrajado e obrigado a lutar (como em um casamento ou amizade de verdade!) você saberá que tem um Deus real e não algo que sua imaginação criou. Por isso, uma Bíblia inquestionável não é inimiga de um relacionamento pessoal com Deus, mas um pré-requisito para ele. Scanned by CamScanner

[EEE onde significa, literalmente, encontrar-se entre jornadas ou missões. E onde nos encontramos agora. Todas as objeções ao cristianismo ocultam crenças alternativas, pressupostos inverificáveis sobre a natureza das coisas. Até agora examinei as crenças subjacentes às seis maiores objeções ou dúvidas que os indivíduos de nossa cultura nutrem quanto à fé cristã. Respeito boa parte do raciocínio que as embasa, mas, no final, creio que nenhuma delas torna a verdade do cristianismo impossível ou mesmo improvável. No entanto, temos outra jornada a empreender. Uma coisa é argumentar que não existem motivos suficientes para desacreditar o cristianismo, outra é argumentar que existem motivos suficientes para acreditar nele. É o que farei na

“Espere”, alguém poderia dizer. “Você vai nos dar fundamentos suficientes para acreditar no cristianismo? Qual é a sua definição de cristianismo? E como você define 'suficiente"?”. Examinemos essas perguntas pela ordem.

De fora, as várias igrejas e tradições cristãs podem parecer paga distintas, quase religiões diferentes. Isso ocorre, em parte, P pia sa no Públicos serem bastante diversos, mas também porque, como eu ; Capítulo 3, o cristianismo é a religião mais disseminada nas culturas : regiões o

, p de formas culturais distintas.

mundo, Por isso, ele assume um número enorme e a dá Rã

Outra razão pela qual os cristãos parecem tão ditam n longo dos séculos. 'espeito aos grandes cismas teológicos que ocorreram à

no ioreia grega oriental e a igreja

À primeira grande divisão se deu entre a o é S Ja romana , : ão conhecidas como igrejas ortod

ocidental no século 11. Hoje, elas sã da dera porem di e g Oxa tê nde cism O da Igre;

oriental e católica romana. O segundo gra 'Sreja

ocidental, entre o catolicismo romano € Pp 4 sia

Todos os cristãos que levam a sério à verdade e a doutrina concordarão

ap innins Em mente relevantes. Elas criam

que tais diferenças entre as igrejas são alta jo uma

diferença de peso na forma como alguém adota e pratica uma religião. Não obstante, todos os cristãos ortodoxos, católicos e protestantes, professam os cl ' istóri esiástica, com

grandes credos dos primeiros mil anos da história ecl ; o 0 Credo Apostólico, o Credo Niceno, O Credo Calcedoniano e o Credo Atanasiano, Esses credos apresentam a visão cristã fundamental da realidade. Eles registram expressões clássicas da compreensão cristã de Deus como três em um. À crença na Trindade cria uma visão profundamente diversa do mundo se comparada à visão de politeístas, monoteístas não trinitários c ateus, como mostrarei no capítulo 13. Também nesses credos há uma forte afirmação da divindade e da humanidade plenas de Jesus Cristo. Os cristãos, assim, não encaram Jesus como mais um mestre ou profeta, mas como salvador do mundo. Esses ensinamentos tornam os cristãos muito mais parecidos do que diferentes.

O que é cristianismo? Para nossos fins, definirei cristianismo como O corpo de crentes que professam esses grandes credos ecumênicos. Eles creem que o Deus trino criou o mundo; que a humanidade caiu em pecado e no mal; que Deus voltou para nos resgatar na pessoa de Jesus Cristo que, por sua mor té e ressurreição, efetuou nossa salvação de modo que possamos ser recebidos el : toras , ,

; a graça; que ele fundou a igreja, seu povo, como veículo por meio do qual á prossegui ; issã SE -

: E o guimento à sua missão de resgate, reconciliação e salvação; e que, nº nal dos te é A o

: pindi Jesus voltará para renovar os céus e a terra, eliminando do mundo iniusti

T N o mal, a injustiça, o pecado e a morte.

ape isso. B acreditam em tudo isso, mas nenhum cristão acredita nas nisso. Basta você .& ai . p

da obra de J ; crguntar: (Como a igreja atua na condição de veículo

x a » Como a morte de Jesus efetuou nossa salvação”

e “Como somos recebidos pela graça?” . vá

8raça?”, para que cristãos católicos, ortodox

e protestantes lhe deem toti ,

ra intas. Apesar de muitos afirmarem

contrário, não existem cristãos “genéricos” : Todos

S genuínos, sem denominação. 10

precisam responder a essas perguntas para que vivam a vida cristã, e todas essas respostas imediatamente os encaixam em uma ou outra denominação.

É importante que os leitores entendam isso. Defendo neste livro a verdade do cristianismo em geral, não de determinada corrente dele. Alguns leitores presbiterianos atentos pesenbeção que me calo sobre algumas crenças teológicas particulares na tentativa de fazer o possível para representar todos os cristãos. No entanto, quando chegar a hora de descrever o evangelho cristão do pecado e da graça, necessariamente o farei como cristão protestante e não assumirei tons que um autor católico assumiria.

Quero mostrar que existem motivos suficientes para acreditar no cristianismo. Nos dias atuais, incrédulos de renome — Richard Dawkins, Daniel Dennett, Sam Harris e Christopher Hitchens — insistem que não há motivos suficientes para a existência de Deus. Dawkins, por exemplo, diz que a afirmação da existência de Deus é uma hipótese científica que deveria estar aberta à comprovação racional.! Ele e seus colegas céticos querem um argumento lógico ou empírico em favor da existência de Deus que seja à prova de tudo e, por isso, convença quase todo mundo. Não crerão em Deus enquanto não encontrarem tal argumento.

Há algo de errado nisso? Creio que sim. Esses autores avaliam os argumentos cristãos com base no que alguns chamaram de “racionalismo forte”.? Seus defensores estabeleceram o que se convencionou chamar de “princípio de erificação”, ou seja, ninguém deve acreditar em uma proposta à menos que E Possa ser provada racionalmente pela lógica ou empiricamente pela expe- “ncia dos sentidos.? Que sentido é atribuído à palavra “provada”? Prova, nesse COntexto, é um argumento tão forte que ninguém cujas faculdades mentais ai sa God delusion, p. 31ss. [edição em por tuguês: Deus: um delírio, tradução de

Veja mis mm o Paulo Compant vi Dio forte e racionalismo crítico em Victor a introdução ão técnica à Etna a E Gr

Em ei Cs. aa dangerous los Une a duo aê de

“Empre, em doa Ra ra j ns ma ra com base em provas (empíricas) Meuficientes” E Ugar e paca qualquer um, acreditar e algu de

- O texto mais conhecido de A. J. Ayer foi Language, truta, am 6 Scanned by CamScanner

estejam funcionando direito tenha motivo para densorestitan Ateus e agnósticos demandam esse tipo de “prova” para Deus, mas não são os únicos a se apegar ao racionalismo forte. Muitos cristãos afirmam que seus argumentos em favor da fé são tão fortes que todos aqueles que os rejeitam estão fechando a mente à verdade por medo ou obstinação.

A despeito de todos os livros conclamando os nano a produzirem provas para suas crenças, você não verá filósofos fazendo isso, nem os mais ateus, A grande maioria considera praticamente impossível defender o racionalismo forte. Para começar, ele não satisfaz suas próprias expectativas. Como provar empiricamente que ninguém deve acreditar em algo que não possa ser empiricamente comprovado? Não é possível, e isso acaba se revelando uma crença.” O racionalismo forte também pressupõe que seja possível alcançar “a perspectiva neutra”, uma posição de objetividade quase completa, mas praticamente todos os filósofos hoje admitem que isso é impossível. Chegamos a nossas conclusões individuais trazendo na bagagem todo tipo de experiências

p * crenças que influenciam profundamente nossa forma de pensar e a maneira como se processa nosso raciocínio. Não é justo, assim, impor um argumento à0 qual todos os seres racionais tenham de se render.

*Veja exemplos em Reppert.

'Em Whose justice? Which rationality?, de Alaisdair MacIntyre (Notre Dame University Press, 1988) [edição em português: Justiça de quem? Qual racionalidade?, tradução de Marcelo Pimenta nie (São Paulo: Loyola, 1991)], o autor demonstra de forma desafiadora e convincente como pense várias “tradições” diversas de racionalidade no Ocidente — a aristotélica, a agostinianaftomista, o realismo do bom senso. Em cada uma delas, a lógica e a razão funcionam segundo premissas fundamentais distintas sobre coisas como a natureza humana, a relação da razão com à emoção é? Wniage, a silação do indivíduo com o contexto social e a tradição, e assim por diante. Um argume” E ni coerência dentro de um conjunto de crenças de uma tradição er no talvez sejam escada coerent ' a entre essas racionalidades, e alguns a egos mi es em mais de uma tradição, mas é improvável (impossível; P

acIntyre) haver um único argumento sobre a existência de D d jenamente em todas as tradições racionais. E

e iluminista fis o racionalismo forte é À. Plnén

1983). A visão do iluminismo foi sho a pos Gt UNatrm Te e E em está E universalmente abandonada ai ren sa careta

cason «within the bounds of religion (Eerdmans, 1984). o pr | Scanned by CamScanner

(0) filósofo Tomas paca É io mas em seu livro The last word” admite que não é capaz da O di Ê questão de Deus de forma isenta. Ele confessa ter “medo de religião e duvida Ai que alguém consiga lidar com o assunto sem ter fortes motivos para direcionar os argumentos Em il oe para outro.

Estou falando do [...] medo da religião em si. Baseio-me em experiência própria, já que eu mesmo sofro desse medo. Quero que o ateísmo seja verdade. [...] Não é apenas O fato de eu não crer em Deus e, naturalmente, esperar estar certo em minha crença. Trata-se da esperança de que Deus não exista! Não quero que Deus exista. Não quero que O universo seja assim. [...] Fico curioso para saber se existe alguém que seja de fato indiferente à existência ou não de Deus, alguém que, seja qual for sua crença real sobre o assunto, não deseje especificamente que uma das duas respostas esteja certa.

Imagine um juiz que precise decidir sobre um caso em que uma das partes seja uma empresa na qual investiu muito dinheiro. Por desejar seriamente que o caso siga determinado curso, ele se declara incompetente para julgá-lo. Nagel está afirmando que, quando se trata de Deus, somos todos como esse juiz. Dependendo de nossa experiência com a religião, de nossas outras crenças e compromissos, e de como estamos levando nossa vida, todos temos profundo interesse em ver o julgamento da existência de Deus seguir este e aquele curso. O problema é que não podemos declarar incompetência para julgar. Por rejeitar o racionalismo forte, Nagel, apesar de seu ceticismo, respeita muito à féea religião e se distingue profundamente, da perspectiva de tom e postura, de escritores como Dawkins e Harris. o RAR mio

A indefensabilidade filosófica do “racionalismo forte é O motivo pelo qu Os livros de Dawkins e Dennett vêm recebendo duras € surpreendentes críticas das publicações acadêmicas. Apenas como exemplo, O acadêmico arms T delusion no London Review of

erry Eagleton fez uma dura resenha de The God aii

Bots, Eagleton ataca ambas as ideias ingênuas de Dawkins, a Sabem - isés (São Paulo:

UN dilção em português: 4 última palavra, tradução de Carlos Felipe Moisés ( ESP 2001). apo

“Thomas Nagel, The last word (Oxford University Press, 199 ), pe OU cd

a fé não apresenta nenhum elemento racional e a de q e baseia em grande medida na fé.

| Dawkins considera toda fé como fé cega e acha que as crianças cristãs e muçul- | manas são criadas para crer sem questionar. Nem mesmo os clérigos idiotas que ] me maltratavam no primeiro grau pensavam assim. Para o cristianismo, a razão, É a argumentação e à dúvida honesta sempre tiveram importante papel na fé. [...] A razão, é claro, não é onipresente para os que creem, mas também não é para os tipos não religiosos mais sensíveis e civilizados. Até Richard Dawkins vive mais segundo a fé do que segundo a razão. Nutrimos várias crenças que não podem ser | racionalmente justificadas, mas, ainda assim, elas nos parecem razoáveis...” À ao

Se rejeitarmos o racionalismo forte, será que ficaremos presos ao relativismo, sem nenhum parâmetro para separar um conjunto de crenças de outro? De jeito algum. Nos capítulos 2 e 3, defendo que é impossível manter o relativismo total.!º A abordagem que empregarei no restante deste livro chama-se “ . . RÁ » 1 . 2, .

racionalidade crítica”! Ela parte do princípio de que existem argumentos ue muitos indiví ionai ã jori ã i

q ndivíduos racionais, se não a maioria deles, acharão convincentes, mesmo na ausência de qualquer argumento capaz de convencer a todos indepç do ponto de vista de cada um. A racionalidade crítica parte o princípio i ã À den

p : pio de que alguns sistemas de crenças são mais razoáveis que outros, mas todos os argumentos sã i itdvrei -

o gu tos são racionalmente evitáveis no final, ou seja, sempre será possível encontrar u i i ã

p m motivo para fugir deles que não tenha por base O

“Terry Eagleton, “Lungi li i imo?

Dauilins a r o R umemg, failing, mispunching”, resenha de The God delusion, de Richard : Lon,

o ? mr ie of Books, vol. 28, n. 20, October 19,2006.

ara uma defesa sofisticad j i iai

] o à, veja H. Siegel, Relativism refuted: a critique of contemporary epistemological relativism (Dordrecht: D. Reidel 1987). O di : “ de” é , « Os relativistas insistem que a verdade

verídica somente dentro da estrutura de crenças de algué a , Ei À e alguém, e todas as estruturas têm a mesm

validade. Os relativistas dizem que não existe u itéri al , m critério transcendente à estrutura pelo qu

escolher entre todas as alegações de verdade. No enta ão dos aid anto, como observa Siegel, a afirmação

relativistas de que todas as estruturas (não apenas a deles) são ivuais é “ério de São iguais é, em si mesma, um critério

verdade que transcende a estrutura. Com tal afirmação, ele : ças del ' . » eles saem de sua estrutura e avaliam out”

com base na deles — mas é exatamente isso que eles negam a única a ão gam aos outros. “Assim [...] o relativismo Pº

pode se autoproclamar ou mesmo se autorreconhecer sem derrotar a si " (p. 43) : . . mesmo” (p. 43).

“De leitura acessível, veja a abordagem do racionalismo críti E crítico em Reppert, p. 3655.

——— >>> mae at ot cama amami Sa aaa |

peconceito ou à teimosia. Não obstante, isso não significa que não possamos avaliar crenças, mas apenas que Bia devemos esperar provas conclusivas, e esigi-las é injusto. pe ERRA os cientistas agem assim.

Os cientistas hesitam muito para afirmar que uma teoria está “provada”. Até Richard Dawkins admite que a teoria de Darwin não pode ser provada em definitivo, pois “novos fatos podem vir à luz para obrigar nossos sucessores [...] a abandonar O darwinismo ou alterá-lo a ponto de torná-lo irreconhecível”.2 No entanto, isso não quer dizer que a ciência não possa testar teorias e descobrir que umas são muito mais verificáveis empiricamente do que outras. Uma teoria é considerada empiricamente verificada se organizar as evidências e explicar os fenômenos melhor do que qualquer teoria alternativa concebível, ou seja, se, por meio de testes, nos levar a esperar com exatidão diversos eventos variados melhor do que a teoria que nos apresenta uma leitura concorrente dos mesmos dados. Então ela é aceita, embora não esteja “provada” (no sentido do racionalismo forte).

Em Is there a God? [Deus existe?], Richard Swinburne, filósofo de Oxford, defende com veemência que a crença em Deus pode ser testada e justificada (mas não provada) seguindo a mesma linha.? A noção de que existe um Deus, diz ele, leva-nos a esperar o que observamos, ou seja, a existência de um universo que sofre a ação de leis científicas e contém seres humanos com consciência e com senso moral permanente. A teoria da inexistência de Deus, defende ele, não nos leva a esperar nenhuma dessas coisas. Por isso, a crença em Deus oferece uma condição empírica superior e, comparada a alguma

Outra explicação para as coisas, explica e justifica melhor o que observamos.

“Extraído de 4 Devil's chaplain (London: Weidenfield and Nicolson, 2003), p. 81, apud A. TeCrnh, The Dawkins delusion (InterVarsity, 2007), p. 100, n. 16 [edição em português: O delírio de Pao uma paia ao fundamentalismo ateísta de Richard Dawkins, tradução de Sueli Saraiva (São

“CA estrutura básica de meu argumento é a seguinte: cientistas, historiadores e detetives ob- Servam os dados e depois elaboram uma teoria sobre o que explica melhor a ocorrência desses dados. Podemos analisar os critérios usados por eles para chegar à conclusão de que determinada teoria tem Mais dados a apoiá-la do que outra, diferente. [...] Utilizando esses mesmos critérios, descobrimos Que a visão que defende a existência de Deus explica tudo o que observamos, não só um estreito leque de dados” Richard Swinburne, 1s there a God? (Oxford University Press, 1996), p.2.

io de Deus pode ser provada, mas isso não significa que não Nenhuma nn fundamentos de várias crenças religiosas e descobrir onderar OS ' Do cad

possamos Pp uma única, sejam mais razoáveis.

: ingué e estou adotando a “racionali

Não quero, porém, que ninguem pense qu Não ed lidade

crítica” como uma espécie de prêmio de consolaçã a Bíblia é ” PAL IGN DO 4 b

realmente existe, a “racionalidade crítica é O melhor caminho para abordar a questão de sua existência e natureza.

Quando um cosmonauta russo voltou do espaço e relatou que não havia encontrado Deus, C. S. Lewis respondeu que isso se assemelhava a Hamlet subindo ao sótão de seu castelo em busca de Shakespeare. Se Deus existe, ele não há de ser outro objeto do universo, passível de ser levado a um laboratório e analisado por meio de métodos empíricos. Ele se relacionará conosco da forma como um teatrólogo se relaciona com as personagens de sua peça. Nós (as personagens) talvez sejamos capazes de conhecer razoavelmente bem o teatrólogo, mas apenas na medida em que o autor decida inserir na peça informações sobre si próprio. Por isso, em nenhuma hipótese poderíamos “provar” a existência d has :

ade Deus como se ele fosse um objeto integralmente contido em nosso universo, como ioêni à 2.3

pia acontece com o oxigênio e o hidrogênio ou com uma

rt outra metáfora para o conhecimento da verdade

e LVeus quando escreve que crê «

- que crê em Deus “com i | nasceu,

penas porque o vejo, mas porque À o o

Imagine olhar diretam dHe, por seu intermédio, vejo tudo o mais ente para o . ão é

possível. Ele queimaria sua : sol a fim de aprender a seu respeito. Não é S retinas i . 4-Jo.

Uma forma bem melhor destruindo sua capacidade de enxerga lo d . Para aprender sobre a existênci anria e natureiê

o sol é olhar o mundo que el stência, potência € Ni

que vemos e nos “98 mostra, reconhecer que ele sustenta tudo O capacita a vê-lo,

Collins, 1980) 140 [ Ed PR a Weight of glory and arpet

Paul Vid Ne ú edição em português: Peso de glóri Dn oe si a

atlo: Vida Nova, 1993)]. Síria, tradução de Isabel Freire Messias (Sã ————e 4

Am a a existência de Deus. Em vez disso, devemos “olhar pará o que o sol os taDRE.. Que relato do mundo possui mais “poder explanatório para dar sentido ao que vemos no mundo e em nós mesmos? Temos a sensação de que o mundo não é do jeito que deveria ser. Temos a sensação de que somos imperfeitos, porém grandiosos. Temos uma ânsia de amor e de beleza que nada neste mundo é capaz de satisfazer. Temos uma profunda necessidade de conhecer o sentido e o propósito. Que cosmovisão dá conta disso melhor?

Os cristãos não afirmam que sua religião lhes confere onisciência ou conhecimento absoluto da realidade. Apenas Deus os possui. Acreditam, contudo, que a explicação cristã das coisas — da Criação, da Queda, da Redenção e da Restauração — é a que faz mais sentido. Peço que você coloque o cristianismo como se fosse um par de óculos e olhe para o mundo através deles. Verifique que poder ele tem para explicar o que sabemos e vemos.

Se o Deus da Bíblia existe, ele não é um homem no sótão, mas, sim, O teatrólogo. Isso significa que não seremos capazes de encontrá-lo como se fosse um objeto passivo sujeito à investigação empírica. Em vez disso, precisamos descobrir as pistas de sua realidade que ele inscreveu no universo, € isso nos inclui. É por isso que, se Deus existe, é de esperar que descubramos seu apelo às nossas faculdades racionais. Se fomos feitos “à sua imagem” como seres racionais, individuais, deve haver alguma sintonia entre sua mente e a nossa. Isso também significa que, sozinha, a razão não basta. O teatrólogo pode ser conhecido somente por meio das revelações que faz. Por isso precisamos dar uma olhada no que a Bíblia diz a respeito de Deus e da condição nina,

No entanto, da perspectiva cristã, a prova definitiva da existência de Deus to próprio Jesus Cristo. Se Deus existe, nós, personagens de sua P ap ER Mos ter esperança de que ele inclua alguma informação a seu pa na FR No entanto os cristãos acreditam que ele fez mais do que nos ini infor

õ : otagonista da história, quando

Mações. Ele próprio se incluiu na peça como P nd É com ele que Jesus nasceu em uma manjedoura € ressuscitou dos mortos. q temos de nos relacionar.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se os Evangelhos preservam detalhes constrangedores e mulheres como primeiras testemunhas, coisas que ninguém inventaria para convencer aquela cultura, isso fortalece ou enfraquece a confiança de que relatam o que de fato aconteceu?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando rotulamos certos ensinos da Bíblia de "culturalmente obsoletos", não estaríamos absolutizando os valores da nossa época, que as gerações futuras também julgarão datados?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Você já considerou que escolher de antemão quais partes da Bíblia aceitar é, no fim, manter a si mesmo como autoridade final, em vez de deixar o texto confrontá-lo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$As pistas de Deus$t$, 9,
$conteudo$Se alguém descarta a existência de Deus e a sobrevivência após a morte como |

altamente incertas [...] terá de descobrir o sentido da vida. Se a morte põe fim a |

tudo, se não me cabe esperar o melhor nem temer o mal, preciso perguntar a mim |

mesmo para que estou aqui e como, nessas circunstâncias, devo me conduzir. Ora,

a resposta é clara, mas tão desagradável que a maioria de nós prefere não encará-la. |

Não há sentido para a vida e [por isso] a vida não tem sentido. |

Somerset Maugham, The summing up |

Era verdade, sempre me dei conta — nunca tive “direito” algum de existir. Surgi |

por acaso e existo qual uma pedra, uma planta, um micróbio. Eu não podia sentir |

coisa alguma, salvo minha própria embriaguez inconsequente. Fiquei pensando |

[...] cá estamos comendo e bebendo para preservar nossa preciosa existência, e |

não há nada, nada, absolutamente nenhuma razão para existir. |

Jean-Paul Sartre, 4 náusea |

C OMO acreditar no cristianismo se nem sabemos se Deus pqp cobro o disias prova irrefutável da nie “ pare a ho a

vários ly claros indícios de sua realidade — imp

H Fi larmente com um jovem

nto, º Eq época em que eu mé NI pi sa ms

Boa Bi e eia indo jr o o último descobri durante nossas

“nversas E E E neste RR da todos OS argumentos em favor da Wtência d EA UA poi a m crédito, em algum momento

e Deus e, embora muitos merecesse

sempre acabava tachando todos eles de racionalmente evitáveis. Isso 9 in modava bastante. “Não consigo acreditar, a ii O e dh mm Mínimo uma prova absolutamente irrefutável da EpnEnCa Fr E a ele. Euo alertava para o fato de ele estar adotando o “racionalismo forte”, e ele expe. rimentou certo alívio quando, juntos, nos demos conta de que tal prova irre. futável não existia. Então, voltamos atrás € revisamos as linhas de raciocínio que ele vinha chamando de “provas” e passamos a encará-las sem pistas, Ao abordá-las dessa perspectiva, ele começou a perceber que, cumulativamente, as pistas da existência de Deus eram bastante fortes.

O filósofo Alvin Plantinga acredita que não existem provas da existência de Deus capazes de convencer todos os seres racionais. Ele crê, porém, que existam, no mínimo, duas ou três dezenas de argumentos muito bons em favor da existência de Deus.! Entre os leitores que pararem para refletir sobre a lista de Plantinga, a maioria achará alguns argumentos cativantes e outros, não. Entretanto, o peso acumulado dos que forem considerados cativantes pode ser enorme. Esboçarei apenas alguns deles.

Os donos de mentes mais racionais sempre sentiram fascínio pela pergunta: a que existe algo em lugar de nada?”. Essa pergunta se tornou ainda mais interessante na esteira da teoria do Big Bang. Existem indícios de que o unirc. expandindo explosivamente a partir de um único ponto. Stephen Hawking escreveu: “Quase todos agora acreditam que o universo e O próprio rango tiveram início no Big Bang”.? Usando lin guagem leiga, 0 cientista Francis Collins fala sobre essa pista em seu livro 7he language of God:

plantinga lvinfovo dogen or so their argoner e ui esa ra | o resumo de William C. Davis, “Theistic ain Mi eme em: 1.º dez. 2014. Veja in pe | within (Grand Rapids: Eerdmans, 1998). in: Michael J, Murray, org., Reason for

1996), p. 5 [edição a aa Perg oftime and space (Princeton Universia, Rocha Barros (Campinas: Papirus, 1997)], Paço e do tempo, tradução de Alberto

Contamos com à apra bastante sólida de que o universo teve uma origem, O Big Bang. fdp de anos atrás, o Universo começou com uma explosão de energia e véia incalculável a partir de um ponto de proporções infinitesimais. Isso tpnes que antes nada havia. Não consigo imaginar como a natureza, neste caso o universo, possa ter criado a si mesma. O próprio fato de que o universo teve um começo implica que alguém foi capaz de lhe dar início, e parece-me que isso ocorreu necessariamente fora da natureza? Tudo o que conhecemos neste mundo é “contingente”, tem uma causa fora de si mesmo. Assim, o universo, que não passa de uma enorme montanha de tais entidades contingentes, teria de ser dependente de alguma causa fora de si mesmo. Algo precisou causar o Big Bang, mas o quê? O que poderia ser, senão algo externo à natureza, um ser sobrenatural, não contingente, que tem em si sua razão de ser?

Sam Harris, em sua resenha do livro de Francis Collins, levanta a objeção clássica a essa linha de raciocínio: “Seja como for, mesmo que aceitássemos que nosso universo teve de ser criado por um ser inteligente, isso não indica que este ser seja o Deus da Bíblia”. Absolutamente correto. Se encararmos esse argumento como prova da existência de um Deus pera, não chegaremos muito longe. No entanto, se estivermos buscando uma pista — uma pista de que existe algo além do mundo natural —, esse argumento será bem desafiador para muita gente.

O tapete cósmico de boas-vindas

Para que exista vida orgânica, as regularidades € constantes a damentais — a velocidade da luz, a constante de gravitação . : valores que,

tensão das for 1 fortes e fracas — precisam possuir o

. ças nucleares fo nte limitado. A probabi

lintos, se enquadrem em um escopo extremame so é ínfima, a ponto lidade de essa calibragem perfeita acontecer por aca

3 isponível em: hetp:// www. salon.com/books/

“Em uma entrevista em Salon.com, dispo

“BMG 08/07 /eolnsndexa.bhtml, acesso em: 9 mar a .2/20060815. sum harris Janguage. imo Ponível em: http://www.truthdig.com/repor ái

Ce/, acesso em: 9 mar. 2007.

de ser estatisticamente desprezível.” Mais uma vez, Collins descreve bem o argumento:

[Observado da perspectiva de um cientista, parece que o universo sabia que

| iríamos chegar. Existem quinze constantes — à constante gravitacional, várias

“constantes sobre as forças nucleares fortes e fracas etc. — que possuem valores

C exatos. Se alguma dessas constantes estivesse minimamente fora de esquadro

| mesmo que fosse uma parte em um milhão, ou, em alguns casos, uma parte em

um bilhão, o universo não teria chegado ao ponto em que o conhecemos hoje.

A matéria não teria condições de se aglutinar, não haveria galáxias, estrelas,

Alguns dizem que é como se existisse um painel ou dia/ com um grande número de indicadores de sintonia dentro de intervalos mínimos — e a sintonia se desse com perfeição. Parece bem improvável que isso tenha ocorrido por acaso. Stephen Hawking conclui: “As chances de um universo como o nosso surgir de algo como o Big Bang são ínfimas. Acho que existem implicações religiosas claras”. Em outro texto, ele prossegue: “Seria muito difícil explicar por que o universo teria começado como começou, salvo pelo ato de um Deus que pretendesse criar seres como nós”.”?

Trata-se do chamado “argumento da sintonia fina” ou “princípio antrópico”, ou seja, o universo foi preparado para os seres humanos. É um argumento que precisa ser bastante forte, pois há muitas críticas pesadas sendo publicadas contra ele. Uma das mais comuns, que consta do livro de Richard Dawkins, Hi God medo, é que talvez existam trilhões de universos. Dado o enorme Enio E Ei ao longo de enormes períodos dé it

É ável que alguns deles estejam em perfeita sinto

“Veja um breve resumo deste argumento em Robin Collins, “A scienti + for the existence of God: the fine-tunin desi DM: at, TA, soteiiio angu thin

“Em uma entrevistaem Sono dp E ” Me rende pt |

inc/i j “http://www.salon.com/books/in |

2006) p. 75 [edição em pin a q E tt evidence for belief ar E existe, tradução de Giorgio Cappelli (São Paulo: Gere 2007 cientista apresenta evidências de q , )1.

pasa sustentar nosso Hpo demidasO union em que vivemos é um deles: por is50, AQUÍ estimos nos. , e

Novamente, como ia 1 O argumento da sintonia fina é racionalmente evitável. Embora não haja prova alguma de que existem vários universos, tamvêm não há como provar que eles não existem.

No entanto, como pista, essa linha de raciocínio tem sua força. Alvin Plantinga ilustra a questão imaginando um homem em um jogo de pôquer que recebe vinte fours de ases seguidos. Quando os outros jogadores ameaçam partir para cima dele, ele exclama: “Sei que parece suspeito! Mas, e se houver uma sucessão infinita de universos, de modo que, para qualquer distribuição possível de cartas no pôquer, haja um universo em que tal possibilidade se concretize? Basta que estejamos em um deles em que eu sempre tire quatro ases sem roubar!”.? Esse argumento não surtiria efeito sobre os outros jogadores. A rigor, é possível que o sujeito por mero acaso conseguisse vinte fours de ases consecutivos. Embora não fosse possível provar a trapaça, não seria razoável concluir que ele não trapaceou.

O filósofo John Leslie propõe outro exemplo. Ele imagina um condenado que recebeu a pena de fuzilamento por um pelotão composto de 50 atiradores de elite 1º Todos atiram de uma distância de dois metros € nenhuma bala o atinge. É possível que até atiradores de elite errem o alvo a curta distância e, por isso, a rigor, é possível que todos por acaso errem ao mesmo tempao o bora não seja possível provar que todos combinaram errar, não seria razoáve Concluir o contrário. j ssdo-

A rigor, é possível que, por acaso, estejamos no único iiiperso o n ai ta vida orgânica. Embora não seja possível provar pe a mare aee “eso se deve a algum tipo de desígnio, não seria razoável págs é nai Embora a vida orgânica possa simplesmente ter ocorrido cem Da verdade? &entido viver como sé essa possibilidade infinitamente remota Se) Dai edição em portupuê “Veja Richard Dawkins, The God delusion o tradução de *E as (em Pais po Cristo ” tt's dangerous idea”, Books and Culture (May , 1996), nO de Alvin Plantinga, “Denne |

“Relatado em Collins, “A scientific argument”, Pm

A regularidade da natureza

Existe algo sobre a natureza muito mais Ampressorante e inexplicável do que seu desígnio. Todo raciocínio indutivo, científico, baseia-se no Pressuposto da regularidade (das “leis”) da natureza como, por exemplo, que a água ferverá amanhã sob as mesmas condições de hoje. O método de indução exige que se generalize a partir de todos os casos do mesmo tipo. Sem o raciocínio indutivo não poderíamos aprender com a experiência, não poderíamos usar a linguagem, não poderíamos confiar na memória.

A maioria dos indivíduos acha isso normal e isento de problemas. Exceto os filósofos! David Hume e Bertrand Russell, como bons secularistas, ficaram incomodados com o fato de não fazermos a mínima ideia do porquê da regularidade da natureza agora e, principalmente, com o fato de não termos a mais ínfima justificativa racional para pressupor que ela continuará amanhã. Se alguém dissesse: “Ora, o futuro sempre foi como o passado no passado”, Hume e Russel responderiam que essa pessoa está pressupondo exatamente aquilo que tenta provar. Em outras palavras, a ciência não é capaz de provar a regularidade contínua da natureza, mas apenas de aceitá-la pela fé.

Nas últimas décadas muitos acadêmicos vêm defendendo que a ciência moderna surgiu em sua forma mais sustentável a partir da civilização cristã, dada a crença em um Deus todo-poderoso, pessoal, que criou e sustenta um universo organizado. Como prova da existência de Deus, a regularidade da natureza não é inevitável. Sempre se pode dizer: “Não sabemos por que as coisas são como são”. No entanto, ela é útil como pista para a existência de Deus.

Arthur C. Danto, crítico de arte da revista 7he Nation, certa vez descrevel uma obra de arte que lhe dava uma sensação de “sentido obscuro, porém inescapável”.'? Em outras palavras, embora boas obras de arte não deem UM

NVeja “Science gets strange”, in: C. John Sommerville, 7he decline ofthe secular university (Oxford University Press, 2006). Veja também Diogenes Allen, Christian beliefin a post-modern avorld (Jobt Knox, 1989).

2Arthur Danto, “Pas de deux, en masse: Shirin Neshat's rapture”, The Nation, June 28, 1999.

dim certeiro” par ati rr si elas sempre nos passam a sensação jegue a vida não - uma história contada por um idiota, cheia de som e fúria, aih sentido algum . Elas nos pai de esperança e nos dão força para seguir ar e, embora não seja possível definir o que nos emociona. ? Leonard Berstein certa vez discorreu sobre o efeito que Beethoven prosocava sobre ele:

Beethoven [...] compôs obras de exatidão arrebatadora. Exatidão — é esta a palavra! Quando temos à sensação de que a próxima nota, qualquer que seja ela,

é a única certa para aquele instante, é bem provável, nesse contexto, que estejamos ouvindo Beethoven. Melodias, fugas, ritmos — façam deles bom proveito

os Tchaikovskys, os Hindemiths e Ravels da vida. Nosso garoto possui o dom

verdadeiro, o que vem do céu, o poder de nos fazer sentir completos: alguma

coisa é exata no mundo, algo é adequado do início ao fim, segue sua própria lei

com coerência; há algo em que podemos confiar, que jamais nos decepcionará.”

Se Deus não existe e se tudo neste mundo é produto de (conforme expressou Bertrand Russell) “um aglomerado acidental de átomos”, não há um propósito genuíno para o qual fomos feitos — somos acidentes. Se somos produto de forças acidentais da natureza, O que chamamos de “beleza” não passa de uma resposta neurológica a determinados dados. Achamos que certas Paisagens são belas somente porque tivemos ancestrais que sabiam que ali encontrariam comida e que sobreviveram por causa desse elemento neurológico Je agora também possuímos. Da mesma forma, embora a música nos pareça portante, essa importância é uma ilusão. Também o amor deve ser encarado er ls E somos o resultado de disrças Ecs Pei di

sobrevive não passa de uma reação bioquímica, herdada de :

B tam porque essa característica OS ajudou à sobreviver. paia “sy na fe ss pai imp ' ai eilzdetie sentimos que

iste um 6 Ra de obras-primas e da beleza, inescapave tida

entido real na vida, que existem verdade e justiça e estas ) “Extraído de L :n “The i : (Simon & Schuster, 2004), p. 105. conard Bernstein, “The joy of music (Sim

o « tudo. Observe que Bernstein, que nada tinha de

decepcionarão, e que O amor é csrandã :M

religioso ortodoxo, não consegue Se furtar até mesmo a Wes g iii céu ao falar de Beethoven. Assim, podemos ser materialistas os que acreditam que verdade e justiça, bem e mal não passam de ilusões completas, Na presença da arte, porém, ou mesmo diante de uma grande beleza natural, nosso coração nos diz outra coisa.

Outro artista de renome que aparentemente nos diz o mesmo é John Updike. Em seu conto “Pigeon feathers” [Penas de pombo], um adolescente diz à mãe: “A senhora não percebe que, se quando a gente morre tudo acaba, nada de sol, de campos, tudo é um horror? Só um oceano de horror”. Mais tarde, diante da beleza de penas de pombo, de sua textura e cor, ele é tomado pela certeza de que existe um Deus por trás do mundo, um Deus que o deixará viver eternamente.!* Updike parece dizer que independentemente das crenças que temos em nossa mente sobre a aleatória falta de sentido da vida, elas se modificam diante da face da beleza.

Mas alguém pode contestar: “E daí? Só porque algo nos dá a sensação de ser verdade, não quer dizer necessariamente que seja!” Mas será que estamos falando apenas de sensações aqui? O que essas experiências evocam é, para ser mais exato, apetite ou desejo. Goethe se refere a isso como selige sebnsucht, an- Em im e apenas sentimos a realidade, mas também a ausência daquilo

Fim é ado Agostinho concluiu que esses desejos impossíveis de serem satisfeitos nai pistas da realidade de Deus. Como assim? Com efeito rum a eita eira só porque sentimos vontade de comer carne no que o apetite por qualquer comida nã is desrjada ur ani a verdade que os desejos inatos corres ão cd a exisrênção de comida? Não é fazd-los, cama o desejo seual (epi pa a objetos reais capazes é E Pr cnc é co á enem ao sexo), o apetite fisiológico

; ei ge rrespondente ao sono) e o anseio

por laços afetivos (correspondente à amizade)?

4, Dt pri Why do we believe?”, The New York Times Magazine, March

O desejo irrealizável evocado pela beleza não é um desejo ; por felicidade, amor e beleza que nenhuma en JO inato? Temos jo j ; Idade .

ns de ou sucesso é capaz de satisfazer. Queremos algo de ei sexo, iza . ã ' ERC Tê que nada no mun

rt substituir. Será que isso não é ao menos uma Pista da existência d o Fra desejamos?" Assim, esse anseio irrealizá ta desse

migo q a É Pode ser qualificado

im profundo desejo humano inato, o que o torna uma ri:

como de Deus.é ma pista importante

Em nossa cultura existe uma corrente de pensamento muito influente que firma ter as respostas para todas as chamadas “pistas” mencionadas. Trata-se da escola da biologia evolucionista que afirma que tudo a nosso respeito pode ser explicado como uma função da seleção natural. Um livro que busca explicar assim todas as pistas para a existência de Deus é Breaking the spell: religion asa natural phenomenon,” de Daniel Dennett. O autor afirma que, se temos sentimentos religiosos, isso se deve apenas ao fato de que tais características jiajudaram no passado um grande número de seres humanos a sobreviver ao meio ambiente e, por isso, esse código genético nos foi legado. Dennet resume sua visão:

Tudo o que valorizamos — do açúcar ao sexo, do dinheiro à música, passando à ' õ jacentes €

pelo amor e pela religião — valorizamos por determinadas razões. Subj 5 ) p “ erança”, em C.sS. Lewis,

M. À afirmativa clássica desse argumento se encontra no capítulo si o eo de Álvaro PET à an es,

: * Christianity (Macmillan) [edição em português: Cristianismo puro np P E insfontes

Permann e Marcelo Brandão Cipolla (São Paulo: Wmfmartinsfontes, ci Paio E NT We : ão é a mesma dos platônicos.

filósof, — Right observa que a visão ceistiá da yeleza 2º de beleza nos indicam O caminho ii ê e

ade Sregos acreditavam que todas as experiências terrenas A spiritual eterno da realidade é, . ndo € k .

di, deste mundo mater jal, uma imagem refletida, pare O po g uma nova terra. Nossos anseios Mis ; No entanto, a visão bíblica da salvação é de um novo € ” mas à restauração deste mundo Citos nã ritual, mi

hi itos não se referem apenas a um mundo eterno, a saio importante, pois O famoso iÇão (vei - . = E um ani

“me (veja Weight, Simply Christian, p- 44 E a segue demais O modelo platônico. : vp, ai do desejo” de C. S. Lewis, em Mere prega a como fenômeno natural, tradução de Icã E grão

tea id português: Quebrando o encanto: à TeHE;

ndres (São Paulo: Globo, 2006).

distintas, nossas razões são razões evolucionistas, motivações lógicas que Autuam

livremente, endossadas pela seleção natural. !º

Na New York Times Magazine, Robin Marantz Henig examinou o que os

evolucionistas pensam a respeito da religião em um artigo chamado “Why do we believe? How evolutionary science explains faith in God” [Por que cremos? Como a ciência evolucionista explica a fé em Deus].” Sabemos que “a ideia de um Deus infalível é agradável e bem conhecida, algo que as crianças prontamente aceitam”. Por quê? Alguns evolucionistas, como David Sloan Wilson, acham que a crença em Deus tornou as pessoas mais felizes e altruístas, o que possibilitou que suas famílias e tribos sobrevivessem e elas conseguissem melhores parceiros. Outros, como Scott Atran e Richard Dawkins, postulam que a crença em Deus é um subproduto acidental de outras características que beneficiaram a adaptação. Nossos ancestrais que sobreviveram tinham uma tendência maior para detectar ameaças mesmo quando não havia nenhuma, bem como para identificar quem era mais apto a impor narrativas, raciocínio causal, com relação a tudo que acontecia à sua volta. No entanto, essas mesmas características nos tornam mais receptivos à crença em Deus — a ver agentes, narrativas e inteligências onde estes, na verdade, inexistem.?!

A despeito dos inflamados debates nesta área, os teóricos evolucionistas concordam que nossa capacidade de acreditar em Deus se encontra embutida em nossa fisiologia, pois estava direta ou indiretamente associada a caracte- Enieaa que ajudaram a adaptação de nossos ancestrais ao meio ambiente. Por log argumentos em favor da existência de Deus convencem tanta gente. É só o Às pistas não apontam para coisa alguma. |

que ele, com efeito, aponta cata outss . rs contradição fatal como tom |

Na última parte do livro de Davlias, 75 A Tre deneus ite que como somos produto da seleção natu Vi ã Rea PAgEA PIMERRNNE O

ral, não podemos confiar integralmente

os New York Times Pita pe York Times Book Review, February 19» 2006-

“Henig, “Why do we believe?”, p. 43.

nossos sentidos. Afinal, a evolução só se is

em ortamento adaptativo, não a crença sida ssa em preservar o ati outro cientista diz: “Em algumas rca da New York

po ólica que se origina da realidade factual faz mais pais] ia palavras, falsas crenças P drânoicas Costumam ser mais eficazes para ajudar a sobreviver do que crenças monlists,

Não creio que Ta ou outros teóricos evolucionistas percebam a plena extensão desse insight crucial. É possível confiar somente que a evolução nos forneça faculdades cognitivas que nos ajudem a seguir vivendo - não que ela forneça faculdades que nos deem uma imagem precisa e fdedigna do mundo à nossa volta.?* Patrícia Churchland se expressa com estas palavras:

A principal tarefa do [cérebro] é encaixar as partes do corpo onde estas devem

ser encaixadas para que o organismo possa sobreviver. Melhorias no controle

sensitivo-motor conferem uma vantagem evolutiva: um estilo mais sofisticado de

“Dawkins, The God delusion, p. 367ss., “nosso próprio cérebro é um órgão que evoluiu [...] evoluiu para nos ajudar a sobreviver”.

“Em seu prefácio para The selfish gene [edição em português: O gene egoísta, tradução de Rejane Rubino (São Paulo: Companhia das Letras, 2007)], de Richard Dawkins, Robert Trivers observou à ênfase do autor no papel do engano na vida animal é acrescentou que, se na verdade “o engano é findamental para a comunicação animal, deve haver uma forte seleção para identificá-lo, e ai deve, Por sua vez, optar por um grau de autoengano, tornando inconscientes alguns fatos € si para Mão trair os sinais sutis de autoconhecimento do engano praticado”. Assim, “a visão convencional de We a seleção natural privilegia os sistemas nervosos que produzem imagens ao e ar ral do mundo deve ser uma visão muito ingênua da evolução mental”. Apud Robert Wright, a a pe (Pantheon, 1994), p. 263-4 [edição em português: O animal moral: pr que use pr mi a "ova ciência da psicologia evolucionista, tradução de Lia Wyler (Rio de J hn postem 2 a o Pleólogo cognitivo Justin Barrett escreve: “Alguns cientistas cognitivos nr do ao liga it suas funções foram 'programados' pela seleção Sm Ei ce an e bri, a pressuposto é cpistemologieamen e ; pn mente como um todo nos diga a Verdade à res nin Aida ando se trata de um raciocínio point [...] ia esa uma de coisa alguma = sobretudo Famiá ale firmar com segurança é que nossa Mente fo; io mp gem pi da aê », Justin L. Barrett, Why avould anyone believe im Gog? (als ei nossa sobrevivência no passado -

representar [o mundo] é vantajoso desde que [...] aumente 8 Possibilidades de

sobrevivência do organismo. À verdade, seja qual for, vem por último.

Thomas Nagel, conhecido filósofo e ateu, concorda com isso no último capítulo de seu livro The last word. Ele escreve que, para si certeza de que q que nossa mente nos diz é realmente verdade, no mundo HE fora Precisamos “seguir as regras da lógica, pois elas estão FRER e não apenas Porque estamos biologicamente programados para fazê-lo”. No entanto, de acordo com a biologia evolucionista, as leis da razão teriam de fazer sentido para nós meramente porque nos ajudam a sobreviver e não porque obrigatoriamente nos dizem a verdade. Assim, indaga Nagel:

[Será que podemos ter alguma] confiança permanente na razão como fonte de

conhecimento a respeito do caráter não evidente do mundo? Acredito que, em si

uma história evolucionista [da raça humana] contraria essa confiança *

“Os evolucionistas dizem que se Deus faz sentido para nós não é porque ele realmente exista, mas apenas porque essa crença nos ajudou a sobreviver, logo, estamos programados para tê-la. No entanto, se não pudermos confiar

que as faculdades que formaram nossas crenças nos dizem a verdade sobre Deus, por que haveríamos de confiar que elas nos dizem a verdade sobre o que quer que seja, inclusive sobre a ciência evolucionista? Se nossas faculdades cognitivas nos dizem apenas aquilo de que precisamos para sobreviver, e não O que é verdade, como confiar nelas em relação a todo o resto?

— Aparentemente, os teóricos evolucionistas precisam optar entre dois minhos: ou voltam atrás e admitem que podemos confiar no que nossa mente nos diz a respeito de tudo, inclusive de Deus — se encontrarmos argumento ou pistas que indiquem sua existência e nos pareçam convincentes, talvez el exista mesmo —, ou seguem adiante e admitem que não podemos confiar Dº ts 1987, 58, Ad Pg, e a 0 en, Jamal

2000), p.218. , ant and proper function (Oxford Uni

que nossa mente n os diz a respeito de coisa alguma. Iniusto é 495 evolucionistas estão fazendo : Justo É o que tantos

cientista » OU Seja, usando o bisturi d

ceticismo para cortar o que nossa mente nos diz a respeito de D o próprio

oque ela nos diz sobre a prúpria ciência evolucionista.

Fm toda a questão da biologia e da teoria evolucioni

Aquiles. Alvin Planti onista existe um evidente

ia Ry de vul peso ca próprio Charles Darwin

eu essa grande vulnerabilidade. P : ,

seconhec 5 ara um amigo, Darwin escreveu:

.. sempre surge à dúvida terrível sobre as convicções da mente humana, que se

desenvolveu a partir da mente de animais inferiores, se elas têm ou não algum

valor ou se são confiáveis.”

Plantinga então prossegue afirmando que é definitivamente irracional xeitar o “naturalismo” evolucionista, a teoria de que tudo em nós se originou unicamente da seleção natural. Se fosse verdade, não poderíamos confiar nos métodos pelos quais chegamos a essa teoria, bem como a nenhuma teoria científica.

Gente como Dawkins defende que existe um conflito entre ciência e religião

[...] a verdade, porém, é que O conflito se dá entre a ciência e O naturalismo, não .

entre a ciência e a crença em Deus. [...] Em vista da evolução não orientada,

seria igualmente possível tanto viver em uma espécie de RO q

conhecer realmente algo sobre nós mesmos e sobre nosso mundo.” i Harris,

À despeito de livros populares como 08 de De tê tange à religião, Ue g : ionista No é

We tentam usar o exterminador de pistas evolucion AR

Cada vez mai falhas, e não só 08 crentes

n ez mais pensadores estão vendo essas " Wieseltier, editor literário

do Ta, também = -UininnA ns ento exterminador de pistas

em é New Republic, denuncia a falha no me ell.

“a resenha do livro de Dennett, Breaking the? d

ZA, PRA, de Warrant and prop er fumei!

Univers Pud Alvin Plantinga, “Is naturalism irrationd” » Ad proper function. ro,

= Y Press, 2000), p. 219. 11 e 12, em Wlarrant and proP (Books and

Veja o lantinga caps hard Dawkins

“% argumento completo em A. Plan God confusiom, de Ric

“Guy -taído da resenha de Alvin Plantinga de Ty

'*[Dennett] retrata a razão a serviço da seleção natural e como produto da seleção natural. Mas se a razão é um produto da seleção natural, que nível de confiança | poderíamos ter em um argumento racional em favor da seleção natural? O poder / da razão se deve à sua independência e a nada mais. [...] À biologia evolucionista não pode invocar O poder da razão se, ao mesmo tempo, o destrói.

Tudo se resume ao seguinte: se, como dizem os cientistas evolucionistas, 0 que nosso cérebro nos diz sobre moral, amor e beleza não é real — mas meramente um conjunto de reações químicas destinadas a dar continuidade a nosso código genético —, o mesmo é válido para o que o cérebro deles lhes diz sobre o mundo. Assim, por que deveríamos confiar neles?

O exterminador de pistas, na verdade, é uma pista

Acho que, no final das contas, o suposto exterminador de pistas acaba nos | dando mais uma pista da existência de Deus. |

À primeira pista é a própria existência do mundo, o Big Bang. O secula- | rista responde corretamente: “Mas isso não prova a existência de Deus. Talvez o Big Bang tenha se autoprovocado”. A segunda pista é a sintonia fina do universo, uma possibilidade em um trilhão de trilhões de que nosso universo sustente a vida orgânica e humana. Mais uma vez, um secularista pode responder com razão: “Mas isso não prova a existência de Deus. Talvez por uma circunstância totalmente aleatória, este universo é o que foi formado”. Outra pista é a regularidade da natureza. Todo raciocínio indutivo, científico se ba.

seia nessa pressuposição, embora não disponhamos da mais ínfima justificativa | racional para supor que ela prossiga. Quando os crentes afirmam ser esta uma pista para a existência de Deus, os incrédulos retrucam: “Não sabemos por que

a natureza é regular; é assim, e pronto. Isso não prova a existência de Deus”.

ie pista é a da beleza e do sentido. Se somos o produto de forças

eine e sem sentido da natureza, indagam os crentes, como explicar |

a sensação que temos de que a beleza importa, de que o amor e a vida são |

tias eia Wieseltier de “The God genome” foi publicada no New York Times em 19 de |

. nortantes? O secularista responde: “Isso não prova dada pum explicar todas essas “sensações e convicções a existência de Deus. ucionista. Nossas intuições religiosas, estéticas e mia da biologia é ajudaram nossos ancestrais a sobreviver”, N O

porque ) . TF. INO entanto, como apontam

dários pensadores, se é que esse argumento prova algo, ele prova demais. Se não podemos confiar em nossas faculdades formadoras de crenças em uma área, não podemos confiar nelas em área alguma. Se não existe Deus, não devemos confiar de forma alguma em nossas faculdades cognitivas.

Mas confiamos, ora, e esta é a última pista. Se acreditamos na existência de Deus, nossa visão do universo nos fornece uma base para crer que as faculdades cognitivas funcionam, já que Deus nos capacitou a formar crenças e conhecimento verídicos. Se acreditamos na existência de Deus, o Big Bang nada tem de misterioso, nem a sintonia fina do universo nem a regularidade da natureza. Todas as coisas que vemos fazem sentido. Igualmente, se Deus existe, nossas intuições a respeito do sentido da beleza e do amor são presumíveis.

Se você não crê em Deus, não só todas essas coisas são profundamente inexplicáveis como também sua visão — de que Deus não existe — o levará a não esperá-las. Embora haja poucos motivos para acreditar que suas faculdades racionais funcionem, você continua a usá-las. Não há base para crer que a natureza continuará regular, mas você segue utilizando o raciocínio indutivo e a linguagem. Não há motivos fortes para confiar em sua sensação de que o amor ea beleza importam, mas você segue achando que sim. C. S. Lewis expressa “sas ideias com eloquência:

Não é possível, exceto no sentido animal mais primitivo, você se apaixonar pa

uma moça quando sabe (e vive lembrando) que toda a sua Heli tanto a

quanto de caráter, é um padrão momentâneo e acidental produzido Ear E por

de átomos, e spria reação a eles não passa de uma espécie de be , » € que a sua próp ç enes. Não é possível

“Scência psíquica que brota do comportamento de e b não para de lem-

Continuar a tirar da música um prazer substancial, se você stle* dá y lhe agrada

bra que sua aura de importância não passê peqputh pa ” ds a gostar dela.”

Porque seu sistema nervoso está irracionalmente condiciona

“Es Lewis, “On living i ic age”, in: Present concerns (Collins, 1986), p: 76.

Naturalmente nenhuma das pistas que buscamos até agora prova q existência de Deus. Cada uma delas é racionalmente evitável. No entanto, Penso que seu efeito cumulativo seja estimulante e poi Hnlroã a visão secularizada do mundo seja racionalmente possível, ela não explica tão bem todas a coisas quanto a visão de que Deus existe. Por isso as chemaroi de pistas, À teoria da existência de um Deus que criou o mundo explica as evidências que vemos de forma mais satisfatória do que a teoria de que Deus não existe, Os que defendem a inexistência de Deus seguem usando a indução, a linguagem ' suas faculdades cognitivas, e tudo isso faz muito mais sentido em um universo criado por Deus, no qual ele tudo sustenta com seu poder. |

Posso imaginar que, a esta altura, alguém esteja dizendo: “Então, tudo é inconclusivo! Em suma, o que você está dizendo é que Deus provavelmente existe, mas ninguém é capaz de fornecer um argumento à prova de tudo. Isso significa que ninguém sabe se ele existe ou não”.

Não concordo com esse pensamento.

No próximo capítulo, farei algo muito pessoal. Não quero argumentar em favor da possibilidade da existência de Deus, mas demonstrar que você já sabe que ele existe. Gostaria de convencer o leitor de que, seja o que for que professemos intelectualmente, a crença em Deus é inevitável, é “básica”, não podemos prová-la, mas também não podemos evitá-la. Sabemos que Deus existe. É por isso que, mesmo quando acreditamos com toda nossa força mental que à vida não tem sentido, não conseguimos viver assim. Temos consciência disso.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se o universo teve um começo e suas constantes parecem ajustadas com precisão extraordinária para permitir a vida, o que lhe parece mais razoável: que tudo isso brotou do nada por acaso ou que aponta para um Autor?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por que confiamos tanto na regularidade da natureza e na nossa própria razão para fazer ciência, se, num universo puramente acidental, não haveria garantia de que nossa mente diga a verdade sobre a realidade?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando a beleza desperta em você um anseio que nada neste mundo satisfaz por completo, você já se perguntou se esse desejo não estaria apontando para algo, ou Alguém, além daqui?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O conhecimento de Deus$t$, 10,
$conteudo$CuarLig: Claro que Deus existe! No fundo, todo mundo sabe que sim.

CynrTHIA: Eu não sei de nada disso.

CuarLIE: Claro que sabe! Quando pensa consigo mesma — e na maior parte do tempo que passamos acordados fazemos isso —, com certeza você tem aquela sensação de que seus pensamentos não são totalmente desperdiçados, que de alguma forma estão sendo ouvidos. Acho que essa sensação de ser ouvido em silêncio com uma compreensão absoluta é o que representa nossa crença inata em um ser supremo, em uma inteligência que abrange todas as coisas. O que isso demonstra é que algum tipo de crença é inata a todos nós. Em algum momento a maioria das pessoas perde essa crença, que pode ser recuperada apenas por meio de um ato consciente de fé.

Cynruia: E você passou por isso?

Chartig: Não. Espero passar um dia.

Metropolitan (1990, Estados Unidos, Whit Stillman)

SCRITORES e preletores conservadores vivem se equi q h

de . ae ais. Como pastor em Manhattan,

k nossa cultura são relativistas e amorats. anos e Dão

quase duas décadas vivo em meio a jovens de vinte e P j

Concord, : ; Itos secularizados que conheço têm um

O com essa visão. Os jovens adultos

Sent; “a coisa que acontece no

uito aguçado do que é certo ,

Mundo é les. No entanto, há um problema com

E 9 é moralmente ultrajante para les.

Em várias ocasiões, preciso assumir o papel de professor de filosofia para ser um bom pastor. Um jovem casal certa vez me procurou para recebe, orientação espiritual. Eles me disseram: “Não acreditamos em quase na. da”. Como eles poderiam ao menos começar a pensar na possibilidade d, existência de Deus? Eu lhes pedi que me falassem de algo que para eles fosse realmente errado. À moça imediatamente atacou as ações que marginalizam as mulheres. Respondi que concordava plenamente, pois era um cristão que acreditava que Deus criou todos os seres humanos, mas fiquei curioso acerca do porquê de sua crítica. Ela me disse que “as mulheres são seres humanos, e seres humanos têm direitos, e é errado passar por cima dos direitos de alguém”. Perguntei-lhe como sabia disso. Intrigada, ela respondeu: “Todo mundo sabe que é errado violar os direitos de alguém”, ao que retruquei: “A maioria das pessoas neste mundo não “sabe” disso. Elas não têm uma visão ocidental dos direitos humanos. Imagine que alguém lhe diga: todo mundo sabe que as mulheres são inferiores”. Você diria isso não é um argumento, apenas uma afirmação”. E estaria certa. Assim, comecemos de novo. Se, como você pensa, Deus não existe, e todos evoluíram a partir de animais, por que seria errado passar por cima dos direitos de alguém?”. O marido interveio: “Sim, é verdade que somos apenas animais com cérebros maiores, mas eu diria que os animais também têm direitos. Também não se pode passar por cima dos direitos deles”. Perguntei-lhe se ele responsabilizaria os animais por violar os direitos de outros animais quando, por exemplo, os mais fortes comem os mais fracos. “Não, eu não os responsabilizaria”. Quer dizer que você responsabiliza apenas 08 seres humanos por oprimirem os mais fracos? “Sim.” Perguntei-lhe o porque desse padrão de dois pesos e duas medidas. Por que o casal insistia que os seres ar tinham de se distinguir dos animais, de modo que não lhes era pelinido agir como é natural para o restante do mundo animal? Por em pr em insistir que os seres humanos possuem essa digni

grande e incompará did ois

acreditavam nos direitos pda a pic o du ui |

eles existem, só isso”, ida despon deu à moça, àc

versa foi muito mais agradável do

Ago Lriu d a que transparece nesse relato

ro. O jovem casal riu da fragilidade de al

ompactogumas de suas respostas, e

c fez perceber que estavam receptivos a um anã ,

E a lou a ser mais diret é averiguação mais detida,

quê me estimu. ng o que de hábito. No entanto, essa con- SAT vela como nossa cu tura é diferente de todas as outras que nos precessoas ainda nutrem fortes convicçõ '

jesam. Às Pe : i Vleções morais, mas, ao contrário

k indivíduos de outras épocas e lugares, não possuem nenhuma base visível para O porquê de acharem algumas coisas más e outras boas. É quase cono Se SUAS intuições morais flutuassem livremente no espaço — bem acima do chão.

O poeta polonês Czeslaw Milosz fala sobre o assunto:

O que surpreende no período pós-Guerra Fria são as belas e tocantes palavras pronunciadas com veneração em lugares como Praga e Varsóvia, palavras que pertencem ao velho repertório dos direitos do homem e da dignidade do indivíduo. Esse fenômeno me confunde, porque é possível que haja um abismo por baixo dele. Afinal, essas ideias se apoiam na religião, e não sou muito otimista quanto à sua sobrevivência em uma civilização tecnocientífica. Ideias que pareciam enterradas para sempre subitamente ressuscitaram, mas quanto tempo poderão permanecer à tona se o chão lhes foi tirado?”

Não creio que Milosz esteja certo. Acho que os indivíduos continuarão mtrindo em definitivo suas crenças na dignidade humana, ainda que a cren- | a consciente em Deus desapareça. Por quê? Defendo uma tese radical. Acho | uy “ctênci é inevitável |

e as pessoas em nossa cultura sabem que a existência de Deus é inevitável, | Mas renri a |

eprimem esse conhecimento. |

Mum ouvir alguém dizer: “Ninguém pode impor sua vis

Outros 8 : rdade que está dentro

de ta orque todos têm o direito de encontrar à ve â ic ido Cada um” : à mercê de uma sért |

um. Essa crença deixa seu proponente à |

“Apud Mi sazhos: religion, lat, courts (Cambridge |

Cien ichael ]. Perry, Toward a theory 9f human D$

perguntas bastante incômodas. Não existe gente no mundo fazendo coisas que você acha serem erradas — coisas que deveriam parar de fazer não importa o que pensem sobre seu próprio comportamento? Se esse é o seu caso (e é o de todos nós!), será que isso não indica que você, de fato, acredita existir algum tipo de padrão moral a ser respeitado independentemente de convicções individuais? Isso leva a uma pergunta. Por que é impossível (na prática) ser um relativista moral coerente, mesmo quando nos declaramos assim? A resposta é que todos temos uma crença difusa, potente e inevitável não apenas nos valores morais, mas também no dever moral. Nas palavras do sociólogo Christian Smith:

“Moral” [...] é um posicionamento em face da compreensão do que é certo e

errado, justo e injusto, que não surge a partir de nossos desejos ou preferências,

mas, ao contrário, existe à parte deles e fornece padrões com base nos quais nossos próprios desejos e preferências podem ser julgados.?

Todos os seres humanos têm sentimentos morais. É o que chamamos de consciência. Quando pensamos em fazer algo que sentimos estar errado, costumamos nos refrear. Nosso senso moral, porém, não para por aí. Também acreditamos haver padrões que “existem por si próprios” e nos servem de base para avaliar os sentimentos morais. O dever moral é a crença de que algumas coisas não devem ser feitas, não importa como o indivíduo se sinta a respeito delas, independentemente do que digam o restante da comunidade e a cultura, sendo ou não essas coisas do interesse do agente. O jovem casal, por exemplo, não tinha dúvida que o dever dos indivíduos de outras culturas era honrar Os direitos das mulheres.

| a tenhamos aprendido que todos os valores morais são relativos à Ei um e culturas, não podemos viver dessa maneira. Na prática, é ineviind tratemos a/guns princípios como padrões absolutos e os utilizemos a nn : ao dade E ao não competiam de npsgs valores. O

vas? Nada nos dá esse direito. No o a n as as crenças morais são relans , ntanto, não conseguimos evitar tal prática.

as am Moral believing animais: human personhood and culture (Oxford University Scanned by CamScanner

Quem ri ante a áliiináção de que existe uma ordem moral transcendente não acha que O Erondlio racial seja apenas algo absurdo e contraproducente, mas sim, que ele n errado. Os nazistas que exterminaram judeus podem ter alegado que não consider avam seus atos imorais. Pouco importa. Pouco importa se eles acreditavam sinceramente estar prestando um serviço à humanidade. Eles não podiam ter feito aquilo.

Não apenas nutrimos sentimentos morais, mas também acreditamos piamente na realidade do padrão moral, que existe por si próprio e usamos para avaliar nossos sentimentos morais. Por quê? Por que razão achamos que esses padrões morais existem?

À teoria evolucionista do dever moral

Uma resposta comum nos dias atuais deriva do que chamei no capítulo anterior de “exterminador de pistas”, ou seja, a sociobiologia ou psicologia evolu- % cionista. Essa visão defende que os altruístas, aqueles que agem sem egoísmo e com espírito de cooperação, sobreviveram em maior número do que os egoístas e cruéis. Assim, os genes do altruísmo nos foram legados, e agora a maioria dos indivíduos considera “certo” o comportamento altruísta.

Existem, contudo, várias falhas nessa teoria, e ela tem recebida enfia arrasadoras.? O comportamento altruísta, de autossacrifício, de qm E em relação a um parente pode resultar em uma taxa maior de obesas pa afamília ou o clã desse indivíduo e, consequentemente, em um número superior de descendentes portadores do material genético dessa pessoa. Visando aos

“Entre as obras que tentam explicar nosso senso de dever moral ee pra Jtural encontram-se: Edward O. Wilson, On human nature (Hloeenrd h Dil The selfish Me biological basis for morality”, Atlantic Monthly, April nei anais isidigodo Rejane o (Oxford University Press, 1976) [edição em P ui ng animal: evolutionary

Ubino (São Paulo: Companhia das Letras, 2007), e pod O animal moral: por que somos - ne and everyday life (Pantheon, 1994) nai de Lia Wyler (Rio de Janeiro: Devir 19% a nova ciência da psicologia ás ci m em Philip Kitcher, Vaulting ambi na

; ! Veja algumas críticas bastante ferinas à ess . Hilary Rose; Steven Rose, Alas, poo “ciobjolo sure (MIT Press, 1985); ns hn Dupre, Human nature and ie and the quest for human na “ ebology (Harmony 2000); John L)upré, “e limits » mão paid mid. à va 2001).

cience (Oxford University E TESS» »

propósitos do evolucionismo, porém, a reação oposta, de hostilidade dirigida a todos os que não pertencem a esse grupo, também deveria ser considerada moralmente correta. No entanto, acreditamos hoje que é certo sacrificar tempo, dinheiro, emoção e até mesmo a vida em prol de um indivíduo ou de uma tribo “de fora”. Se vemos um total desconhecido cair em um rio, mergulhamos imediatamente para salvá-lo, sob pena de nos sentir culpados. Com efeito, a maioria de nós sentirá o dever de fazer o mesmo, ainda que a pessoa que está em perigo seja nosso inimigo. Como essa característica pode nos ter sido legada por um processo de seleção natural? Pessoas assim teriam menos probabilidade de sobreviver e transmitir seus genes. Com base no naturalismo evolucionista estrito (a crença de que tudo o que nos diz respeito existe em virtude de um processo de seleção natural), esse tipo de altruísmo deveria ter desaparecido da raça humana há muito tempo. Em vez disso, ele está mais forte do que nunca.

Outros argumentos usados para demonstrar os benefícios reprodutivos do altruísmo também enfrentam problemas. Alguns defendem que o comportamento altruísta leva o agente a receber de terceiros vários benefícios recíprocos indiretos, mas isso não consegue explicar nossa motivação para praticar ações que não chegarão ao conhecimento de ninguém. Outros argumentam que 0 comportamento de autossacrifício beneficia todo o grupo ou sociedade, capacitando k sociedade inteira a passá-lo adiante em seu código genético. No entanto, existe consenso de que a seleção natural funciona em indivíduos, não em populações inteiras.

Minimo Re pia origem de nosso “ au

» O fato de todos acreditarmos na existência

z Ego cre cá e e E: que ele desmascara um exemplo às vez e terem mais filhotes, suas irmãs. “Mas o sima die ni né vm ambiente ai pag evolucionistas pelo fato de que os genes que motivam re o pa e temente e mesmos que serão passados por suas mães às irmãs que id, E di ra o o pcomum ligação direta de DNA não se aplica a populações a compl a app cer papa quase universalmente concordam entre si que a seleção operado nota do quais e “ R a pó lação.” Veja também George Williams, Adaptation and natural ' " ' faia ge o ity Press 1996), que afirma que a seleção coletiva não ocorre, “elttion (Princeton Univert? Scanned by CamScanner

zes morais independentes pelos i . .

de padrõe . Pp P quais nossos sentimentos morais

Esse senso de dever moral cria um problema para os que têm uma cosmovisão secularizada. Carolyn Fluehr-Lobban é uma antropóloga cujo campo profis- Z e “« ..

sional é dominado pelo que ela chama de “relativismo cultural” — a visão de que todas as crenças morais são culturalmente criadas (ou seja, nós as temos porque fazemos parte de uma comunidade que lhes empresta credibilidade) e que não há base objetiva para julgar que a moralidade de uma cultura seja superior à de outra. No entanto, essa antropóloga ficou horrorizada diante de atos de opressão às mulheres em sociedades por ela estudadas e decidiu que promoveria os direitos das mulheres sempre que atuasse como antropóloga. Isso de imediato gerou um enigma para ela. Ela sabia que sua crença na igualdade feminina derivava de uma linha de pensamento individualista socialmente localizada (Norte da Europa, no século 18). Que direito tinha ela de promover suas ideias em detrimento das ideias das sociedades não ocidentais em que trabalhava? Sua reação foi a seguinte:

Os antropólogos continuam a expressar um forte apoio ao relativismo cultural. Uma das questões mais polêmicas nasce da pergunta fundamental: Que autoridade temos nós, ocidentais, de impor ao restante da humanidade nosso próprio conceito “a « « única coisa no universo. [...] Nunca temos

: € (como estamos supondo) a Natureza [...] é a única cols? 4N alii m q a Natureza no: a

a Dia por ser ele genuíno, mas somente porque às dai GS os obrigam a agir - ; za n

to, Nunca agimos por ser correto, mas apenas porque as forças da Nature assim, [ À é inacreditável. Para começar, somente atraves da bs +=) [Mas] com efeito, essa [...] conclusão é inacreditável. Do peias lêrehs . OISs, q

pa ânça em nossa mente passamos à conhecer a própria Natureza [...] dep É ar am E í i ara crer nelas L.eJ Se

Meio “8rupamentos acidentais de átomos e não teríamos motivo pa átomos sob nosso crânio en- ; á

Pelo qual os antropoides de nossa espécie percebem quando os air tam em d ] P A e causas bastante irracionais, não humanas, nã eterminados estados — estados produzidos po :cão bem

o mora : impasse. Devemos voltar a uma visão be

À 8.[...] Existe apenas uma forma de evitar esse pannacãe” nr Beer Tais anti . P A livres e racionais, no presente vivendo em Univ, 8a. Precisamos aceitar que somos livres, seres inner (E 8. Lewis, “On living . VESO jrrari . ão deriv cdi ans

Nan ar 'tracional, bem como temos de concluir que nam

Mic age”, in: Present concerns.)

de direitos universais? [... Mas] o argumento dos relativistas culturais é muitas

vezes usado por governos repressores para Se esquivarem da crítica internacional à

violência que praticam contra seus cidadãos. [...] Acredito que não devemos deixar

que o conceito de relativismo nos impeça de utilizar os fóruns nacionais € internacionais para examinar maneiras de proteger a vida e a dignidade dos indivíduos de

todas as culturas. [...] Quando existe escolha entre a defesa dos direitos humanos e

a defesa do relativismo cultural, os antro ólogos devem optar por proteger e propolog ptar por proteger e pro

mover os direitos humanos. Não podemos ser meros espectadores.

A autora faz uma pergunta difícil: “Se todas as culturas são relativas, também relativa é a ideia de direitos humanos universais. Como posso decidir impor meus valores a determinada cultura?”. No entanto, ela não responde à sua própria pergunta. Apenas diz que sua denúncia de opressão se baseia em um conceito ocidental de liberdade individual, mas não apresenta resposta para o enigma. Simplesmente declara que as mulheres estão sendo oprimidas e que ela se sente na obrigação de pôr fim a isso. Temos de levar nossos valores ocidentais a essas outras culturas. Nossos valores são melhores que os delas, e ponto final.

A difícil questão dos direitos humanos

Tisgen Hab uma crise de peso no campo dos direitos humanos. abermas escreve i : ; Rail

humanos na Ási Ática a despeito de suas origens europeias, Os direitos sia, na i ári ; o

ra pd o" rica e na América do Sul hoje “constituem a única m pela qual opon íti :

to oder y ponentes e vítimas de regimes homicidas e de guerras evantar a voz con tolênci a :

pl pm Ea a violência, a repressão e a perseguição”? Isso mportânci inoi k

cris x a da moral dos direitos humanos, que Michael J.

pala p RO de que todo ser humano possui dignidaq obrigação de ordenar nossa vida de acordo com tal

Carolyn Fleuhr-Lobban, “Cultural relativi

, tvism and universal É ” che 0)

Higher Education, June 9, 1995. Artigo citado e usado ir ua ai rights”, The Gita q ; ular argumento semelhante

George M. Marsden, The outrageous idea of Christi ; su

E g , 44 of Christian scholarship (Oxford University Press, 1997) 7Apud Michael J. Perry, Toward a theor :

> Of human rights: relioi bridge

University Press, 2007), p. 3. gue raligiêm Java, mund (Camo! da Scanned by CamScanner

fato. É errado flar , Parra idêntica de outros seres humanos. Mas por go devemos acreditar nisso? De que depende essa dignidade?

Alan Dershowitz, prstessoi de Direito em Harvard, apresenta as possibilidades enseu PEA Aa o rights come from?” [De onde vêm di reitos?].º Alguns dizem que os direitos humanos vêm de Deus. Se fomos todos criados à imagem de Deus, todo ser humano é sagrado e inviolável. Dershowitz rejeita essa resposta, já que vários milhões de indivíduos são agnósticos. Outros dizem que os direitos humanos vêm da natureza, ou do que é chamado “lei natural”. Estes defendem que a natureza e a natureza humana, se examinadas, apresentarão alguns tipos de comportamento que “e encaixam” na forma como as coisas são, e estão corretos. No entanto, Dershowitz observa que a natureza se vale da violência e da predação, da sobrevivência dos mais aptos. Não há maneira de chegar ao conceito de dignidade de todo indivíduo a partir da forma como as coisas realmente funcionam na natureza.

Outra teoria afirma que os direitos humanos são criados por nós, por aqueles que fazem as leis. Muitos defendem que é do interesse das sociedades criar os direitos humanos, pois honrar a dignidade individual significa que, a longo prazo, todos na comunidade se sairão melhor. No entanto, o que acontece se a maioria decidir que não é de seu interesse conferir direitos humanos? Se os direitos não passam de uma criação da maioria, não existe nada a que apelar quando eles são cassados. Dershowitz, citando Ronald Dworkin, argu- Menta que essa terceira noção de direitos humanos é inadequada:

Dizer que a comunidade se sairá melhor a longo prazo se Os indivíduos Re

esses direitos não é uma resposta válida [...] porque quando pos que tlguém

tem o direito de oninar livremente, estamos afirmando que tal direito lhe perten pinar ,

SE ainda que não atenda ao interesse geral.

dn a E direitos humanos são criados pela a ditada

Teside no fato de que podem ser usados para Íorç

Tia, P.6. Par ittle, Brown,

0a ul 1 de Alan M. Dershowitz, Shoutingjire: civil libertiesin a turbulent age (Little,

honrar a dignidade das minorias e dos indivíduos, à Mespeito do conceito de a Te «o podem ser criados. Precisam ser descobertos, sob “bem maior”. Direitos nao po nao .

pena de não valerem nada. Como conclui Enolieio, Se qpibscritoa defender os direitos individuais, temos de tentar descobrir algo além da utilidade que demande esses direitos”.!º ii

O que será esse “algo”? Nem Dworkin nem Dershowitz são capazes de responder. Dworkin acaba apelando, de todo jeito, para uma forma de domínio da maioria. Em Life's dominion: an argument about abortion, euthanasia and individual freedom [O controle da vida: argumentos sobre aborto, eutanásia e liberdade individual] (1995), ele escreve:

A vida de um único organismo humano exige respeito e proteção [...] por causa de nossa admiração diante [...] dos processos que geram vidas novas a partir de vidas antigas. |...) A essência do sagrado reside no valor que atribuímos a um processo, a uma empreitada ou a um projeto, e não aos seus resultados, independentemente da maneira como foram produzidos... !!

Michael J Perry, professor de Direito, contrapõe:

A fonte não religiosa do normativismo, para Dworkin, é o grande valor que “nós” atribuímos a todo ser humano considerado uma obra-prima criativa; é “nossa” arg diante dos processos que produzem novas vidas a partir de vidas antigas. [...] Mas a quem Dworkin se refere com seus “nós” e “nossa”? Os nazistas salao os judeus em sua essência? O problema evidente com o argumento Pap de Dworkin [com relação aos direitos] é que ele pressupõe a existência F rr entre Os agentes humanos, consenso este que não existe nem O livro de ia Toward a theory on human rights [Por uma teoria de direitos humanos], é bastante persuasivo, Perry conclui que, embora seja evidente “que existe fundamento religioso para a moral dos direitos humanos [...] não 1Jbid., p. 15.

a existência! de fundame A ueli d

evidente ntos não religiosos, secul,

; já! » 14 » Secutares. para os

e « humanos”. Perry comenta o famoso argumento d N; F

gre aque e Deus está morto, toda e qualquer moral do amor e d d » que aii - . e dos direitos

e base. de Deus não existe :

pá nos carece , defendem Nietzsche, Sartre e ou-

- 14 nor que ser generoso, amoroso ou lut à .

mos NÃO há por q 8 4 ? ar pela paz. Perry cita Phillipa

rot e diz que os pensadores seculares aceitaram a ideia da inexistência de Deis é de qualquer sentido para a vida humana, mas não “chegaram a cerrar j acerca da moral. j

dias com Nietzsche oral. Continuamos a achar natural o julgamento moral, como se nada tivesse acontecido”.!5 Por quê? [44 º .

O poderoso “Quem foi que disse?”

A explicação consta de um ensaio clássico do falecido professor de Direito de Ye Arthur Leff. A maioria das pessoas sente que os direitos humanos não são criados por nós, mas, sim, descobertos por nós, que eles existem e têm de er honrados pelas maiorias, quer elas gostem, quer não. No entanto, Leff diz: Quando seria proibido utilizar o equivalente intelectual daquilo que nos bares e pátios escolares se define como o poderoso “quem foi que disse?”. Na ausência de Deus [...] todo [...] sistema ético e jurídico [...] seria diferenciado pela resposta que se desse a uma pergunta-chave: quem entre nós [...] precisa ser capaz de yo a cP adicã tuguês: Exisleme; Tejao famoso ensaio de Sartre, “Existentialism is à humanism” [edição em por gu i “alismo é u : a : h (Petrópolis: Vozes, 2012). “Deus não dit m humanismo, tradução de João Batista Kreuch Pp | Não é mais possível e 4 pçs ã +. | INÃO Ads

ha Ê L.] é necessário levar as consequências de sua ausência até O fim. [ i-lo. Não algum b lo “ancia infinita e perfeita para elaborá-lo. Ná Sá eser em a priori, já que não existe uma consciência inhinite ão podemos menfitis “to em lugar al 7 "exi temos de ser honestos ou que não P . iu gum que 'o bem existe, que ioveley escreveu certa vez: Se N Que estamos k homens. Dostoievsky es

US não eric agora no plano onde existem apenas Deus não existe, e O homem, im “istisse, tudo seri «ado! Tudo é de fato permitido se Deus ni ja fi | nsequê , seria permitido". Tudo € ada de que depender, seja den ênci 2 o BE? , , ar nadie k

tr “ja for ç está desamparado, pois não é capaz de a ufman, org Existentialism from a .p É A ar a chdy DD)

| ty de de o ei o de ser lido on-line em: http://www.

| "oi a Sartre (Meridian Publishing Company; 1989) sso em: 17 mar: 2007. ] Ê à e id

Pery Teference/archive/sartre/works/exist/ sartre.htm, 4€ T . :

ig Arda theory of human rights, pH E, Bucar; B. Barnetb orgs. Does human he Pi 8 JR irá)

CN mood. “23, Outro livro recente sobre esse tema €

186 OS FUNDAMENTOS DA FÉ |

declarar que isso ou aquilo é uma “lei” que tem de ser Poececie Formulada d um jeito direto assim, à pergunta é tão Inbelentualiente eo a que se poder esperar que um número considerável de pensadores EA é éticos teria ss não lidar com ela. [...] Ou Deus existe ou ele não existe, mas, se ele não exi s nada nem ninguém pode ocupar seu lugar...!

Se Deus não existe, não há como dizer que um ato seja moral” e out “imoral”, mas apenas que “este me agrada”. Se é assim, quem se vale do direit de transformar em lei os próprios sentimentos subjetivos e arbitrários? Talve você argumente que “a maioria tem o direito de definir as leis”, mas será qu você também diria que a maioria tem o direito de votar pelo extermínio de um minoria? Se sua resposta for “não, isso está errado”, voltará à estaca zero. “Que: foi que disse” que a maioria tem o dever moral de não matar a minoria? Por qu suas convicções morais seriam obrigatórias para os que se opusessem a ela Por que sua visão deveria prevalecer sobre a vontade da maioria? O fato é qu | diz Leff, se Deus não existe, todas as declarações morais são arbitrárias, todã as avaliações morais são subjetivas e internas, e não é possível haver um padrã moral externo pelo qual sejam julgados os sentimentos e os valores de alguér

Mas Leff conclui seu ensaio intelectual de uma forma ainda mais chocante:

Do jeito como estão as coisas agora, qualquer um pode tudo. Ainda assim, jog napalm em bebês é errado. Matar de fome os pobres é perverso. Comprar 05 melhante e vender-se é depravação. [...] O mal existe. Todos juntos agora: Que foi que disse? Que Deus nos ajude. ?

Nietzsche, é claro, entendia isso. “As massas piscam e dizem: 'Somos tod iguais — o homem é sempre o homem, diante de Deus somos todos igual Diante de Deus! Mas hoje esse Deus está morto”.“” Raimond Gaita, pensad ateu, escreve com relutância: 4

Am Allen Leff, “Unspeakable ethics, unnatural law”, Duke Law Journal (Dec E [edi ia Nietesche, Thus spoke Zaratustra, part IV, “On the Higher Mar”, próximo ao fim da seç edição em ês: Assi; A ' 1

ção ds Assim falou Zaratustra, tradução de Mário da Silva (Rio de Janeiro: C ; Scanned by CamScanner

O CONHECIMENTO DE DEUS 187

Somente quem é religioso pode falar seriamente do sagrado. [...] Podemos dizer

que todos os seres humanos são de um valor incalculável, que são fins em si mesmos, merecedores de respeito incondicional, que possuem direitos inalienáveis e,

é claro, têm dignidade inalienável. Em minha opinião, essas são formas de tentar

dizer aquilo que precisamos dizer quando nos alienamos dos recursos conceituais

fisto é, Deus]. [...] Nenhuma [dessas declarações a respeito dos seres humanos] tem o poder do discurso religioso [...] de que somos sagrados porque Deus ama

Leff não conclui apenas que não há base para os direitos humanos sem Deus, mas também ressalta (como fazem Dershowitz e Dworkin, à sua maneira) que, a despeito do fato de não podermos justificar ou fundamentar os direitos humanos em um mundo sem Deus, ainda assim sabemos que eles existem. Leff não fala somente do ponto de vista genérico, mas também do ponto de vista pessoal. Sem Deus, ele não pode justificar o dever moral, mas, ainda assim, não pode ignorar que ele existe.

O argumento em favor da existência de Deus

baseado na violência da natureza

Por que saberíamos disso? Para melhorar nosso foco na importância desse conhecimento indelével do dever moral, reflitamos sobre as observações da escritora Annie Dillard. Ela morou durante um ano perto de um 1 Eadeá o Tontanhas da Virgínia na esperança de encontrar inspiração e vitalidade por Meio da proximidade com a “natureza”. Em vez disso, convenccurse de Era ag é totalmente regida por um princípio central — a violência dos tor Os fracos.

Não existe uma única pessoa no mundo que $€ pompa esto ou

uva-a-deus. “Espere aí!”, você vai dizer, “na natureza o turas morais em

“rrado; esses conceitos são humanos!” Exatamente! Somos cria sentimento

Um mundo al nsemos na alternativa [...] somente O

a “Raimond Gaita, 4 common bumanity: ghinking about Jove and truth and justice (apud “Ty, Toward a theory of buman rights, p: 7 € 17-8). á

humano é estranhamente anormal... Tudo bem — anormais são nossas

emoções. Somos aberrações, o mundo é perfeito, sejamos todos lobotomizados

a fim de voltar ao estado natural. Podemos sair [...] e, lobotomizados, voltar ao

riacho e viver à beira dele com a tranquilidade de qualquer ratazana d'água ou

dos juncos. Você primeiro.”

Annie Dillard percebeu que a natureza inteira se baseia na violência. No entanto, é inevitável acreditarmos ser errado que indivíduos ou grupos humanos mais fortes matem os mais fracos. Se a violência é totalmente natural, por que considerar errado que seres humanos fortes passem por cima dos fracos? Não há base para o dever moral, a menos que defendamos que a natureza, em certo sentido, é antinatural. Não podemos saber que a natureza é de alguma forma imperfeita, a menos que exista algum padrão sobrenatural de normalidade além da natureza pelo qual sejamos capazes de julgar o certo e o errado. Isso significa que é preciso haver céu, ou Deus, ou algum tipo de ordem divina independente da natureza a fim de que esse julgamento seja possível.

Só existe uma saída para esse enigma. Podemos examinar os relatos da Bíblia e ver se eles explicam melhor nosso senso moral do que uma visão ia Se o mundo foi criado por um Deus de paz, justiça e amor, é por isso, então, que sabemos que violência, opressão e ódio são errados. Se 0 mundo está decadente, falho e precisa ser redimido, isso explica a violência e à desordem que vemos.

' vos vio qua os direitos humanos são uma realidade, faz muito mais algumas coisas como certas e out diam pio ip

tas como erradas, espero que seja capaz de

entender a profunda desarmonia entre o mundo d i undo

ET Ri ndo do seu intelecto e o m a

crucial. Se uma premissa (“Deus do ni dy pe li á vma ça | sabe não ser verídica (“jogar napalm em el Du deus porta e º -” | que não alterar a premissa? és é culturalmente relativo"), ? j Scanned by CamScanner

Existência, um litígio interminável e é

Não tentei provar a existência de Deus para você. Meu objetivo foi mostrar que você já sabe que Deus existe. Até certo ponto, venho tratando a inexistência de Deus como um problema intelectual, mas há muito mais em jogo. Isso não apenas torna sem sentido todas as escolhas morais, mas também retira o sentido da vida. O dramaturgo Arthur Miller revela essa realidade com eloquência por meio de Quentin, personagem de Depois da Queda. Quentin diz:

Durante muitos anos encarei a vida como um processo judicial. Tratava-se de um conjunto de provas. Quando somos jovens, provamos nossa coragem ou inteligência; depois, o quanto sabemos amar, ser bons pais e, finalmente, o quanto somos sábios, poderosos ou [seja lá o que for]. No entanto, percebo agora que nisso tudo sempre houve uma premissa: seguimos [...] por um caminho ascendente na direção de algum lugar mais alto onde [...] só Deus sabe [...] serei justificado ou até mesmo condenado. De qualquer forma, um veredicto. Acho agora que minha tragédia realmente começou no dia em que ergui o olhar [...] e não havia juiz. E não restou nada mais além de uma discussão interminável comigo mesmo, esse litígio sem sentido da existência diante de um estrado sem juiz. [...] Isso, é claro, é outra forma de dizer — desespero.

O que ele está dizendo? Todos vivemos como se fosse ici sap Paz em vez da guerra, falar a verdade em vez de mentir cuidar e net em lugar de destruir, Acreditamos que tais escolhas não sejam am ed Há quer Maneira como escolhemos viver importa. ii NA r ee

N fato ausente, “quem foi que disse quer pr inútil, um litígio “Odemos discutir, mas tudo não passa ao bito da civilização huinterminável. Se o juiz está de fato ausente, pps ir sempre uma fagulha “ana, mesmo que ela dure alguns aiihões des oceanos dos tempos que de brevidade infinitesimal em comparação se

2 Apud Peter C. Moore, One Lord, one faith (Thomas Nelson, 1994), p-1 Scanned by CamScanner

a precederam e a sucederão. Não parar iguám pm lembrar-se de nada que lhe diga respeito. No final, não fará a mínima diferença se somos bons ou cruéis.”

Quando nos damos conta dessa situação, restam-nos duas opções. Umaé + nos recusarmos a pensar nas implicações de tudo isso. Podemos nos apegar à crença intelectual na ausência de um Juiz e, mesmo assim, viver como se nossas escolhas importassem e houvesse diferença entre amor e crueldade. Por que A agiríamos assim? Um cínico talvez respondesse que esse é um jeito de “comer | o omelete sem ter de quebrar os ovos”, ou seja, nos valemos do bônus deterum Deus sem o ônus de precisar segui-lo. Mas não há honestidade nisso. A outra opção é reconhecer que você sabe que Deus existe. Você é capaz de aceitar o fato de que vive como se a beleza e o amor tivessem sentido, como se houvesse sentido para a vida, como se os humanos tivessem uma dignidade inerente — tudo porque você sabe que Deus existe. É desonesto viver como se | ele existisse mas negar-se a reconhecer aquele que lhe deu todas essas bênçãos. | g

P. es S. Lewis, “On Iiving in an atomic age” (1948), Teimpresso no volume Present | | Scanned by CamScanner$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se você está convicto de que certas coisas, como a tortura de inocentes, são realmente erradas e não apenas desagradáveis para você, de onde vem esse senso de obrigação moral que vincula a todos?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Numa visão de mundo sem Deus, os direitos humanos e o dever de amar o próximo seriam verdades objetivas ou apenas sentimentos que herdamos da cultura e poderíamos descartar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Keller sugere que no fundo todos sabem que Deus existe, mas reprimem esse conhecimento: que sinais dessa "voz" silenciosa você reconhece, e por que às vezes preferimos não ouvi-la?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$O problema do pecado$t$, 11,
$conteudo$Será possível duvidar de que atualmente a nossa raça tornará realidade nossas mais ousadas ideias, conquistará a unidade e a paz, e nossos filhos viverão em um mundo mais esplêndido e agradável que qualquer palácio ou jardim de que se tem conhecimento, adquirindo cada vez mais força em um círculo q q ç

cada vez maior de conquistas? O que o homem já fez, os pequenos triunfos de sua condição presente [...] não constituem senão o prelúdio do que ele ainda está por fazer.

H. G. Wells, 4 short history of the world (1937)!

Os massacres a sangue frio de indefesos, a volta da tortura proposital e organitada, o tormento mental e o medo em um mundo do qual tais coisas pareciam de todo banidas — quase aniquilaram por completo meu espírito. [...] O “homo “piens”, como gostava de chamar a si próprio, está esgotado. ; H.G. Wells, 4 mind at the end of its tether [Uma mente sem rédeas] (1946) Ld

) feiL escapar à conclusão de que há algo de fundame , ; Com o aca aê maior problema é o peca o.

No mundo. Segundo o cristianismo, nosso .

ENtanto, . ' idículo para muitos, O que,

em Beral + 9 conceito de “pecado” é ofappivo of cristãos dão t 1 ue os

wte ” *Ontece porque não entendemos O sentido q

MM “ção em A ccpópi ndo, tradução de Gustavo Barroso (

o. Português: Pequena história do mun&?,

: istá do pecado é austera e pessi-

Muitos têm a impressão de que à doutrina cr ;

: ; humana. Nada poderia estar mais distante da verdade, mista quanto à natureza hu o ; recém-abandonado pel

No início de meu ministério como pastor, um jovem pe Ei EM

esposa veio me procurar. Estava bravo com o que levad b , doná-l o Os EI i o a aban -

culpado com relação às próprias falhas que a haviam leva oná-lo e desanimado diante de toda a situação. Eu lhe disse que, mais que qualquer coisa, ele precisava de esperança. Concordando prontamente, o rapaz me perguntou o que fazer para adquiri-la. Com toda gentileza respondi que a boa notícia era ele ser pecador. Como pecador, não lhe cabia meramente o papel de vítima impotente de impulsos psicológicos ou sistemas sociais. Anos depois, deparei com um trecho de um sermão de Barbara Brown Taylor, que expressava com y

mais eloquência o que tentei dizer naquele dia.

Nem a linguagem da Medicina nem a do Direito é substituto adequado para a linguagem do [pecado]. Ao contrário do modelo médico, não estamos totalmente à mercê de nossas doenças. A escolha é entrar no processo de arrependimento. Ao contrário do modelo jurídico, a essência do pecado não está [basicamente] na transgressão das leis, mas em um relacionamento arruinado com Deus, com o próximo e com toda a ordem da criação. “Todos os pecados são tentativas de e »” .

preencher vazios”, escreveu Simone Weil. Porque não suportamos o vazio em forma de Deus d 5

entro de nós, tentamos enchê-lo com todo tipo de coisas, mas apenas Deus pode preenchê-lo.?

ereto fi l e humanidades na Columbia University:

pra os Alcoólicos Anônimos e frequentava

iões dos AA em todo o país. Em um E

igreja em Nova York, um “; e manhã de sábado, no porão de uma » um Jovem muito bem vestido” f;

falar de seus problemas Segundo Ido fez uso da palavra para " seu própri É

os seus erros se deviam às injustiç SE pe nao

vingaria de todos que o haviam prejudi dE de terceiros. Afirmou que se udicado, “ p

de um orgulho terrivelmente ferido” Cada gesto dele dava a sensação escre

, veu Delbanco. Era óbvio que O

y. or, Speaking ofsin: the lost Ea

enredado em sua necessi na

jovem vaia ida até iai de autojustificação e que tudo só var em sua vida até que reconhecess

a piorar q : e tal fato. Enquanto ele falava, um

uarenta e poucos anos, de tranci 5 co Ei

negro ea di a “p pé inhas e óculos escuros, inclinou-se

para Delbanco e disse: Lu também me sentia assim antes de adquirir uma . »

paixa autoestima D escreveu mais tarde em seu livro The real American dream: à meditation on hope [O verdadeiro sonho americano: uma meditação acerca da esperança]:

Foi mais que uma boa piada. Para mim, foi o momento em que entendi de uma maneira nova a religião sobre a qual eu afirmava saber alguma coisa. Conforme o rapaz que falava nos bombardeava com frases do tipo “preciso assumir o controle de minha vida” e “preciso acreditar em mim mesmo”, o homem a meu lado encontrava abrigo na velha doutrina calvinista que afirma que o orgulho é inimigo da esperança. O que ele quis dizer com a piada sobre autoestima foi que havia aprendido que ninguém é capaz de salvar a si mesmo graças ão próprio esforço. Em sua opinião, o rapaz continuava perdido em si mesmo, só que não sabia disso.? Com o termo “baixa autoestima” o sujeito das trancinhas não estava SUerindo que o jovem se odiasse, mas dizendo apenas que ele se encontrava “« : E ” ás

Perdido em si mesmo” é continuaria assim enquanto não fosse capaz de it : : icõ or. Jamais se

“dmitir que era um ser humano cheio de imperfeições, um pecador. J ' a o ra perdoar Os

tbertaria o bastante para de fato enxergar as próprias Ear Pp er ie i “di : uscar e obter o perdão de

Ena osjuelisação ua preeá humildemente > dida, pode ser uma frcei Ê pci entendida

Ceiros. A doutrina cristã do pecado, corretamente ,

de fonte de esperança. Mas que doutrina é ess

Og d escreveu um livrete fasde Moso filósofo dinamarquês Soren a E tio Kierkegaard define nt , . ) r

Pe E chamado The sickness unto death 5 íblia, mas igualmente acessível ado” ibid,

indo de uma forma fundamentada na Jesespero não querer ser quem 2 R SM m

'víduo contemporâneo. “Pecado é: €

“Andr . a meditation on bope (A

1 2%) ew Delbanco, 7he real American dream

se é diante de Deus. [...] Fé é: o eu, sendo o que é e desejando ser 0 que é, apoiar-se com transparência em Deus.”* Pecado é a recusa desesperada de encontrar nossa mais profunda identidade no relacionamento com Deus e | no serviço a ele. Pecado é tentar nos tornar nós mesmos, adquirir uma identidade alienada dele.

O que significa isso? Todos têm identidade própria, a sensação de ser diferente e valioso, em relação a algum lugar ou a alguma coisa. Kierkegaard afirma que os seres humanos foram criados não só para crer em Deus de | forma geral, mas para amá-lo sobre todas as coisas, para centrar a vida nele acima de tudo e a partir dele construir sua identidade. Qualquer alternativa a isso constitui pecado.

A maioria pensa em pecado basicamente como “transgressão das regras divinas”, mas Kierkegaard sabe que o primeiro dos Dez Mandamentos é “não terás outros deuses além de mim”. Assim, segundo a Bíblia, pecado não é apenas a prática de atos perversos, mas transformar boas ações em algo absoluto. É tentar estabelecer uma identidade fazendo que alguma outra coisa seja mais central para nosso valor, propósito e felicidade do que nosso relacionamento com Deus.

No filme “Rocky”, a namorada do protagonista lhe pergunta por que para ele é tão importante “ir até o fim” na luta de boxe. “Porque aí vou saber que não sou um vagabundo”, responde Rocky. No filme “Carruagens de Fogo”, uma das personagens principais explica por que se esforça tanto no treino para a corrida de cem metros da Olimpíada. Ele explica que, uma vez iniciada a corrida, “tenho dez segundos solitários para justificar minha existência”. Ambas as personagens encaram a conquista atlética como força definidora do sentido para a vida. |

Ernest Becker recebeu o prêmio Pulitzer por seu livro 7he denial of death. Logo no começo, o autor observa que a necessidade que uma criança tem de + se sentir valorizada “é a condição de sua existência”, de tal forma que todos buscam desesperadamente o que Becker chama de “importância cósmica”. De

*Soren Kierkegaard, The sickness unto death: a Christian psychological exposition for edification and awakening (Penguin, 1989), p. 111, 113 [edição em português: O desespero humano, tradução de Alex Marins (São Paulo: Martin Claret, 2006).

imediato, ele E dl encarar com leviandade essa expressão.” à e nos sentir valori é tã à

A necessidade izados é tão poderosa que basicamente “en- ” ver elemento que si : é

jeusamos qualg | que sirva de base para nossa identidade e nosso a esse elem nm ca .

valor. Qlhamos par ento com toda paixão e intensidade de culto e Jevoção, mesmo que nos consideremos altamente não religiosos. Becker utilia 0 amor romântico como exemplo:

A autoglorificação de que necessitava [o homem moderno] em sua natureza mais pessoal é agora buscada no ser amado. Este se torna o ideal divino no qual ele se realiza na vida. Às necessidades espirituais e morais se acham agora focadas em um indivíduo.

Becker não está dizendo que todos dependem do romance € do amor para encontrar uma identidade própria. Muitos, em vez disso, buscam no trabalho e na profissão a importância cósmica:

[Às vezes é] o trabalho que carrega O ônus de justificá-lo. O que significa Gustificar? [...] Ele vive a fantasia de controlar a vida e a morte, de controlar o destino.” Mas tudo isso serve apenas para preparar O palco para a decepção contínua: Nenhum relacionamento humano é capaz de suportar [esse] fardo de endeusamento. [...] Se seu parceiro é seu “Tudo”, qualquer erro que cometa se transforma em uma enorme ameaça para você. [...] O que será que queremos quando elevamos nosso parceiro a essa posição? Queremos nos livrar de [...] nossa sensação de nulidade [...] saber que nossa existência não foi em vão. Queremos redenção — nada menos que redenção. É desnecessário dizer que 8 = ala?

eres humanos não são capazes de provê-la.

ão em português: 4 negação

da mo em Becker, The denial af death (Free Press, a ae Di o Ei los % ide rte: ã uiz Car

Silva (á uma abordagem psicológica sobre à finitude humana, tradução de ho O de Janeiro: Record, 2007)).

não “im Pp. 166, É importante observar que Becker não estava tentando P à esse objetivo,

É exatamente isso o que diz Kierkegaard. Todos pes encontrar alguma

maneira de “justificar a própria existência € Es here ao argo o medo universal de ser “um vagabundo”. Nas culturas His tido o senso de Valor | e identidade vem do cumprimento de deveres junto à família e da prestação de serviços à sociedade. Em nossa cultura Individanliaã contemporânea, costumamos buscá-lo em nossas conquistas, na posição social, nos Ea ou relacionamentos amorosos. Existe uma infinita variedade de bases de identidade. Alguns | adquirem seu senso de “identidade” obtendo e exercendo poder; E ig a À depende da aprovação humana; e há os que o Ein da autodiscip 5 ) 0 | controle. Todos, porém, constroem sua identidade em cima de alguma coisa. |

*Se usarmos a definição de Kierkegaard, podemos classificar vários “substitutos para deus” e os tipos específicos de desalento e de danos que cada um deles provoca na vida de uma pessoa. Assim, podemos identificar os seguintes:

* Se centrar sua vida e identidade em seu cônjuge ou parceiro: você ficará emocionalmente dependente, ciumento e controlador. Os problemas do outro serão opressivos para você. |

* Se centrar sua vida e identidade em sua família e filhos: você tentará viver a vida através dos | filhos até que eles fiquem irritados com você ou percam de todo a identidade própria. Na pior das hipóteses, talvez seja capaz de maltratá-los quando eles o desagradarem. o |

* Se centrar sua vida e identidade no trabalho e na vida profissional: você se tornará um viciado em trabalho, além de uma pessoa chata e vazia. Na pior das hipóteses, perderá a família e os amigos e, caso a vida profissional vá mal, acabará desenvolvendo depressão profunda. |

* Se centrar sua vida e identidade em dinheiro e posses: será arrasado pela preocupação com | dinheiro e pela avareza. Estará disposto a agir de maneira antiética para manter O nível de | vida, o que acabará por dinamitar a sua vida. |

* Se centrar sua vida e identidade no Prazer, na gratificação e no conforto: vai se flagrar viciado em alguma coisa. Acabará ficando escravo de suas “estratégias de fuga”, por meio das quais evita as dificuldades da vida,

* Se centrar sua vida e identidade nos relacionamentos e na aprovação: haverá de sempre S€ sentir ofendido pelas críticas &, assim, estará sempre perdendo amigos. Terá medo de con” frontar os outros e, assim, acabará se tornando um amigo inútil,

* Se centrar sua vida e identidade em uma “causa nobre”: você dividirá o mundo entre OS “bons” e os “maus” e demonizará seus oponentes. Por ironia, será sempre controlado pelos inimigos. Sem eles, você não terá objetivo.

* Se centrar sua vida e identidade na religião e na moral: caso satisfaça seus padrões morais você se tornará orgulhoso, arrogante e cruel. Se não satisfizer seus próprios padrões, será arrasado pela culpa.

As consequências individuais do pecado

sp definir ASSIM O pe j mm ah várias maneiras pelas quais ele nos destrói como indivíduos. A 1 val e alienada de Deus é inerentemente | ve Sem Deus, nosso senso de valor pode parecer sólido na superfície, as ss jamais é real, palato Ep abandonar de uma hora para outra. Por semplo, S€ construo minha identidade sobre a ideia de ser um bom pai ou ma boa mãe, não possuo identidade “genuína” — sou apenas pai ou mãe, ada mais. Se alguma coisa de errado acontece com meus filhos ou com minha condição de genitor, nenhum “eu” sobrevive. O teólogo Thomas Oden escreve: Suponhamos que meu deus seja o sexo ou minha saúde física ou o Partido Democrata. Se algum desses elementos sofrer uma ameaça real, ficarei profundamente abalado. À culpa será neuroticamente intensificada na medida em que idolatrei valores finitos. [...] Suponhamos que eu valorize meu talento para lecionar e me comunicar com clareza. [...] Se a comunicação clara tiver se transformado em um valor absoluto para mim, um centro de valor que torna valiosos todos os meus outros valores [...] caso eu [deixe de lecionar bem] serei arrasado por uma culpa neurótica. À amargura é neuroticamente intensificada quando alguém ou algo se interpõe entre mim e aquilo que é meu valor absoluto.!º

Se alguma coisa ameaçar sua identidade, você não só ficará ansioso, como a into, se spa E identidade em beniencdi See a

Esc você não só ficará ressentido, eo a a pn

nto a causa do fracasso pessoal, odiará ou ; o rm Sadi

toco FÊ, ps Es a sua identidade for cofiatri A ni eee ne Não av Ea pesa yr queue rn a do Til Mesmo que

Você diga: in gr pa inseguro” a ha importância sobre

do om al E o colocarei minha felicidade ou EA sobre sua liberdade “independe a + Você E ima aa nm mais uma vez você

Perder RR RO lolita Se algo vier a ameaçã-”S

psi Oden, Tivo worlds: notes on the death of modernity im America and Rus a Cap, 6.

Uma identidade cuja base não seja Deus também deita mia, / formas de vício. Quando transformamos coisas doa eis

Ja profundas form a iciados. Se atrelarmos o sentido da vida “| absolutas, já estamos espiritualmente viciados. iaçã

| à nossa família, ao trabalho, a uma causa ou à alga Ria E Pod que não seja Deus, estes nos escravizarão, tornando-se fr prsi pEosénho ss que “nossos amores não estão na ordem certa . Ni se Spa Aus a ma frase que ficou conhecida: “Nosso coração está inquieto enquanto não descansa em til”. Se tentarmos encontrar descanso em alguma outra coisa, nosso coração ficará deslocado, “desarticulado”. As coisas boas que nos escravizam são coisas boas que merecem ser amadas. Mas quando os amores de nosso coração estão fora de ordem, cedemos a padrões de vida que não diferem muito da dependência química. Como em qualquer dependência, negamos o grau de controle exercido por nossos deuses substitutos. Um amor desordenado cria angústia desordenada, incontrolável, caso algo de errado aconteça com o objeto de nossas maiores expectativas.

Quando era pastor em minha primeira igreja em Hopewell, na Virgínia, vi-me orientando duas senhoras, ambas casadas com homens que não eram bons pais e ambas com filhos adolescentes que começavam a ter problemas na escola e com a polícia. As duas estavam com raiva do marido. Aconselhei-as e discorri (dentre outras coisas) sobre os problemas derivados da amargura não resolvida, bem como sobre a importância do perdão. Ambas concordaram e tentaram perdoar. No entanto, a que tinha o marido mais difícil e era a menos religiosa conseguiu perdoar. A outra, não. Isso me deixou confuso durante meses até que um dia ela confessou: “Ora, se meu filho se perder, minha vida toda terá sido um fracasso!”. Ela havia centrado a vida na felicidade e no sucesso do filho; por isso não conseguia perdoar.

Em Easter Ci a memoir [Páscoa em toda parte: memórias], Darcey Steinke, filha de um ministro luterano, conta como abandonou a fé cristã. Ao se mudar para Nova York, passou a levar uma vida mundana e ficou obcecada por

“É importante recordar que perdoar alguém não significa deixar de responsabilizar a pessoa pelo que ela fez. Não se trata de E a é a É preciso fazer ambas as coisas. Quaddo paia q selha as mulheres a perdoarem, isso não significa simplesmente Fecomendar que permitam que 0. marido continue com o mesmo comportamento sem nenhuma confrontação. Isso é licado con

mais detalhes no capítulo 11. co 5 E

sexo: Escreveu vários ig, mas continuou a sentir profunda inquietação « frustração. No Enipdilivea) ela cita Simone Weil para resumir a principal questão em poe vida. “A única escolha que temos é entre Deus e a idolatria”; escreveu Weil. “Se negarmos a Deus [...] haveremos de adorar algumas coisas | deste mundo acreditando que as vemos como são, mas, na verdade, embora) sem saber, imaginamos nelas os atributos da Divindade.”12 É Uma vida não centrada em Deus leva ao vazio. Construir a vida sobre algo que não seja Deus não nos fere somente quando não obtemos o que nosso coração deseja, mas também quando nossos desejos são satisfeitos. Poucos conseguem realizar todos os sonhos e, por isso, é fácil viver na ilusão de que se fossemos bem-sucedidos, ricos, admirados ou bonitos como gostaríamos, viveríamos felizes e em paz. Simplesmente não é assim. Em uma coluna na revista The Village Voice, Cynthia Heimel relembrou alguns indivíduos que havia conhecido em Nova York antes de se tornarem astros € estrelas de cinema. Uma era balconista da seção de cosméticos da Macy's, outro vendia ingressos na bilheteria de um cinema e assim por diante. Quando fizeram sucesso, todos se tornaram mais irritadiços, mais maníacos, infelizes e instáveis do que quando davam duro para alcançar a fama. Por quê? Heimel escreve: Aquela coisa gigantesca pela qual lutavam, à fama que faria tudo ficar bem, que lhes tornaria a vida suportável, que os encheria de felicidade, havia acontecido, mas no dia seguinte eles acordaram e viram que ainda eram eles mesmos. À decepção os deixou irritados e insuportáveis.”

As consequências sociais do pecado

O pecado não só produz um impacto dentro de nós, como também e efeito devastador sobre o tecido social. Na esteira da Segunda ii ” per TA tora inglesa Dorothy Sayers testemunhou várias pin pecar e ini “as entrarem em desespero quanto aos rumos da sociedade. Em seu li Or chaos? y 1947, ela sugere que tal desesperança se

os? [Credo ou caos?), escrito em ,

Ynthia Heimel, coluna “Tongue in Chic”, 7he

200 OS FUNDAMENTOS DA FÉ |

deveu, em grande parte, à perda da crença na doutrina cr is do nã “ori- | ginal”, ou seja, o orgulho e egocentrismo inerentes à humanidade. “Os que se | mostram mais desanimados”, escreveu ela, “são aqueles que se apegam a uma | fé otimista no progresso e no conhecimento como influências que contribuem | para o processo de civilização”. Para eles, o genocídio nos estados totalitaristas | e a ganância e o egoísmo da sociedade capitalista “não são meramente cho- | cantes e alarmantes. Para eles, essas coisas são a negação absoluta de tudo em que acreditavam até agora. É como se o chão do universo em que viviam desaparecesse”. Os cristãos, contudo, estão habituados à ideia de que “existe um profundo desajuste interior no âmago da personalidade humana”. Ela conclui; O dogma cristão da dupla natureza do homem — que afirma que ele é decaído e necessariamente imperfeito em si mesmo e em todas as suas obras, porém intimamente ligado a uma perfeição eterna dentro e além de si por meio de uma verdadeira unidade de substância — faz a atual e perigosa situação da sociedade humana parecer menos irremediável e menos irracional.!4

Em 7he nature oftrue virtue [A natureza da verdadeira virtude), um dos mais profundos tratados de ética social jamais escritos, Jonathan Edwards mostra como o pecado destrói o tecido social. Ele defende que a sociedade humana é profundamente fragmentada quando algo que não seja Deus se torna nosso amor supremo. Se nosso objetivo supremo na vida é o bem da família, diz Edwards, nossa tendência será nos importar menos com as outras famílias. Se nosso objetivo supremo for o bem de nossa nação, tribo ou raça, Feetedea a ser racistas ou nacionalistas. Se nosso objetivo primordial na in for a felicidade individual, colocaremos nossos interesses econômicos à frente dos interesses de terceiros. Edwards conclui que apenas se Deus for Reco FREE tem, nosso sumo bem, e centro da vida, nosso coração se Deda NA pt pessoas de todas as famílias, raças e classes, | of Jonathan Edwards: ethical wri tings (Yale Dvs ei pings em Paul Bart The or . - Ramsay são muito importantes, A ) vol. 8, As notas introdutórias Scanned by CamScanner

De que modo essa destruição dos relacionamentos sociais decorre d | efeitos RAE do PRE Se extraímos nossa identidade, nosso senso E qalor, da posição pois dBe oeupamos, a política deixa de ser apenas política e passa a estar relacionada it Por meio de nossa causa ganhamos uma dentidade, o BERRO valor. Isso significa que é preciso desprezar e demonizar a oposição. Se extraímos ER identidade da etnia ou da posição socioeconômica, precisamos nos sentir superiores aos indivíduos de outras classes e raças. Se você sente grande orgulho em ter uma mente aberta, uma alma tolerante, ficará extremamente indignado com pessoas que lhe pareçam preconceituosas. Se for alguém muito moralista, haverá de se sentir superior àqueles que considerar permissivos, e assim por diante.

Não existe saída para isso. Quanto mais amarmos e nos identificarmos com nossa família, raça ou religião, mais difícil será não nos sentir supetores ou mesmo hostis com relação a outras religiões, raças etc. Assim, o racismo, o classismo e o machismo não decorrem da ignorância ou da falta de instrução. Foucault e outros contemporâneos nossos demonstraram ser muito mais difícil do que imaginamos possuir uma identidade pessoal que não conduza à exclusão. A verdadeira guerra cultural acontece dentro de nosso coração devastado por desejos desordenados em relação às coisas que "os controlam, que nos levam a uma sensação de superioridade bem Ee à exclusão dos que não as possuem, coisas que não conseguem nos satisfazer Mesmo quando as obtemos.

As consequências cósmicas do pecado

OS até agora sobre os efeitos do prato: do e, quase literalmente, Pitulos de Gênesis nos mostram Deus criando o mundo & do pó da terra Sjando as próprias mãos: “E o SENHOR Deus formou o homem do po : “Soprou-lhe nsraaçd da vida” (Gn 2.7).0 contraste com todos Os mt; nas narinas o fôlego pe

Netos da criação não poderia sermÃlt a +, de algum tipo de pero telatos mais antigos da criação, ela € ques é deliberada e planedi hm 4 outro ato de violência. Quase nunca à oisas são, curiosamente, EE telatos científicos seculares da origem das €

quase idênticos aos relatos pagãos mais antigos. A forma material do mundo, | bem como a vida biológica, é produto de forças violentas.

Ímpar dentre os relatos da criação, a Bíblia pinta um mundo em que so- | bejam formas de vida variadas, dinâmicas, perfeitamente interligadas, interdependentes, mutuamente enriquecedoras. A reação do Criador diante disso | tudo é de deleite. Ele não para de repetir que tudo é 4om. Quando cria os seres i humanos, ele os instrui a continuar a cultivar e colher os vastos recursos da ] criação como um jardineiro faz em um jardim. O Criador parece estar dizendo em Gênesis 1.28: “Levem isso adiante! Divirtam-se!”.16

À palavra hebraica que denota essa interdependência perfeita, harmoniosa, entre todos os elementos da criação é shalom. Ela é traduzida por “paz”, mas em nossa língua o termo é basicamente negativo e refere-se à ausência de problemas ou de hostilidade. A palavra hebraica significa muito mais que isso. Significa plenitude absoluta — vida plena, harmoniosa, feliz, próspera.

À devastadora perda do sha/om como consequência do pecado é descrita em Gênesis 3. Ali aprendemos que tão logo decidimos servir a nós mesmos em lugar de servir a Deus — assim que abandonamos a ideia de viver para Deus e desfrutá-lo como nosso sumo bem —, todo o mundo criado se tornou imperfeito. Os seres humanos de tal forma faziam parte do tecido de todas as coisas que, quando voltaram as costas para Deus, toda a estrutura do mundo se desintegrou. Doenças, transtornos genéticos, fome, desastres da natureza, bem como a velhice € a própria morte, resultam do pecado tanto quanto a opressão, a guerra, o crime | e a violência. Perdemos o shalom de Deus — física, espiritual, social, psicológica e culturalmente. Tudo agora está desintegrado. Em Romanos 8, Paulo diz que O mundo todo se encontra no “cativeiro da degeneração”, a criação está “sujeita à inutilidade” e não será restaurada enquanto não formos restaurados. | O que é capaz de restaurar todas as coisas?

Em algum momento na vida da maioria dos indivíduos, é preciso enfrentar O : fato de que não somos as pessoas que, sabemos, deveríamos ser. Quase sempre “Debra Rienstra, So much more: an invitation to Christian spirituality (Jossey-Bass, 2005), p.41.

nossa reação é “virar a página” e tentar viver segundo nossos princípios. No fim, isso NOS levará a um beco sem saída espiritual.

No ensaio de C. S. Lewis “Is Christianity hard or easy?” [O cristianismo é fácil ou difícil?], o autor descreve o empenho humano normal:

Todos costumamos pensar que [...] temos um eu natural com vários desejos e

interesses [...] e sabemos que algo chamado “moral” ou “comportamento decente”

exerce poder sobre esse eu. |...) Todos esperamos que, uma vez satisfeitas todas as exigências da moral e da sociedade, ainda reste ao pobre “eu” natural uma oportunidade, tempo para seguir em frente com a própria vida e fazer o que quiser. Com efeito, somos muito semelhantes ao cidadão honesto que paga seus impostos.

Depois de pagá-los, ele espera que sobre o suficiente para seu sustento.

No cristianismo as coisas são diferentes, mas ao mesmo tempo mais diiceis e mais fáceis. Cristo diz: “Entregue-me TUDO. Não quero apenas este tanto de seu tempo, este tanto de seu dinheiro e este tanto de seu trabalho — de modo que seu eu natural possa ficar com o restante. Quero você, não suas coisas. Não vim para torturar seu eu natural [...] em vez disso, eu lhe darei um novo eu. Entregue seu eu natural por inteiro — TODOS os desejos, não apenas os que você considera perversos, mas também os que considera inocentes — todo o aparato. Eu lhe darei em seu lugar um novo eu”.

Lewis elabora em cima da definição de pecado de Kierkegaard. O pecado não

significa apenas praticar coisas ruins, mas pôr coisas boas no lugar de Deus.

Assim, a única solução não está em simplesmente mudar nosso comportamento,

mas em reorientar e centrar inteiramente em Deus o coração ca vida.

O que é difícil, quase impossível, é entregar 9 nosso “eu” inteiro a Cristo, Mas isso é muito mais fácil do que o que todos tentamos fazer em vez disso. Porque o que tentamos fazer é continuar a Ser o que chamamos “nós” — nossa felicidade individual centrada no dinheiro, no prazer ou na ambição —, espetando, apesar disso, que nosso comportamento seja honesto, casto e humilde. Foi exatamente isso que Cristo advertiu não ser possível. Se sou um gramado, toda a poda do mundo manterá a grama aparada, mas não à fará produzir trigo.

! Se quiser produzir trigo, terei de ser arado e semeado. Scanned by CamScanner

Isso assusta você? Parece sufocante? Lembre-se — se você não viver para Jesus, viverá para alguma outra coisa. Se viver para sua prnfiseiio e não se sair bem, isso poderá puni-lo pelo resto da vida e você se eg um Eescasmado, He viver para os filhos e eles acabarem não sendo bem-sucedidos, você se sentirá atormentado, pois achará que não tem valor como ser humano.

Se Jesus for seu centro e Senhor e você o decepcionar, ele lhe perdoará. Sua profissão não pode morrer por seus pecados. Talvez você diga: “Se eu fosse cristão, viveria o tempo todo perseguido pela culpa!”. Mas todos nós somos perseguidos pela culpa, pois precisamos de uma identidade, e há de existir algum padrão para pautar a vida e nos fornecer tal identidade. Seja no que for que você centre a vida, será preciso viver de acordo com isso. Jesus é o único Senhor para o qual podemos viver — por você ele entregou a vida e deu seu último suspiro. Isso lhe parece opressivo?

Talvez você diga: “Acho o cristianismo perfeito para gente que sofreu re-

) veses na vida. E se eu não fracassar na minha profissão e minha família for ótima?”. Como disse Agostinho, se existe um Deus que nos criou, as câmaras mais profundas de nossa alma não podem ser preenchidas com nada menos que ele. Essa é a dimensão da grandeza da alma. Se Jesus é o Senhor-Criador, por definição, nada poderá satisfazer você tanto quanto ele, mesmo que você seja bem-sucedido na vida. Até mesmo as profissões e famílias mais bemsucedidas não são capazes de nos oferecer o sentido, a segurança e a confiança que o autor da glória e do amor é capaz de dar.

Todos precisamos viver em função de alguma coisa. Qualquer que seja essa “alguma coisa”, ela se torna “Senhor de nossa vida”, quer pensemos nesses termos, quer não. Jesus é o único Senhor que, se você o receber, vai realizá-lo plenamente e, se o desapontar, lhe perdoará por toda a eternidade. |$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se pecado, no sentido mais profundo, é construir a própria identidade sobre algo que não é Deus, sobre o que você tem realmente apoiado o seu valor: trabalho, aparência, aprovação, alguém que ama?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando aquilo em que você ancorou sua identidade falha ou é ameaçado, a reação de pânico, raiva ou vazio não revela que você fez dessa coisa um "deus" pequeno demais para sustentá-lo?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Diante do otimismo que acredita que a humanidade vai se aperfeiçoar sozinha, o que a história do século passado lhe ensina sobre haver algo profundamente quebrado no coração humano que nenhum progresso resolveu?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 12;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A religião e o evangelho$t$, 12,
$conteudo$No exato instante daquele pensamento de vanglória, assaltou-me um pressentimento, uma náusea horrível e o tremor mais horripilante [...] baixei os olhos [...] mais uma vez eu era Edward Hyde.

Robert Louis Stevenson, O médico e o monstro

O ensina que nosso maior problema é o pecado. Qual,

então, seria a solução? Ainda que você aceite o diagnóstico cristão do problema, aparentemente não existe nenhum motivo específico para buscar à solução apenas no cristianismo. Talvez você diga: “Tudo bem, entendo que se eu construir minha identidade sobre alguma outra coisa que não seja Deus, serei levado à ruína. Por que a solução deve ser Jesus e o cristianismo? Por que

outra religião não serviria, ou tão somente minha fé individual em Deus?”

À resposta é que existe uma diferença profunda e fundamental Roi o modo pelo qual as outras religiões nos dizem que busquemos a salvação eo modo descrito no evangelho de Jesus. Todas as outras religiões denparemêrs foram fundadas por mestres que mostram o caminho para a uiação: Somente Jesus afirmou ser ele próprio o caminho da salvação. A diferença é de gal ordem dg embora o cristianismo certamente possa ser chamado de religião no seno mais amplo, para fins de argumentação neste capítulo uismemos o rr | Teligião” para nos referir à “salvação por meio do esforço moral” e “evangelho Para nos referir à “salvação por meio da graça”!

mota Edo mais indo a ago é piquer NE ne a qual é bastante a Usca de um tipo específico de vida no mu

Duas formas de egocentrismo

Na obra de Robert Louis Stevenson, O médico e o monstro, o dr. Jekyll acaba se dando conta de ser uma “mistura bizarra de bem e mal”. Ele acredita que sua natureza má coíbe sua natureza boa. Ele pode desejar fazer algumas coisas, mas não consegue levar avante esses desejos. Assim, descobre uma poção capaz de separar as duas naturezas. À esperança é que sua natureza boa, que se manifesta durante o dia, seja libertada da influência do mal e se torne capaz de atingir as metas almejadas. No entanto, quando certa noite ele ingere a poção e seu lado mau vem à tona, este é bem pior do que se poderia esperar. Ele descreve sua natureza má fazendo uso de categorias cristãs clássicas: Percebi ser, ao primeiro sopro dessa nova vida, mais perverso, dez vezes mais perverso, vendido como escravo a meu mal original; e o pensamento naquele instante envolveu-me e agradou-me como vinho. [...] Cada ato e pensamento [de Edward Hyde] centrava-se em si mesmo.

O nome Edward Hyde não lhe coube apenas por sua aparência horripilante, mas por estar escondido.? Ele só pensa em seus próprios desejos e não se importa com quem ferirá para alcançar a autossatisfação. Mata quem se interpõe em seu caminho. Stevenson está dizendo que até as melhores pessoas escondem de Ê : que trazem no interior — uma enorme capacidade para o egoísmo, O narcisismo e a preocupação consigo e com seus próprios interesses acima de tudo o mais. O autoengrandecimento está na base de boa parte da dor neste mundo. E o motivo que torna os poderosos e ricos indiferentes às mazelas dos pobres, a razão da maior parte da violência, dos crimes e das guerras. Está no centro da grande maioria dos casos de desintegração familiar. Escondemos de os indivíduos se aproximem de Deus através de vários Rare o bei do a ra também é o que a maioria acha ao pensar em religião e, ne Am servâncias ii a no Novo Testamento é radicalmente diverso. Por esse di rap Recarga ia disso di taianilorgo ese En dr Ivo, para as finalidades deste capítulo, ?Na língua inglesa, o nome Hyd k ai ira

hidden (oculto, escondido). (N. do E). remete a bideous (horripilante, abominável, monstruoso) e à Scanned by CamScanner

nós mesmos nossa pane autocentrada para cometer atos perversos, mas surgem situações que funcionam como uma “poção”, e tais atos se inanifestao Quando percebe em si essa capacidade para atos perversos, o dr. Jekyll decide reprimir esse terrível egocentrismo e orgulho presentes no âmago de | seu ser. Em certo sentido, ele “adota a religião”. Compromete-se solenemente a não mais ingerir a poção. Dedica-se à caridade e às boas obras, em parte como reparação pelo que Edward Hyde havia feito e em parte como tentativa de sufocar sua natureza egoísta com atos de altruísmo.

Um dia, porém, sentado em um banco do Regents Park, o dr. Jekyll se põe a pensar em todo o bem que vinha fazendo e em como, a despeito de Edward Hyde, era um homem bem melhor que a grande maioria de seus semelhantes. Decidi redimir o passado por meio de minha conduta futura e posso dizer honestamente que a decisão deu bons frutos. Você sabe com quanta determinação, nos últimos meses do último ano, trabalhei para aliviar o sofrimento; você sabe que fiz muita coisa pelos outros. [... Mas enquanto] eu sorria, comparandome a outros homens, comparando minha boa vontade ativa com a crueldade preguiçosa da negligência alheia [...] no exato instante daquele pensamento de vanglória, assaltou-me um pressentimento, uma náusea horrível e o tremor mais horripilante [...] baixei os olhos [...] mais uma vez eu era Edward Hyde. Essa é uma reviravolta mortal. Pela primeira vez, sem querer sem à poção, 0 dr, Jekyll se transforma em Hyde. É o começo do aid Ep pi Controlar suas transformações, Jekyll se mata. Õ discernimento de a Penso eu, é profundo aqui. Por que o médico se transformaria no monstro 5 pace é Profundo aq q Le ques pecador, por isso

Poção? À semelhança de muita gente, o dr. Jekyll sabe q , PA tenta desesperad brir seu pecado com um grande número

Ea - peradamente ue r cá mtenuni dE orgulho e egocentrismo, de “No entanto, sua tentativa de fato nã apr superioridade, justiça Pró “Penas os agrava. Eles o levam à sm médico se transforma no a * orgulho, Então, de repente “E dl dela.

Stro, não a despeito de sua bondade, mas re conduzem à opressão contra e na poe e é ser muito mau e ig

todas E E ira pen e bom e seguir todas as regras, tornan regras; a outra, ser muito bom

arrogante. Existem duas maneiras de voce E seu próprio sancor e cone A primeira é dizer: “Viverei minha vida do jeito que eu quiser . 1 segu E É crita por Flannery O'Connor, que escreveu sobre ii de seus personagens, tee Motes: “... ele sabia que a melhor maneira de evitar Jesus era evitar o pecado”. Se você evita o pecado e vive segundo a moral de modo que Deus tenha de abençoá-lo e salvá-lo, então ironicamente talvez esteja buscando em Jesus um mestre, um modelo, uma ajuda, mas o está evitando como Salvador. Você está confiando em sua própria bondade em vez de confiar em Jesus no que tange à sua condição diante de Deus. Está tentando salvar a si mesmo seguindo Jesus. Por ironia, isso é rejeitar o evangelho de Jesus. É uma forma cristianizada | de religião. É possível evitar Jesus como Salvador tanto obedecendo às regras bíblicas quanto transgredindo-as. Tanto a religião (pela qual você constrói sua identidade em cima de suas conquistas morais) quanto a irreligião (pela qual você constrói sua identidade em cima de alguma outra meta ou relacionamento secular), no final, são caminhos espirituais idênticos. Ambas constituem “pecado”. À autossalvação por meio de boas obras talvez produza um bom volume de comportamentos morais em sua vida, mas, por dentro, você estará cheio de arrogância, crueldade e preconceito. E vai sofrer. Estará sempre se comparando ; terceiros, nunca seguro de ser bom o bastante. Por isso, você não será capaz de lidar com sua própria perversidade e com seu narcisismo por meio da lei moral, tentando ser uma boa pessoa por meio de atos da vontade. Você precisa de uma daniforiação erp na própria motivação que habita seu coração. os fariseus são mais infelizes ainda e es SEO Ep E Fi Inpa m muito mais prejuízo espiritual.

Por ioião farisaica é +5 pia

onstruir nossa identidade a partir de

*O road et fr ar ar (Signet, 1962), Pp. 16.

LEnjoo mortal], por ele mencionada no ani Faso id em inglês é The sickness unto death desespero humano (veja capítulo 10, n. 4), (N. do E,) dor. O título da edição em português é O Scanned by CamScanner

Deus. Lutamos para dis um Penido valor, de propósito e individualidade, po rém com base em condições que jamais somos capazes de cumprir ou manter, que constantemente a Como diz Kierkegaard, não nos tornamos nós mesmos. Interiormente, isso é vivenciado como ansiedade, insegurança e ódio, levando-nos, exteriormente, a marginalizar, oprimir e excluir os outros.

A despeito de toda a justiça da perspectiva da lei, os fariseus são movidos mais pelo desespero do pecado. Constroem seu senso de valor sobre seu próprio desempenho moral e espiritual, uma espécie de currículo a ser apresentado à Deus e ao mundo. Os padrões morais e espirituais de todas as religiões são muito altos, e os fariseus, no fundo, sabem que não estão plenamente à altura de tais padrões. Não oram com a frequência recomendada. Não amam nem servem o próximo tanto quanto deveriam nem mantêm puros os pensamentos mais íntimos como deveriam. A ansiedade, a insegurança e a irritabilidade interiores resultantes quase sempre são muito maiores do que qualquer coisa que possa afetar os irreligiosos.

Richard Lovelace capta muito bem outra maneira pela qual a religião farisaica é tão nociva:

Muitos [...] extraem a certeza de que serão aceitos por Deus da sua própria sinceridade, da experiência anterior de conversão, do desempenho religioso recente

ou da relativa raridade de ocasiões em que desobedecem de modo consciente

e espontâneo. [...] A insegurança se mostra no orgulho, na afirmação feroz e

defensiva da justiça pessoal, bem como na crítica defensiva aos outros. Acabam

naturalmente odiando outros estilos culturais e outras raças à fim de promover | sua própria segurança e descarregar à raiva reprimida.” Como diz Lovelace, a religião farisaica não lesa apenas O paço | Fi rg também cria conflito social. Os fariseus o condi de | Justiça e, por isso, desprezam e atacam todos en que ca VS crenças doutrinárias e práticas religiosas. Disso resultam O Mpeg); gota hem de gente dona da verdade,

| Perialismo cultural. As igrejas que se enc

| s Vassity, 1979), p: 212ss [edição em por-

| , Richard Lovelace, The dynamics of spiritual hife qua ai coa detiáço di a or: E ca da vida cristã: as dinâmicas da renovação o es acido ceia as RÁ Si

exclusivista, insegura, irritada e moralista são extremamente sem graça. Seus sermões costumam ser altamente preconceituosos, embora E essas igrejas amarguem conflitos, divisões € desunião. Quando ds das lideres ee senta uma falha moral, as igrejas à racionalizam e denunciam os críticos do líder ou fazem dele bode expiatório. Milhões de indivíduos criados nessas igrejas ou próximos delas rejeitam O cristianismo bem cedo na a ou quando jovens adultos, em grande parte por causa da própria experiência. Estarão vacinados contra o cristianismo para o resto da vida. Caso tenha se decepcionado com igrejas desse tipo, toda vez que alguém lhe recomendar o cristianismo, você pensará que querem fazê-lo adotar a “religião”. Os fariseus e suas vidas em nada atraentes confundem muita gente quanto à verdadeira natureza do cristianismo. A diferença da graça

Existe, assim, um grande abismo entre a visão de que Deus nos aceita em de- | corrência de nosso esforço e a visão de que Deus nos aceita com base no que | Jesus fez. A religião atua segundo o princípio “obedeço, logo, sou aceito por | Deus”, mas o evangelho funciona segundo o princípio “sou aceito por Deus por meio do que Cristo fez, logo, obedeço”. Dois indivíduos que levem a vida com base nesses dois princípios diversos podem sentar-se lado a lado em um banco de igreja. Ambos oram, contribuem generosamente com dinheiro, são leais e fiéis à família e à igreja, tentam viver com decência. No entanto, fazem tudo isso com motivações radicalmente distintas, detêm identidades espirituais radicalmente diversas, e o resultado são dois tipos radicalmente díspares de vida. A diferença primordial é a motivação. Na religião, tentamos obedecer 205 pude divinos por medo. Acreditamos que se não obedecermos, perderemos a bênção de Dino neste mundo e no próximo. No evangelho, a motivação é ot Re pela bênção já recebida por causa de Cristo. Enquanto o mo” . , pelo desejo de agradar e de se parecer com aquele

Outra diferença tem a ver co pr

o lion leo O pap identidade e autoestima. Em a

azendo os padrões religiosos que nôs

mesmos escolhemos, daí a sensação de superioridade é ão aos e o desdém com relação à

A RELIGIÃO E O EVANGELHO 211

nã não seguem o pas caminho. Ta acontece quando nossa religião é de um tipo mais liber Epi em que as sentimos superiores aos preconceituosos , ignorantes) e também de um tipo mais conservador (caso em que nos sentimos superiores aos menos moralistas e menos espirituais). Quando não «atisfazemos 08 padrões que escolhemos, passamos a desprezar a nós mesmos. À culpa é bem maior do que se ficássemos de todo alienados de Deus e da religião.

Quando minha compreensão pessoal do evangelho era bem limitada, minha autoimagem oscilava loucamente entre dois polos. Quando eu satisfazia meus padrões — no trabalho acadêmico, nas conquistas profissionais, nos relacionamentos —, eu me sentia confiante, mas não humilde. Ficava sujeito o orgulho e não me solidarizava com os fracassados. Quando não satisfazia meus próprios padrões, eu me sentia humilde, mas não confiante, me via como um fracasso. Descobri, porém, que o evangelho continha os recursos para à construção de uma identidade ímpar. Em Cristo me descobri aceito pela graça, não apenas apesar de minhas falhas, mas porque estava disposto a admiti-las. O evangelho cristão diz que sou tão falho que Jesus precisou morrer por mim, mas ainda assim sou amado e valorizado, e Jesus fez questão de morrer por mim. Isso leva, ao mesmo tempo, a uma humildade profunda e a uma profunda confiança. Acaba tanto com a presunção quanto com à lamúria. Não consigo me sentir superior a ninguém, e mesmo assim nada tenho a provar a pessoa alguma. Não me considero superior nem inferior. Em vez disso penso menos em mim. Não preciso reparar em mim — como me saio, o que pensam à meu respeito — com tanta frequência.

Religião e evangelho também diferem fundamentalmente na maneira Como tratam o Outro — aqueles que não compartilham da ros crenças apra Os pensadores pós-modernos entendem que o eu € formado e Definim, de pi em não somos. Inflamos nosso

Senso de val cd rar epangna O At a outras raças e têm outras Crenças q pio a ag a vangelho nos fornece uma nova

base j Tnapienfieicaa A jdegeidade So À : O valor de um cristão não

Para interações sociais harmoniosas € justas. O v

“Veja como o eu é formado pela exclusão em Miroslav Volf, Exclusion and embrace (Abingdon, 1996).

é construído através da exclusão de alguém, mas por meio do Senhor que foi excluído em meu benefício. Sua graça me desperta uma humildade mais | profunda que a humildade que qualquer outra religião é capaz de despertar a (já que sou demasiado falho para conseguir me salvar graças a meu próprio 1 esforço), mas também me afirma de maneira mais potente que afirmações | advindas de qualquer outra religião (já que estou absolutamente seguro de que sou aceito por Deus de forma incondicional). |

Isso significa que não posso desprezar quem não crê como eu creio. Já que | não sou salvo por minhas doutrinas ou práticas corretas, essa pessoa diante | de mim, mesmo com suas crenças equivocadas, talvez me seja superior sob vários aspectos. Significa, também, que não preciso me sentir intimidado por | ninguém. Não sou inseguro a ponto de temer o poder, o talento ou o sucesso dos que são diferentes de mim. O evangelho nos possibilita escapar à suscetibilidade, à postura defensiva e à necessidade de criticar os outros. A identidade cristã não se baseia na necessidade de ser visto como um indivíduo bom, mas na avaliação que Deus faz de nós em Cristo.

Religião e evangelho também levam a maneiras divergentes de lidar com os problemas e o sofrimento. A religião moralista faz seus adeptos se convencerem de que se levarem uma vida de retidão, Deus (e os outros) lhe deverá respeito e favores, c eles merecerão uma vida decente e feliz. No entanto, se a vida começar a desandar, os moralistas sentirão uma raiva debilitante. Ficarão revoltados com Deus (ou com “o universo”) por acharem que, já que vivem melhor que os outros, deveriam ter uma vida melhor, ou sentirão profundo rancor de si mesmos, incapazes de se livrar da sensação de não ter vivido como deviam. O evangelho, porém, possibilita escapar da espiral de amargura, autocensura e desespero quando as coisas não vão bem na vida. Sabemos que a premissa básica da religião — se vivermos bem, as coisas darão certo — está errada. Jesus foi a pessoa mais correta do ponto de vista moral que já existiu, mas em sua vida não faltaram pobreza, rejeição, injustiça e até mesmo tortura. Muita gente, quando ouve pela primeira vez a distinção entre religião e evana Ko gelho, acha que parece fácil demais. “Que ótimo!”, alguém talvez diga. “Seo | É Scanned by CamScanner

A RELIGIÃO E O EVANGELHO 213

cristianismo é isso, basta entrar em uma relação pessoal com Deus e depois fazer tudo o que eu quiser!” Essas palavras, contudo, só podem sair da boca de quem jamais teve a experiência da graça radical. Quem a teve jamais falará assim. Na verdade, a graça pode ser bem ameaçadora.

Anos atrás conheci uma mulher que começou a frequentar a igreja Redeemer. Ela frequentava a igreja desde mocinha e me disse que jamais havia ouvido falar na distinção entre evangelho e religião. Sempre ouviu que Deus só nos aceita se formos bons o bastante. Acrescentou ainda que a nova mensagem lhe parecia assustadora. Perguntei por que, e ela me respondeu:

Se eu fosse salva por minhas boas obras, haveria um limite para o que Deus

poderia me pedir ou me fazer passar. Eu seria como um contribuinte que paga

seus impostos, teria “direitos” — cumprido o meu dever, mereceria certa qualidade de vida. Mas se sou uma pecadora salva por pura graça, não há nada que ele não

Ela entendeu a dinâmica da graça e da gratidão. Se perder o medo da punição nos tirasse o incentivo para levar uma vida altruísta, então o único incentivo para viver uma vida decente teria sido o medo. Aquela mulher conseguiu entender logo que o ensinamento incrivelmente maravilhoso da salvação por pura graça tinha um reverso. Ela percebeu que o fato de ser uma pecadora salva pela graça a deixava mais sujeita ao soberano senhorio de Deus. Percebeu que se Jesus realmente havia feito tudo isso pelo seu bem, ela não pertencia mais a si mesma. Agradecida, pertencia de bom grado a Jesus, que lhe havia concedido tudo isso por um preço infinitamente alto para ele.

De fora, isso talvez pareça intimidar, como se fosse uma obrigação pesadíssima. De dentro, a motivação é só alegria. Imagine o que acontece quando nos apaixonamos. O amor nos deixa ansiosos pela aceitação do ser amado. Perguntamos ao outro: “Você quer sair?”, ou até Sd af USAM ui ER casar comigo?” O que acontece quando a e é ti ? Será que leres “Ótimo, tudo certo! Agora posso agir como eu quiser?” ro que não. À partir daí nem esperamos que O objeto de nosso afeto peça een algo de nós. Tentamos adivinhar tudo o que possa agradá-lo e pleito, Pião existe intimidação nem obrigação, mas nosso comportamento Já foi radicalmente alterado pela mente e pelo coração dique amamos

Ninguém expressa esse conceito de forma Enaie pa do que Victor Hugo em Les miserables. O protagonista, Jean im um amargo ex-condenado. Ele rouba os talheres de prata de um bispo que já lhe tinha dado mostras de bondade. Valjean é pego pelos guardas e levado preso de suma à cú do bispo. Em um ato de graça radical, o bispo dá os talheres a a eo E da prisão. Esse ato de misericórdia o abala profundamente. No capítulo seguinte, Victor Hugo esclarece como tal graça foi ameaçadora:

A essa bondade celestial [do bispo], ele contrapõe o orgulho, que é a fortaleza do mal dentro de nós. Ele estava confuso mas ciente de que o perdão daquele padre era a maior ofensiva e o ataque mais ameaçador que já havia sofrido; ciente de que sua obstinação se imporia em definitivo caso ele resistisse ao perdão; se cedesse, seria obrigado a renunciar àquele ódio com o qual os atos de outros homens haviam enchido sua alma durante tantos anos, um ódio que o agradava; ciente de que desta vez era necessário conquistar ou ser conquistado; e que havia tido início uma luta, uma luta colossal e decisiva, entre sua maldade e a bondade daquele homem.”

Valjean escolhe deixar a graça vencer. Abre mão de sua profunda autopiedade e amargura e passa a viver uma vida de bondade estendida aos outros. É transformado na raiz de seu ser.

Outra importante personagem do romance é o policial Javert, que construiu toda uma vida sobre seu conceito de recompensas e castigos. Incansável e arrogante, ele persegue Valjean ao longo do livro, ainda que isso esteja destruindo sua própria vida. Finalmente, Javert cai nas mãos de Valjean. Em vez de matá-lo, Valjean deixa o inimigo partir. Esse ato de graça radical é profundamente perturbador para Javert, que se dá conta de que, para reagir de forma adequada a esse gesto, teria de mudar por completo sua maneira de encarar O mundo. Em vez de mudar, ele se lança no rio Sena.

| Parece o maior de todos os paradoxos. O ato mais libertador de graça incondicional e gratuita exige que o receptor abra mão do controle da própria

sm Hugo, “Little dd (cap. 13), in: Les miserables, Book One [edição em português: Os e Ozanan Pessoa de Barros (São Paulo/Rio de Janeiro: Cosac Naify/ Scanned by CamScanner

vida. Será uma contradição? Não, se você se lembrar do ue foi di Não t 1 que toi dito nos caeulos 3 € 9. Não temos controle sobre nossa vida. T ;

pÍ lados por isso Model - Todos vivemos para algo

e somos contro P 9 verdadeiro senhor de nossas vidas. Se não for esse algo para sempre nos oprimirá. A

Deus, ' B É eh y P Apenas a graça nos liberta da es-

“dão do eu + mesmo no mei oia A

cravidã edgar : o da moral e da religião. A graça só

usão e ser livres, indiví ô ;

ameaça à q es, indivíduos autônomos, levando a vida

| O evangelho possibilita levar uma vida radicalmente diversa. Os cristãos, porém, muitas vezes deixam de usar os recursos fornecidos pelo evangelho para viver à vida que eles teriam condições de viver em Cristo. É crucial para qualquer leitor deste livro admitir essa diferença fundamental entre evangelho e religião. A mensagem básica do cristianismo se distingue na raiz dos pressupostos da religião tradicional. Os fundadores de todas as outras principais religiões eram, em essência, mestres, não salvadores. Eles vieram para dizer: “Faça isto e você encontrará o divino”, mas Jesus veio essencialmente como salvador e não como mestre (embora também tenha ensinado). Ele disse: “Sou o divino | . 4 ” A m a Do,

que veio até vocês, para fazer o que vocês não eram capazes de fazer sozinhos”. À mensagem cristã é de que não somos salvos pelo nosso histórico; por isso, O cristianismo não é religião nem irreligião, mas algo totalmente diverso. o Scanned by CamScanner$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se a religião diz "obedeço, logo sou aceito" e o evangelho diz "sou aceito, logo obedeço", qual dessas lógicas tem governado de fato a sua vida espiritual e seu senso de valor diante de Deus?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Tanto o moralista que confia nos próprios méritos quanto o transgressor que ignora Deus colocam a si mesmos no centro: você consegue ver como ambos podem estar igualmente distantes da graça?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se a salvação fosse pelo seu esforço, ela traria orgulho quando você acertasse e desespero quando falhasse: o que mudaria em você ao descobrir que ela é, do início ao fim, um presente imerecido?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 13;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A verdadeira história da cruz$t$, 13,
$conteudo$Eu podia aceitar Jesus como mártir, encarnação de sacrifício e mestre divino. Sua

morte na cruz foi um magnífico exemplo para o mundo, mas meu coração jamais

pôde aceitar que nisso houvesse alguma virtude misteriosa ou miraculosa. Gandhi, An autobiography!

Eu vislumbrava a cruz e, de repente, meu coração parava de bater. Por instinto

ou intuição eu entendia que havia algo mais importante, mais turbulento, mais

intenso que nossas causas, por mais nobres que fossem. [...] Eu deveria tê-la vestido. [...] Ela deveria ter sido meu uniforme, minha língua, minha vida. Não tenho desculpa; não posso alegar que não sabia. Eu sabia desde o início e virei as costas.

Malcolm Muggeridge, Jesus rediscovered

À ani símbolo do cristianismo sempre foi a cruz. A morte de Jesus por nossos pecados é o coração do evangelho, a boa nova. Cada vez mais, Porém, o que a igreja cristã sempre encarou como boa nova vem sendo considerado uma má notícia pelo restante de nossa cultura.

No relato cristão, Jesus morre para que Deus po cal ppedot a Muitos, isso parece um absurdo, algo até mesmo port, ERÊ que J e inda de morrer?” é uma pergunta que ouço dos nova-iorquinos mais vezes do que a

pergunta “Deus existe?”. Eles indagam: “Por que no não posta simplesmen- | te nos perdoar?”. “O Deus cristão se parece com os RE vingativos dos ptimórdios, que precisavam ser apaziguados Eai o sacrifício de vidas humanas” Por que Deus não pode simplesmente aa mdb end ou, no mínimo, os que se arrependem de seus erros? A doutrina cristã da cruz deixa algumas pessoas confusas, e outras, alarmadas. Há teólogos protestantes liberais que rejeitam integralmente à doutrina da cruz, pois ela lhes parece um “abuso infantil praticado por um ser divino”.

Ora, por que então não deixar a cruz de fora? Por que não nos concentrar na vida de Jesus e em seus ensinamentos em vez de nos fixar em sua morte? Por que Jesus teve de morrer?

A primeira razão: o perdão genuíno

Comecemos com um exemplo puramente econômico. Imagine que alguém

tome emprestado seu carro e, ao dar marcha ré para sair, bata no portão, derrubando-o juntamente com uma parte do muro. Seu seguro residencial não

cobre o portão e o muro. O que fazer? Basicamente, existem duas opções. A

primeira é exigir que o responsável assuma o prejuízo. A segunda é recusar

qualquer pagamento. Talvez também haja soluções intermediárias em que 0

dois dividam o custo. Repare que em qualquer das opções alguém deve arcar como prejuízo. Ou você ou ele assume o ônus da ação, mas a dívida não vai

simplesmente evaporar. Nesse exemplo, perdão significa você arcar com O ônus

da infração cometida por ele.

A maior parte dos males que nos são causados não pode ser calculada em termos puramente econômicos. Alguém talvez tenha roubado parte de sua felicidade, reputação, de suas chances ou privado você de determinados à” pectos de sua liberdade. Não se pode pôr uma etiqueta de preço nessas coisas» mas isso não elimina a sensação de injustiça, que não desaparece quando 0 outro diz “sinto muito”. Quando somos seriamente prejudicados, ficamos er a sensação indelével de que os culpados incorreram em uma dívida que precisa ser saldada. Quando somos prejudicados e nos damos conta de que existe uma

dívida que não pode ser ignorada, só há duas coisas a fazer. To

A (VERDADEIRA) HISTÓRIA DA CRUZ 219

A primeira opção é procurar formas de fazer os culpad 6

que fizeram. Podemos romper o relacionamento e rã o di em Pelo que eles passem por algum sofrimento Proporcional ao que das para pelo menos deja Fa aconteça, Existem várias maneiras de Exec Podemos confrontá-los com crueldade, dizendo coisas que magoam. Pa sair espalhando boatos que manchem a *eputação que eles têm. Se os culpados sofrerem, talvez comecemos a sentir certa satisfação, imaginando que eles agora estejam pagando sua dívida.

No entanto, essa opção apresenta problemas graves. Talvez nos tornemos mais duros € frios, adotemos a autopiedade e, assim, é possível ficarmos mais autocentrados. Se o culpado for rico ou poderoso talvez passemos instintivamente a nos ressentir desse tipo de pessoa pelo resto da vida. Se for uma pessoa do sexo oposto ou de outra raça, talvez nos tornemos para sempre cínicos e preconceituosos em relação a toda uma classe de indivíduos. Além disso, o culpado, seus amigos e sua família quase sempre acham ter o direito de devolver na mesma moeda as nossas investidas. Ciclos de reação e retaliação podem durar anos. Fizeram mal a você, sim, mas quando você tenta cobrar o que lhe devem através da vingança, o mal não desaparece. Ao contrário, ele se alastra, €o pior é que atinge principalmente você e sua própria natureza. ra

Existe, porém, outra opção. Você pode perdoar. O perdão significa Tecusar-se a fazer os culpados pagarem pelo que fizeram. pi entanto, cd se de atacar alguém quando isso é o que mais desejamos ê pura agonia, : uma forma de sofrimento. Não apenas sofremos a perda neigioal a felicida ri = Teputação gt dsuma oportunidade, mas também abrimos ira g nan E ra infligir o mesmo mala quem nos prejudicou. Arcamos com a ai a ira Por completo o ônus em lugar de cobrá-lo do outro. Dói ime Bente diria que é uma espécie de morte. Na lugar da perpétua morte

Sim, mas é uma morte que leva à ressurreição am ug ke quanto em «: o tor, orientei muita gente q

” vida de amargura e cinismo. Como past” ecusando-se à vingar-se 30 perdão e descobri que, quando se age assim — r  ód ana posisdê d “as da mente —

Pa culpado, seja por atos ou nas fantasias timento vai se apagando. C. 5. en Como não o alimentamos, O pp “Semana passada, durante

escreveu em uma de suas Letters v0 “* achei — que havia realmente as “ações, descobri de repente — OU sé

perdoado alguém a quem vinha tentando perdoar ao longo de mais de trinta anos. Tentando e orando para conseguir”? Lembro-me de certa vez ter orientado uma garota de dezesseis anos que sentia raiva do ppl estávamos conseguindo nada até que eu lhe disse: “Seu pai sempre sairá vencedor enquanto você o odiar. Você ficará presa em sua raiva a menos que lhe perdoe do fundo do coração e comece a amá-lo”. Uma parte dela se poi ao perceber isso. Enfrentando o sofrimento do perdão oneroso, que no início sempre parece - bem pior que a amargura, ela acabou conquistando a liberdade. O perdão precisa ser dado antes de ser sentido, mas acabamos chegando lá. Isso leva a uma nova paz, a uma ressurreição. É a única forma de impedir que o mal se alastre.

Quando aconselho pessoas que foram feridas a perdoar, elas costumam indagar sobre os culpados: “Mas eles não têm que ser responsabilizados?”. Quase sempre respondo: “Sim, mas só se você os perdoar”. Há vários bons

) motivos para nos fazerem querer confrontar os culpados. Eles causaram danos e, como no exemplo do muro, reparar o prejuízo implica um custo. Deveríamos confrontar os culpados — para fazê-los ver seu verdadeiro caráter, para motivá-los a reparar seus relacionamentos ou, ao menos, para cerceá-los e impedir que prejudiquem outros no futuro. Repare, porém, que todos esses motivos para a confrontação decorrem do amor. A melhor maneira de amar os culpados e amar suas vítimas potenciais é confrontá-los, na esperança de que se arrependam, mudem e corrijam a situação.

O desejo de vingança, contudo, não decorre da boa vontade, mas da má vontade. Você pode dizer: “Só quero cobrar satisfações”, mas sua motivação real talvez seja vê-los sofrer. Se não os confrontar para o bem deles ou da sociedade, mas apenas para se satisfazer, apenas para ser ressarcido, a possibilidade de o culpado vir a se arrepender é praticamente nula. Em um caso assim, aquele que confronta irá além, buscando não a justiça, mas a vingança, não à redenção do culpado, mas seu sofrimento. As exigências do prejudicado serão excessivas e sua postura, abusiva, Ele encarará a confrontação como meio de causar dor, e um ciclo de retaliação terá início.

(São Paulo: Vida, 2009)] nei sobre o dialogo íntimo entre o homem e Deus |

A (VERDADEIRA) HISTÓRIA DA CRUZ nao

Apenas se você buscar primeiro o perdão interior, a confrontação será sóbria, sábia om Apenas quando você tiver se livrado da necessidade de ver 0 OUtrO sofrer surgirá a possibilidade de promover mudança, reconciliação e cura. Você precisará se sujeitar ao sofrimento oneroso e à morte causados pelo perdão para que haja ressurreição.

Ninguém encarnou melhor o ônus do perdão do que Dietrich Bonhoeffer, cuja história contei no capítulo 4.º Após voltar à Alemanha para se opor a Hitler, ele escreveu em he cost of discipleship (1937) que o verdadeiro perdão é sempre uma forma de sofrimento.

O fardo de meu irmão que preciso carregar não é apenas o que se vê por fora, suas

características e dons naturais, mas, literalmente, seu pecado. E a única maneira

de carregar esse pecado é perdoá-lo pelo poder da cruz de Cristo, do qual agora

partilho. [...] Perdão é o sofrimento semelhante ao de Cristo, e o cristão tem o

Em abril de 1943, Bonhoeffer foi detido e encarcerado. Acabou sendo levado para o campo de concentração de Flossenburg, onde foi executado pouco antes do fim da Segunda Guerra Mundial.

Como Bonhoeffer pôs em prática suas próprias palavras? Em primeiro lugar, seu perdão foi onerosamente sofrido porque confrontou a dor e o mal que estavam diante dele. Não foi aquilo que ele chamaria (em The cost df discipleship) de “graça barata”. Ele não ignorou nem justificou o pecado. Resistiu diretamente a ele, embora tenha lhe custado tudo o que tinha. Foi oneroso também porque ele se recusou à odiar. Atravessou [o espirros Processo exigido para amar os inimigos, o que tornou comedida e corajosa Sua resistência ao mal que ele havia sofrido, e não venenosa € cruel. As provas impressionantes disso se encontram nas cartas e textos escritos por Bonhoeffer Ta prisão. A ausência de amargura é notável.

Grego ness; en and the see am a non dos),

Ty Jones, Embodying forgiveness: a theological anaty mn "

“Dietrich Bonhoeffer, The cost of discipleship (Macmillan, 1567), ps/N00 [edição e prortnguhss Discipulado traducã ; Ido: Sinodal, 1980)].

, tradução de Ilson Kayser (São Leopo

Por favor, não se angustie por minha causa nem se preocupe comigo, is não se esqueça de orar por mim. Estou certo de que você não se pe Eitio tamanha confiança da mão de Deus a me guiar que espero jamais perdê-la. Nunca duvide de que trilho com gratidão e ânimo o caminho pelo qual estou sendo conduzido. Meu passado transborda a bondade de Deus, e meus pecados à estão perdoados pelo amor do Cristo crucificado.

Vemos aqui que Bonhoeffer estava vivenciando o que Jesus havia feito | por ele. Jesus levou seus pecados, assumindo o custo deles. Agora Bonhocffer estava livre para fazer o mesmo pelos outros. Ele usa o perdão divino como auxílio para entender o perdão humano. No entanto, usemos agora o magnífico exemplo do perdão humano de Bonhoeffer para entender o perdão divino. | O perdão de Deus |

“Por que Jesus teve de morrer? Será que Deus simplesmente não podia nos perdoar?” Essa é a pergunta de muita gente, mas agora entendemos que ninguém “simplesmente” perdoa quando o mal cometido é grave. Perdoar significa arcar com o custo em vez de obrigar o culpado a assumi-lo, de modo que se possa oferecer amor para tentar restaurar e mudar o inimigo. Perdoar significa arcar sozinho com a dívida do pecado. Todos os que perdoam grandes males passam pela morte para alcançar a ressurreição, vivenciam os pregos, o sangue, O suor e as lágrimas. |

Então, será que deveria nos surpreender o fato de Deus, tendo decidido | nos perdoar em vez de nos punir por todas as vezes que o ofendemos e pre- 8 judicamos uns aos outros, ter ido para a cruz na pessoa de Jesus Cristo para ae morrer? Como diz Bonhoeffer, todos os que perdoam arcam com os pecados E do outro, Na cruz, vemos Deus fazer claramente e em nível cósmico o que A raia ser humano Precisa fazer para perdoar alguém, embora em escala inà imagem de nosso Criador, Por isso não ;

sada (London: SR E E are rom friso edição rd à E

escritas na prisão, tradução de Nélio Schneider (São Leopoldo: di aa i , :

+amos ficar SUrpresos por sentir ni .

deveríam lo sofri P tod ar que a única maneira de triunfar sobre s nassar pelo sofrimento do So ei ; '

o malé pa ; p d e ão, € isso valeria muito mais no caso de ' ão por derrotar o i

Deus, cuja pax P mal e desejo amoroso de perdoar os outros são infinitamente maiores que os nossos.

A esta “e es on recordar que a fé cristã sempre enteng Cristo é Deus.º Ele não infligi :

deu que Jesu a não infligiu sofrimento a outrem, mas, pelo contrário, na Cruz O prin eus arcou com a dor, a violência e o mal do mundo. Por esse motivo, o Deus da Bíblia não é como as divindades primitivas que exigiam nosso sangue para aplacar a própria ira. Ao contrário, esse Deus se fez humano e ofereceu seu sangue a fim de honrar a justiça moral e o amor misericordioso de modo que um dia possa destruir todo o mal sem nos destruir.

Por isso, a cruz não é meramente um exemplo belo de amor sacrificial. Desperdiçar a vida à toa não é nada admirável — é errado.” A morte de Jesus só é um bom exemplo se tiver sido mais que um exemplo, se tiver sido algo absolutamente necessário para nos salvar. E foi. Por que Jesus teve de morrer para nos perdoar? Havia uma dívida a ser paga — o próprio Deus a pagou. Havia um castigo a suportar — o próprio Deus o suportou. O perdão é sempre uma forma de sofrimento oneroso.

6 erica 10 & : : icad um ser divino” parece admitir

À denúncia de que a cruz é O abuso infantil praticado por p que o Pai no céu é o Deus verdadeiro e que Jesus é apenas algum outro tipo de ser divino que está sendo morto. Isso não faz jus à doutrina cristã da Trindade. Os cristãos acreditam que, embora o Pai €o Filho sejam pessoas distintas, eles partilham o mesmo ser e a mesma substância, de modo que, quando Jesus arcou com o ônus do perdão, o próprio Deus estava arcando com esse ônus. Veja outras 1 o

"formações sobre a Trindade no capítulo 13. di da

ami sm exemplo se faz necessário. Imagine-se esepiahendo. PA ar r você!” e, dito isso, se 7, o gosto de ic: 7

"89, quando ele repentinamente lhe diz: “Quero mostrar com Une > Claro que não. Você Joga no ri a diria: 4 o ele gostava de mim"? Claro q -

O e se afoga. Será que você diria: “Nossa, com po RR

ficaria Re "oo. No entanto, se você estivesse caminhando pel. em dúvida sobre a sanidade mental desse amigo. água e não soubesse nadar, O

fai a de um rio com um amigo e calsse a nao Nesse caso, você pensaria: € achari basse se atoganito:

Nos aria se ele mergulhasse e o resgatasse, mas aca a exemplo se fosse somente um exe vi Como ele gostava de mim!”. O exemplo de Jesus Sem ão estivéssemos fadados ao pecado e à m aa : — se nã dncdgi ad

CE Caso não existisse perigo do qual nos salvar * modelo de seu amor sacrificial não seria tocant Não ser que fôssemos resgatados por sua morte E Jesus tenha morrido em nosso lugar, sua ini “etransformador de vidas, mas insano. A menos q ipa

"ão pode ser um exemplo comovente de amor sacrt

Já vimos como o perdão humano e seu preço ajudam a entender o perdão | divino. No entanto, é no perdão divino que se encontram à fonte e o caminho | do perdão humano. Bonhoeffer comprovou isso diversas vezes, afirmando que foi o perdão de Jesus na cruz que lhe deu segurança no amor de Deus, a ponto | de torná-lo capaz de levar uma vida de sacrifício a serviço do próximo. E

A segunda razão: o amor verdadeiro |

Em meados da década de 1990, uma denominação protestante sediou uma conferência teológica em que um preletor disse: “Acho que não precisamos em absoluto de uma teoria da expiação; acho que não precisamos de gente pendurada em cruzes, com sangue pingando e cenas tétricas”.º Por que não nos concentramos em ensinar o quanto Deus é um Deus de amor? A resposta é que se deixarmos de lado a cruz não teremos um Deus de amor.

No mundo real de relacionamentos, é impossível amar alguém que tenha problemas ou necessidades sem, de alguma forma, partilhá-los ou até mesmo trocar de lugar com essa pessoa. Todo amor genuinamente transformador implica alguma troca desse tipo.

Amar alguém feliz e equilibrado exige muito pouco de nós. Pense, porém, nos que se encontram emocionalmente enfermos. Não há como ouvir e amar gente assim e continuar emocionalmente intacto. Talvez essas pessoas se sintam mais fortes e seguras quando nos ouvem, mas isso não acontece sem que fiquemos emocionalmente exauridos. São elas ou nós. Para erguê-las emocionalmente precisamos estar dispostos a nos exaurir emocionalmente.

Consideremos outro exemplo. Imagine que você conheça um homem inocente, mas que esteja sendo perseguido por agentes secretos, pelo governo ou por algum outro grupo poderoso. Ele pede sua ajuda. Se você não o ajudar, é provável que ele morra, mas, caso se tornem aliados, você, que até então estava totalmente seguro, passa a correr risco de vida. Muitas tramas cinematográficas partem daí. Mais , uma vez, é ele ou você. Ele se sentirá mais seguro em virtude de seu envolvimento, E mas apenas por você estar disposto a partilhar a insegurança e vulnerabilidade dele. :

*Apud David Van Biema, “Why did Jesus have to die?”, Time, April 12, 2004, p. 59. a o

A (VERDADEIRA) HISTÓRIA DA CRUZ 225

Consideremos a condição dos pais. Os filhos vêm a este mundo em uma situação de total apenidênniirs Não podem ser autossuficientes, independentes, menos que os pais alias mão da própria independência e liberdade durante anos. Se você não permitir que seus filhos comprometam sua liberdade, se estiver presente ao lado deles somente quando lhe for conveniente, seus filhos crescerão fisicamente apenas. Sob todos os demais aspectos, continuarão, do ponto de vista emocional, carentes, confusos e com um alto nível de dependência. À escolha é clara: ou você sacrifica sua liberdade ou sacrifica a deles. São eles ou você. Para de fato amar seus filhos, você precisa perder para que eles ganhem. Precisa estar disposto a participar da dependência dos filhos para que eles possam vir a gozar da liberdade e independência que você tem.

Todo amor transformador dirigido a indivíduos com necessidades sérias é um sacrifício de transferência. Se você se envolver emocionalmente com eles, de alguma forma absorverá suas fraquezas e lhes doará a força que tem. John Stott escreve em The cross of Christ que a substituição está no âmago da mensagem cristã.

A essência do pecado está em nós, seres humanos, nos colocarmos no lugar de

Deus, ao passo que a essência da salvação está em Deus se colocar em nosso lugar.

Nós [...] nos colocamos onde só Deus merece estar, Deus [...] se coloca onde

Se isso é verdade, como Deus poderia ser um Deus de amor se não se envolvesse pessoalmente no sofrimento gerado pela mesma violência, opressão, luto, fraqueza e dor que vivenciamos? A resposta a essa pergunta é dupla. Primeiro, não, ele não poderia ser Deus. Segundo, apenas uma grande religião “iversal afirma que ele se envolveu.

JoAnne Pereil é «nato da mãe pelo namorado desta. “Eu

screveu sobre o assassinato da Pp

Pecisava encontrar uma ligação entre à história de mamãe, minha história e (São Pa qa » The cross of Christ (Inter Varsity, 1986), p. 160 [edição em portuga piora Cirino * Vida, 2006)).

a história de Jesus”. Ela a encontrou ao entender a cruz, ou seja, ao aiii , que Jesus não apenas sofreu por nós, mas também sofreu conosco. ai sabia E o que era ser açoitado e se recusar à ceder aos poderosos, pagundopos 1580 -COmM | a vida. Espontaneamente assumiu seu lugar junto aos que não ug ça e sofriam injustiças. !º Como escreveu John Stott: “Eu jamais conseguiria crer em Deus se não fosse a cruz. No mundo real da dor, como alguém poderia cultuar um Deus imune a ela?”.

Por isso a cruz, quando bem entendida, não pode de forma alguma ser usada para estimular os oprimidos a simplesmente aceitarem a violência. Quando sofreu por nós, Jesus honrou a justiça. Mas quando sofreu conosco, Jesus se identificou com os oprimidos do mundo, não com seus opressores. Todo amor transformador envolve uma troca, uma inversão de papéis, mas aqui se trata da Grande Inversão. Deus, detentor do poder supremo, troca de lugar com os marginalizados, os pobres e os oprimidos. Os profetas sempre entoaram cânticos sobre o Deus que “derrubou dos tronos os poderosos e elevou os humildes” (Lc 1.52), mas jamais poderiam imaginar que o próprio Deus descesse de seu trono supremo e sofresse com os oprimidos para que estes fossem exaltados. Esse modelo da cruz significa que a glorificação mundial do poder, do domínio e do prestígio está denunciado e derrotado. Na cruz, Cristo vence através da perda, triunfa através da derrota, conquista poder através da fraqueza e do serviço, chega à riqueza abrindo mão de tudo. Jesus Cristo vira de cabeça para baixo os valores do mundo. Nas palavras de N. T. Wright: f 0) ae inimigo, afinal, não era Roma, mas os poderes do mal presentes na | Mi e violência humanas. [...] [Na cr uz) o reino de Deus triunfou sobre os | reinos deste mundo recusando-se a participar de suas espirais de violência. [Na pecado, amou seus inimigos, ofereceu a outra face, andou à segunda milha.” Esse modelo inverti :

ceu cu negão iai quicadio o pensamento e as práticas t

ivo , uma realidade alternativa, uma

04 história de JoAnn “ ; 5

E pi de Ja Stom a ing Pt did Jesus have to die?”, de Van Biema, E eritão (Viçosa DE era (Harper, 2006), p. 110 [edição em português: Simplesmente Scanned by CamScanner

A (VERDADEIRA) HISTÓRIA DA CRUZ 227

contracultura entre aqueles que foram transformados por ele. Nesse reino p acífico existe gre e dos valores do mundo no que tange ao poder, à fama, 20 prestígio e à riqueza. Nessa nova contracultura, os cristãos encaram o dinheiro como algo que se doa. Encaram o poder como algo a ser usado estritamente para servir. A superioridade racial e de classe, o acúmulo de dinheiro € poder à custa dos outros, o anseio de popularidade e fama, características normais da vida humana, são o oposto da mentalidade dos que entenderam e vivenciaram a cruz. Cristo cria toda uma nova ordem de vida. Os que são moldados pela grande inversão da cruz já não necessitam se justificar através do dinheiro, do prestígio, da profissão ou do orgulho racial ou social. Assim, a cruz cria uma contracultura na qual sexo, dinheiro e poder deixam de nos controlar e são usados para doar vida e edificar a comunidade, em vez de servir como meios destrutivos.

Para entender por que Jesus teve de morrer é importante recordar tanto o resultado da cruz (o perdão oneroso dos pecados) quanto o seu modelo (a inversão dos valores do mundo). Na cruz, nem à justiça nem à misericórdia ficam de fora — ambas são cumpridas ao mesmo tempo. A morte de Jesus era necessária, para que Deus levasse à justiça a sério sem deixar de nos amar. Essa mesma preocupação com o amor € a justiça deve caracterizar todos Os nossos relacionamentos. Jesus se identificou com os oprimidos. No entanto, não devemos tentar vencer o mal com o mal. Jesus perdoou seus inimigos e morreu por eles.

Por que, então, Jesus teve de morrer? Até ele próprio fez essa pergunta. No jardim do Getsêmani, perguntou se não haveria outro caminho. Não havia. Não há. Na cruz, em agonia, ele gritou “Por quê?!” Por que ele estava sendo abandonado?!2 Por que teve de passar por tudo aquilo? À resposta da Bíblia é: por nós.

Tentei explicar o que Jesus fez por nós quando morreu e o fiz apresentando alguns princípios. Não posso, porém, fazer jus à doutrina da cruz. Soube que “Mt 27.45,46. E

certa vez pediram à grande escritora Flannery O'Connor que “explicasse | em poucas palavras” o significado de um de seus contos. Meio irritada, ela respondeu que se pudesse explicá-lo em poucas palavras não seria preciso escrever o conto. Venho tentando resumir o significado da cruz de Cristo porque acho que se trata de um exercício importante. Todavia uma exposição como a deste capítulo não é capaz de transmitir todo o poder transformador k : do ato narrado. |

As histórias que sempre nos tocam mais fundo são aquelas em que alguém passa por uma perda irreparável ou mesmo a morte a fim de que outro possa | viver. Praticamente não existe um filme de sucesso cujo tema principal não seja esse. Um de meus favoritos é Angels with dirty faces.” James Cagney faz o papel de Rocky Sullivan, um criminoso famoso e ídolo de todos os delinquentes juvenis da cidade. Ele está prestes a ser executado na cadeira elétrica. Na véspera da execução, recebe a visita do amigo de infância, Jerry, vivido por Pat O'Brien, que se tornou padre e tenta livrar os jovens da cidade de uma vida de crimes. Jerry faz um pedido chocante, mas afirma ser esta a única maneira de afastar aqueles garotos do caminho de destruição que escolheram. Quero que você os decepcione. À vida toda você tem sido um herói para esses garotos e centenas de outros. Agora, Rocky, você está para virar um herói glorificado pela morte e quero impedir que isso aconteça. Eles precisam se lembrar de você com desprezo. Precisam sentir vergonha de você.

Você está me pedindo que eu faça uma cena, que me acovarde, para que esses garotos pensem que eu não tenho valor algum. [...] Está pedindo que eu jogue fora a única coisa que me restou. [...] Quer que eu rasteje, a última coisa que eu Rss faria na vida. [...] Nem pensar. Você está pedindo demais. [...] Se quer ajudar E É E esses garotos, trate de pensar em outro jeito. E a À

Jerry está pedindo a Rocky que faça a Grande Inversão, o sacrifício de substituição. Diz ao amigo que se ele se apegar à sua dignidade, os meninos * E Scanned by CamScanner

A (VERDADEIRA) HISTÓRIA DA CRUZ "

morrerão na apoios Se o amigo os envergonhar, abrindo mão da glória pessoal, os garotos poderão ser salvos. É a única maneira de libertá-los do culto ao herói. Rocky se recusa a atender. Na manhã seguinte, porém, nós o vemos a caminho da sala de execução. De repente, ele começa a implorar clemência com gritos histéricos e morre de forma humilhante, fazendo o supremo sacrifício. Os espectadores do filme sempre ficam estupefatos. Quanto a mim, cada vez que assisto, ele mexe comigo, me faz querer viver de um jeito diferente. Tal é o poder que a história tem para influenciar vidas.

Outro ótimo exemplo desse tipo de narrativa é 4 tale of two cities.'* Charles Darnay e Sydney Carton são muito parecidos, e ambos amam a mesma mulher, Lucie Manette. Lucie escolhe Charles, eles se casam e têm um bebê. O contexto da história é a Revolução Francesa, e Charles, aristocrata francês, é preso e condenado à morte na guilhotina.

No final do romance, Sydney, que é inglês, visita Charles na véspera de sua execução é se oferece para trocar de lugar com ele. Charles recusa a oferta, mas Sydney dopa o amigo e o leva às escondidas até a carruagem que os aguarda. Em seguida, assume o lugar de Charles, que mais tarde, junto com a família, foge para a Inglaterra.

Naquela noite, uma jovem costureira, também condenada à morte, aproxima-se de Sydney e entabula uma conversa com ele, pensando tratar-se de Charles Darnay. Quando se dá conta da troca, ela arregala os olhos e pergunta: “Você vai morrer por ele?”. E Sydney responde: “Também pela denso eo filho dele. Não conte! Vou, sim”. A costureira confessa, então, que está apavor ada G não tem certeza de que será capaz de enfrentar a morte. Pergunta ao corajoso

estranho se ele seguraria sua mão nos momentos finais. padão chega pi ambos se dirigem para a guilhotina de mãos dadas. Ela está calma e até com Certa esperança, desde que não tire os olhos dele. no

À moça do romance estava afundando sob o peso de sua provação, e força se esvaía, mas então ficou maravilhada pelo sacrifício de substituição de Sydney, que a capacitou a enfrentar a prova decisiva.

230 OS FUNDAMENTOS DA FÉ o

Emocionante? Sim, mas o evangelho vai mais fundo.” Sempre achei essas histórias de sacrifício muito emocionantes. Elas sempre me impeliram í a decidir viver com mais coragem € altruísmo. No entanto, nunca perseverei o no cumprimento dessas resoluções. As histórias tocavam meu coração e me beliscavam a consciência, mas meus padrões emocionais permaneciam intactos. | O que me movia continuava a ser uma necessidade de provar aos outros o meu | valor, de obter aprovação e aplausos, de controlar o que os outros pensavam a meu respeito. Enquanto esses temores e necessidades exercessem poder sobre mim, minhas intenções de mudar não iriam longe.

O evangelho, contudo, não é apenas um romance emocionante sobre alguma personagem. É uma história verídica, e fazemos parte dela. Somos aqueles jovens delinquentes; para nos salvar, Jesus abriu mão de algo infinitamente | maior que a fama deste mundo. Jesus também veio nos visitar na prisão e, apesar de nossa recusa em sermos salvos, ele assumiu nosso lugar. À costureira se emocionou com um sacrifício que nem sequer havia sido feito por ela. Quanto mais força somos capazes de extrair da descoberta de que Jesus se entregou por nós, trocou de lugar conosco?

Só posso dizer que olhar de fora essas histórias mexeu comigo, mas quando me dei conta de que, na verdade, eu era participante da história de Jesus (e da minha), fui transformado. O temor e o orgulho que habitavam meu coração finalmente foram desalojados. O fato de que Jesus tinha de morrer por mim me fez humilde e me libertou do orgulho. O fato de Jesus ter se alegrado em morrer por mim me tranquilizou e me libertou do medo.

Os Evangelhos contêm [...] uma estória mais ampla que abarca toda a essência de [outras] À E estórias. Mas esta estória entrou na história e no mundo. [...] É uma estória suprema e verdadeira.” E J.R.R. Tolkien, “On fairy stories”, in: The Tolkien reader (Del Rey, 1986). Scanned by CamScanner$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se todo perdão verdadeiro custa caro a quem perdoa, como na imagem da dívida que alguém precisa absorver, isso ajuda você a entender por que Deus não podia "simplesmente perdoar" sem que algo lhe custasse?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quando vê na cruz não um Deus exigindo sangue, mas um Deus que toma sobre si mesmo o preço do nosso mal, isso transforma a impressão de "abuso divino" em algo que se parece com amor que se entrega?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Há alguma mágoa que você se recusa a perdoar porque o preço lhe parece alto demais: o que a cruz revela sobre quanto Deus esteve disposto a pagar para perdoar você?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A realidade da ressurreição$t$, 14,
$conteudo$Minha pergunta — aquela que aos cinquenta anos de idade quase me levou ao suicídio — era a mais simples das perguntas que habitam a alma de qualquer ser humano [...] uma pergunta sem cuja resposta não é possível viver. É a seguinte: O que será feito de meus atos de hoje ou de amanhã? O que será feito de toda minha vida? Por que viver, por que desejar ou fazer o que quer que seja? Ela também pode ser formulada assim: “Existe algum sentido em minha vida que não será destruído pela morte inevitável que me aguarda?”. Leon Tolstoi, 4 confession

vANDo estudava filosofia e religião na faculdade, aprendi que a ressur- Qui de Jesus era um grande problema histórico, não importa como a encarássemos. A maioria dos historiadores modernos partia da pressuposição filosófica de que a existência de milagres é impossível, o que tornava altamente problemática a questão da ressurreição. No entanto, se você não crê na ressurteição, fica difícil explicar como a igreja cristá teve início. | Vários anos atrás, tive o diagnóstico de câncer na tireoide. Era tratável, e foi removido com sucesso por via cirúrgica € outras terapias. No entanto, Parafraseando Samuel Johnson, a palavra “câncer” pronunciada ar relação à você em qualquer circunstância leva a uma incrível concentração da mente. Durante o tratamento descobri o livro de N.T Wright, he resurrection ofthe Son God, a última palavra em academicismo histórico sobre acesa niedção de Josias Eu o li com grande atenção. Ficou bastante claro para mim que à E sia psd Tito mais que histórica ou filosófica. Por certo são ambas as coisas, mas muito mais também. Se a ressurreição aconteceu, isso muda totalmente nossa vida. e

Às vezes sou procurado por gente que me diz: “Tenho sérias dificuldades com esse aspecto do ensinamento cristão. Gosto de uma parte das crenças do cristianismo, mas esta acho que não consigo aceitar”. Costumo responder: “Se Jesus ressuscitou dos mortos, você tem de aceitar tudo o que ele disse; se não ressuscitou, por que se preocupar com qualquer coisa que ele tenha dito? A pergunta em torno da qual tudo gira não é saber se você gosta ou não de seus ensinamentos, mas, sim, se ele ressuscitou ou não dos mortos”. Foi assim que se sentiram os primeiros que ouviram a notícia da ressurreição. Eles sabiam que se ela fosse verídica não mais seria possível viver como quiséssemos. À ressurreição também significava que não precisaríamos ter medo de nada, nem das espadas romanas, nem do câncer de tireoide. De nada. Se Jesus ressuscitou dos mortos, isso muda tudo.

Será que ele ressuscitou? Examinemos os motivos e as evidências, os argumentos e os contra-argumentos.

A maioria acha que, quando se trata da ressurreição de Jesus, o ônus da prova cabe aos crentes, que devem provar que o fato aconteceu. Não é bem assim. À ressurreição também atribui aos incrédulos o ônus da prova. Não ; basta simplesmente acreditar que Jesus não ressuscitou dos mortos. É preciso apresentar outra explicação historicamente viável para o nascimento da igreja. E preciso fornecer algum outro relato plausível para o começo de tudo. À maioria dos que não creem que a ressurreição de Jesus realmente ocorreu E oferece como explicação para o início do cristianismo um cenário mais ou menos assim:

Naquela época os indivíduos não possuíam nosso conhecimento científico E a respeito do mundo. Acreditavam em magia e em acontecimentos sobrenaturais. Eram presas fáceis de relatos sobre um Jesus que havia ressuscitado, pois acreditavam na ressurreição dos mortos. Os seguidores de Jesus ficaram desolados quando ele foi morto. Como acreditavam que era o Messias, talvez Enigma começado a sentir que Jesus continuava entre eles, guiando-os, vivendo em espírito Gi coração de cada um, Alguns podem até ter tido à impressão de que Jesus tia falado epa eles. Com o passar das décadas, essa sensação de que Jesus poningaçA espiritualmente vivo transformou-se em histórias sobre À sua ressurreição física. Os relatos da ressurreição nos quatro Evangelhos serviram para sustentar essa crença. E

to alternativo apresen 4 ;

9 e id licasaça P . missa parágrafo anterior parece admissível o indivíduo c porâneo médio, mas .

par do do tuiral , apenas porque ignoramos o contexto histórico e cultural.

| O túmulo vazio e as testemunhas

A primeira falácia no relato alternativo é a afirmação de que as narrativas dos Evangelhos de Mateus, Marcos, Lucas e João obrigatoriamente se desenvolveram mais tarde, muito depois dos acontecimentos. Argumenta-se que os dois principais elementos desses textos — o túmulo vazio e as testemunhas oculares — foram invenções. Isso não pode ser verdade.

Os primeiros relatos sobre o túmulo vazio e as testemunhas oculares não constam dos Evangelhos, mas das epístolas de Paulo, as quais, todos os hisp 48

toriadores concordam, foram escritas entre quinze e vinte anos apenas após a morte de Jesus. Um dos textos mais interessantes é 1Coríntios 15.3-6: Porque primeiro vos entreguei o que também recebi: Cristo morreu pelos nossos pecados, segundo as Escrituras; e foi sepultado; e ressuscitou ao terceiro dia, segundo as Escrituras; e apareceu a Cefas, e depois aos Doze. Depois apareceu a mais de quinhentos irmãos de uma só vez, € à maior parte deles ainda vive, mas alguns já faleceram.

Aqui, Paulo não só fala do túmulo vazio e da ressurreição ao terceiro dia” (demonstrando falar de um acontecimento histórico, não de um símbolo é boo ti s. Paulo indica que o

ou metáfora), mas também lista as testemunhas oculare a a Jesus ressurreto não apenas apareceu para indivíduos e pequenos pas ais 4 ioria das quais

também apareceu para quinhentas pessoas de uma só vez, a maioria , q S . m H odiam Ss

continuava viva no momento da redação da epístola, de modo o E Z 171 aa

consultadas para confirmar o fato. Essa epístola de Pu era Ger die igreja; «bl i ra ser lido em voz alta.

igreja; logo, era um documento público, escr ito pa amiia Hora convidava qualquer um que duvidasse de que Jesus honyvesse sa nie á e. Tratamorte a procurar as testemunhas oculares se assim E ne te a pax romana : . . 1to. à que duran

desafio direto, que podia facilmente ser re à Paulo não teria feito tal Viajar na região do Mediterrâneo era seguro € fácil. Fa

desafio se essas testemunhas oculares não ex

Outro elemento importante desse texto é que Paulo enfatiza estar contando com toda fidelidade o que lhe havia sido transmitido. Acadêmicos críticos ão século 19 e início do século 20 pressupunham que os primeiros cristãos utilizavam um processo para à transmissão de histórias diliiôricas populares que as alterava, como uma versão cultural da brincadeira infantil “telefone sem fio”. Todavia, como observei no capítulo 6, estudos antropológicos mais recentes mostram que as culturas antigas faziam nítida distinção entre histórias fictícias e relatos históricos quando os transmitiam. Não era permitido alterar os relatos históricos.” É isto o que Paulo afirma: os relatos da ressurreição por ele transmitidos foram conservados inalterados depois de narrados por pessoas que efetivamente viram Jesus.

Ademais, os relatos da ressurreição na Bíblia eram problemáticos demais para serem inventados. Todos os Evangelhos afirmam que as primeiras testemunhas oculares da ressurreição foram mulheres. A posição social inferiorizada das mulheres implicava que seu testemunho não constituía prova admissível em juízo. Para a igreja não seria de modo algum vantajoso dizer que as primeiras testemunhas oculares foram todas mulheres. Isso só conseguiria enfraquecer a credibilidade do testemunho. A única explicação possível para 0 fato de mulheres aparecerem nessas condições é que tudo se passou exatamente assim. N. T. Wright observa que os primeiros proclamadores da mensagem cristã devem ter sofrido enorme pressão para retirar as mulheres dos relatos, mas estes não se sentiram à vontade para tanto — os registros eram bem conhecidos? Os relatos das primeiras testemunhas oculares da ressurreição devem ter sido eletrizantes e transformadores, passados adiante e recontados mais que qualquer outra história sobre a vida de Jesus.

Além disso, conforme defende Wright, o túmulo vazio e os relatos de encontros com Jesus parecem ainda mais verossímeis historicamente quando nos damos conta de que devem ser encarados como um todo. Se houvesse apenas um túmulo vazio e nenhuma aparição, ninguém teria concluído tratar-se de

a à e eyewitnesses (Eerdmans, 2006) [edição em português: Jest DO REIS (São Paulo: Pi, out, E a Pen ans iii nc

surreição do is a apo a ado portuguese il

: a Cristã/Paulus, 2013)], p. 608.

uma premio E que 0 corpo havia sido roubado. Se apenas uma a ma oeu ar afirmasse ter visto Jesus e nada se dissesse sobre o túmulo vazio, untem concluiria tratar-se de Uma ressurreição, pois eram comuns os relatos de visões ni entes queridos que haviam falecido. Apenas se ambos os elementos fossem igualmente verídicos seria possível chegar à conclusão de que Jesus havia ressuscitado dos mortos 3

As epístolas de Paulo mostram que os cristãos proclamaram desde o início a ressurreição corpórea de Jesus. Isso significa que o túmulo devia necessariamente estar vazio. Ninguém em Jerusalém acreditaria por um segundo na pregação se o túmulo não estivesse vazio. Os céticos facilmente poderiam produzir o corpo de Jesus em decomposição. Da mesma forma, Paulo não afirmaria em um documento público que havia um bocado de testemunhas oculares vivas se isso não fosse verdade. Não podemos nos dar ao luxo de pensar que os relatos da ressurreição só foram inventados anos mais tarde. Independentemente do que mais tenha acontecido, o túmulo de Jesus com certeza estava vazio e centenas de testemunhas devem ter afirmado tê-lo visto fisicamente ressurreto. Ressurreição e imortalidade

Existem, portanto, evidências muito fortes de que o túmulo estava vazio e de que centenas de pessoas afirmaram ter visto O Cristo ressurreto. Esse volume de evidências é “historicamente seguro”, conforme diz Wright. “Mas por certo”, alguém pode questionar, “isso não prova que Jesus tenha enairnaas Tessuscitado. É claro que seus seguidores queriam desesperadamente acreditar que Jesus havia ressuscitado. Se alguém tivesse roubado o corpo a a de Ear a impressão de que isso havia acontecido, vários indivíduos de boa fé o 'Maginar tê-lo visto, e, quem sabe, outros tantos fizessem o mesmo, achando Ser por uma boa causa”. A forma do que C

O pressuposto dessa hipótese bastante frequente é uma RR ui q , $. Lewis chamou de “esnobismo cronológico”. Supomos que nós, in ivíduos modernos, encaramos com ceticismo afirmações de uma ressurreição corpórea, 20 passo almente crédulos no que toca ao sobrenatural,

Co ideia. As coisas não são assim. Para todas as

teriam imediatamente comprado a ide ição corpórea, individual ai : $ uma ressurrei : u

cosmovisões predominantes na época, ç ,

era quase inconcebível. a E duda

N.T Wright fez um extenso levantamento do pe nen Judaico irorrá imeiro sé nto no lado oriental qu

do mundo do Mediterrâneo do primeiro século, ta po e quanto

; isão uni essoas da época dizia qu

no ocidental, e revela que a visão universal das p Pp que a

ressurreição corpórea era impossível. Por quê: Segundo o pe greco romano, a alma, ou espírito, era boa, e o mundo físico e material, fraco, corrupto e impuro. Para os gregos e os romanos, o elemento físico, por definição, estava sempre em decomposição e, por isso, à salvação era vista como a [ibertação do corpo. Segundo esse conceito, a ressurreição não só era impossível, como também totalmente indesejável. Nenhuma alma, tendo se libertado do corpo, haveria de desejá-lo de volta. Mesmo os que acreditavam na reencarnação, entendiam que o retorno à vida encarnada significava que a alma ainda não havia saído de sua prisão. O objetivo era libertar-se para sempre do corpo. Uma vez que a alma se libertasse do corpo, um retorno à vida reencarnada era bizarro, impensável e impossível.

O relato da ressurreição de Jesus também deveria ser impensável para os judeus. Ao contrário dos gregos, os judeus encaravam o mundo físico € material como algo bom. À morte não era vista como libertação do mundo material e, sim, como tragédia. Na época de Jesus, muitos judeus já nutriam a esperança de que algum dia, no futuro, haveria uma ressurreição corpórea de todos os justos, quando Deus renovasse o mundo inteiro e retirasse dele

ado sofrimento e morte.” A ressurreição, contudo, não passava de uma parte ar ã ' Ec

á ai completa do mundo, segundo os ensinamentos judaicos. A ideia de um úni : : = su

m único ser ressuscitar, no meio da história, enquanto o restante *É comum ouvir que a ideia de “ er

de todo o antigo is E leia de “deuses morrerem e ressuscitarem” era encontrada em religiões n 1 . E e

er | e Próximo. Sim, esses mitos existiam, mas ainda que se suponha que os S€ guidores judeus de Jesus conhecessem essas lend; ã ão é itava nem nas religiões naoã ] as pagãs (o que não é certeza), ninguém acreditava, glões pagãs, que a ressurreição ocorria com seres h E qa Vei N.T Wright, Simply Christi re es humanos individualmente. Veja , | Christian [edição em português: Simplesm Aa E 008)], P- 113, e sua extensa pesquisa sobre i mente cristão (Viçosa: Ultimato, 2 , os m psd ,

the Som of God, itos de morte e ressurreição de deuses em The resurrecton f Wright, The resurrecti

| RO SE dae tie dono SÍ God (Fortre 4) 2003), Pa OO ii | Scanned by CamScanner

A REALIDADE DA RESSURREIÇÃO sai

do mundo continuasse Riga pela doença, pela decomposição e pela morte,

era inconcebível. Se alguém dissesse a um judeu do primeiro século: “Fulano

ressuscitou dos mortos!”, a resposta seria: “Você enlouqueceu? Como isso é

possível? Não há mais morte nem doença? À verdadeira justiça foi implanada no mundo? O lobo deitou-se ao lado do cordeiro? Ridículo!”. A mera

ideia de uma ressurreição individual seria inimaginável tanto para um judeu

Ao longo dos anos, céticos da ressurreição sugeriram que os seguidores de Jesus podem ter tido alucinações, imaginando que ele lhes aparecia e lhes falava. Isso implica que a ressurreição do Mestre era concebível para seus seguidores judeus, uma opção naquela cosmovisão. Mas não era. Outros surgiram com à teoria da conspiração: os discípulos roubaram o corpo € afirmaram para outros que Jesus estava vivo. Isso implica que os discípulos esperavam que outros judeus fossem receptivos à ideia de que um indivíduo pudesse ressuscitar dos mortos. Mas nada disso é possível. As pessoas daquele tempo considerariam uma ressurreição corpórea impossível tanto quanto nossos contemporâneos, embora por razões diferentes.

No primeiro século houve vários outros movimentos messiânicos, cujos supostos messias foram executados. No entanto,

Em nenhum caso sequer se levanta a hipótese de seguidores decepcionados afir-

- marem que seu herói havia ressuscitado dos mortos. Eles não eram tolos. A ressurreição não era um acontecimento para indivíduos. Os revolucionários judeus | cujo líder fosse executado pelas autoridades e que conseguissem escapar da prisão tinham duas opções: desistir da revolução ou encontrar um novo líder. Afirmar ne o líder original tinha voltado à vida simplesmente não constituía uma opção. A menos, é claro, que fosse verdade.

Houve dezenas de outros candidatos à messias cujas vidas e trajetórias se encerraram de forma semelhante ao que ocorreu com Jesus. Por que os discí- Pulos de Jesus chegariam à conclusão de que a crucificação não havia sido uma derrota, mas um triunfo — a menos que O tivessem visto ressurreto? Wright, Who was Jesus? (Eerdmans, 1993), P: 63-

/ 238 OS FUNDAMENTOS DA FÉ

O amanhecer de uma nova cosmovisão

Após a morte de Jesus, toda a comunidade cristã de repente do um conjunto de crenças totalmente novas €, até aquela altura, PR EERRS Os Primeiros cristãos tinham uma visão da realidade centrada na ementa, Acreditavam que a futura ressurreição já havia começado em Jesus. Acreditavam que Jesus tinha um corpo transformado capaz de atravessar paredes, mas que, ainda assim, se alimentava. Não se tratava apenas de um corpo ressurreto, como vislumbravam os judeus, nem somente de uma existência espiritual, como a imaginada pelos gregos. A ressurreição de Jesus garantiu nossa ressurreição e já trouxe ao nosso coração um pouco da nova vida futura.”

Como observa N.T Wright, cada uma dessas crenças era inédita no mundo até então, mas em qualquer outra situação de que temos notícia, uma alteração tão colossal nas noções relativas à cosmovisão ocorreria em um grupo de indivíduos apenas ao longo de um período de tempo.* Normalmente são precisos anos de debate e polêmica em que numerosos pensadores e escritores discutem a “natureza da ressurreição” até que um Jado saia vitorioso. É assim que as culturas e cosmovisões se modificam.

No entanto, a visão cristã da ressurreição, absolutamente inédita na história, surgiu já cristalizada imediatamente após a morte de Jesus. Não passou por um processo de desenvolvimento. Seus seguidores disseram que suas crenças não derivavam de debates e discussões. Eles estavam apenas contando aos outros o que haviam visto em primeira mão. Ninguém apresentou nenhuma alternativa plausível para tal afirmação. Ainda que sugeríssemos à ideia altamente improvável de que um ou dois discípulos de Jesus se convenceram sozinhos de que ele havia ressuscitado, eles jamais conseguiriam levar outros judeus a acreditarem nisso a menos que houvesse múltiplos encontros inexpli cáveis, admissíveis e repetidos com o Mestre.

À história posterior da igreja é ainda mais difícil de explicar. Como uM grupo de judeus do primeiro século passaria a adorar um ser humano como se ele fosse divino? As religiões orientais acreditam que Deus seja uma força

A REALIDADE DA RESSURREIÇÃO

- resoal que permeia todas as coisas e

impessoal q n » Portanto, podem aceitar a ideia de

que alguns Seres umanos possuam uma consciência mais divina que outros. As religiões ocidentais acreditam E Os vários deuses costumavam se disfarcar como seres humanos. Era possível, assim, que alguma figura humana na verdade fosse Zeus ou Hermes. Os judeus, contudo, acreditavam em um único Deus transcendente, pessoal. Era uma completa blasfêmia sugerir que qualquer ser humano fosse adorado. No entanto, centenas de judeus começaram a adorar Jesus literalmente da noite para o dia. É amplamente aceito que o hino a Cristo como Deus citado por Paulo em Filipenses 2 tenha sido escrito apenas poucos anos após a crucificação. Que acontecimento extraordinário teria derrubado toda essa resistência judaica? À visão de Jesus ressurreto explicaria isso. Que outra resposta histórica o faria?

Há mais uma coisa a ser lembrada. Como disse Pascal: “Eu [acredito] na- | quelas testemunhas cujo pescoço é cortado”. Praticamente todos os apóstolos e | todos os primeiros líderes cristãos morreram por causa da fé, e fica difícil acreditar que esse tipo de autossacrifício seria feito para sustentar uma mentira. |

Portanto, não basta ao cético meramente descartar o ensinamento cris- | tão sobre a ressurreição de Cristo dizendo: “Isso simplesmente não pode ter | acontecido”. Ele precisa responder a todas estas perguntas históricas: Por que |, O cristianismo surgiu tão repentinamente e com tamanho irem tha Outro grupo de seguidores messiânicos da época jamais concluiu que seu líder Tessuscitou dos mortos — por que este grupo O fez? Nenhum grupo de judeus | jamais adorou um ser humano como se fosse Deus. O que levou este grupo a | *gir assim? Os judeus não acreditavam em homens divinos nem a a | Sões de indivíduos. Como explicar as centenas de testemunhas oculares a ) SUrreição que continuaram vivas durante décadas € publicamente susten /

seu testemunho, às vezes dando a vida por aquilo em que criam: A

az E aboratório. No entanto, à maior parte de outros acontecimentos Que da dr sfinçgaão o A y de explicar O nascimento da igreja que damos como certos. Toda tentativa de &P

deixe de fora a ressurreição de Jesus vai contra o que sabemos a respeito da história e da cultura do primeiro século. Se não qua esse processo invocando o preconceito filosófico que nega a existência de milagres, a ressurreição

de Jesus é a maior prova de que eles existem.

O problema, porém, é que as pessoas de fato apelam para a sabotagem na investigação. Em lugar de se darem ao trabalho de responder a essas perguntas históricas bastante difíceis e, depois, seguir a direção que as respostas indicam, elas se safam com a objeção de que milagres são impossíveis. N. T. Wright dá uma resposta mordaz: ,

| Ós primeiros cristãos não inventaram o túmulo vazio, nem os encontros com

: Nesus ressurreto nem suas aparições. [...] Ninguém esperava algo assim; nenhum

| tipo de experiência de conversão haveria de inventar essas histórias, não importa

| quão culpados (ou perdoados) se sentissem esses indivíduos, não importa o

) | número de horas que se debruçassem sobre as Escrituras. Sugerir o contrário é | deixar de fazer história e entrar em um mundo particular de fantasia.”

Sou solidário com quem diz: “E daí, se não consigo pensar em uma explicação alternativa? À ressurreição simplesmente não pode ter acontecido”. Não nos esqueçamos, porém, de que as pessoas do primeiro século sentiam o mesmo. Assim como você, elas também achavam a ressurreição inconcebível. À única maneira de fazer alguém aceitar a ressurreição naquela época era deixar que as provas desafiassem e alterassem sua cosmovisão, sua concepção do que era possível. Os problemas então enfrentados diante da ideia da ressurreição eram os mesmos de hoje, mas as evidências — os relatos das testemunhas oculares e a mudança na vida dos seguidores de Cristo — foram esmagadoras.

Todo ano na Páscoa, prego sobre a ressurreição. Em meu sermão sem” pre iai a meus amigos céticos, secularizados, que, mesmo que não consigam deles E ne que sia a verídica, A maioria

com o alívio para a fome e as doencas . a a mise Aa o ço entanto, a maioria acredita ao co E er Sae À

que o mundo material surgiu por acidente e que O

A REALIDADE DA RESSURREIÇÃO at

mundo € tudo o que nele existe acabarão queimados na morte do sol. Ficam desapontados porque tão poucos se preocupam com a justiça, mas não se dão conta de que à cosmovisão que eles adotaram acaba sabotando qualquer motivação para fazer do mundo um lugar melhor. Por que nos sacrificar em prol das necessidades de terceiros se, no final, nada do que realizarmos fará a menor diferença? No entanto, se a ressurreição de Jesus é fato histórico, isso significa que existe uma esperança infinita e motivos de sobra para nos desdobrarmos para atender às necessidades do mundo. Em um sermão, N. T. Wright disse:

A mensagem da ressurreição é: este mundo importa! As injustiças e dores do mundo atual devem ser agora abordadas com a notícia de que a cura, a justiça e o amor venceram. [...] Se a Páscoa significa que Jesus Cristo ressuscitou apenas no sentido espiritual, ela diz respeito somente a mim, e devo buscar uma nova dimensão em minha vida espiritual como indivíduo. Mas se Jesus Cristo realmente ressurgiu dos mortos, o cristianismo se torna uma boa nova para o mundo inteiro — uma boa nova que aquece nosso coração justamente porque não se resume a isso. A Páscoa significa que em um mundo onde a injustiça, a violência e a degradação são endêmicas, Deus não está disposto a tolerar tais coisas, e que trabalharemos e planejaremos, com toda a energia de Deus, para implantar a vitória de Jesus sobre isso tudo. Se eliminarmos a Páscoa, provavelmente Karl Marx estará certo ao acusar o cristianismo de ignorar os problemas do mundo material. Se eliminarmos a Páscoa, Freud provavelmente estará certo em dizer que O cristianismo é a satisfação de um desejo. Se eliminarmos à Páscoa, Nietzsche provavelmente estará certo em dizer que o cristianismo é para Os fracos.!º p. Ft «“T Wright, For all God's worth: true worship and the pe im Scanned by CamScanner$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se negar a ressurreição também exige explicar de outro modo o surgimento explosivo da igreja, as testemunhas dispostas a morrer e o túmulo vazio, qual explicação alternativa você considera de fato mais plausível?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Keller diz que a pergunta decisiva não é se você gosta dos ensinos de Jesus, mas se ele ressuscitou: por que essa é a questão da qual tudo depende, e você já a encarou de frente?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se Jesus realmente venceu a morte, e portanto nada, nem o câncer, nem a perda, nem a própria morte, tem a palavra final, o que isso mudaria no medo que você carrega hoje?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A dança de Deus$t$, 15,
$conteudo$Em 1938 [...] eu sofria de dores de cabeça lancinantes; qualquer som era como um soco. [...] Descobri o poema chamado “Love” [de George Herbert], que decorei. Muitas vezes, no auge de uma dor de cabeça violenta, eu me obrigava a recitá-lo, concentrando nele minha atenção e me apegando de todo coração à ternura que ele abriga. Eu costumava pensar que estava mer | ramente recitando um belo poema, mas, sem saber, aquilo funcionava como | uma oração. Foi durante uma delas que Cristo se apossou de mim. Em meus argumentos sobre a insolubilidade do problema de Deus, jamais previ essa possibilidade, a de um contato real, pessoal, aqui neste mundo, entre um ser humano e Deus.

Simone Weil, Waiting for God

pi que o cristianismo seja a religião que melhor explica nossas histórias individuais de vida e aquilo que vemos na história do mundo. Defendi, nos últimos seis capítulos, que a compreensão cristã de nossa origem, do que está errado conosco € como isso pode ser restaurado explica mais satisfatoriamente o que vemos € vivenciamos do que qualquer outro relato concorrente. Chegou a hora de juntar Os vários fios da narrativa que xaminamos até agora € encarar à linha mestra do cristianismo como um todo. À Bíblia muitas vezes é vista como um drama em quatro atos Criação, | Queda, Redenção e Restauração.

"Edição em português: Espera de Deus (São Paulo: Cultura Espiritual, 1987). Scanned by CamScanner

Somente o cristianismo, entre as religiões mundiais, ensina que Deus é trino, A doutrina da Trindade diz que Deus é um ser que existe eternamente em três pessoas: Pai, Filho e Espírito Santo. No entanto, a Trindade significa que Deus, em sua essência, é relacional. F

O Evangelista João apresenta o Filho vivendo por toda a eternidade “ao F lado do Pai” (Jo 1.18), denotando assim amor e intimidade. Mais adiante no É mesmo Evangelho, Jesus, o Filho, apresenta o Espírito que vive para glorificálo (Jo 16.14). O Filho glorifica o Pai (17.14), que por sua vez glorifica o Filho (17.15). Isso se dá por toda a eternidade (17.5b).

O que significa o termo “elorificar”? Glorificar é louvar, apreciar algo ou alguém, deleitar-se em alguma coisa ou pessoa. Quando alguma coisa é útil, você se sente atraído por ela em razão do que ela pode lhe trazer ou fazer por você. Mas se alguma coisa é bela, você a aprecia pelo que ela é. Estar em sua presença já representa a recompensa. Glorificar alguém também significa servir a pessoa ou a ela se submeter. Em lugar de sacrificar os interesses do outro em prol de sua felicidade, você sacrifica seus interesses em prol da felicidade do outro. Por quê? Porque sua felicidade suprema é vê-la feliz.

O que significa, então, o fato de o Pai, o Filho e o Espírito Santo glo- | rificarem uns aos outros? Se usarmos uma ilustração, podemos dizer que o egocentrismo é algo estático, estacionário. Nele, exigimos que outros orbitem em torno de nós. Agimos e damos afeição aos outros, desde que isso nos ajude a satisfazer nossas metas pessoais e nos realize.

A vida interior do Deus trino, contudo, é totalmente distinta. A vida da a Trindade se caracteriza não pelo egocentrismo, mas pelo amor mutuamente E doado. Quando servimos alguém e com esse alguém nos deleitamos, entramos g em uma órbita dinâmica em torno dessa pessoa, focamos seus interesses € É desejos. Isso cria uma dança, principalmente se são três as pessoas, cada uma das E quais disposta a girar em torno das outras duas. É isso o que a Bíblia nos diz.

Cada uma das pessoas divinas se concentra nas outras, Nenhuma exige que as

outras girem em torno de si. Cada uma se concentra espontaneamente nas outras |

duas, derramando sobre elas amor, deleite e adoração. Cada pessoa da Trindade |

tem as outras como objeto de amor, adoração, deferência e júbilo. Isso cria uma no Scanned by CamScanner

inâmica e pulsante de alegri nr

dança dinâmica 6 po'SSm Rico Os primeiros líderes da igreja grega : o para 18so: À

gnham um term k perichoresis, Perceba que nossa palavra “coreografia” está nele representada € significa, liter almente, “dançar ou fluir à volta” 2 1 [...] Filho [...] e Espíri :

O Pai [... L..] pírito Santo glorificam uns aos outros. [...] No centro do universo, o amor que se doa é a moeda dinâmica da vida trinitária de Deus. As pessoas dentro de Deus exaltam umas as outras, têm comunhão entre si e submetem-se umas às outras. [...] Quando falavam de perichoresis em Deus, os primeiros cristãos gregos queriam dizer que cada pessoa divina abriga as outras no âmago de seu ser. Em um movimento constante de abertura e aceitação, cada uma envolve e circunda as outras.

No cristianismo, Deus não é algo impessoal nem um objeto estático — nem mesmo uma única pessoa —, mas uma atividade dinâmica pulsante, uma vida, quase um tipo de drama, se você me desculpar a irreverência, um tipo de dança. [...] O padrão dessa vida constituída por três pessoas é [...] a grande fonte de energia e - beleza que brota no próprio núcleo da realidade.*

A doutrina da Trindade sobrecarrega nossos circuitos mentais. Todavia, a despeito da dificuldade cognitiva que ela encerra, essa concepção dinâmica, espantosa, do Deus trino transborda implicações profundas, maravilhosas, transformadoras da vida e do mundo.

ao . pa ; da pessoa da Trindade “recipro-

“Hilário de Poitiers em Concerning the Trinity (3.1) diz que cada p ne sa temente engloba as outras e é engio

Camente contém as outras, de modo que cada uma permanen iai da SR da Migros ito de Tom Torrance: The holy Trinity:

hi Pop ganda ii en o d, 2004), p. 265 373. A “pericorese” envolve ts “heology ainda e Ami om repor pn do Amor ou à Comunhão 1 á a . q m

am mútuo assim como habitação mútua. E o pi

rs ir a pr istian vision of faith, learning, and living

' "Cornelius Plantinga, Engaging God's world: a Chri

erdmans, 2002) és: Cristianismo puro e

c ij «e? in: Mere Christianity [edição em po 8 ins 2009)] f «5. Lewis, “The good infection , in: Cipolla (São Paulo: Wmfinartinstontes, + Â 1

“imples, tradução de Álvaro Oppermann; Marcelo Brandão uai ário detectadas pelos pensadores ao À en ib “Existem muitas implicações profundas no a lo — de Platão € Aristóteles até à moderi tiplo — aê

Ngo dos séculos. O antigo problema do uno e do en Pp será a unidade mais importante do que dade e pós- : ta os filósofos há séculos. ou vice-versa? Serão Os aro modernidade — atormenta 08 “” ais importante que 9 grupo Particularidade ou vice-versa? Será o indivíduo m

246 OS FUNDAMENTOS DA FÉ |

Se Deus não existe, tudo em nós e à nossa volta é produto de forças impessoais cegas. A experiência do amor pode parecer importante, mas os naturalistas evolucionistas nos dizem que se trata meramente de um estado bioquímico no cérebro. À importância do amor, na opinião deles, é uma ilusão.

Mas e se Deus existir? Será que o amor ganha uma definição melhor? Depende de quem você acha que Deus seja. Se Deus fosse uma só pessoa, antes de criar outros seres não havia amor, já que amor é algo que alguém sente pelo outro. Isso significa que um Deus unipessoal representa poder, soberania e grandeza por toda a eternidade, mas não amor. O amor, assim, não faz parte da essência de Deus, nem se encontra no coração do universo. O poder é primordial.

No entanto, se Deus for trino, os relacionamentos de amor na comunidade são “a grande fonte [...] no âmago da realidade”. Quando alguém diz “Deus é amor”, penso que está querendo dizer que o amor é extremamente importante ou que Deus realmente deseja que amemos. No entanto, na concepção cristã, Deus realmente tem como essência o amor. Se ele fosse apenas um, não poderia amar por toda a eternidade. Se fosse apenas a alma impessoal do pensamento oriental, não poderia amar, pois o amor é um sentimento próprio das pessoas. As religiões orientais acreditam que a personalidade individual é uma ilusão e, portanto, o amor também. Chesterton escreveu: “Para o budista [...] a universais mais importantes que os particulares e os contextos ou vice-versa? As culturas tiveram de optar entre o absolutismo e o relativismo, entre o individualismo e o coletivismo, mas se Deus é trino e tanto unidade quanto diversidade, o pensamento filosófico trinitário não deveria se encaixar no espectro entre o absolutismo e o relativismo, nem sua noção social se encaixar no espectro entre o coletivismo e o individualismo. Nem o indivíduo nem a família/tribo deveriam constituir a unidade social suprema. Nem o legalismo nem o relativismo deveriam caracterizar a filosofia moral. Veja algumas reflexões extremamente estimulantes sobre a promessa do pensamento trinitário nas obras de Colin Gunton, especialmente The One, the Three, and the Many (Bampton Lectures) (Cambridge University Press, 1993), | The triune Creator: a historical and systematic study (Eerdmans, 1998) e The promise of Trinitarian theology | (T8ET Clark, 2004). |

Consideremos a declaração de Lee Kuan Yew, Ministro Mentor de Cingapura, relativa à controvérsia : sobre a punição judicial de chibatadas aplicada a Michael Fay, em 1994, A jornalistas ocidentais, ele disse: À “Para nós, na Ásia, um indivíduo é uma formiga. Para vocês, é um filho de Deus. Trata-se de um conceito : curioso”. Apud Daniel C. Dennett, Darwin dangerous idea: evolution and the meaning of life (1995), p. 474. |

personalidade éa quis ii Me gra O cristão, é o propósito de Deus, a razão de ser de sua ideia cósmica”.” É o propósito de Deus, pois ele, essencial e eternamente, é amor interpessoal.

A realidade suprema é uma comunidade de indivíduos que se conhecem e se amam. E isso que caracteriza o universo, Deus, a história e a vida. Se privilegiar O dinheiro, o poder e a realização em detrimento dos relacionamentos humanos, você colidirá com a rocha da realidade. Quando Jesus disse que você precisa perder a vida por ele para preservá-la (Mc 8.35), ele estava relatando o que o Pai, o Filho e o Espírito Santo vêm fazendo durante toda a eternidade. Assim, você jamais obterá um senso de identidade ficando parado e fazendo que todo o resto gire em torno de suas necessidade e interesses. A menos que esteja disposto a vivenciar a perda de opções e a limitação individual que resultam de compromissos relacionais, você permanecerá fora de sintonia com sua própria natureza e com a natureza das coisas.

Em vários outros trechos deste livro, esbocei a impossibilidade de ser plenamente humano para quem recusa o ônus do perdão, a troca substitutiva de amor e as restrições da comunidade. Citei C. S. Lewis, que disse que o único lugar além do céu onde inexistem a dor e o sofrimento dos relacionamentos é 0 inferno.

Por quê? Porque, segundo a Bíblia, este mundo não foi criado por um Deus que é apenas um indivíduo, bem como não é a emanação de uma força impessoal, Não é, igualmente, o produto de lutas de poder entre divindades Pessoais nem de forças naturais aleatórias € violentas. Os Pi rejeitam essas outras explicações da criação, que se recusam à dar primazia ao amor. Acreditamos que o mundo foi criado por um Deus que é ne porosa de pessoas que têm se amado por toda à eternidade. Você foi iria para dar à o amor altruísta, dirigido ao outro. O egocentrismo destrói o tecido

a (São Paulo, 2008)], p. 245, apud Rienstra,

Jonathan Edwards, refletindo sobre a vida interior do Deus trino, concluiu que Deus é infinitamente feliz. Dentro dele existe uma comunidade de pessoas que derramam amor alegre e glorificador umas sobre as outras. Pense nesse padrão aplicado à sua própria experiência. Imagine alguém que você admire | mais que qualquer outra pessoa no mundo. Você faria qualquer coisa por essa pessoa. Imagine, agora, ter descoberto que ela sente o mesmo por você e ambos | firmem uma amizade por toda a vida ou um namoro seguido de casamento. Parece o paraíso? Sim, porque isso vem do céu — isso é o que Deus vivencia em seu interior, mas em grau e profundidade infinitos ou inimagináveis. Por isso, Deus é infinitamente feliz, porque no âmago de seu ser está o “foco no outro”, visto que ele não busca sua própria glória, mas a dos outros. “Espere aí”, diz você. “Praticamente em todas as páginas da Bíblia, Deus nos exorta a glorificá-lo, louvá-lo e servi-lo. Isso não é buscar a própria glória?” Sim, ele nos pede obediência incondicional, nos exorta a glorificá-lo, louvá-lo e a centrarmos nossa vida nele. Mas espero que a esta altura você tenha, finalmente, entendido o porquê. Ele deseja nossa felicidade! Ele é infinitamente feliz não por ser autocentrado, mas por dar seu amor sem reservas, focado no outro, À única forma de nós, criados à sua imagem, desfrutarmos da mesma felicidade é centrando toda a nossa vida nele, não em nós mesmos. Por que um Deus assim criaria um mundo de seres como nós? Baseando- -Se em passagens bíblicas como João 17.20-24, Jonathan Edwards chegou a uma conclusão. O historiador George Marsden resume a ideia de Edwards: E que um ser infinitamente bom, perfeito e eterno haveria de criar? [...] Aqui, dwards lança mão do conceito cristão da Trindade como essencialmente | “O que temos, então, é um retrato de Deus, cujo amor, mesm da criaçã al coisa, é orientado para o outro. [...] Sempre houve um Pr a Ni natureza de Deus. [...] Somos amigos de Deus em decorrência de s To E o our o RA atuou na plenitude do tempo, que o plano da redenção, concebid Pç : e i passada, explodiu no espaço-tempo de nossa história a o mA mente de Deus inn The difficult doctrine of the love of God (InterVarsity, 2000) “em im certo.” D. A. pi doutrina do amor de Deus, tradução de Degmar Ribas (Rio Ei E ledição em p ortuguês: 4 dificil ; ii e Janeiro: CPAD, 2007)]. Â

interpessoal. [...] A razão primordial que levou Deus a criar, diz Edwards, não foi satisfazer alguma carência em si mesmo, mas expandir essa perfeita comunicação

interior da bondade e do amor do Deus trino. [...] A alegria, a felicidade e o

deleite de Deus ante as perfeições divinas se expressam externamente através da

comunicação dessa felicidade e desse deleite aos seres criados. [...] O universo é

uma explosão da glória de Deus. Amor, beleza e bondade perfeitos irradiam de

Deus e fazem as criaturas partilharem cada vez mais a alegria e o deleite divinos.

[...] Assim, a finalidade suprema da criação é a união de Deus e das criaturas

Deus não nos criou para obter a felicidade infinita, cósmica, do amor mútuo e da glorificação, mas para partilhá-la. Fomos feitos para participar da dança. Se centrarmos nossa vida nele e o servirmos não por interesse próprio, mas apenas por ser ele quem é, por causa de sua beleza e glória, participaremos da dança e partilharemos da alegria e do amor em que ele vive. Portanto, fomos criados não apenas para crer em Deus de uma forma geral, numa espécie vaga de inspiração ou espiritualidade. Fomos feitos para centrar nossa su nele, para ter como finalidade e paixão de nossa vida conhecê-lo, servi-lo, usufruí-lo e nos assemelhar a ele. Essa intensificação da felicidade prosseguirá eternamente, crescendo de forma inimaginável (1Co 2.7-10). ]

Isso leva a uma visão positiva e ímpar do mundo material. O mundo não é, como pretendem outros relatos da criação, uma ilusão, resultado S e batalha entre os deuses nem produto acidental de forças pras el criado com alegria e, portanto, é bom em si mesmo. ai universo ' pe 1

e ias interligadas, porém stintas,

como uma dança de seres unidos por energias pe

mo as marés e as estações,

como planetas girando em torno de estrelas, co o So,

“Como átomos em uma molécula, como às notas Ee O o sem pa Organismos vivos nesta terra, como a mãe com O di sor cam Au faco À Corpo”.1º O amor da vida interior da Trindade está Imp

G corge Marsden, Jonathan Eduwar ds: a lifé (Yale University Press, »P “Rienstra, So much more, p. 38-

A história da Bíblia começa com a dança da criação, mas em Gênesis 3 lemos sobre a Queda. Deus diz a Adão e Eva que não lhes é permitido comer o fruto de uma árvore sob pena de morrerem. Mas o que haveria de tão errado em consumir o fruto daquela árvore? À resposta não é fornecida. No entanto, se obedecermos às instruções de Deus apenas quando isso for ao encontro de nossos objetivos e interesses, estaremos tentando fazê-lo girar em torno de nós. Deus se torna o meio para um fim, não um fim em si mesmo. Deus, então, diz à humanidade algo como: “Obedeçam-me no tocante à árvore exclusivamente por amor a mim. Por mim apenas”.

E falhamos. Tornamo-nos estacionários, autocentrados. De acordo com Gênesis 3, quando nosso relacionamento com Deus desandou, todos os nossos outros relacionamentos também se desintegraram. O egocentrismo gera alienação psicológica. Nada nos faz mais infelizes do que o narcisismo, a interminável e rígida concentração em nossas necessidades e desejos, no tratamento que queremos receber, em nosso ego e histórico. Além disso, o egocentrismo leva à desintegração social, está na raiz da ruptura das relações entre nações, raças, classes e indivíduos. Finalmente, de alguma forma misteriosa, a recusa da humanidade em servir a Deus levou também à nossa alienação do mundo natural.

Perdemos a dança. À dança dos relacionamentos felizes, mutuamente doadores, é impossível em um mundo em que todos são estáticos, tentando fazer todo o resto girar à sua volta.

No entanto, Deus não nos deixa nessa situação. O Filho de Deus veio ao mundo para dar início a uma nova humanidade, uma nova comunidade que poderia perder seu egocentrismo, começar uma vida centrada em Deus e, como consequência, lenta, mas certamente, reparar também todos os outros relacionamentos. Paulo chama Jesus de “último Adão”. O primeiro Adão foi tentado pe jardim de Deus, o último Adão (Jesus) foi testado no jardim do Petar, pr imeiro Adão sabia que viveria caso obedecesse a Deus no que

na respeito à árvore. Mas não obedeceu. O último Adão também foi testado « , .

id da Ear e (it, “árvore”), a cruz, Jesus sabia que seria - Mesmo assim, obedeceu.

Porque Jesus morreu por nós? O que ele ganharia com isso? Record

| e ele já particip ava -de, usa. comunidade: de alegria, glória e a Es

| Mós de nós. paia o benefício auferiu disso? Nenhum. Isso guita que quando E in na cruz para lidar com nossos pecados

estava orbitando em torno de nós e nos servindo. “Eu lhes dei à glória que EE peste" (Jo 17). Ele começou a fazer conosco o que vinha fazendo com o Paie o Espírito Santo por toa f eternidade. Ele se centra em nós, amando-nos sem girar qualquer benefício disso.

Sea beleza do que Jesus fez emociona você, esse é o primeiro passo para abandonar seu egocentrismo e seu medo e firmar uma relação de confiança com ele. Na verdade, quando morreu por você, Jesus o convidou a participar da dança. Ele o convida a começar a centralizar nele toda a sua vida, ao mesmo tempo em que se entregou por você.

Se você aceitar esse convite, todos os seus relacionamentos começarão à ser curados. Como observei no capítulo 9, pecado é centrar sua identidade em qualquer outra coisa que não seja Deus. Entregamo-nos apenas à relacionamentos e buscas que nos façam crescer € sustentem nossas tentativas de are Justificação e autocriação. Mas isso também nos leva a desprezar vromndiiaçae inferiores aqueles que não detêm as mesmas realizações ou sinais de mrgro :

No entanto, quando somos capazes de ver Jesus vindo em nossa Tá “98 envolvendo com um amor infinito € desinteressado, somos a Sê novo E des a sobre um alicerce totuiontl E et it a mec Podemos ; — ssa vida e parar de tentar set ri como pecadores neces-

- “aCeitar tanto seu desafio de nos reconhecermos ossa

Sitados de s . taurador como à nova base de n

: dentidade E enipegão aan seu amor prai pinguém. Não precisaremos e ii ntão não precisaremos por eai] senso de orgulho € autoestima Bota Pessoas para sustentar noseo es mo Jesus se dirigiu a nós. | Nos capacitados a nos dirigir a0S outros CO no

Na autoentre huma outra situação, entramos nO a em

| asd pç Ra «« o Verbo Eterno sempre 5

it o € toda a criação, mas de todo ser. Pois

sacrifício. Ao ser crucificado, ele “fez nas tormentas de suas províncias remotas o que já havia feito em casa em glória e alegria” desde antes da fundação do mundo. [...] Do mais elevado ao mais baixo eu existe algo de que abdicar e, por meio dessa abdicação, o eu se torna mais verdadeiro, para abdicar cada vez mais por todo ; o sempre. Esta não é uma [...] lei da qual possamos fugir. [...] O que se encontra : fora do sistema de autoentrega é [...] apenas e tão somente o inferno [...] aquela vil prisão no eu. [...] A autoentrega é a realidade absoluta.” O futuro da dança +

Como, então, terminará a história humana? No final do último livro da Bíblia, vemos exatamente o oposto do que outras religiões preveem. Não vemos a ilusão do mundo se dissolver nem vemos as almas fugirem do mundo físico para o céu. Ao contrário, vemos o céu descer ao nosso mundo para se unir à ele e purificá-lo de todas as suas falhas e imperfeições. Haverá um “novo céu | e uma nova terra”. O profeta Isaías retrata o cenário como um novo jardim do | Éden, no qual novamente haverá de imperar a total harmonia da humanidade com a natureza e o fim do sofrimento, da doença e da morte, juntamente com o fim de toda guerra e animosidade racial. Não mais existirão pobres, escravos, | criminosos ou enlutados de coração ferido.

Tudo isso decorre do que sabemos sobre a criação como uma dança. À - Trindade praticamente “rejubilou-se” na criação do mundo. Por puro deleite | Deus criou um universo de seres para acolher em sua alegria, e as estrelas recém-criadas o aclamaram. Mesmo agora, os seres criados continuamente | anunciam a glória de Deus e o contemplam, “por isso eles se regozijam, por isso | eles cantam” (Sl 65.13). Deus se dirige a seu mundo com carinho e amor. Está comprometido com todas as partes de sua criação, amando-a e sustentando-a. Embora o pecado e o mal tenham maculado o mundo, fazendo dele apenas uma sombra de sua verdadeira identidade, no final dos tempos a natureza será restaurada a sua glória plena e nós com ela. À própria criação será “libertada | do cativeiro da degeneração, para a liberdade da glória dos filhos de Deus" | 4C,S. Lewis, The problem of pain (Macmillan, 1961), p. 140 [edição em português: O problema do sofrimento, tradução de Alípio Franca (São Paulo: Vida, 2006)]. Scanned by CamScanner

(Rm 8.21). O mundo inteiro será curado quando for atraído para a plenitude da glória de Deus. O mal será destruído e todo o potencial da criação, latente até esse momento, romperá em plenitude e beleza. Assim, comparados ao que seremos, somos hoje meros vegetais. Até as árvores cantarão e produzirão música ante a face do Rei que retorna, que, por meio de sua presença, sempre transforma o luto em dança.

Como a criação foi feita à imagem de Deus, que é igualmente um e muitos, a raça humana será finalmente reunida, mas nossa diversidade racial e cultural permanecerá intacta no mundo renovado. A raça humana finalmente viverá junta, em paz e interdependência. Glória a Deus nas alturas e paz na terra. A vida cristã

Como reagir a isso? Quando observamos o todo desse enredo, vemos claramente que o cristianismo não diz respeito apenas ao perdão de nossos pecados para que possamos ir para o céu. Esse é um meio importante para a salvação de Deus, mas não sua finalidade ou propósito. O propósito da vinda de Jesus é restaurar o mundo todo, renovar e recuperar a criação, não mantê-la ao largo. Não se trata apenas de trazer perdão e paz individual, mas também Justiça e shalom ao mundo. Deus criou tanto o corpo quanto a alma, e a ressurreição de Jesus mostra que ele redimirá tanto o corpo quanto à alma. A obra do Espírito de Deus não é apenas salvar almas, mas também cuidar e cultivar à face da terra, o mundo material. o

Nunca é demais ressaltar a singularidade dessa visão. Além da Bíblia, "enhuma outra religião de peso nutre esperança nem mesmo interesse Dn “stauração de shalom, justiça e integridade perfeitas neste pano ion À Vinoth Ramachandra, escritor cristão do Sri Lanka, entende a iara clareza, Todas as outras religiões, diz ele, oferecem à ido sob & ae forma de libertação da humanidade comum. A salvação é vista como úoa ga dos grilhões da individualidade e da encarnação corpórea para algum tipo de Sistência espiritual transcendente.

A salvação [bíblica] consiste não em se libertar deste mundo, mas em intao Má-lo. La Você não encontrará esperança para O mundo em nenhum sistema Scanned by CamScanner

asa OS FUNDAMENTOS DA FÉ |

religioso nem em nenhuma filosofia da humanidade. EJA visão bíblica é impar Por isso, quando alguém diz que existe salvação também o outras religiões, indago: “De que salvação você está falando?”. Nenhuma religião apresenta uma promessa de salvação eterna para O mundo — o mundo comum — a exemplo do que fazem a cruz e à ressurreição de Jesus.2 |

O que significa, então, participar da obra de Deus no mundo? O que significa levar uma vida cristã? Uma forma de responder a essa pergunta é voltar E i o olhar para a vida da Trindade e para a criação original. Deus nos fez para a compartilhar cada vez mais de sua alegria e deleite, da mesma maneira como E os tem em si mesmo. Participamos de sua alegria primeiro quando o glorificamos (adorando-o e servindo-o em lugar de adorar e servir a nós mesmos), depois, quando honramos e servimos a dignidade de outros seres humanos fei- | tos à imagem da glória de Deus e, finalmente, quando valorizamos sua glória | derivativa no mundo da natureza que também a reflete. Nós o glorificamos e | usufruímos apenas quando o adoramos, quando servimos a comunidade humana e cuidamos do meio ambiente criado.

Outra forma de encarar a vida cristã, porém, é vê-la da perspectiva da restauração final. O mundo e nosso coração estão dilacerados. À vida, a morte | e a ressurreição de Jesus foram uma operação de regaste infinitamente preciosa que tinha como alvo devolver a justiça aos oprimidos e marginalizados, à integridade física aos doentes e moribundos, a vida comunitária aos isolados e solitários e a alegria e o vínculo espiritual aos que se alienaram de Deus. Ser : cristão hoje é fazer parte da mesma operação, com a expectativa de sofrimento | e dificuldades e a feliz certeza de um final bem-sucedido. % Ea dei do evangelho dá sentido ao dever moral e à nossa fé na 1a E a Justiça, permitindo aos cristãos promover a justiça restauradora € E caminho do perdão e da reconcilia g a Du : eiangrdima, cpa E dá sentido a nosso caráter eisfcdact jo a Afins err

cristãos se sacrificam para fortalecer as ! o POR

comunidades humanas à sua volta bem |

2Vinoth Ramachandra, The scandal of Jesus (InterVarsity, 2001). j Scanned by CamScanner

como à comunidade NA nr Ei a ta do evangelho também

dá sentido a nosso deleite dian ' a beleza, sa ocando Os cristãos a serviço do qundo material, pum os que cultivam a criação natural por meio da ciência çda agricultura até OS que se entregam 2 empreendimentos artísticos, todos abendo por que a eia são nn para o desenvolvimento humano. Q céu e as árvores cantam” a glória de Deus, e, ao cuidar deles e ao celebrálos, libertamos nossa voz para louvar a Deus e para nos deleitar. Trocando em miúdos, vida cristã significa não só edificar a comunidade cristã incentivando | as pessoas a terem fé em Cristo, mas também edificar a comunidade humana, | por meio do serviço e de atos de justiça. |

Desse modo, os cristãos são verdadeiros “revolucionários” que batalham | em prol da justiça e da verdade, labutando com a expectativa de um mundo | perfeito no qual: |

Ele lhes enxugará dos olhos toda lágrima; e não haverá mais morte, nem pranto, | nem lamento, nem dor, porque as primeiras coisas já passaram (Ap 21.4). E quando chegarmos lá, diremos: Finalmente de volta ao lar! Este é o meu verdadeiro país! É o meu lugar. Esta é a terra que busquei a vida toda, embora nunca a tivesse visto! Esse não será, de forma alguma, O fim da história. Na nl dade, como disse C. S. Lewis, todas as aventuras que tivemos um dia pedindo Por ser não mais que “a capa e a folha de rosto”. Finalmente, darei não a Primeiro Capítulo da Grande História, que ninguém na tea jamais deu, história que prosseguirá para sempre, na qual cada capítulo é melhor que 0 ânterior” 13

l dE ês: À última batalha,

tato o The last battle (Collier, 1970), P. ini o PRE

a Steuernagel (São Paulo: Martins Hom»

Conhecer a si mesmo é, acima de tudo, conhecer a própria carência. É pautar-se pela verdade, e não o contrário.

Flannery O'Connor, The fiction writer and his country

“E então o coração de Éowyn se modificou, ou, quem sabe, ela finalmente o entendeu.”

J.R.R. Tolkien, The return ofthe king

) possívEL, embora não absolutamente certo, que o cristianismo tenha se tornado mais admissível para você após a leitura deste livro. Você talvez tenha se emocionado com algumas descrições das necessidades de nosso mundo, com sua própria condição e com à missão de Cristo no mundo. a e agora estiver pronto para sondar O que significa colocar sua fé em Cristo: agora, para onde você vai?

As motivações quase sempre são confusas. Se esperar até e E a ni Z A 4 (6) .

Ainda assim, é importante indagar o que bast

) , -+ Maria Rímoli Esteves; Almiro P

(s Edição em português: O retorno do ret, tradução Lenita it do Paulo: Martins Fontes, 1994).

de determinada maneira, sobretudo quando se trata de assumir um compromisso de fé. Por exemplo, talvez você esteja atravessando um período muito difícil. Pode ser que, pela primeira vez na vida, você tenha plena consciência de que precisa de Deus e de algum tipo de auxílio espiritual para superar a fase. Não há nada de errado nisso, mas seria muito fácil nessa situação aproximar-se de Deus como um meio para alcançar um fim. Você se dispõe a adotar o cristianismo para servir a Deus ou para que Deus o sirva? A segunda opção é um tipo de xamanismo, uma tentativa de obter controle sobre Deus por meio de suas orações e práticas. Trata-se de fazer uso de Deus em vez de confiar nele.

Temos de admitir que praticamente todos nós começamos nossa jornada em busca de Deus porque desejamos algo dele. No entanto, precisamos nos dar conta do fato de que lhe devemos nossa vida em virtude do que ele já fez por nós. Ele é nosso Criador, e só por isso já lhe devemos tudo. No entanto, ele também é nosso Redentor, que nos salvou pagando um altíssimo preço. Qualquer coração sensato desejará se render a alguém que não apenas é todo-poderoso, mas também já provou sacrificar qualquer coisa pelo nosso bem.

Normalmente começamos a jornada em direção a Deus pensando: “O que preciso fazer para alcançar de Deus isto ou aquilo?”, mas em algum momento precisamos começar a pensar: “O que preciso fazer para alcançálo?”, Se você não fizer essa transição, jamais encontrará, de fato, o verdadeiro Deus, e acabará crendo tão somente em alguma versão caricaturesca dele.

Um cristão é, literalmente, “de Cristo”, alguém que não apenas sofre uma vaga influência dos ensinamentos do cristianismo, mas transferiu para Jesus sua lealdade mais básica. Os cristãos entendem a escolha do tipo “tudo ou nada” que nos é imposta pela magnitude das alegações de Jesus.

Desde os primórdios, a profissão de fé dos cristãos era Christos Kyrios, “Jesus é o Senhor”. Em um contexto histórico no qual era obrigatório afirmar Kaiser Kyrios, “César é o Senhor”, essa confissão significava que Jesus encarnava o poder supremo. Não era apenas um ser angelical divino, mas,

E AGORA, PARA ONDE VAMOS? 259

conforme expressa um dos primeiros hinos cristãos, ele tinha “o nome que está acima de qualquer outro nome” (Fp 2.9). Nele, “habita corporalmente toda a plenitude da divindade” (Cl 2.9).

Essa é uma afirmação grandiosa, mas nela reside certa lógica. Um dos indivíduos que mais recentemente observou essa lógica foi Bono, vocalista da panda U2, em conversa com o jornalista e escritor Michka Assayas:

Assayas: Cristo tem seguidores entre os maiores pensadores do mundo. Mas será

que “Filho de Deus” não é meio mirabolante?

Bono: Não, para mim não é mirabolante. Veja, a resposta secular para a história

de Cristo é sempre a mesma: ele foi um grande profeta, sem dúvida um sujeito muito interessante, que tinha muito a dizer seguindo a linha de outros grandes profetas, como Elias, Maomé, Buda ou Confúcio. Na verdade, porém, Cristo não permite isso. Ele não deixa você se safar tão fácil. Cristo diz: “Não, não estou dizendo que sou um mestre, não me chamem de mestre. Não estou dizendo que sou um profeta, mas que 'sou o Messias”. Estou dizendo que “sou Deus encarnado”. E o pessoal responde: “Não, por favor, seja apenas um profeta. De um profeta damos conta. Você é meio excêntrico. Já vimos João Batista comer gafanhotos e mel, tudo bem. Mas não fale aquela palavra que começa com M! Porque, sabe, vamos ser obrigados a crucificar você”. Mas ele insiste: “Não, eu sei que vocês esperam que eu volte com um exército e os liberte destes canalhas, mas, na verdade, sou o Messias”. A esta altura todos desviam o olhar e pensam: “Ai, meu Deus, ele não vai parar de dizer isso”. Assim, ou ficamos com O Cristo que era o que dizia ser — o Messias — ou com um maluco completo. Veja bem, estou falando de um maluco tipo Charles Manson. [...] Não é piada. Para mim, mirabolante é a ideia de que todo o curso da civilização de mais da metade do mundo teve seu destino transformado € virado pelo avesso por causa de um maluco...

?Charles Manson foi líder de uma comunidade (conhecida como “Família Manson”) surgida nos Estados Unidos no final da década de 1960 e responsável por vários assassinatos cometidos sob suas ordens. Dono de uma mente doentia, ele está preso, cumprindo pena de prisão perpétua. (N. do E,)

Bono descreve como as afirmações de Jesus a seu próprio respeito nos obrigam a uma escolha do tipo “tudo ou nada”. Ele pergunta qual a probabilidade de um sujeito mentalmente perturbado no nível de Charles Manson ter | produzido o tipo de impacto que Cristo teve sobre seus seguidores e sobre o mundo. No entanto, se Jesus não era doido, nossa única alternativa é aceitar o que ele disse e nele centrar nossa vida. À única coisa que não temos o direito de fazer é reagir moderadamente a ele.

Flannery O'Connor afirma o mesmo em 4 good man is hard to find.O Desajustado é um bandoleiro que aprisiona uma família em uma área rural no sul dos Estados Unidos. A chefe da família, a avó, tenta dissuadi-lo de matá-la e apela para um papo sobre orações, igreja e Jesus, mas o Desajustado responde:

Jesus [...] desequilibrou todas as coisas. Se fez o que ele disse ter feito, só nos

resta jogar tudo para o alto e segui-lo. Se não fez, só nos resta aproveitar da

melhor maneira possível os poucos minutos que ainda temos, matando alguém ou incendiando sua casa ou fazendo alguma outra maldade contra a pessoa. Coisa boa, não. Maldade.

Flannery O'Connor comentou certa vez sobre esse encontro dizendo que

o Desajustado realmente havia entendido as implicações do “tudo ou nada” de Jesus. “A história é uma espécie de duelo entre a avó e suas crenças superficiais e o Desajustado, que se envolve com um sentimento mais profundo em relação às ações de Cristo, as quais, para ele, desequilibraram o mundo.” O'Connor sofreu pessoalmente tal pressão. Não adianta dizer que você crê em Jesus, à menos que permita que isso mude sua vida e sua concepção de todas as coisas. “A redenção não tem sentido, salvo se existir uma causa para ela na vida que efetivamente levamos”, escreveu a autora em um ensaio. “Observo do ponto de vista da ortodoxia cristã. Isso significa que, para mim, o sentido da vida está centrado em nossa redenção por Cristo, e encaro tudo o que vejo no mundo com base nisso,”4

“Letter to Mr, Flannery O'Connor: collected works (New York: Library of America, 1988),

“The fiction writer and his country”, Flannery O'Connor: collected works (New York: Library of America), 1988, p. 804-5.

E AGORA, PARA ONDE VAMOS? 261

Bono e Flannery O'Connor têm personalidades muito diversas, mas ambos sentiram pessoalmente as implicações radicais das alegações de Jesus. Os cristãos são indivíduos que permitem que a realidade de Jesus modifique tudo o que diz respeito ao que são, ao que pensam e ao modo como vivem.

Talvez esses desafios da parte de Bono € Flannery O'Connor façam você engolir em seco. E se tiver adquirido mais respeito e interesse pelo cristianismo, mas ainda não estiver pronto para assumir um compromisso dessa ordem? Talvez sinta que ainda existem barreiras entre você e a religião cristã.

Se esse é O seu caso, não deixe as coisas em suspenso, esperando que de alguma forma seus sentimentos mudem e as barreiras caiam. Faça um levantamento a fim de identificar razões específicas de suas reservas. Veja a seguir um conjunto de perguntas que irão ajudá-lo nesse processo:

- Questões de conteúdo: Existe alguma parte da mensagem cristã — a criação, o pecado, Jesus como Deus, a cruz, a ressurreição — que você não entenda ou com a qual não concorde?

- Questões de coerência: Existem, ainda, dúvidas e objeções quanto à re-

| ligião cristã que você não conseguiu sanar?

* Aquestão do preço: Você sente que a iniciativa de adotar plenamente a fé cristã lhe custará muito caro? Que temores você sente em relação ao compromisso?

| Você pode utilizar um esboço como esse para analisar € identificar suas barreiras contra um compromisso pleno, mas não confie em sua capacidade

de fazer isso sozinho. Praticamente qualquer coisa — de um novo idioma a uma nova habilidade — fica mais fácil de ser aprendida em comunidade,

onde cada membro se encontra em seu próprio estágio da peregrinação. Passe

| algum tempo em uma igreja cristã, assistindo ao culto e fazendo amizade com o ça mbros, a fim de conversar com cristãos e saber como eles lidaram com suas

O mais importante: lembre-se de que se tornar cristão não é ticar um item de uma lista de coisas a fazer e nas quais acreditar. No final do capítulo 11 do Evangelho de Mateus, Jesus nos convida: “Vinde a mim, todos os que estais cansados e sobrecarregados, e eu vos aliviarei. Tomai sobre vós o meu jugo e aprendei de mim. [...] Porque o meu jugo é suave, e o meu fardo é leve”. Certa vez um homem disse a um pastor que aceitaria de bom grado crer na mensagem do cristianismo se ele lhe apresentasse apenas um argumento incontestável de sua veracidade. O pastor respondeu: “E se Deus não nos tiver dado um argumento incontestável, mas, sim, um indivíduo incontestável?” .5 Jesus está dizendo: “Sou essa pessoa. Venham a mim. Vejam quem sou. Observem minha cruz, minha ressurreição. Ninguém poderia inventar isso! Venham a mim e encontrarão descanso para suas almas”.

No final, a fé e a certeza crescem à medida que aprendemos mais sobre Jesus, quem é ele e o que fez.

Existe mais uma barreira que, a esta altura, muitos sentem que talvez não seja tão difícil de superar como imaginavam. Nova York está cheia de gente criada e batizada em várias igrejas, pessoas que abandonaram a fé na adolescência ou na juventude e há muitos anos não pensam nela. Então, alguma coisa faz essas pessoas pararem, e elas passam a empreender uma busca espiritual. Examinam as ideias básicas da religião cristã e lhes parece que jamais a entenderam antes. À pergunta que me fazem como pastor é: “Não sei se sou convertido ou não. Será que estou voltando à minha fé ou descobrindo-a pela primeira vez?”. À resposta é simples. Não sei, e isso não faz diferença. Se você deseja se conectar ou reconectar com Deus, é preciso que faça as duas coisas. Que coisas são essas?

À primeira coisa a fazer é arrepender-se. Essa não é uma palavra bonita de ouvir, mas não há alternativa. O arrependimento que dá início a um novo relacionamento com Deus não é primordialmente uma questão de elaborar listas de pecados específicos que você lamenta ter cometido e deseja corrigir.

“Extraído de um sermão de Dick Lucas, Mateus 11.

E AGORA, PARA ONDE VAMOS? 263

Não me interprete mal: se você está explorando os pobres ou traindo sua mulher, mas deseja pôr sua fé em Cristo, por favor, pare de fazer ambas as coisas. Um cristão deve amar os pobres e ser fiel a seus votos conjugais. Mas só essas mudanças de comportamento não farão de você um cristão. Muita gente no mundo tem uma preocupação ética social e individualmente, mas não tem um relacionamento com Deus por meio de Jesus Cristo. O arrependimento inclui lamentar por pecados específicos, mas significa muito mais.

O arrependimento que realmente modifica o coração e seu relacionamento com Deus começa quando você reconhece que seu maior pecado, o pecado sobre o qual se acumula o restante de seus pecados, é seu projeto de autossalvação. Como vimos nos capítulos 9 e 10, tanto em nossas más ações quanto nas boas ações, tentamos ser nosso próprio salvador e senhor. Confiamos em objetos e “deuses” alternativos, ainda que não os chamemos assim. Tentamos provar nosso valor através da correção moral ou por meio de realizações, da família ou da vida profissional. Quando entendemos que tudo não passou de um artifício para pôr Deus e o próximo na condição de nossos devedores, podemos precisar nos arrepender até mesmo do envolvimento diligente com à igreja ou com a religião.

Portanto, arrependimento é confessar as coisas das quais você depende, além de Deus, para ter esperança, sentido e segurança. Isso significa que precisamos nos arrepender não só dos erros (como trair e mentir), mas também das motivações de nossas boas ações.

A segunda coisa a fazer é crer em Cristo. A fé em Cristo tem um conteúdo definido. Precisamos crer que ele foi quem disse ser, que necessitamos de salvação, que na cruz ele nos garantiu essa salvação e que ressurgiu dos mortos. No

entanto, ao mesmo tempo em que à fé cristã transformadora inclui crer nessas coisas com o nosso intelecto, ela é muito mais que isso.

A fé que muda a vida e nos conecta com Deus é mais bem traduzida pela palavra “confiança”. Imagine-se em um alto penhasco. De repente, você escorrega e despenca. Bem ao lado há um galho projetando-se da beirinha do

penhasco. Ele é sua única esperança e mais que forte para aguentar seu peso. Como ele poderá salvá-lo? Se sua mente estiver repleta de certeza intelectual de que o galho é capaz de aguentá-lo, mas você não esticar o braço e agarrálo, estará perdido. Se, ao contrário, sua mente estiver repleta de dúvidas e bm

incertezas quanto à capacidade do galho para ampará-lo, mas, mesmo assim, esticar o braço e agarrá-lo, você estará salvo. Por quê? Não é a força da sua fé, mas o objeto dela que realmente o salvará. Uma grande fé em um galho fraco é fatalmente inferior a uma fé tímida em um galho forte.

Isso significa que você não precisa esperar que todas as dúvidas e temores se dissipem para agarrar-se a Cristo. Não cometa o erro de pensar que é preciso eliminar todas as apreensões a fim de encontrar Deus, o que acabaria por transformar sua fé em mais um meio para você ser seu próprio salvador. Concentrar-se na qualidade e na pureza de seu compromisso acabaria se tornando um meio para merecer a salvação e deixar Deus em dívida com você. O que nos salva não é a profundidade nem a pureza de nosso coração, mas a obra de Jesus Cristo realizada em nosso favor.

A fé, portanto, começa quando você reconhece e rejeita os objetos e deuses alternativos em que deposita sua confiança e se volta para o Pai, pedindo um relacionamento com ele baseado no que Jesus fez e não em seus esforços ou conquistas morais. Vários jovens adultos que conheço deram seu passo de fé orando assim:

Pai, sempre acreditei em ti e em Jesus Cristo, mas a minha principal confiança

estava depositada em outro lugar — na minha competência e decência —, o que

só me trouxe problemas. Pelo que conheço de meu coração, hoje o entrego a ti, transfiro-te minha confiança e peço que me recebas e aceites não por algo que eu

tenha feito, mas por causa de tudo o que Cristo fez por mim.

Assim começa um processo que levará uma vida inteira, no qual, por meio de uma mudança constante em todas as áreas da vida, a história do evangelho nos molda cada vez mais.

O compromisso com a comunidade

Quando me perguntam: “Como posso me tornar cristão?”, costumo responder: “São necessárias duas coisas e mais uma terceira”. As duas coisas — arrependimento e fé — acabo de abordar. Existe, porém, outro aspecto crucial. Por que não dizer então que, na verdade, são três coisas? Prefiro dizer “duas e uma Scanned by CamScanner

terceira” porque à ter Ei não é propriamente uma terceira, mas a forma como você fará as duas primeiras.

Tornar-se cristão sempre apresenta tanto um aspecto individual quanto coletivo. Os indivíduos das culturas ocidentais subestimam o grau em que são produto não de suas escolhas pessoais, mas das escolhas de suas Faia comunidades € eira, Assim, o arrependimento e a fé têm de ser serie vidos tanto pelo indivíduo quanto pela comunidade. Isso acontece quando nos aproximamos individualmente de Deus em oração (como nos exemplos anteriores) e também quando publicamente nos identificamos com Cristo, ao nos tornar parte da igreja.

O Evangelho de Lucas nos diz que Jesus foi crucificado entre dois ladrões que também estavam sendo executados. Um deles dirigiu ofensas a Jesus, mas o outro disse ao primeiro: “Nós, na verdade, estamos recebendo com justiça O que nossos atos merecem; mas este homem não fez mal algum. Então disse: Jesus, lembra-te de mim, quando entrares no teu reino. E Jesus lhe respondeu: Em verdade te digo que hoje estarás comigo no paraíso”. Ele depositou em Jesus toda a sua confiança e esperança de que ele traria um reino futuro, um

novo céu e uma nova terra. No momento em que depositou sua confiança em Cristo, Jesus lhe garantiu: “Em verdade te digo que hoje estarás comigo no paraíso” (Lc 23.41-43).

Conto isso porque esse episódio deixa claro que podemos obter a garantia de pertencer a Cristo no momento em que entregamos nosso coração à Deus. Ainda assim, tudo no Novo Testamento indica que 08 cristãos devem confirmar e selar esse compromisso pessoal por meio de uma ação pública, comunitária, pelo batismo e pela filiação à igreja. O coração é indócil, e pass garantir que nossa confiança sincera seja depositada em Jesus e não em ERA Coisas, precisamos nos juntar a um grupo de fiéis.

Tenho consciência de que O principal problema de muita gente co er cristianismo está muito mais relacionado à igreja do que à Jesus. Essas P i S0as não querem ouvir que, para ser cristão € levar uma vida cristã, as e encontrar uma igreja onde possam se desenvolver. Já passaram por do Periências ruins com igrejas Entendo perfeitamente. Admito que, de ida a , cd “e fracos psicológica

geral, os cristãos que frequentam igreja talvez sejam mais ST can lh * moralmente do que os que não frequentam. Isso não deveria cam Scanned by CamScanner

surpresa do que o fato de que os pacientes que Aguada na sala de espera de um consultório médico, de modo geral, estão mais doentes do que os que não estão ali. As igrejas atraem uma proporção maior de pessoas que is necessidades, mas também reúnem um grande número de indivíduos cuja vida foi totalmente redirecionada e preenchida com a alegria de Cristo.

Portanto, a igreja de Jesus Cristo lembra o oceano. É enorme e diversificada. À semelhança do oceano, há pontos cálidos e cristalinos e pontos gélidos, lugares onde se pode entrar facilmente sem correr perigo € lugares onde rapidamente somos tragados e mortos. Estou ciente de como é arriscado dizer a meus leitores que eles devem procurar uma igreja. Não o faço de forma leviana e recomendo que tomem o maior cuidado. Mas não existe alternativa. Não é possível levar uma vida cristã sem um grupo de amigos cristãos, sem uma família de crentes na qual você encontre seu lugar.

Quando alguém pergunta: “Como faço para me tornar cristão?”, é importante dar uma resposta concreta. É perigoso passar a impressão de que encontrar Deus é basicamente uma técnica, algo que compete a nós. Por certo devemos ser muitos ativos na busca de Deus, e o próprio Jesus nos convidou a “pedir, buscar, bater à porta” a fim de encontrá-lo. No entanto, os que estabelecem um relacionamento com Deus inevitavelmente olham para trás e reconhecem que a graça de Deus os buscou, abrindo-os para novas realidades. De alguma forma totalmente inesperada para você, a graça radical de Deus penetra a realidade de sua natureza imperfeita. Você percebe que suas tentativas de ser bom ou feliz ou autêntico contribuíam para o problema. A ficha cai, e você vê as coisas de maneira diferente, mas nunca se sabe como isso acontecerá. Eu poderia demonstrar essa dinâmica por meio de uma centena de biografias espirituais de nomes famosos, como as de Paulo, Agostinho, Martinho Lutero, John Wesley ou por milhares de testemunhos de mudança de vida em minha própria igreja. Mas meu exemplo favorito do trauma da graça é retratado por Flannery O'Connor em seu conto “Revelation” [Revelação].

O conto começa em um consultório médico, onde a senhora Turpin e o marido Claud aguardam com outros pacientes sua consulta. A senhora Turpin

E AGORA, PARA ONDE VAMOS? . 267

passa o tempo avaliando, a partir de uma postura de superioridade, praticamente todo tipo de pessoas — de todas as raças, classes, aparências e temperamentos —, representadas pelos presentes na sala. Ela é muito moralista e santimonial, mas de uma forma bastante convincente. À autora retrata com competência os processos mentais da avaliação que a senhora Turpin faz dos demais de um jeito que nos é incomodamente familiar.

Ela começa a conversar com outra senhora que está lá com a filha, uma menina chamada Mary Grace, que lê um livro. Conforme fala, afloram a enorme autossatisfação e o orgulho da senhora Turpin. Mary Grace, embora não diga nada, torce o nariz e faz caretas enquanto a outra fala sem parar. Finalmente, a senhora Turpin exclama:

Se tem uma coisa que eu sou, é grata. Quando penso em tudo que eu poderia ter sido e tudo que recebi, sinto vontade de gritar: “Obrigada, Jesus, por fazer todas

as coisas desse jeito! Eu podia ser diferente! [...] Obrigada, Jesus, obrigada!”. Nesse exato momento, Mary Grace explode. Atira o livro que está lendo (intitulado Desenvolvimento humano) na senhora Turpin, atingindo-a no olho. Ela desaba sobre uma mesa, e Mary Grace agarra seu pescoço e começa à esganá-la até que é acometida de um surto epiléptico. Enquanto os outros à seguram, a espantada senhora Turpin se inclina sobre ela. “O que você tem a me dizer?”, pergunta com uma voz rouca € prende a respiração, como se aguardasse uma revelação. Em certo nível, está exigindo desculpas, mas em outro nível começa a se dar conta de que a moça é uma mensageira da graça de Deus. Mary Grace ergue os olhos e diz: “Volte para o inferno de onde veio,

A revelação atinge seu alvo, mas à senhora Turpin agora é obrigada a mudar sua maneira de ver o mundo em consonância com à revelação. Mais tarde no mesmo dia, sozinha em seu chiqueiro, ela pensa, queixando-se com Deus: “Por que o senhor me mandou uma mensagem como esta? Como posso ser uma porca e eu mesma ao mesmo tempo? Como posso ser salva e pertencer ao inferno também?”. Séculos antes, Martinho Lutero havia aprendido, de forma não menos traumática, que Deus salva pela graça, não pelas boas obras.

| Ele percebeu que um cristão é simul iustus et peccator, simultaneamente justo € I

aceito (em Cristo, exclusivamente por sua graça) e, mesmo assim, peccator, um pecador. Salva e uma porca do inferno, ao mesmo tempo.

No entanto, a senhora Turpin, à semelhança de Martinho Lutero, resiste de início à revelação da graça de Deus. “Por que eu?”, choraminga ela. “Não há um infeliz por aqui, branco ou negro, a quem eu não tenha ajudado. Trabalho feito uma condenada todos os dias. E ajudo a igreja. Se você prefere o lixo, vá arrumar algum lixo. [...] Como exatamente me pareço com eles? Eu podia largar o trabalho, levar a vida na flauta e ser imunda”, ela resmunga. “Ficar caída na sarjeta o dia todo bebendo cerveja. Cuspir e escarrar na calçada e deixar o nariz escorrendo. Eu podia ser desagradável.” Um último surto de fúria a sacode e ela grita para Deus: “Quem você pensa que é?”.

Nesse momento, o sol se põe e ela vê uma lista roxa no céu.

A luz de uma visão invade seus olhos. Ela vê [...] uma enorme ponte pênsil que se

ergue da terra através de um campo de fogo ardente. Sobre a ponte uma multidão

de almas segue ruidosamente em direção ao céu. Ali estavam grupos inteiros de

[...] lixo [...] e legiões de anormais e malucos gritando, batendo palmas e pulando

como sapos. [Porém no] final ela avista um grupo de pessoas que reconhece imediatamente como aquelas que, como ela própria e Claud, sempre tiveram um pouco de tudo e o talento dado por Deus para fazer bom uso de tudo o que tinham. [...]

Marcham atrás dos outros com grande dignidade, responsáveis como sempre pela

ordem e pelo comportamento respeitável e ajuizado. Só eles cantavam afinados.

Mas dava para ver, pelos rostos chocados e expressões alteradas, que até suas virtudes estavam queimando. [...] Passado um momento, a visão se dissolve. [...] No

mato à sua volta o coro dos grilos havia recomeçado, mas o que ela ouve por todo lado são as vozes das almas subindo ao céu estrelado e gritando aleluia.

Que ideia mais radical! Os “anormais e malucos” indo para o céu à frente do grupo moralmente correto? Mas foi exatamente isso que Jesus disse quando anunciou aos chocados líderes religiosos de sua época: “Em verdade vos digo que os publicanos e as prostitutas estão entrando antes de vós no reino de Deus” (Mt 21.31).

“Extraído de “Revelation”, in: Three by Flannery O'Connor (Penguin, 1983).

E AGORA, PARA ONDE VAMOS: 369

E se você chegar ão fim deste Hyrm e, como consequência da leitura, desejar ver fé mas não conseguir? O escritor Joseph Epstein admitiu certa vez que invejava aqueles que possuíam o tipo de fé profunda e inteligente capaz de ustentá-los nas piores crises. Ele admirava em particular a maneira como a fé cristã de Flannery O'Connor a havia capacitado a enfrentar uma morte prematura graças ao lúpus, sem queixas nem medo. No entanto, concluiu ele: “Inveja da fé é uma inveja com à qual, infelizmente, nada se pode fazer senão guardá-la em silêncio”.” Admiro o respeito de Epstein pelo mistério da fé. Ela não é algo que se possa criar por meio de alguma técnica. No entanto, será que não há mesmo nada a fazer?

Durante um período difícil em sua vida, uma senhora de minha igreja queixou-se de haver orado várias vezes pedindo: “Senhor, ajuda-me a encontrar-te”, sem chegar a lugar algum. Um amigo cristão sugeriu que ela mudasse a oração para “Deus, vem me encontrar. Afinal, tu és o Bom Pastor, aquele que sai à procura da ovelha perdida”. Ao me contar essa história, ela concluiu: “O único motivo que me levou a lhe contar esta história foi este: Ele veio me encontrar”.

adm “The green eyed monster: envy is nothing to be jealous of”, Washingto ii ugust, 2003.

Esta obra traz um relato da vida de Cristo

relato, descobrimos o significado cósmico,

| A histórico e pessoal da vida de Jesus,

CRI ] 7 e somos desafiados a reexaminar

DO nosso relacionamento com Deus.

Este livro se baseia na muito aplaudida “im. E Las

série de sermões pregados por Tv mo pau Edf

todos — cristãos, céticos, solteiros, ia

casais casados há muito tempo N A à ais

e aos que estão prestes a noivar 4 CM |

— a visão do que o casamento e Ai

deve ser segundo a Bíblia. |. A der

Po PRN tic ” ia o E Aiii sinal á z cê A fais: id dsiá EIS . s ã nal j o si PSV] Scanned by CamScanner

Nesta obra, o autor analisa a fundamental

TI MOTHY relação entre evangelho e justiça e nos dá

ER uma visão bíblica de justiça social. Ele nos

KELL mostra que a preocupação com a justiça em

postas ret todos os aspectos da vida não é acréscimo

TA artificial nem contradição à mensagem das

PIO Escrituras, pois a Bíblia é a verdadeira

: A graça de Deus e a justiça social |

Como Deus nos chama a expressar sentido

e propósito por meio de nosso trabalho

e carreira profissional. TIMOTHY

por mais de vinte anos estudantes, jovens :

| profissionais e líderes experientes sobre o

j a e enmands cristão. Agora FÉ: T RABALHO

| ele disponibiliza suas ideias para leitores

| do mundo inteiro neste livro, que oferece Nossu profissão q serviço perspectivas bíblicas sobre do reino de Deus

| eqoiçop siri comento percepções desafiadoras e levanta questões é z l provocativas. Por meio da aplicação de

va EI Ps doutrinas clássicas ao nosso tempo e

Did CENTRADA ss contexto, Keller descreve de forma concisa De SN S 4 e direta uma visão teológica para o

A E Es a ministério, organizada em torno de

TABS res é três compromissos fundamentais:

8 Centralidade do Evangelho.

TIMOTHY/KELLER Centralidade da Cidade.

Centralidade do Movimento.

Neste livro breve e contundente, o autor Fo E ESSO Rs

mostra que a humildade que brota do a Ra Es E Ex

evangelho torna possível pararmos de Se E as = E

vincular cada experiência e cada conversa ss se : e “E =. com a nossa história e com quem somos. E. O E

E assim podemos ficar libertos da EE Ea

autocondenação. Quem é realmente humilde TRANSFORMADO

segundo o evangelho não se odeia, mas tum qua ad exangao também não se ama... é, antes, alguém que Renee

esquece de si mesmo. Você também pode rIMOTv KELIER

conquistar essa liberdade...$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Se Deus existe eternamente como Trindade, três pessoas que se glorificam e se entregam mutuamente numa "dança" de amor, o que significa para você descobrir que o amor é a própria essência da realidade, e não um acaso tardio?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Fomos feitos para girar nessa dança, centrados em Deus e nos outros, mas o pecado nos faz exigir que tudo orbite ao nosso redor: onde você reconhece esse egocentrismo travando a sua vida?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se a felicidade suprema da Trindade está em deleitar-se no outro, e não em si mesma, como seria reorientar a sua vida do "que os outros podem fazer por mim" para "como posso me entregar em amor"?$p$, 'reflexao', null);
  end if;

end $migration$;
