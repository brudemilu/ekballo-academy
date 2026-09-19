-- 315_perspectivas_licao9.sql
-- As cinco leituras que faltavam na Lição 9, na ordem em que o guia as chama,
-- mais duas que a Lição 11 também pede e um capítulo que nenhum guia pede.
--
-- PROCEDÊNCIA: PDF de 50 páginas fotografadas. QUATRO vieram de cabeça para
-- baixo (4, 6, 45 e 48) e foram giradas antes da leitura. As páginas 46 e 47
-- são a MESMA página fotografada duas vezes (98% de sobreposição de
-- vocabulário) — a 47 ficou de fora.
--
-- O CAPÍTULO 98 NÃO É QUADRO. Eu vinha anotando o Travis como caixa lateral
-- dentro do capítulo de outro autor, como o Lewis no Bosch. Não é: é capítulo
-- próprio, p. 693-697, com abertura, bio e bibliografia. O capítulo do Parshall
-- fecha na p. 38 do lote, com as perguntas de discussão dele, e o do Travis abre
-- na 39. Como a Lição 11 pede os dois, eles entram lá também — e a ordem de
-- chamada da Lição 11 põe o Parshall ANTES do McGavran e o Travis DEPOIS.
--
-- AS SETE ABERTURAS vieram destruídas pelo OCR, como sempre neste acervo (a
-- caixa de bio é sans-serif pequeno). Todas reconstruídas olhando a imagem.
-- Conferindo os títulos na página de abertura, e não no cabeçalho corrido,
-- apareceram duas coisas: o capítulo do Parshall chama-se "Indo longe demais?",
-- com interrogação, e o capítulo da Analzira é o de número 64 — eu o tratava
-- como avulso sem número.

begin;

do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  -- abre cinco posições para as leituras da Lição 9, logo após o Willowbank
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 77;
  update aulas set ordem = ordem - 10000 + 5 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 9 · Leitura — Hiebert, cap. 61: Estrutura social e crescimento da Igreja', 'Paul G. Hiebert

PAUL G. HIEBERT foi chefe do Departamento de Missões e Evangelismo e professor de missões e antropologia da Trinity Evangelical Divinity School. Antes disso, lecionou antropologia e estudos sobre o sul da Ásia na School of World Mission, do Fuller Theological Seminary. Hiebert foi missionário na Índia e é autor de dez livros em parceria com sua esposa, Frances. Desses livros, podemos destacar: Cultural Anthropology [Antropologia cultural], Anthropological Insights for Missionaries [Considerações antropológicas para missionários] e Case Studies in Mission [Estudos de caso em missões].

Ali s pessoas são seres sociais que nascem, crescem, se casam são sepultados junto de seus companheiros hurmanos. Formam grupos, instituições e sociedades. À estrutura social é o meio pelo qual elas organizam seus relacionamentos entre si e constroem as sociedades,

Às sociedades podem ser estudadas em dois níveis: o do relacionamento interpessoal e o da sociedade como um todo. Um estudo de missões em cada um desses níveis pode nos ajudar imensamente a entender como as igrejas crescem. RELACIONAMENTOS INTERPESSOAIS: A PONTE BICULTURAL a o pá! a

Quando um missionário se estabelece no estrangeiro, o que ele faz? Seja qual for sua tarefa, ele se envolve em relacionamentos interpessoais com uma grande quantidade de pessoas. Muitas delas não são cristãs, mas provavelmente ele passará boa parte de seu tempo na companhia de cristãos convertidos. Ele irá ao mercado e pregará numa praça, porém seus relacionamentos mais íntimos serão com os pastores, evangelistas, professores e outros cristãos nativos. Quais as características desses vários relacionamentos:

nunes PAUL 6. HIEBERT foi chefe do

Ra O e antropologia da Trinity Evangelica Divinity School. Antes disso, lecionou antropologia e estudos sobre o usa Ásia na School of World dart rd os ca lrdia é é áutor de dês liros em parceria com sua esposa, Frances. Desses livros, podemos destacar: Cultura! Anthropology [Antropologia o aa o antropológicas para missionários] e Case Studies in Mission [Estudos de caso em missões],

Está claro que, na maioria dos casos, a comunicação transcultural se processa através de várias etapas. O missionário recebeu a mensagem em sua família, em sua igreja e em sua escola. Ele a transmite ãos líderes cristãos nativos que, por sua vez, à com nicam aos cristãos e não cristãos nas cidades e nas vilas. Com poucas exceções, a obra missionária dentro de um país será, principalmente, feita por esses nativos desconhecidos.

Para entender como se faz uma análise estrutural, vamos examinar aqui um dos elos dessa cadeia de comunicações 0 rela cionamento entre o missionário e o nativo, etapa crítica, também chamada “ponte bicultural”, na qual OCOITC grande parte da tradução da mensagem para à nova cultura.

À ponte bicultural é o conjunto de relacionamentos entre pessoas de duas culturas, porém é mais que isso. Ela mesma eua nova cultura. O missionário raramente pode “se tornar nativo. Ek monta uma casa, cria instituições e adota costumes que, em parte, refletem sua cultura original e, em parte, constituem adaptações cultura em que se encontra. Seus colegas nau fazem o mesmo, verdade que cles não punedonaram vos sua cultura, mas à interação com missionário os deixou expostos à inúmeras fuências estrangeiras, que tém o potencial missionário e os nativos “O que é que você faz?” Essa pergunta é ci feita repetidas vezes à pessoa que se estabelece no estrangeiro, Às pessoas fazem essa pergunta porque desejam saber como se relacionar com e aliená-los da cultura nativa.

Uma grande quantidade de energia no ;mbiente bicultural é gasta na definição de mo exatamente a nova cultura deverá funcionar.

missionário deve ter um carro numa sociedade am que a maioria das pessoas anda a pé? Nesse caso, seus colegas nativos também devem poseuir automóvel? Onde matricular os filhos dos missionários: numa escola local, numa escola para filhos de missionários ou numa escola no país de origem do missionário? Que comida o o recém-chegado.

Os missionários em geral respondem: “Somos missionários”. Nessa declaração, eles estão mencionando um status com as funções que lhe são próprias, todas perfeitamente claras para eles, Eles sabem o que significa “missionários” e como os missionários devem agir. Mas o que acontece com os nativos, particularmente os que nunca viram um missionário antes? O que eles pensam desses estrangeiros?

Aqui, temos de retroceder mais uma vez missionário deve comer? Que roupas deve vesir? Que tipo de casa ele e os obreiros nacionais devem ter? Essas e muitas outras perguntas surcem no ambiente bicultural. Status e função (ou papel) O termo status tem diversos significados comuns, mas os antropólogos usam-no num sendo específico, definindo-o como as “posições ocupadas por indivíduos num sistema social”. No nível dos relacionamentos interpessoais, a às diferenças culturais, Assim como as línguas diferem entre si, também as funções desempenhadas numa cultura diferem daquelas desempenhadas em outra. “Missionário” é uma palavra de origem latina que representa um status uma função no Ocidente. Na maioria das outras culturas, essa função não existe, Quando um missionário aparece nessas culturas, o povo precisa observá-lo e tentar deduzir, pelo comportamento dele, em qual função ele se encaixa. Quando entendem o tipo de pessoa que ele é, esperam organização social é constituída de enorme vanedade de tais posições: professores, sacerdotes, médicos, pais, mães, amigos, e assim por diante.

Cada status é associado com certas expecativas de comportamento. Por exemplo, esperamos que um professor aja de determinada maneira para com seus alunos. Ele deve ficarà frente da classe e dirigi-la. Ele não deve dormir na classe nem dar aula vestido de pijama. O professor deve também ter determinado comportamento diante de seus administradores, dos que se comporte de acordo. Nós, na verdade, fazemos a mesma coisa quando um estrangeiro chega e se apresenta como sannya-sin. Pelo seu aspecto, poderíamos pensar que ele é um hippie, quando na verdade é um santo hindu.

Como as pessoas têm encarado os missionários? Na India, os missionários eram chamados dora, a mesma palavra usada para designar fazendeiros ricos e reis de pequena influência. Esses governantes subalternos compravam grandes terrenos, erguiam muros, construíam pais dos alunos e em público.

Todos os relacionamentos interpessoais podem ser decompostos ao nível de pares de funções (ou papéis) complementares: professor-aluno, pastor-paroquiano, marido-esposa é outros. À natureza do relacionamento entre dois indivíduos depende, em grande parte, do status que escolhem.

bangalôs e tinham servos. Eles também construíam bangalôs separados para a segunda e a terceira esposa, Quando os missionários chegaram, eles também compraram grandes terrenos, levantaram muros, construíram bangalôs e tinham servos. Construíram também bangalôs separados, só que para as missionárias instaladas nomesmoconjunto,

As esposas dos missionários eram chamadas dorasani. O termo não é usado para a esposa de um dora, a qual era mantida em isolamento, longe dos olhos do público, mas para sua amante, que ele costumava levar consigo na carruagem ou no carro,

O problema aqui é de mal-entendido transcultural, O missionário considerava-se um “missionário”, não imaginando que um papel desse inexistisse na sociedade indiana tradicional. À fim de se relacionar com o missionário,o povo teve de lhe atribuir um papel dentro de seu próprio conjunto de papéis, e foi o que aconteceu. Infelizmente, os missionários não perceberam como o povo os via.

Uma segunda função (ou papel) com a qual o povo, no passado, em geral identificava os missionários foi a de “administrador colonial”, O missionário era branco, como os governadores coloniais, e às vezes tirava vantagens dessa condição para conseguir os privilégios concedidos às autoridades do governo. Ele podia comprar passagens de trem sem ter de ficar na fila com o povo local e conseguia influenciar os funcionários menos graduados. Na verdade, eleusava quase sempre esses privilégios para ajudar os pobres e oprimidos, mas ao fazer uso delesacabou identificado com os administradores coloniais.

O problema é que nenhum dos papéis, de ricos proprietários de terras ou de administradores coloniais, permitia a comunicação ou a amizade pessoais e íntimas que teriam sido muito mais eficientes na transmissão do evangelho. Suas funções (ou papéis) geralmente mantiveram os missionários distantes do povo.

Mas que funções (ou papéis) os missionários povo irá julgá-lo de acordo com as suas Expe, tativas quanto ao desempenho desse pares O missionário e os cristãos nativos O relacionamento entre O missionário cristãos nativos é diferente do relacionam, e, to entre ele e os não cristãos. Os Primeiro, afinal, são seus “filhos espirituais”, e ele é Um “pai espiritual”.

Esse relacionamento pai-filho é Vertical impositivo. O missionário está automatica. mente em posição de responsabilidade, Ele o exemplo que as pessoas devem imitar é a font. de conhecimento para elas. Todavia, as pessoa, logo ficam cansadas de ser tratadas como crian ças, particularmente quando são mais velhas e sob muitos aspectos, mais sábias que seu “pai” Se não tiverem permissão de ser responsáveis porsi mesmas, jamais irão amadurecer, ou então se rebelarão e deixarão o lar.

O missionário também fica preso ao papel de pai, Não só é difícil estabelecer relacionamentos íntimos com o povo de igual para igual, mas também ele sente que não pode errar, Ele teme que, se admitir pecados e fraquezas pessoais diante do povo, eles perderão a fé em Cristo, porém ele também é o modelo para os papéis de liderança, e logo eles passarão a crer que nenhum líder deve admitir os próprios pecados ou fracassos. Obviamente, o missionário eoslíderes nacionais pecam e, por causa de seu papel, têm meios de confessar o pecado e experimentar o perdão da comunidade cristã sem destruir seu ministério.

Outro papel no qual os missionários podem incorrer, em geral de modo inconsciente, deveriam ter tido? Não há uma resposta simples para isto, pois os papéis devem ser escolhidos em cada caso a partir dos papéis existentes na é de “construtores de império”. Todos nós precisamos sentir que participamos de uma tarefa importante. Daí a nos vermos como o centro cultura para a qual ele vai. No começo ele pode tr como um “estudante”, pedindo que o povo lhe ensine os seus costumes. Conforme for aprendendo os papéis daquela sociedade, ele pode escolher aquele que lhe permita comunicar o evangelho de maneira eficiente. Mas, quando ele escolhe um papel, ele deve se lembrar queo da tarefa e nos considerarmos indispensáveis é apenas um pequeno passo. Ganhamos discípulos pessoais e construímos grandes igrejas, escolas, hospitais e outras instituições que provem nosso valor.

Contudo, esse papel, como o primeiro, não é o mais adequado para a comunicação eficaz.

sas Hebert perspectiva estrutural, é um papelverticalem pa comunicação procede de cima para baixo, A pouquíssimo retorno de baixo para cima, O embaixo segue as ordens que vêm decima, E: o geralmente não internalizam a mensagem, actando-a própria deles, Da perspectiva cristã, ese papel não se encaixa no exemplo de Cristo. pelo contrário, pode representar uma forma de xploração do povo em benefício próprio.

Que papéis o missionário pode assumir? Aqui, pelo fato de o missionário e os nativos .erem cristãos, podemos buscar um modelo píblico o de relacionamento fraterno e de «ervos uns dos outros. Como membros de um á corpo, devemos destacar nossa igualdadeem relação aos nossos irmãos nativos. Não pode haver separação entre “nós” e “eles”, Devemos confiar nos nacionais exatamente como confiamos em nossos colegas missionários e aceitá-los como colegas e administradores acima de nós. As designações para a liderança dentro da igreja não se baseiam em cultura, raça ou mesmo em poder econômico. São feitas de acordo com os dons e capacidades dados por Deus.

Para que a igreja funcione, tem de haver liderança, exatamente como em qualquer outra instituição humana. Contudo, o conceito bíblico de liderança é o de servo. O líder é aquele que procura o bem-estar dos outros, e não oseu “(Mt 20.27). Ele é dispensável e, nesse sentido, o missionário é o mais dispensável de todos, pois sua tarefa é plantar a igreja e se mudar para outro lugar quando sua presença começar aimpedir o crescimento da nova igreja. Identificação Bons relacionamentos envolvem mais que a escolha de papéis adequados. Dentro de um papel, o indivíduo expressa diferentes atitudes, que demonstram seus profundos sentimentos para com outra pessoa.

Se sentirmos que de alguma forma somos diferentes das pessoas com as quais trabalhamos, isso será transmitido a elas de maneiras sutise variadas. Podemos viver separados delas, permitindo que entrem apenas naquele espaço público a is nais

447 Ca e que são nossas salas de estar e não permitindo que nossos filhos brinquem com os filhos delas. Ou, então, talvez vetando a participação de nativos nas comissões missionárias,

Quando nos identificamos com as pessoas, fazemo-lo de maneira formal; numa festa anual oferecida ao quadro de funcionários da escola ou do hospital, em seus lares, mas apenas com um convite formal, e nos comitês, permitindo que alguns poucos participem. Podemos até usar as roupas nativas em determinadas ocasiões, mas a identificação formal é pouco significativa. Destaca as diferenças básicas existentes entre as pessoas, mesmo quando demonstra sua unidade superficial.

O verdadeiro teste da identificação não é o E uc fazemos nas situações formais, estruturadas.

como gastamos nosso tempo informal c nossos pertences mais valiosos. Quando a reunião da comissão termina, o que fazemos; vamos para um canto conversar com os colegas missionários sobre assuntos como máquinas fotográficas, excluindo os colegas nacionais pelo tempo que dedicamos a esse tipo de assunto? Será que não fazemos cara feia quando vemos nossos filhos brincando com as crianças locais?

Mas será que é possível o missionário “se tornar nativo”? Obviamente não. São necessárias três a quatro gerações de imigrantes da Europa Setentrional para que se integrem totalmente à cultura americana, e onde as diferenças culturais são maiores leva ainda mais tempo.

À questão básica da identificação não é a equivalência formal viver em casas iguais, comer a mesma comida e usar as mesmas roupas. Podemos fazê-lo e ainda assim transmitir às pessoas a distinção mental que fazemos entre elas e nós. À questão é de mapas mentais e sentimentos básicos. Se realmente nos vemos e sentimos como um deles, essa mensagem irá transpirar, ainda que tenhamos diferentes estilos de vida. Um nativo nos oferece o que tem de melhor para comer e permite que durmamos em seu quarto de hóspedes e que usemos o seu carro de bois, enquanto nós compartilhamos com ele nossa melhor comida, nosso quarto

E a DIE pri

EO Ted e de hóspedes e nosso carro. O princípio não é de igualdade formal, mas de verdadeiro amor e reciprocidade mútua.

Um sentimento de unidade para com as pessoas cria em nós um interesse por aprender mais a respeito delas e partilhar de sua cultura. Nosso exemplo é Cristo que, por amor, veio a encarar entre nós, a fim de nos trazer as boas novas de Deus. A ORGANIZAÇÃO DAS SOCIEDADES E O CRESCIMENTO DA IGREJA Outra forma de vermos as estruturas sociais é examinar como as sociedades são formadas como um todo, Que grupos instituições sociais existem dentro de determinada sociedade? Como se articulam uns com os outros, como ocorrem as mudanças? Aqui, mais uma vez, duas ou três ilustrações podem demonstrar melhor a aplicação e a utilidade do conceito. Sociedades tribais Em muitas tribos, os grupos sociais desempenham um importante papel na vida do indivíduo, bem mais que em nossa sociedade individualista e liberal. Numa tribo, a pessoa nasce e é criada no contexto de um grande grupo de parentes ou de uma linhagem formada por todos os descendentes do sexo masculino de um ancestral remoto e todas as famílias desses homens. Para se ter uma ideia desse tipo desociedade, imagine, por um momento, que você morasse com todos os seus parentes que usam seu sobrenome, vivendo todos juntos numa fazenda que pertencesse a todos, e cada um tendo responsabilidades para com o outro. Todos os homens da geração anterior à sua seriam seus uma ancestral remota, com cada uma d, famílias, mas aqui também a autoridas, responsabilidade diante do grupo perenar como fundamentais na vída da pesos,

Os fortes laços consanguíneos rium proporcionam grande segurança 29 india” ú Eles cuidam de você em caso de doença e, de comida, sustentam você quando vai ess. A em outro lugar, ajudam na compra de un a, po ou na obtenção de uma noiva e lutas, você caso seja atacado. Em troca, o Erupo faz muitas exigências. Suas terras seu termo, não são estritamente seus. Espera-se que Vis os compartilhe com os que necessitam,

Sociedades Tribals

ANCIÃO,

e Ênfase no parentesco como base para os orte orientação grupal, com responsabilidade mútua e processos de tomada de decisão i Hierarquia social mínima

Comunicação vertical

Nessas tribos, as decisões importantes sã, geralmente tomadas pelos anciãos os home, mais idosos, com grande experiência de vida. Is, se aplica particularmente a uma das decisões ma; importantes da vida, a saber, o casamento. Di. rentemente de nossa sociedade, na qual os joves; estão todos dispostos a se casar quando se apa xonam”, sem analisar com cuidado as condiçõe sociais, econômicas, mentais e espirituais da outn pessoa, na maioria das tribos os casamentos sã “pais”, responsáveis por discipliná-lo se você transgredisse alguma regra ou costume da tribo. Todas as mulheres dessa geração seriam as “mães” que cuidam de você. Todos os membros de sua linhagem com sua idade seriam seus“irmãos” e “irmãs”, e todas as crianças detodosos seus “irmãos” seriam seus “filhos” e “filhas”.

Em algumas tribos, a linhagem é formada por todos os descendentes do sexo feminino de arranjados pelos pais. Em razão de sua grand: experiência, eles conhecem os perigos e as arma dilhas do casamento e são menos influenciado pelos relacionamentos emocionais e efêmero Os pais acertam o casamento só depois de long: e minuciosa análise de todos os candidatos er perspectiva. O amor cresce nesses casamentos como em qualquer outro: cada parceiro aprené a conviver com o outro a amá-lo.

As decisões tribais e da linhagem são também cadas pelos anciãos. Os chefes das famílias

As sociedades campesinas A organização social das sociedades campesinas

«ya palavra, mas devem acatar as decisões A uderes se quiserem permanecer na tribo.

Esse tipo de organização social apresenevangelismo cristão algumas situações opiexas. Examinemos, porexemplo,aexpe-Z0cia de Lin Barney. Lin estava em Borméu «gado foi convidado a levar o evangelho a uma tribal numa região montanhosa. Depois y uma caminhada dificil, ele chegou âaldeiae convidado a falar aos homens reunidos na grande. Apresentou a mensagem do canho de Jesus, alongando-se a exposição até de da noite, e então os anciãos anunciaram «se tomariam uma decisão sobre o novo cami“so. Os membros da linhagem reuniram-seem gquenos grupos para discutir o assunto, eos sderes reuniram-se para tomar a decisão final. fodos decidiram que se tornariam cristãos. A graisão foi tomada no consenso geral.

O que o missionário deveria fazer agora:derover O assunto para eles com a orientação de qse tOMASSEM suas decisões individualmente? Devemos nos lembrar que nessas sociedades gnguém pensaria em tomar uma decisão tão mportante como um casamento sem o aval jos anciãos. Seria uma atitude realista esperar que os membros daquela sociedade tomassem sznhos uma decisão tão importante?

O missionário deve presumir que todos foam regenerados? Alguns talvez não desejem se tornar cristãos e continuem adorando os deuses de seus ancestrais.

Decisões em grupo não significam que todos os membros do grupo se converteram, mas sgnifica que o grupo está aberto a instruções bíblicas mais detalhadas. À tarefa do missionáão não terminou. Na verdade, apenas começou, porque agora ele deve apresentar-lhes todo o ensino das Escrituras.

Decisões coletivas não são incomuns. Na verdade, grande parte do crescimento da Igreja Lo passado aconteceu dessa maneira, quem sabe primeiros antepassados cristãos de muitos eitores deste livro, é totalmente diferente das sociedades tribais. Aqui, encontramos quase sempre o enfraquecimento dos laços de parentesco mais distantes o surgimento de classes e castas sociais. O poder geralmente se concentra nas mãos de uma elite que vive distante dos cidadãos comuns.

Podemos retornar à Índia para uma ilustração de como a estrutura social dos camponeses influencia o crescimento da Igreja. As vilas são divididas em inúmeras jatis ou castas. Muitas delas, como as dos sacerdotes, carpinteiros, ferreiros, tintureiros, oleiros e tecelões estão associadas à certos monopólios de trabalho. A pessoa não só herda o direito de ter a profissão da casta, mas também deve se casar com alguém da mesma casta. Uma analogia bem simples pode ser feita com a realidade de alguns países ocidentais, onde há professores de colégio que casam seus filhos com outros professores de colégio, de pastores que casam seus filhos com os filhos de outros pregadores e muitas outras ocupações que fazem o mesmo. É visível, portanto, a necessidade de iniciar as negociações matrimoniais bem cedo.

Às castas também são divididas em limpas e intocáveis. Estas são ritualmente imundas, e tocar nelas, no passado, contaminava os membros das castas limpas, que tinham de tomar um banho de purificação a fim de restaurar sua pureza. Por essa razão, os intocáveis antigamente eram obrigados a viver em aldeias separadas das vilas principais e proibidos de entrar nos templos hindus.

Quando o evangelho chegou à Índia, a tendência foi penetrar num grupo de castas ou em outro, mas não em ambos. Alguns dos primeiros convertidos pertenciam a castas puras, mas quando os intocáveis começaram a aceitar a Cristo, os integrantes das castas puras objetaram. Eles não queriam associar-se com o pessoal do lado errado” da cidade. Os missionários continuaram a aceitar todos os que se convertiam e exigiam que todos se reunissem na mesma igreja. Por causa disso, muitos membros das castas puras voltaram para o hinduísmo.

O problema aqui não é teológico. Muitos dos convertidos das castas mais elevadas creram sinceramente no evangelho, e ainda hoje muitos são cristãos secretos. É um problema social. À casta elevada não queria associar-se comosintocáveis. Antes de os julgarmos, devemos parar c examinar as igrejas e denominações nos países ocidentais. Em quantas delas encontramos uma mistura ampla de membros de vários grupos

Na Índia, muitos defendem a ideia de que a salvação não se prende à filiação a uma Unic; igreja, por isso fundaram igrejas para as casta, purasc igrejas para as intocáveis. Com tsso, obti. veram êxito em ganhar os membros das castas puras para Cristo, mas também enfrentam mu tas críticas por parte dos que argumentam que essa prática é contrária à vontade de Deus.

étnicos c diferentes classes sociais? Em quantas delas as diferenças de nível econômico, social, educacional e político se tornaram insignificantes na comunhão c no Serviço cristão? posecanes sapo iai idos

Ancea donilnante

O cenário urbano O crescimento das cidades em tempos recentes tem sido fenomenal. Em 1800, não havia uma cidade do mundo com mais de um milhão de habitantes, é menos de 25 tinham população superior a 100 mil pessoas. Em 1950, 46 cidades tinham ay mais de um milhão de habitantes,

À área metropolitana de Nova

York contava mais de 15 milhões à ea de pessoas em 1970! Grupos ou classes Essa rápida urbanização do Una qi subordinadas mundo suscita muitas perguntas entre os que se interessam pelo cresgrupo

Hierarcas intergrupais e Comunicação horizontal dentro dos grupos e vertical

O dilema é que, teologicamente, a Igreja deveria ser uma, porém as pessoas, socialmente, são bem diferentes. Além disso, elas têm dificuldades para associar-se e casar-se com pessoas criadas em outros contextos. Seria razoável a expectativa de que as pessoas mudem hábitos sociais profundamente arraigados no momento de sua conversão, ou que todos se reúnam sem problemas na mesma igreja? Ou será que mudar os costumes sociais faz parte do crescimento cristão? Devemos permitir a formação de diferentes igrejas na esperança de que, com social de uma cidade e como essa estrutura influencia a comunicação entre eles e a tomada de decisões? Como as mudanças ocorrem na sociedade urbana, caracterizada por rápidas transformações e grande diversidade?

Os processos sociais que afetam o crescimento da Igreja nas sociedades tribais e campesinas são menos evidentes nas sociedades urbanas. Grandes fluxos humanos em que as pessoas vêm a Cristo com base nas decisões de grupos ou em que a mensagem é compartilhada por meio de castas ou laços de parentesco parecem quase ausentes. Todavia, há novas forças em operação. O povo da cidade em geral é involuntariamente ensinamentos mais aprofundados, eles venham a se tornar um só corpo? À questão é semelhante a outras verificadas nas igrejas de vários países ocidentais: é essencial à salvação abandonar o fumo ou o álcool ou qualquer outro tipo de comportamento definido como pecaminoso,ou Isso faz parte do crescimento cristão?

envolvido nas rápidas transformações. Suas ideias são moldadas pelos meios de comunicação de massa, pelas instituições educacionais e pelas entidades de associação voluntária. A comunicação costuma acompanhar teias ou redes de pessoas mutuamente relacionadas: um amigo contaa um amigo, que, por sua vez, conta a outro amigo.

cociedades Urbanas Individualistas

O ara À ao O! O k voluntárias Associações O cruzadas evangelisticas, tudo for tentado, com êxito variado. Não individuos enste wma fórmula simples para o icação sucesso de igrejas nunca uma houve, tarefa À edi- di é ias ou ficil de longo alcance. restes sociais As cidades também oferecem

Êntase no individualismo e na decisão pessoal Ovganização com base em associações voluntárias, teias er re vet medi Uso dos meios de comunicação, além da comunicação tetas (redes) de relacionamento Que método as missões devem utilizar na cidade? Até agora, não surgiu uma estratégia bem definida. Meios de comunicação, amizades, vizinhos, evangelismo nos apartamentos, grandes instituições educacionais e médicas e

Perguntas 1. Explique o desenvolvimento e o propósito da

Açã ou redes de OS centros bros da cormumue ação mu Ê dial e a fonte de onde as ideias através das se espalham para o intertor. Um motivo para a rápeda expansão do cristianismo primitivo for seu fluxo através das cidades. Precisamos descsperadamente examinar mais de perto à dinâmica urbana moema 4 fim de entender como acontecem as mudanças e então aplicar essas descobertas ao planejamento moderno de eissóes. para estudo “ponte bicultural”,

2. Hiebert descreve alguns papéis assumidos pelos missionários que foram inadequados na co»

muunicação do evangelho. Que tipos de papéis são adequados?', 77 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 9 · Leitura — Larson, cap. 63: Um missionário viável: aprendiz, comerciante e contador de histórias', 'Donald N. Larson

DONALD N. LARSON foi consultor sênior para vivência e aprendizado transcultural no Link Care Center. Foi também professor de antropologia e linguística na Bethel College, em St. Paul, Minnesota. Antes disso, foi diretor durante 25 anos do Toronto Institute of Linguistic.

Ora meu interesse pela missão da Igreja foi despertado peta fimeira vez, cu era velho demais para que mc aceitassers como candidato à missionário em minha denominação, Contudo, durante os últimos vinte anos, tenho trabalhado nos bastidores. ajudando pessoas a resolver os problemas de aprendizado da Jíngrza e da cultura no campo missionário, De fora do palco, tenho ana: sado os missionários, as agências que os enviam, as comunidades missionárias locais e os cristãos e não cristãos nativos em diversos campos. Dessas observações, tirei a conclusão de que geralmente há uma grande brecha no conceito que o missionário tem sobre seu papel e como é visto pelos não cristãos de sua comunidade de adoção. O propósito deste artigo é examinar essa brecha e propos meios e métodos de preenchê-la.

Conheci, certa vez, um jovem que se candidatava a um trabalho missionário de curta duração no Sudeste Asiático e perguntei- lhe o que ele iria fazer. Ele respondeu, com toda a seriedade:

Vou ensinar os nativos a cultivar a terra.

Será que eles já não sabem plantar? insisti.

ge es Eis) a A DE DO) «umuua serenas DONALD N, LARSON foi consultor sênior para vivência e aprendizado transcultural no Link Care Center. Foi também pr

Ele pensou um pouco e então respondeu:

Bem, realmente não sei. Ainda não tenho uma ideia muits clara sobre o assunto.

Imagine o que os não cristãos de sua comunidade de adoção pensariam dele se ouvissem essa conversa! Quer aquele jovem soubesse, que não, aqueles asiáticos já eram lavradores muito tempo antes de os primeiros grupos de imigrantes cristãos chegarem parz colonizar o país deles, na verdade antes mesmo de existirem cristãos.

Infelizmente, declarações como a daquele jovem não são limitadas aos que planejam ficar pouco tempo no campo missionário. Os missionários de carreira às vezes ignoram a experiência, os antecedentes e a cosmovisão dos membros das comunidades que os recebem como eles são vistos. Essa brecha entre os missionários e os não cristãos nas comunidades locais gera diversos problemas de comunicação.

St. Paul, Minnesota. Antes disso, fo diretor durante 25 anos do Toronto Institute of Linguistic.

Num encontro com um missionário a quem vê como estrangeiro, O não cristão local tende a considerar o relacionamento entre ambos de uma dentre três maneiras. Ele usa a escola, o mercado e o tribunal “dra Ae Não cristão local Missionário como cenário para entender seus encontros com o missionário. Se o local imaginário for a escola, ele vê o missionário como professor e ele própno como estudante, O propósito é transmitir informações que devem ser aprendidas. Se for o mercado, ele vê o missionário como vendedor e ele próprio como comprador. O objetivo é vender e comprar alguma coisa. Se foro tribunal, ele vê o missionário como um acusador e ele próprio como o acusado, O encontro éum julgamento. Na escola, o professor diz: “Vou lhe ensinar uma coisa”, No mercado, o vendedor diz: “Tenho uma coisa para lhe vender”. No tnbunal, o juiz diz: “Vou medi-lo com este padrio”. Dependendo do cenário, o nativo vêsuas necessidades de maneira diferente. Na escola, ele pergunta a si mesmo se tem necessidade de aprender o que o professor tem para ensinar. No mercado, pergunta a si mesmo se precisa comprar o que o vendedor tem para vender. No tnbunal, pergunta a si mesmo se precisa levar à sério a acusação do juiz.

Mas será que alguém de fora pode ensinar, vender ou acusar alguém do local? Será queo não cristão precisa daquilo que o missionário lhe apresenta? Seria o missionário capaz de transmitir o evangelho no papel de vendedor, professor ou acusador? São papéis eficazes? Essas perguntas são muito sérias.

Naturalmente, há outras maneiras, além

O missionário típico de hoje talvez esteja prestando pouca atenção para a aparência de autenticidade de seu papel. Caso eu fosse me apresentar como voluntário para o trabalho missionário quisesse ser produtivo e feliz, certificar-me-ia de que meu papel causasse a impressão de ser genuíno a partir de quatro perspectivas: 1) da comunidade na qual resido; 2) dos missionários que ali residem; 3) da agência que me enviou; 4) da minha perspectiva.

Minha atuação deve permitir que cu seja eu mesmo, que eu seja como sou. Também deve parecer válida na comunidade missionária local. Caso a comunidade missionária local não reconheça meu desempenho e importância, não irei sobreviver por muito tempo. Minha atuação também deve parecer válida para a agência que me enviou. Preciso de seu apoio e estimulo. Não posso sobreviver muito tempo se eles não me derem um lugar importante na comunidade. Finalmente, meu papel deve parecer válido do ponto de vista da comunidade local, Não quero ficar desfilando nessa comunidade como um monstrengo, um sujeito esquisito, um espião ou um inútil, À questão da autenticidade evidente na comunidade costuma ser desprezada, mas não deve ser. É importante, pois preciso de experiências positivas para continuar, Os residentes devem sentir-se bem com dessas três analogias, de examinar o encontro do não cristão com o missionário.

minha presença em sua comunidade, Minha contribuição deve reforçar e complementar o programa missionário em andamento. À agência que me enviou deve ter sólida base lógica subjacente em seus programas e nas oportunidades que me oferece,

Assim, o novo missionário deve buscar papéis que sejam simultaneamente legítimos a estas quatro partes: eu, a comunidade que me hospeda, a comunidade missionária ali existentee a agência que me envia.

Para o não cristão, os papéis de professor, vendedor e acusador podem ou não ser válidos. Os nãos cristãos podem esperar que o estrangeiro adquira a perspectiva do nacional antes que possa ensinar-lhes com eficácia seu ponto de vista. Podem esperar que ele sobreviva nas mesmas condições dos nativos e dependa do mercado local antes que lhes possa vender alguma mercadoria. Podem esperar que o elemento de fora meça a si mesmo pelas leis do local antes de medir os nativos com um padrão vindo de fora, aprendiz, comerciante e contador de história, Primeiro, cu me tornaria um aprendiz. Depois de três meses, acrescentaria outro papel: Comer. ciante. Mais três meses, assumiria UM tercei. ro papel: contador de histórias, Passados mais três meses, embora continuasse sendo aprendi, comerciante e contador de histórias, começaria a desenvolver outros papéis especificados em minha descrição de atividades,

Vou explicar. De sua visão de pessoa vinda de fora, o missionário deve descobrir um caminho para se dirigir rumo ao centro, caso pretenda influenciar as pessoas. Alguns papéis irão ajudá-lo nesse movimento, Outros, não, Sua primeira tarefa é identificar os métodos mais apropriados e eficazes. Então poderá desenvolver meios e métodos de comunicar suz experiência cristã por meio dos papéis nos quais encontrou aceitação. Aprendiz

Um princípio de ordem parece ser importante: aprender antes de ensinar, comprar antes de vender, ser acusado antes de acusar. O que vem de fora poderá ter de seguir essa ordem antes de ser admitido nesses papéis ao nativo.

Como aprendiz, minha principal preocupação é o idioma, símbolo básico de identificação da comunidade que me recebe. Se tento aprendêlo, sabem que os estou levando a sério, que eles valem alguma coisa para mim, porque estou me esforçando para me comunicar com eles.

Quem vem de fora não pode viver à margem de uma comunidade sem chamar de maneira negativa a atenção dos de dentro. O termo

Aprendo um pouco cada dia e ponho em prática o que aprendi. Falo com uma nova pessoa cada dia. Digo alguma coisa nova cada dia. Ãos “pessoa de fora” ou “forasteiro” tem conotações negativas. Portanto, ojmissionário deve setornar uma pessoa de dentro, pelo menos até certo ponto, caso pretenda evitar tais reações à sua presença se tornar uma pessoa de valor na comunidade.

Caso o nativo relute em aprender de um professor, em comprar de um vendedor ou em aceitar as acusações de um acusador de fora, esse poucos, chego ao ponto em que entendo e começo a ser entendido. Posso aprender muito em três meses.

Passo as manhãs com alguém que me ajuda no aprendizado da língua (num programa preestabelecido ou num que eu mesmo preparei), de quem obtenho as informações que vou usar para falar com as pessoas à tarde. Mostro-lhe como deve me exercitar nesse material e, então, forasteiro não trá realizar muito até que encontre novos papéis ou reformule os antigos. Três papéis Conforme entendo, há três papéis que o missionário pode desenvolver a fim de se tornar aceitável aos olhos do não cristão nacional:

passo boa parte da manhã praticando. Então, à tarde, vou aos lugares públicos e estabeleço, com os habitantes do local, contatos que sejam aceitáveis e naturais, tanto quanto permitem meus limitados conhecimentos começando logo no primeiro dia. Início uma conversa depois da outra, nas quais digo verbal e não verbalmente:

anais é AdQUiro um pouco mais de desenvoltura, jesde 0 primeiro dia,

No final dos trés primeiros meses, afirmei-me diante de dezenas de pessoas e che+ «gel dO ponto no qual posso fazer declarações samples, perguntar e responder a perguntas amples, descobrir para onde vou, aprender rapidamente 0 significado de novas palavras e, à mais importante, sentir-me mais ou menos vontade” em minha comunidade de adoção.

alguém que está Interessado cm outras pessoas e procura trocar algumas informações. Meu domínio da língua ainda está em desenvolvis mento é fico conhecendo muitas pessoas. Dependendo do tamanho e da complexidade da comunidade, torno-me uma figura bem conhecida a essa altura, Sou uma ponte entre 0 povo da comunidade local e um mundo mais amplo pelo menos simbolicamente,

Não consigo aprender a “língua toda" em três meses, mas posso aprender a iniciar conversas, controlá-las de maneira limitada e aprender com à pessoa que vou conhecendo, um pouco mais sobre a língua, Comerciante No quarto mês, acrescento outro papel o de comerciante, trocando experiências e opiniões com às pessoas de minha comunidade de adoção e vendo-nos mais claramente como parte da humanidade, não apenas de uma comunidade ou nação diferente, Preparo-me para esse papel em períodos de residência em tantos lugares quantos me forem possíveis, ou substitutivamente, por meio de um curso de antropologia e assuntos afins. Também venho equipado com um jogo de fotos grandes que ilustram de maneira bem variada os modos de vida do ser humano.

Nesses outros três meses, passo as manhãs com meu orientador no aprendizado da língua,

Contador de histórias No início do sétimo mês, mudo de papel mais uma vez, Agora passo a ser contador de histórias, Passo as manhãs com a pessoa que está me ajudando a aprender a língua. Agora aprendo a contar uma história bem simples para as pess0as que conheço e a responder às perguntas da melhor maneira possível, Às histórias que conto são sobre a peregrinação do povo de Israel, a vinda de Cristo, a formação do novo povo de Deus, o movimento da Igreja em todo o mundoe, recentemente, nessa mesma comunidade, Finalmente, conto a história de meu encontro com Cristo e minha vida de cristão. Durante as manhãs, preparo essas histórias e as pratico intensamente, Então, à tarde, saio pela comunidade, como faço há muitos meses, porém agora para me encontrar com as pessoas no papel de contador de histórias, Ainda sou um aprendiz da língua e um comerciante, mas acrescentei 0 papel de contador de histórias. Todos os dias, partilho o máximo possível dessas histórias com conversando sobre as fotos de minha coleção. Assim, avanço no domínio da língua, desenvolvido nos três primeiros meses. Exercito-me descrevendo as fotografias e me preparo o melhor que posso para responder às perguntas feitas sobre elas. Então, à tarde, visito informalmente a comunidade, usando as fotos como parte de minha demonstração “mostre e conte”. Explico o melhor que posso como os outros vivem, como ganham a vida, o que fazem para se divertir, como sofrem e como lutam pela sobrevivência e pela satisfação.

o máximo de pessoas que puder,

No final dessa terceira fase, já fiz amizades e tenho conhecidos, Já tive experiências incontáveis, que nunca esquecerei. Deixei impressões positivas como aprendiz, comerciante e contador de histórias. Já estou pronto para outro papel, e outro, e mais outro, Reconsiderando a aceitabilidade Tendo este perhl em mente, vamos examinar à luz de nossa discussão anterior à aceitabilidade. À figura 2 nos ajuda a entender a questão:

A AR ATO Figura 2 PAPÉIS

Um missionário viável: aprendiz, comerciante e contador de da

DIMENSÕES Residentes locais Comunidade missionária queen Mir

Na figura 2, o sinal positivo significa que o papel é indubitavelmente aceito. O ponto de interrogação significa que uma discussão e esclarecimentos posteriores provavelmente serão necessários antes que ocorra a aceitabilidade.

Do ponto de vista dos habitantes locais, um forasteiro pronto, desejoso e capacitado para aprender tem boas chances de ser recebido. Além disso, o membro comum nessas comunidades tem uma curiosidade natural sobre pessoas de outros lugares. Essa curiosidade pode ser aumentada e aproveitada por meio deuma abordagem cuidadosa. Por fim, contar histórias Mais missionários e 8 f brasileiros 8 e para o mundo muçulmano e relatar incidentes são coisas comuns em das as comunidades. Todos fazem isso. Nap. ralmente, há regras que devem ser respeitada, Presumo que alguém que já se afirmou cor, aprendiz e comerciante pode partilhar históri,, e experiências pessoais com outras pessoas, habitantes locais provavelmente irão ouvir e 17). vez até mesmo o ajudem a contá-las,

Considero aceitáveis esses papéis. Gosto de aprender e saber como fazê-lo. Tenho um conhecimento geral dos diferentes modos de vida das pessoas e gosto das possibj-Jidades inerentes ao papel de comerciante, Aprecio contar histórias e gosto de ouvi-las,

As portas nunca estiveram tão abertas, e o momento é oportuno para os missionários brasileiros no Oriente Médio. Em meio a tantos conflitos raciais, culturais e religiosos na região, nota-se uma necessidade de obreiros com um perfil apropriado e eficaz, que traga resultados positivos para o Reino de Deus.

Hoje, o Brasil é conhecido não somente como o país do futebol, do café e do samba, mas também como um país de obreiros de caráter e de ministério aprovados e efetivos, para a glória de Deus! Destacamos 2 seguir alguns pontos positivos com relação a nossos missionários no mundo muçulmano,

Somos um país diversificado. O fato de o Brasil ser um país de diversas culturas, raças e religiões é um fator determinante e contribui grandemente para o trabalho missionário. Podemos nos relacionar com outras culturas sem receio ou indiferença.

Somos culturalmente flexíveis. Em geral, não Somos flexíveis em nossas ações, na adaptação de vida.

é complicado para um brasileiro misturar-se com o povo. ao que é diferente e na incorporação de um novo estio

Temos uma história a compartilhar. ocidentais, dominadores e indiferentes.

Eles nos veem como latinos, parceiros e semelhantes, não como Parece que compartilhamos uma mesma luta, uma mesma dor

L. C, é missionário no Oriente Médio. Seu nome é omitido por questão de

Extraído da revista AMEM, n. 3, 2006. Usado com permissão.

segurança.

ecialmente quando o contador está pro-A damente envolvido nelas. IN Todavia, do ponto de vista da agência que enviou da comunidade de missionários ae cosidentes, Esses papéis podem ser questionáveis. Dos três, o de contador de histórias talvez eja O mais fácil de desenvolver, embora quase empre as pessoas descubram que os missionásos são pregadores de sermões, professores de scologia ou conferencistas, e não contadores de pistórias. À aceitabilidade do papel de aprendiz está em aberto. O novo missionário, do qual se espera seja um aprendiz no que se refere aos negócios de sua organização missionária local, pem sempre tem tempo e não é incentivado a conhecer os habitantes locais com mais intimidade. À aceitabilidade do papel de comerciante tem sido bem pouco testada, embora eu creia que as agências que enviam e as comunidades missionárias locais devam considerar cuidadosamente sua importância,

Por que não aproveitar o papel de aprendiz 3o máximo? À maioria das pessoas que vivem como estrangeiros, mais cedo ou mais tarde, percebem sua importância. Por que não fazer o novo missionário começar com o pé direito especialmente se houver recompensas crescentes na segunda e na terceira fase? Além disso, O papel de aprendiz representa para 08 habitantes locais algumas coisas que são importantes na comunicação do evangelho, À dependência cavulnerabilidade do aprendiz transmitem de maneira simples as mensagens da identificação eda reconciliação, que são explícitas no evangelho, Ser conhecido como aprendiz certamente não pode prejudicar a comunidade missionária local, Talvez até lhe faça bem.

A aceitabilidade do papel de comerciante talvez seja a mais dificil de estabelecer em parte por ser uma ideia nova. Parece ser demasiado “secular”, mas do ponto de vista da comunidade um papel secular pode ser muito mais viável para o estrangeiro. Vindo na condição de “especialista sagrado”, o estranho faz todo tipo de perguntas, levanta objeções e barreiras. Contudo, há outra coisa a considerar: esse papel reforça a ideia do evangelho como algo para todas as pessoas. Com exceção dos antropólogos, demógrafos e uns poucos outros especialistas, talvez os cristãos tenham

Somos uma cultura orientada “teologicamente”. Com isso, quero dizer que nos referimos muito à Divindade no dia a dia. Costumamos dizer: “Se Deus quiser”; “Deus o abençoe”; “Vá com Deus”, e assim por diante. O mundo árabe também é muito orientado nesse sentido.

Somos uma cultura baseada na honra. O povo árabe, ainda mais que os brasileiros, levam a questão da honra muita a sério. Tudo que lhes cause vergonha é algo a ser descartado. A honra é a base dos reiconamentos. Temos a porta aberta para a comunicação do evangelho quando nos referimos aos mais velhos com respeito, reverenciamos tudo relativo a Deus e não tratamos com leviandade a realidade do sofrimento alheio.

Somos uma cultura subjetiva e intuitiva. Não temos muita dificuldade para falar do que sentimos, e as experiências no âmbito intuitivo afetam o modo de vermos o mundo objetivo. Gostamos de nos envolver com outras pessoas. Temos facilidade e destemor de nos envolver profundamente em nossa relação com outros indivíduos. Priorizamos os relacionamentos; as pessoas, em vez de coisas.

Somos audaciosos na pregação do evangelho. A despeito das dificuldades e dos desafios que a região érabe apresenta, os brasileiros têm se mostrado eficientes evangelistas. Eles têm facilidade para se encaixar ministerialmente nas igrejas, no plantio de igrejas e, acima de tudo, no discipulado e no trabalho com os não crentes.

À igreja brasileira ainda é estarmos conscientes de que ele está realizando em de amor a ele!

tem uma longa estrada missionária a percorrer. Contudo, o mais importante que Deus nos tem confiado algo especial e que nossa tarefa na grande obra nossa geração, principalmente no mundo muçulmano, será nossa expressão ú 472 Um missionário viável: aprendiz, comerciante e contador de hist, um entendimento mais amplo da diversidade humana que qualquer outro grupo, simplesmente em razão de nossas características multiétnicas, multirraciais e multilíngues. O papel de comerciante complementa a apresentação mais formal do evangelho ao partilhar um conhecimento essencialmente “secular” sobre os povos do mundo.

São óbvias as implicações aqui paraaseleção, orientação e avaliação de missionários. Uma discussão dessas implicações, entretanto, está além do escopo deste trabalho, Conclusão Enfrentamos uma situação dificil hoje, enquanto a estrela do colonialismo continua caindo e a estrela das igrejas nacionais que estão amadurecendo continua a subir. Os missionários mostram-se cada vez mais frustrados quando a aceitabilidade de seu papel é questionada. Devemos levar a sério essa situação. O mandamento bíblico desafia o cristão a se tornar um com aqueles aos quais leva a Palavra da vida. Além disso, a história mostra que a vulnerabilidade e a flexibilidade são testemunhas poderosas para a operação do Espírito dentro do homem. Finalmente, para que o movimento missionário continue, novos papéis devem ser acrescentados e os velhos devem ser reelaborados.

Qualquer novo missionário pode prepararse de modo bastante simples e direto para atender às exigências desses três papéis. Naquilo em que forem aceitáveis do ponto de vista da comunidade local, o novo missionário deve começar com eles. Infelizmente, as agências que

Perguntas enviam e as comunidades missionárias lie talvez não estejam preparadas para aceita, sas ideias, A mentalidade “vamos Jogo ag e importa” luta contra a ideia de se dedicar aprendizado, a troca de ideias a prática de contar histórias. Contudo, essa mentalidad, precisa ser desafiada, pois se implica papé;, que isolam o missionário dos habitantes locajs é preciso desenvolver alternativas.

Tempos atrás, num simpósio sobre O apren. rá dizado de língua e cultura, realizado na Oriental, uma missionária perguntou-me se ey; sabia alguma coisa sobre elefantes. Quando respondi que não, ela me perguntou se cu sabia q que acontece quando um bando de elefantes se aproxima de uma poça de água que está rodeada por outro bando. Respondi que não sabia o que acontecia. Então ela me explicou que o elefante que lidera o segundo grupo dá meia-volta e se aproxima de costas da poça. Logo que os outro; elefantes à volta do buraco sentem o contato com as costas dele, afastam-se e lhe dão lugar. Esse é o sinal para os outros elefantes de que o primeiro grupo está pronto para ceder espaço ao redor da poça.

Quando lhe perguntei qual ponto ela estava querendo elucidar, ela declarou simplesmente: “Nós não entramos de costas”. O incessante movimento missionário no mundo de hoje talvez exija que os missionários “entrem de costas” nas comunidades que os recebem. Os papéis de aprendiz, comerciante e contador de histórias talvez não sejam apropriados para um método direto, mas podem ser necessários num método que enfatize o “entrar de costas”. para estudo

1. Por que Larson afirma que os papéis aceitáveis para os missionários?

de aprendiz, comerciante e contador de histórias são

2. Por que os papéis sugeridos por Larson podem para a comunidade missionária local?

ser “questionáveis” para a agência que envia é', 78 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 9 · Leitura — Hogan, cap. 103: Trovão distante: mongóis seguindo ao Khan dos khans', 'Brian Hogan

BRIAN HOGAN fez parte de uma equipe de plantação de igrejas da JOCUM na Mongólia. Atualmente, oferece treinamento em plantação de igrejas com a JOCUM — Mentoreamento de Plantadores de Igrejas em Arcata, na Califórnia, e é autor de There''s a Sheep in my Bathtub: Birth of a Mongolian Church Planting Movement [Há uma ovelha em minha banheira: nascimento de um movimento de plantação de igrejas na Mongólia].

Adaptado do livro de Kevin Sutter, Multiplying Churches Among Unreached People Groups: Guiding Principles [Multiplicando igrejas entre os povos não alcançados: princípios orientadores] (Arcata: YWAM, s.d.). Usado com permissão.

Nº século XIII, as tribos mongóis, unidas sob Gengis Khan, atravessaram as estepes da Ásia Central feito um trovão, causando terror ao mundo conhecido. Em pouco tempo, esses cavaleiros atrozes formaram um império tão poderoso que ofuscava o de Ciro c o de César juntos.

O Império Mongol não duraria muito. Os mongóis abraçaram o budismo tibetano e se tornaram uma província decadente, governada por sucessivas dinastias chinesas. Em 1921, a revolução comunista transformou a Mongólia no primeiro satélite soviético “independente”. Todos os missionários foram expulsos, antes que uma igreja pudesse ser plantada, e as trevas do comunismo pousaram sobre aquele país “fechado”. A Mongólia era um dos pouquíssimos países na terra sem igrejas e, pelo que se sabia, sem nenhum crente.

TI BRIAN HOGAN fez parte de uma equipe de plantação de igrejas da JOCUM na Mongólia. Atualmente, erds STE Eoeaçao estaréamenta dá pleitidoies de Igrejas em Arcata, na Califórnia, e é autor de There''s o Sheep in my Bothtub: Birth of o Mongolian Church Pronto] Movement vma Oventa em minha banheira: nascimento de um movimento de plantação deigrejas na Mongólia)

Adaptado do livro de Kevin sutter, Multiplying Churches Among Unreoçheg Feopre Groups: Guicing ne MO e e À os povos não alcançados: princípios orientadores] (Arcata: YWAM, Usado com permissão.

As portas começam a se abrir Após 70 anos de exclusão do resto do mundo, a Mongólia alcançou liberdade e independência no início da década de 1990 com outras aaçÕES do Bloco Soviético, e ruíram as forças defensivas de Satanás contra o evangelho. Estratégias criativas serviram de fagulha para o fogo que foi se espalhando. Em 1990, uma equipe de crentes americanos de origem indígena entrou na Mongólia como turistas. Sua visita gerou muito interesse entre os mongóis e chegou a ser notícia na imprensa nacional. Ão final da segunda visita, em 1991, batizaram publicamente 36 mongóis recém-convertidos. O cenário espiritual da Mongólia nunca mais seria o mesmo.

Um jovem casal sueco, Magnus e Maria, foi paraa Mongólia com o intuito de implantar igrejas. Enquanto estudavam o idioma na capital, Ulan-Bator, fizeram amizade com os jovens crentes mongóis das igrejas ser em expansão na cidade.

Maria e Magnus fizeram diversas incursões a Erdenet, a terceira maior cidade da Mongólia, levando consigo equipes evangelísticas de breve duração, formada por mongóis de uma igreja de Ulan-Bator. O fruto dessas viagens foi 14 adolescentes que atenderanráo érisino sobrradéeo arrependimento. Magnus batizou a essas primeiras discípulas em janeiro de 1993, e pela primeira Ro vez na história uma igreja nasceu em Erdenet. RUA adolescentes não é um início io ppresalonante, mas a igreja recém-nas-A “da mocesalta via de ajuda 171 /oco à fim de cresaê tor mato? expressividade, Em feverciro,o a ontal mudou-se para Edernet, acompa7 ando por uma jovem crente de 19 anos, mon“ah cujo nome era Bayaraa, que fez a ponte 7 abraral graças do seu rápido aprendizado e quênia o inglês, AM discípulas foram rapidamente organi= pads três pequenas igrejas que se encon= “quadras casas, Elas se reuniam para oração, “mnhão ensino, num ambiente de apoio qgútio E prestação de contas, Desde o início “jam ensinadas a obedecer aos simples man-Jsmentos do Senhor Jesus Cristo, Aprenderam “qamara Deus e umas às outras, a orar, a ofer“gr com generosidade, a se arrepender e crer,a “utizar, à celebrar a ceia do Senhor e a ensinar “ag dutros à amar e obedecer a Jesus. Conforme “a soças levavam suas colegas a Cristo, as pe-quenAs igrejas se multiplicavam. Magnus não aomseguia liderar o número crescente de gru= então treinou e estabeleceu crentes ativos efiéis como líderes das igrejas nos lares, Após dgum tempo, teve início um encontro maior, “oculto de celebração”, que acontecia mensal“pente, com o propósito de reunir os peque“pos grupos para adoração e comunhão como “um só corpo, Quando se completou um ano “taigreja em Erdenet, o número de seguidotes de Cristo, batizados, chegara a 120, quase “todos adolescentes! Não cra a igreja que eles ma que se notasse o trabalho conduzido por discípulos mongóis, Rompendo barreiras a fim de alcançar a essência da sociedade Percebemos que aquelas adolescentes não eram o fundamento adequado para dar início a um projeto de plantação de igrejas, Contudo, na época, 08 jovens eram os únicos que demonstra vam interesse pelo evangelho na Mongólia, Assim, trabalhávamos com os frutos que o Senhor nos concedeu e orávamos para alcançar famílias inteiras, Estabelecemos “anciãos provisórios” (começando por dois jovens e Bayaraa), a fim de iniciar o processo que levasse ao desenvolvimento de um estilo de liderança mongol para a igreja, que nos permitisse atuar ainda mais nos bastidores, Rompendo barreiras quanto à relevância Havia uma diferença muito grande entre nosso círculo de amigos, jovem e urbano, e a cultura centrada nas famílias, como era a tradicional sociedade da Mongólia, As três cidades formavam uma estrutura social urbana, razoavelmente recente, imposta pelo comunismo a uma sociedade tribal nômade, e essa estrutura social nômade era vista por todos como a mais legítima. Até mesmo nossas primeiras convertidas tinham a impressão de que o evangelho não era relevante para os “legítimos mongóis”. Apesar de o comunismo haver transformado a Mongólia numa sociedade 50% urbanizada, para esse “somharam, composta por famílias inteiras com apresentação de todas as faixas etárias. Parecia ais UM grupo de jovens. "Após um ano de estudos no idioma em “Wan-Bator, minha esposa Louise, nossas três “filhas e eu nos mudamos para Erdenet, a fim “de ajudar Magnus, Maria e Bayaraa. Um ano depois, outros vieram juntar-se à nossa equipe, provenientes da Rússia, dos Estados Unidos e da Suécia. Além de três Forças de Paz, nossa “equipe representava a única presença estran“Ara em Erdenet, e éramos muito diferentes. Dedicamo-nos a liderar nos bastidores, de forpovo “os legítimos mongóis” eram pastores que trafegavam a cavalo e habitavam a gher (tenda tradicional, de forma circular, confeccionada com lã e peles). Um adolescente que cresce num apartamento e que jamais montou um cavalo não é um mongol legítimo, Se o evangelho fosse acolhido apenas pelos habitantes da cidade, seria facilmente considerado produto estrangeiro, como a Coca-Cola, À fim de “se tornar mongol”, Jesus precisaria entrar na vida dos pastores nômades.

Uma equipe que visitava temporariamente o subúrbio da cidade, onde havia os tradicionais pe? x 720 gher, começou a orar pelos enfermos. À resposta

Trovão distante: mongóis seguindo ao Khan dos khans do testemunho das curas e libertações. O Deus de Deus a essas orações foi impressionante. Um aleijado, um surdo, um mudo e um cego foram curados, e vários demônios foram expulsos. As que operava essas maravilhas possuía um nome que não soava como ficção científica.

curas serviram como selo de autenticidade para os mongóis mais velhos. À notícia espalhou-se como fogo, e a comunhão passou a contar com diversas pessoas de todas as faixas etárias e de todas as partes da cidade. Mais que todos, os jovens urbanos ficaram surpresos por ver “legítimos mongóis” se converterem. Dois senhores, que eram chefes de família, foram incluídos no grupo provisório de anciãos. Eles e outros paise chefes de família tornaram-se líderes das igrejas nos lares e de outros ministérios e fizeram grande diferença na questão da credibilidade do ministério diante da cultura.

Desenvolvimento da liderança autóctone Durante essa fase de crescimento acelerado, nossa equipe continuou, intencionalmente, exercendo funções de bastidores, proporcionando aos líderes emergentes oportunidades de treinamento prático. Cuidamos para que tudo fosse feito de forma que pudesse ser posteriormente imitada: os batismos eram realizados em banheiras; os cânticos não eram importados, mas escritos pelos membros da igreja, e assim por diante.

À equipe trouxe à memória o que aprendera, antes de partir para a Mongólia, do veterano missionário George Patterson. Ele chegou à

Rompendo barreiras quanto à compreensão O segundo fator que possibilitou a repentina aceitação do evangelho por parte dos mongóis tradicionais mais velhos foi a decisão de nossa equipe e dos “anciãos em treinamento de começar a usar o termo mongol Burhan para se referir ao Deus da Bíblia. Muitos séculos antes, quando missionários budistas tibetanos chegaram à Mongólia, eles adotaram o termo abrangente para “deus”, burhan, a fim de alcançar seus propósitos. No início da década de 1990, quase todos os crentes da Mongólia usavam outro termo para Deus: Yertontsiin Ezen, que era um nome novo, criado por um tradutor na tentativa de evitar qualquer confusão ou sincretismo com as crenças errôneas do budismo. Esse novo nome, porém, que pode ser traduzido por “Mestre do Universo”, soava irreale nada familiar aos ouvidos mongóis. Não tinha nenhum ignificado em si mesmo e era essencialmente im nome estrangeiro composto por palavras nongóis. Embora acostumados com Yertontsiin “zen, os líderes em treinamento de Erdenet ecidiram-se pelo tradicional Burhan, por ser ais adequado e mais bem recebido, além deter n si o potencial de receber pleno significado blico. Essa alteração ocorreu na hora certa, tando as multidões se abriram, como resultado essência do discipulado ao dizer: “As pessoas são salvas a fim de obedecer ao Senhor Jesus Cristo”, Por isso, asseguramo-nos de que os ensinamentos básicos de Jesus fossem ensinados de modo a serem prontamente obedecidos pelos discípulos. Às igrejas nos lares possibilitavam, apoiavam e incentivavam essas reações práticas ao ensino da Palavra de Deus. Os crentes não se limitavam a ouvir a Palavra, mas ajudavam uns aos outros a cumpri-la. Muitas vezes, encontravam formas de cumprir a Palavra todos juntos.

Contudo, de nosso ponto de vista, havia problemas graves com as normas culturais da sociedade mongol, conflitantes com alguns princípios éticos das Escrituras. Incentivávamos os líderes em treinamento a buscar nas Escrituras soluções para situações de pecado que se formavam na igreja. Princípios foram delineados a fim de tratar dos pontos cegos da cultura com relação à pureza sexual e ao namoro, que depois foram ensinados e cobrados. As soluções que os líderes mongóis elaboraram eram bíblicas e também apropriadas à cultura, muito melhores que qualquer solução que partisse de nós, missionários.

À igreja nos lares da Mongólia era muito diferente das igrejas de origem de qualquer um de nós da equipe, da Suécia, da Rússia ou altos de celebração (que passaram de mensal a qaiorenal e, mais tarde, a semanal), A “equipe de catro elaborava e produzia suas esquetes, peças coreografias, bascadas em histórias bíblicas c cotidiano da vida mongol. À dramatização so ago se tornou uma ferramenta poderosa no asino e no evangelismo. Sempre havia um temreservado para os testemunhos dos “legítimos ongóis! geralmente, recém-convertidos por colta dos 60 anos de idade, chegados das estepes havia pouco tempo. Os relatos de converão, longos e vagarosos aos ouvidos ocidentais, prendiam a atenção das pessoas, que ficavam espantadas e maravilhadas, Deus estava aginjo no meio ao povo deles, vestido com a mais adicional das vestes mongóis. O louvor subia cultos semanais, Superação Todo esse progresso não passou despercebido pelo Inimigo. À partir de novembro de 1994, nossa equipe e à igreja inexperiente passaram dois meses inteiros sob ataques espirituais ininterruptos: grupos de três seitas diferentes fixaram-se na cidade, À igreja quase se dividiu, líderes caíram em pecado, alguns ficando endemoniados. Nossa equipe chegou quase ao ponto do desespero e da desistência,

Por fim, duas mortes repentinas e inexplicáveis abalaram a equipe missionária e a igreja. Meu único filho homem, Jedidiah, nasceu no dia 2 de novembro. Na manhã do Natal, do coração deles quando cantavam as músicas compostas pelo próprio povo, em sua língua e em seu estilo musical singular, Não se tratava de um modismo nem de produto estrangeiro!

Após cerca de um ano e meio de “vida” da igreja, OS “anciãos provisórios” decidiram rejeitar, educadamente, os recursos financeiros enviados por igrejas do exterior. Esses recursos eram destinados a suprir o salário de alguns dos obreiros da igreja mongol, pelo período de mais ou menos um ano. Agora, o próprio povo ofertava, e com isso arrecadavam o suficiente. Quando a igreja estrangeira insistiu em continuar envando os recursos, estes foram redirecionados para as congregações, a fim de sustentar seus obreiros, tendo-se em mente que tal situação nosso apartamento ressoou com os gritos de Louise, ao encontrar o corpo frio e sem vida de Jedidiah, vítima da síndrome da morte súbita do lactente, com apenas 2 meses de idade. Sepultamos nosso filho e uma parte de nosso coração no solo congelado de uma colina varrida pelo vento, nas proximidades da cidade. No dia seguinte, uma menina da igreja morreu de causa desconhecida,

À reação dos crentes e de nossa equipe foi reunir-se para 24 horas de jejum e oração. Às três da madrugada, todos sentimos que alguma barreira fora superada. Desde então, a igreja não voltou a ser oprimida com longos ataques espirituais.

também seria temporária. *Aequipe estrangeira concentrou seusesforçosem discipular, capacitar e enviaros mongóis a fim de assumirem a liderança na edificação da Igreja e no alcance aos perdidos. Formamosuma

Crescimento intenso Frequentes assédios do governo atrapalhavam severamente as igrejas mongóis, geralmente vítimas de desocupação forçosa dos locais das reuniões de domingo. Uma das belezas de nos “escola de discipulado que, ao chegar à terceira turma, já era totalmente conduzida por mongóis. Com a ênfase que se dava em “aprender fazendo”, novos líderes eram treinados parao ministério na própria região onde residiam,em vez de serem enviados para longe. A condução “dos cultos foi colocada nas mãos deles quase reunir em lares era que a igreja de Erdenet quase nunca era afetada por tais ações. Afinal, nossa adoração acontecia em diversas salas de estar por toda a cidade! O crescimento continuava a acontecer nos pequenos grupos, e não foi desacelerado nem nos meses que deixamos de ter nossos “cultos de celebração”, Quando as várias

722 pequenas igrejas se reuniam, unidas na presença de Deus, os crentes eram encorajados ao ver que o grupo continuava a crescer. O Início de um projeto de plantação de igrejas

Trovão distante: mongóis seguindo ao Khan dos khans haviam sido desenvolvidos e transferidos, com êxito, para discípulos mongóis. Os mongóis faziam tudo, e nós apenas observávamos. Havia chegado o momento agridoce, que sempre fora nosso alvo: a hora de nos despedir,

O culto de Páscoa estava lotado só ha-

Por mais encorajador que tenha sido esse início de ministério em Erdenet, ainda estava aquém da visão que Deus dera à nossa equipe. Sabíamos que implantar uma única igrejanuma cidade não seria suficiente para alcançar toda a nação e além. Nosso alvo era que as igrejas autóctones se multiplicassem entre os povos mongóis, e esse objetivo precisava ser apoiado via lugar em pé. Cerca de 800 pessoas enchiam o maior salão de Erdenet, sendo que muitos foram impedidos de entrar pelas autoridades, que fecharam as portas quando viram a multidão. Os que conseguiram entrar adoraram a Jesus e participaram da cerimônia, que foi um marco histórico, na qual se transferiu a autoridade de nossa equipe estrangeira na plantação pelos crentes mongóis.

Ainda no primeiro batismo, Magnus compartilhou sua visão com a igreja recém-nascida: alcançar todas as famílias de Erdenet com o evangelho, iniciar uma congregação na província vizinha e alcançar outros povos não alcançados do mundo. Os novos crentes, jubilosos, massem saber direito o que significava essa visão, reagiram com muito entusiasmo. Treinamos todos os discípulos de modo a verem sua igrejacomo um organismo vivo, não como uma organização uma igreja-mãe saudável, capaz de gerar de igrejas para os anciãos locais, Explicamos e encenamos, como analogia, uma corrida de revezamento, a fim de ilustrar visualmente o que estava acontecendo. Um bastão foi passado por nossa família e por Magnus representando os plantadores de igreja a um grupo de líderes mongóis trajados com roupas e adereços nacionais, simbolizando que nosso tempo de “correr” com aquele Corpo havia terminado, e que o tempo deles estava apenas começando. Eles, de fato, estavam dispostos e preparados! O bastão foi passado. Pela primeira vez na hiscongregações, ou seja, filhas e netas. Os líderes que treinávamos mantiveram diante dos membros a visão de que “Deus quer que plantemos novas igrejas por meio de nossa igreja”.

Durante o segundo ano de nossa igreja, tória, uma igreja plenamente mongol estava nas mãos dos mongóis e eles estavam firmes nas mãos de Jesus, cicatrizadas pelos cravos. O culto inteiro foi uma alegre celebração, mesmo em meio às lágrimas de despedida.

os anciãos enviaram equipes e plantaram uma igreja-filha numa cidade a 60 quilômetros de distância. Por pertencer ao mesmo grupo do povo, plantar outra congregação foi fácil para os mongóis. Os líderes que foram estabelecidos sobre a nova igreja logo começaram a enviar equipes para plantar igrejas-netas em outras cidades ainda mais distantes de Erdenet.

Nossa família partiu da Mongólia naquele mesmo dia, e o resto da equipe seguiu em junho, quando encerraram seus compromissos com as aulas de inglês. Em nossa ausência, as igrejas mongóis continuaram a crescer e se multiplicare deram início a vários ministérios de ação social. Começaram a alimentar e dar roupar às crianças de rua, a cuidar de mães solteiras e a

O fim do começo Passados apenas três anos de trabalho de nossa equipe em Erdenet, demo-nos conta de que nossos esforços por “trabalhar até não sermos mais necessários” deram resultado. No início de 1996, todos os ministérios e cargos da igreja evitar que abortassem. Chegaram a plantar uma igreja entre os que moravam no lixão. Todas essas iniciativas partiram de crentes mongóis e foram por eles desenvolvidos.

O ministério continua. Até 2008, a igreja-mãe havia gerado 15 igrejas-filhas em crdades espalhadas por todo o país. Várias delas cando em consideração que começamos em UMAS POUCAS adolescentes: “Da mesma forma, esse ministério tem se implantação de igrejas. O evangelho continua a realizar sua obra de transformação de vidas e da sociedade, Às igrejas continuam crescendo

«openhado no trabalho transcultural. Equipes à» plantadores de igrejas foram enviadas da Vonstólia a povos muçulmanos de dois outros «ses, muito distantes em termos de cultura,e senbém a um povo tribal animista nas selvas, «esa nenhuma relação com os mongóis. Exis“em ainda projetos iniciados entre várias outras “bos mongóis. Cinco igrejas-filhas e quatro “gsejas-netas são fruto da implantação missio«fia em grupos étnicos distintos, Uma escola treinamento missionário em Erdenet treina a orça missionária emergente da igreja mongol. BE a ese reproduzindo. Estimativas conservadoras do governo revelam que o crescimento partiu de apenas dois crentes em 1990 para mais de 50 mil pd em 2005. À Mongólia e transformou-se de campo missionário em poderosa força missionária, a qual, proporcionalmente, envia mais missionários por cristão que qualquer outro país no mundo, Como em tempos remotos, os mongóis abalam as nações que se encontram além de suas montanhas estéreis, dessa vez sob a liderança do “Khan dos khans”, o Rei Jesus!', 79 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 9 · Leitura — Parshall, cap. 97: Indo longe demais?', 'Phil Parshall

PHIL PARSHALL trabalhou como missionário pela SIM (Servindo em Missões) durante 44 anos em Bangladesh e nas Filipinas. Ele é autor de nove livros sobre islamismo, entre eles The Cross and the Crescent: Understanding the Muslim Heart and Mind [A cruz e o crescente: como entender o coração e a mente do muçulmano], Bridges To Islam: A Christian Perspective on Folk Islam [Pontes para o islamismo: uma perspectiva cristã do islamismo popular] e Muslim Evangelism: Contemporary Approaches to Contextualization [Evangelismo aos muçulmanos: abordagens contemporâneas para contextualização].

Extraído de Evangelical Missions Quarterly, v. 34, n. 3, out. 1998. Usado com permissão.

Phil Parshall Ee pes enenos estava falando a um grupo de jovens muito moivados para evangelizar os muçulmanos. Entusiasmados, eles me contaram de um missionário que havia compartilhado com eles um novo modus operandi para ganhar os filhos de Ismael para Cristo, A estratégia baseava-se no evangelista cristão que, declarando-sc muçulmano, participa do sa/at, ou seja, das orações islâmicas oficiais dentro da mesquita. O missionário ilustrou o conceito, mencionando dois cristãos asiáticos que haviam entrado recentemente com uma ação legal para, oficialmente, se tornar muçulmanos. Isso foi realizado para que se fizessem muçulmanos aos muçulmanos, com o intuito de levar muçulmanos a Cristo.

Na verdade, receber uma identidade muçulmana e fazer orações na mesquita não é uma estratégia nova. Todavia, tornar-se legalmente muçulmano leva o empreendimento missionário a um território desconhecido. Essa é a questão que abordarei, com um senso de profunda preocupação.

AO uuuuusu RaGasC a RnaEa PHIL PARSHALL trabalhou como missionário pela SIM [Servindo em Missões) durante sa anos em Bangladesh e nas Filipinas. Ela é ator de lave INics cobre islamismo, entre eles The Cross and the Crescent: Understanding

Contextualização gradual John Travis (pseudônimo), missionário de longa data entre muculmanos na Ásia, formulou uma simples categorização para as etapas de contextualização dentro do movimento para alcançar os muçulmanos. Ele define seus seis C''s como “espectros de plantação de igreja RITA em ambiente transcultural”. é

Há alguns anos, um famoso professor de islamismo deu a entender que minha crença era de que o muçulmano convertido the Muslim Heart and Mind [A cruz e o crescente: como entender 0 Coração e à perma do muçulmano), al ado ãs para islamismo: 0 uma perspectiva cristã do islamismo popular] e Muslim Evangelism: Contemporary Approaches to Contextualization Evangelismo dos Munhanos: cooled aa Es

Extráldo de Evorigelical Mission Quarterly, v. 34, n. 3, out. 1998. Usado com permissão.

poderia e deveria permanecer na mesquita depois da conversão. Rapidamente o corrigi, afirmando que nunca defendi essa postura, nem em meus discursos nem em meus escritos. Meu livro Beyond the Mosque Além da Mesquita trata exaustivamente S obre por que, quando e como os convertidos devem se desassociar da mesquita, embora não da comunidade muçulmana propriamente dita. Entendo, porém, que deve haver um período detransição no qual o novo crente, enquanto amadurece na fé, aos poucos deixa de frequentar a mesquita. Uma retirada repentina pode ocasionar um antagonismo intenso e a consequente alienação. Veja em 2Reis 5 a maneira interessante em que Eliseu respondeu ao novo convertido Naamã, que levantou a questão de sua presença contínua no templo de Rimom. ade]

E A grande

Qudliagrama“A grande divisão” põe em perspeetiva linear as categorias Cl a Aceito a

Aetade que CÍ começa numa contextualização paixactrabalha gradualmente até chegar ao (4, “mo alto. Tudo dentro desse setor é legítimo, desde que fundamentado pelo constante uso de refetências cruzadas e sujeito à verdade bíblica.

"O podescr situado em qualquer lugar ao longo do espectro do sincretismo, dependendo de como cada questão é apresentada c entendida pela comunidade muçulmana. Pessoalmente, só posso entender conversão (ou reconversão) ao islamismo oficial como alto sincretismo, sem levar em conta a motivação.

Quando, em 1975, nossa equipe de missio-E -mários começou uma estratégia C4 (alta contexa tualização, mas os crentes não são mais vistos como muçulmanos pela comunidade muçulmana) num país muçulmano asiático, enfrentamos E considerável oposição. Um obreiro cristão que trabalha há muito tempo num país islâmico disse-me: “Você está numa descida perigosa.

divisão Um experimento ministerial Nós realmente temos ajuda, Numa área geográfica muito limitada e remota da Ásia, um experimento de C5 (“muçulmanos messiânicos” que seguem Isa [Jesus], o Messias, é são aceitos por muçulmanos como muçulmanos) tem sido contínuo há muitos anos. Esse ministério nos dá uma base muito sólida de avaliação, muito embora tenha experimentado significativa rotatividade de pessoal durante os anos. Recentemente, os pesquisadores visitaram Islampur'' para examinar o movimento (C5 e descobriram que esse movimento atinge milhares de pessoas,

Por um lado, as descobertas foram animadoras, Quase todas as pessoas-chave entrevistadas valorizavam muito a leitura do Novo Testamento e as reuniões regulares de adoração cristã. Muitos também diziam que Alá os amava os perdoara porque Jesus morreu por eles. Eles oravam a Jesus para pedir perdão, e praticamente todos acreditavam que Jesus é o único Salvador,

Em breve, estará negando a cruz”. Bem, anos depois, ainda somos C4, ainda pregamos a cruz, eo Senhor tem honrado muito nossos esforços naquele país. No entanto, agora eu é que sou contra a “descida” não em nome de nossa equipe, "mas em nome de outros que estão ministrando em várias partes do mundo muçulmano. Essa descida é gradativa e pode ser decepcionan“te na mesma proporção, sobretudo quando “conduzida por pessoas com altíssima motivação. Parece-me que devemos submeter essas questões à analise de nossos teólogos, missió- “Jogos e administradores, antes que descubramos ter chegado a um ponto verdadeiramente "não cristão. ê --MOs nomes citados nos exemplos são fictícios.

capaz de libertar o ser humano dos maus espíritos. Por outro lado, quase todos responderam que há quatro livros sagrados: a Torá, o Zabur, o Injil, e o Alcorão (esta é a crença muçulmana padrão: Lei, Profetas, Evangelhos e Alcorão), do quais o Alcorão é o mais importante. Quase metade continuava a frequentar a mesquita tradicional na sexta-feira, onde participavam das orações islâmicas, as quais afirmam que Maomé é um profeta de Deus, e quase metade não cria na Trindade. Contextualização ou sincretismo? Será isso contextualização ou sincretismo? Será esse um modelo a seguir ou a evitar? Sem dúvida, existe uma abertura e um potencial animadores aqui, No entanto, ao contrário dos defensores do não estou feliz em conservar tudo dentro de um ambiente religioso islâmico.

feta de Deus, e a divindade de Cristo é consistentemente negada, As orações muçulmanas (sala!) são feitas de forma ritualística, como em nenhuma outra religião, e são tão sacramen-

A mesquita pode ser redimida? tais para os muçulmanos quanto o é participar À mesquita está impregnada com a teologia da ceia do Senhor para os cristãos, Como nos islâmica. Nela, Maomé é afirmado como pro- sentiríamos se um muçulmano participasse ou O espectro Cl a C6 Jobn Travis Um instrumento prático para definir sels tipos de “comunidades cristocêntricas” ("C”)

encontradas no contexto muçulmano O espectro Cl a C6 compara e contrasta tipos de “comunidades cristocêntricas” (grupos de seguidores de Cristo) encontrados no mundo muçulmano. Os seis tipos são diferenciados por língua, cultura, formas de cultuar, grau de liberdade de cultuar com outros e identidade religiosa. Todos adoram a Jesus como Senhor, e os elementos principais do evangelho são os mesmos para todos os grupos. O espectro tenta lidar com a diversidade enorme que existe em todas as partes do mundo muçulmano quanto à etnicidade, história, tradições, língua, cultura e, em alguns casos, teologia,

A diversidade significa que inúmeras metodologias são necessárias para compartilhar com sucesso o Evangelho e plantar comunidades cristocêntricas entre os seguidores do islamismo no mundo, que hoje chegam a um bilhão. O objetivo do espectro é dar assistência a plantadores de Igrejas e crentes vindos do islamismo, para que descubram que tipo de comunidade cristocêntrica pode conduzir o maior número de pessoas do grupo-alvo para Cristo e que melhor se ajusta em determinado contexto, Os seis tipos são atualmente encontrados em alguma parte do mundo muçulmano.

C1 Igreja tradicional usando linguagem dos de fora* Podem ser ortodoxas, católicas, ou protestantes, sendo que algumas até antecedem ao islamismo. Milhares de igrejas Ci são encontradas em terras muçulmanas hoje, Pelo fato de muitas delas refletirem a cultura ocidental, quase sempre há uma enorme lacuna cultural entre a igreja e a comunidade muçulmana ao redor. Alguns crentes vindos do islamismo podem ser encontrados em igrejas C1. Os crentes C1 chamam a si mesmos “cristãos. C2 Igreja tradicional usando linguagem dos de dentro

É, essencialmente, idêntico ao C1, exceto pela linguagem. Embora a linguagem dos de dentro seja usada, o vocabulário religioso é provavelmente não islâmico (distintamente “cristão”). A distância cultural entre muçulmanos e o C2 é ainda grande. Muitas vezes, mais crentes vindos do islamismo são encontrados no C2 que no C1. A maioria das igrejas localizadas no mundo muçulmano hoje é C1 ou C2. Os crentes C2 chamam a si mesmos “cristãos”.

C3 Comunidades cristocêntricas contextualizadas usando formas culturais religiosamente neutras dos de dentro linguagem dos de dentro e

As formas religiosamente neutras podem assim por diante. Os elementos islâmicos, incluir a música folclórica, a vestimenta étnica, a obra de arte, e quando presentes, são “filtrados” para que se usem formas pu-

John J. Travis (pseudônimo) e sua família estão envolvidos com plantação de igrejas contextualizadas entre os muçulmanos da Ásia nas últimas duas décadas. Em parceria com a esposa, escreveu artigos para diversos livros e periódicos. Ele leciona e treina obreiros em vários países nas áreas de contextualização, cura e compartilhamento do amor de Jesus aos muçulmanos.

Extraído de Evangelical Missions Quarterly, v. 34, n. 3, Out. 1998. Usado com permissão ag comunhão? Isso realizado, ele começaria a re islamismo e, na verdade, ganharia O gsmitos de nossos membros pelo seu poder de da mesquita, buscando minar seus preceitos e práticas. O C5, para mim, parece fazer justamente isso, e nos sujeita a uma carga de ativipesado, Mé mesmo o C4 está sujeito a uma carga muçulmana de engano, porém discordo “ego sso como um nível real de indigenização.

dade antiética e não cristã,

No país em que exerci meu ministério, nossa equipe tinha um acordo: nenhum de qamente “culturais” O objetivo é reduzir a influência estrangeira do evangelho e da Igreja e contextualizar “as tomas culturais biblicamente permissívels. Podem ser encontradas numa Igreja ou num local religiosaamgnte mais neutro, As congregações C3 são compostas de uma maioria de crentes vindos do Islamismo, qe erêntes chamam a si mesmos “cristãos”,

Comunidades cristocêntricas contextualizadas usando linguagem dos de dentro e formas culturais e Islâmicas biblicamente permissíveis E semelhante à C3, porém as formas islâmicas e as práticas biblicamente permissíveis também são utillqtas (por exemplo, oração com mãos levantadas, guardar o Jejum, evitar carne de porco, álcool e cães qomo animais de estimação, usar termos islâmicos, vestimentas). As formas C1 e C2 são evitadas, e as prumides não são realizadas nos prédios da igreja. As comunidades C4 são compostas quase Intelramente crentes vindos do islamismo. Crentes C4, embora altamente contextualizados, não são normalmente vistos Como muçulmanos pela comunidade muçulmana, 83,0 Messias”, ou algo semelhante.

Crentes C4 Identificam-se como “seguldores de

Comunidades cristocêntricas de “muçulmanos messiânicos” que aceitaram à Jesus como Senhor e Salvador Qscrentes CS permanecem legal e socialmente dentro da comunidade islâmica, Um tanto semelhante ao movimento de judeus messiânicos, os aspectos da teologia Islâmica incompatíveis com a Bíblia são rejeltados ou reinterpretados, se possível. A participação no culto comunitário islâmico varia de pessoa para pessoa e de grupo para grupo. Os crentes C5 encontram-se regularmente com outros crentes C5 e compartilham sua fé com muçulmanos não salvos. Os muçulmanos não salvos podem ver os crentes C5 como tologicamente desviados e vir a expulsá-los da comunidade islâmica. Onde vilarejos inteiros aceitam a

Cristo, o CS pode resultar em “mesquitas messiânicas”. Os crentes tomunidade muçulmana e se identificam como muçulmanos que (6-Pequenas comunidades cristocêntricas subterrâneas

C5 são vistos como muçulmanos pela seguem a Isa, o Messias.

E São semelhantes aos crentes perseguidos nos regimes totalitários. Em razão do medo, do isolamento, da ameaça de ação legal extremada por parte do governo ou da comunidade ou de retaliação (até mesmo pena de morte), os crentes C6 adoram a Cristo secretamente (individualmente ou talvez esporadicamente em pequenos grupos), Muitos vêm a Cristo por meio de sonhos, visões, milagres, transmissões de rádio, folhetos e testemunho cristão enquanto estão fora de seu país ou por meio da leitura da Bíblia, por iniciativa própria. Os crentes C6, ao contrário dos C5, são normalmente discretos com relação à sua fé. Seu comportamento não é o ideal, pois Deus deseja que seu povo testemunhe e tenha comunhão regular (Hb 10,25). Todavia, os crentes C6 são parte de nossa família em Cristo. Embora Deus possa chamar alguns a uma vida ce sofrimento, aprisionamento ou martírio, ele pode se agradar de receber essa adoração secreta, pelo menos durante algum tempo. Os crentes C6 são vistos como muçulmanos pela comunidade muçulmana eidentificam-se como muçulmanos. Os *de dentro” pertencem à população muçulmana local; “os de fora” pertencem à população não muçulmana local.

nós entraria numa mesquita nem se envolve= ra com as orações islâmicas, Harry, um dos membros do grupo, entretanto, quis “experi= mentar” o salat em segredo, Numa sexta-feira, ele viajou a uma aldeia distante, tornando-se amigo dos muçulmanos de lá, e acabou por expressar seu desejo de aprender como realizar os rituais e formas das orações, Os líderes mu= culmanos, entusiasmados em ver um estrangeiro querendo aprender sobre o islamismo, deram a Harry as instruções necessárias, As 13h00, então, nosso missionário estava sentado na primeira fila da mesquita, curvando-se e prostrando-se enquanto o salat era recitado. Ninguém sabia que ele estava, na verdade, stlenciosamente orando a Jesus, Depois do culto, os aldeões muçulmanos cercaram Harry co parabenizaram por haver se tornado muçulmano, Constrangido, Harry explicou que era seguidor de Isa (Jesus) e que queria apenas aprender sobre o islã, Ao ouvir essas palavras, a multidão ficou furiosa, e ele foi acusado de profanar a santidade da mesquita, Alguém gritou que ele deveria ser morto, e um distúrbio estava a ponto de estourar. Naquele momento, o imame local, para pacificar a multidão, admitiu que havia cometido um erro ao ensinar o estrangeiro a fazer as orações e pediu perdão aos seus companheiros muçulmanos, Decidiuse então que Harry deveria deixar o vilarejo imediatamente e nunca mais voltar ali.

Outra experiência relaciona-se a Bob, missionário entre os muçulmanos, que era muito inteligente, produtivo e espiritualmente firme, Encontramo-nos numa conferência, trocamos correspondência cartas e pelo menos uma fita cassete por vários anos, Minha grande preocupação era que ele, aberta e dogmaticamente, afirmava Maomé como profeta de Deus, Para mim, Bob havia cruzado a linha e entrado no sincretismo, Seus motivos talvez fossem puros, mas a identificação com os muçulmanos fo; longe demais. Hoje, Bob está fora do ministério edivorciado da esposa. Diretrizes Em 1979, escrevi as seguintes diretrizes para evitar O sincretismo enquanto estivéssemos envolvidos com o evangelismo de muçulmanos, Dezenove anos depois, reafirmo estes princípios: 1. Devemos conhecer bem os ensinos bfblicos sobre sincretismo, Passagens do

Novo Testamento sobre a singularidade de Cristo devem ser cuidadosamente observadas, 2, O islamismo, como religião e cultura, deve ser estudado a fundo, 3. É necessária uma metodologia aberta, Uma tentativa cuidadosa de contextualização não precisa levar ao sincretismo, contanto que o envolvido esteja consciente de todos os perigos. 4. À contextualização precisa de monitoramento e análise constantes. O que as pessoas estão realmente pensando? O que a comunicação contextualizada transmite?

O que as formas específicas provocam na a o Ma e O e E AME o A «PA a o BEE E é am “O “LÁ “a ce aa E

7 nas mente do novo convertido? Há progresso no conhecimento da verdade bíblica? Às pessoas estão se tornando claramente mais espirituais? 5. Os comunicadores transculturais precisam ter cuidado ao apresentar um Evangelho que tem sido sincrético na cultura ocidental. Os A Reed, acréscimos ao cristianismo acumulados ao longo dos séculos, em razão de o Ocidente ser o centro do cristianismo, devem ser evitados tanto quanto possível. 4 gu não estou difamando a motivação de misjondrios que praticam e promovem o C5 como estratégia apropriada para ganhar muçulmanos para Cristo, Vários desses obreiros cristãos são meus amigos, sua integridade pessoal é inquesjonável e eles realmente anseiam por ver algo novador no evangelismo entre os muçulmanos, No entanto, estou apreensivo para ver aonde tudo isso levará.

Na conferência que mencionei, um jovem muçulmano convertido veio até mim e disse que havia seguido o exemplo do missionário preletor: fora à mesquita local e dissera ao imame que era muçulmano e que queria aprender mais

Perguntas

Como o missionário pode evitar o sincretismo um relacionamento com o imame, Perguntei a Abdul como ele se sentiu a respeito do que havia feito, Com um olhar de dor e tristeza, ele respondeu que se sentiu muito mal é que não faria aquilo de novo,

Antes que os envolvidos com o C5 largamente propaguem essa estratégia a mentes jovens e im pressionáveis, motivadas pelo “novo” e pelo “não comprovado”, suplico que considerem melhor a carga islâmica de decepção e também as consequências de longo prazo de suas ações, Estou convencido de que os missionários estão pisando em solo teológico e missiológico muito instável. Vamos trazer o assunto à tona e dialogar juntos, para estudo no seu ministério?

2. Deve o missionário “experimentar” com a contextualização? tar? É de não experimentar?

Quais os perigos de experimen-', 80 from cursos where slug = 'perspectivas';
insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 9 · Leitura — Nida, cap. 62: Comunicação e estrutura social', 'Eugene A. Nida

EUGENE A. NIDA, estudioso da Bíblia, linguista e antropólogo, juntou-se à Sociedade Bíblica Americana em 1943. Foi o coordenador da Pesquisa e Tradução para as Sociedades Bíblicas Unidas de 1970 a 1980. Hoje dá continuidade ao seu trabalho de consultor nas sociedades bíblicas, bem como em pesquisas e palestras na Europa e na Ásia. Ele escreveu 22 livros sobre tradução e missões.

Eugene A, Nida LE o nome de Babel, porque ali confundiu Senhor a linguagem de toda a terra e dali o Senhor os dispersou por toda a superfície dela (Gn 11.9). À comunicação jamais acontece num vácuo social, mas sem pre entre indivíduos que fazem parte de um contexto social inte-

grado. Os que participam do evento comunicativo mantém um relacionamento definido um com o outro. Por exemplo, o chefe com o empregado, o filho com o pai, o guarda de trânsito com o infrator e a criança com a babá. Além disso, em cada sociedade há regras definidas sobre que tipos de pessoas dizem determinadas coisas a certas classes de pessoas. Entretanto, o que é dito numa classe talvez seja impróprio na outra. As mesmas observações feitas por diferentes pessoas podem ser interpretadas de maneiras totalmente diversas. O mesmo comportamento interpretado como arrogância desrespeitosa num subalterno pode ser considerado elegante despreocupação por parte do chefe, e o que é servilismo desagradável na classe média baixa pode ser interpretado como modéstia louvável na classe alta.! O que as diferentes classes de pessoas dizem é inevitavelmente influenciado por suas respectivas posições na sociedade. Afinal, o ser humano é mais que um indivíduo: ele é membro de uma “família” muito grande clã, tribo, nação e sempre há regras importantes, embora geralmente não enunciadas, que se aplicam a toda comunicação interpessoal.

«meu eu eae [UGENE A. NIDA, estudioso da Bíblia,

Esse aspecto da comunicação dentro da estrutura social é particularmente importante do ponto de vista religioso. Pois sempre que há deuses tribais ou nacionais, essas divindades ocupam inevitavelmente posições especiais de importância na estrutura social, quer como ancestrais míticos, quer como guardiões dos padrões nguista e antropólogo, juntou-se Sociedade Biblica Americana em 243. Foi o coordenador da Pesquisa e adudho auto sé Ciidadados olicas Unidas de 1970 a 1980, Hoje continuidade ao seu trabalho de ''sultor nas sociedades bíblicas, N como em pesquisas e palestras

Furopa e na Ásia. Ele escreveu 22

Ds sobre tradução e missões.

sociais e dos costumes do povo. Uma coisa é certa: essas divindades são geralmente responsáveis pela conservação do status quo e dessa forma ajudam a regular as relações tradicionais e entre as pessoas. Por isso, a religião está sempre em oposição a qualquer ruptura com o passado, a qualquer afastamento da fé" e a qualquer presumível solapamento do prestígio da liderança tradicional. Com mais

David Riesman, Individualism Reconsidered (Garden City: Doubleday Co., Inc., 1954), p. 46.

sequência, o novo convertido ao cristianismo o sociedade predominantemente pagã irá sentir como O índio hopi que voltou para sua eia depois de ter estado na escola e recebipo batismo cristão. No primeiro dia após seu etormo, quando todos os habitantes da aldeia hram dançar e o deixaram sentado à sombra j muro da missão, ele se sentiu, como definiu gais tarde, “um homem sem pátria”,

Infelizmente, alguns métodos missionários plicados aos não cristãos envolveram a criação ke uma casta ou subcultura cristã. Na Índia, quase de modo inconsciente, alguns missionágos bem intencionados, antes da independência 4a nação, deduziram que os novos convertidos, para se tornar de fato cristãos e permanecer fiéis jnova situação, precisavam identificar-se plenapente com os missionários e com a comunidade estrangeira, Contudo, o resultado, em alguns casos, foi o desenvolvimento de um ambiente gificial, uma “estufa” na qual os cristãos india-

Tipos de estruturas sociais As estruturas sociais e as redes de comunicação que representam são muito diversificadas. Não vamos tentar fazer aqui uma análise detalhada dos diversos tipos de estruturas sociais nem um relato dos muitos fatores que dão origem a diferentes padrões de vida social. Estamos preocupados apenas com um aspecto particular da estrutura social, a saber, com aquele que é significativo em termos de comunicação interpessoal. Com esse propósito, podemos distinguir dois tipos básicos de diferenças, que se cruzam em diversos níveis, Primeiro: devemos distinguir entre os tipos de estrutura urbana (a chamada “sociedade metropolitana”) e rural (“sociedade de base”). Segundo: devemos analisar esses tipos de estrutura com base em seu caráter homogêneo ou heterogêneo. À sociedade urbana é a do habitante típico dos grandes centros, como Nova York, Londres ou Calcutá, e a sociedade rural é característica da comunidade campopos eram protegidos, mas não podiam crescer de verdade. Num certo sentido, os convertidos estavam sendo ensinados a ser pinos quadrados em buracos redondos.

Trabalhos missionários bem-intencionados is vezes fracassam na comunicação do evangeho porque a fonte adotou um papel que impede identificação eficaz com os que precisam ser icançados. Num trabalho missionário entre os índios da América do Sul, o papel dos comunicadores é o de um rico proprietário de terras. Ele pode realizar muita coisa com base em seu prestígio. Contudo, não conseguirá comunicar o evangelho de maneira eficaz ao povo que pretende alcançar porque os papéis dos participantes na comunicação impedem uma compreensão real. Esses missionários fizeram com abnegação muita coisa pelo povo, mas nesa, seja uma vila de índios perto da Cidade do México, seja uma cabana nas montanhas no norte da Tailândia.

Denominamos “sociedade homogênca” aquela na qual a maioria ou todos os membros participam da vida em comum de maneira multo semelhante. Pode haver diferenças de classe e de hierarquia de autoridade nesses grupos, mas a sociedade, não obstante, é um todo integrado, unida em torno do mesmo sistema de valores. Não é um simples agregado de subculturas com padrões de conduta diferentes. A Suécia, por exemplo, pode ser considerada uma sociedade mais ou menos homogênea, em contraste com os Estados Unidos e sua grande população heterogênea em variados graus de “assimilação”. O Peru também apresenta uma cultura ibero-americana nas cidades e uma culnunca foram capazes de fazer algo como povo. Considerando-se os papéis de proprietário de terras e de peão, jamais existirá um movimento ianificativo de comunicação nos dois sentidos sobre os assuntos mais importantes da vida. dem comunicação nos dois sentidos, não pode haver identificação.

tura distinta nas vilas do altiplano e na floresta do leste do país. Modelos diagramáticos de estruturas sociais À fim de entender mais claramente certos aspectos essenciais da estrutura social, é conveniente diagramar tais padrões sociais empregando como figura básica um diamante lapidado de cabeça para baixo.

Alta

Ah ass

Média pio Er

Baixa

Nesse diagrama Ê generalizado e esquemático, indicamos não apenas as posições relativas OS tamanhos das diferentes classes alta, média e baixa mas também algo da configuração total, Essa configuração ua ua à classe alta se afunila num grupo relativamente limitado de líderes mais destacados e que a classe baixa (que poderia ser chamada “segmento indigente da população”) é em geral menos numerosa que os membros das camadas mais altas na estrutura social,

Escolhemos arbitrariamente representar a estrutura social em três classes. Em algumas sociedades, porém, deve-se reconhecer quatro, cinco, seis ou mais classes. Em tais casos, é costume distinguir-se os grupos como classe alta superior, classe alta média, classe alta baixa, classe média baixa, classe baixa alta e classe baixa inferior. À sociedade do Haiti, por exemplo, pode dividida em cinco classes principais. À elite, que constitui a classe alta, divide-seem dois grupos, chamados “elite de primeira classe” e “elite de segunda classe”. À classe média, um trupo relativamente pequeno, está crescendo apidamente, À classe baixa divide-se em duas ategorias; uma classe baixa alta, que consiste e comerciantes abastados e fazendeiros que

HAITI DINAMARCA possuem terras; uma classe de indigentes, (yu sobrevivo com dificuldade como arrendar, e operários.

Entretanto, seria errado deixar a impressg, de que todas as sociedades diferem radicalrmea, te na configuração estrutural, de modo que s, poderiam representar os aspectos principais certas sociedades da seguinte maneira;

Às formas desses diagramas não se basehar; em dados estatísticos, pois tais dados não estã, disponíveis em termos de padrões que dent fiquem as diferentes classes, São obviamente generalizados, porém muito úteis,

Observe-se, por exemplo, que na socieda. de haitiana a classe alta constitui um grupo muito pequeno e estratificado, enquanto a sociedade quase incha na base. No diagrama da Dinamarca, a classe alta não se eleva proporcionalmente muito acima do restante da estrutura, a classe média é bastante numerosa a classe in ferior se afunila numa base de indigentes muito restrita. Já o México representa uma estrutura um pouco mais “típica”, com uma classe média crescente, uma classe alta um tanto reduzida e o grosso da sociedade na classe baixa, embora não coma proporção que caracteriza o Haiti, Comunicação dentro das estruturas sociais O significado da estrutura social para a comunicação pode ser resumido em dois princípios básicos: 1) as pessoas se comunicam mais com os membros da mesma classe, isto é, a comunicação interpessoal de natureza recíproca é essencialmente horizontal; 2) a comunicação influente parte da classe alta em direção às classes mais baixas, e essa comunicação que revela ascendência ocorre em geral numa única

MÉXICO

Média Sato) poder ali

Baixa

Alta Alta

EfPr sa q Média

Média a

Baixa Baixa direção e tende a existir principalmente nos «tu pos adjacentes.

Contudo, a comunicação verdadeiramente eficaz não é unidirecional. Tem de haver recias classes inferiores. Em troca da parceria no controle da sociedade, eram concedidos muitos benefícios à classe alta, até mesmo os melhores serviços religiosos profissionais recursos para procidade ha comunicação (que podemos chamar feedback ou “resposta” social), ou os resultados poderão ser insatisfatórios.

Tanto no ministério quanto na obra missionánia, é comum o profissional da religião ocupar-se mais da comunicação oral da mensagem. Não raro o pastor ou o missionário considera-se unicamente o intermediário de uma mensagem superior de Deus, por isso não toma conhecimento nem depende das reações e respostas que vêm da congregação. Ele está ali para contar a verdade ao povo, não para ouvir as ideias do povo sobre a verdade. Se essa atitude for levada a extremos, a mensagem inevitavelmente se torna irrelevante. Embora a mensagem seja verdadeira, ela não alcança o receptor, poiso “dono da casa” não conhece as condições em que os servos vivem e trabalham, e, mesmo que conheça, a comunicação só será fortalecida se Os ouvintes estiverem convencidos de que ele sabe e entende.

a educação dos filhos. Além disso, a liderança eclesiástica pertencia, em geral, à classe alta (o papa João XXIII foi uma notável exceção),

O método típico católico romano pode ser representado da seguinte maneira:

Segmento de concentração di

N Média

Er ato PRTRIO

Baixa

À área sombreada indica a classe com a qual q Igreja Católica Romana se identificou primeiro, e as flechas indicam a direção do controle (para baixo) e as pressões opostas (para cima).

Na América Latina, onde a Igreja Católica Romana ainda domina a estrutura social é política da sociedade, a maior parte da oposição ao

Método de comunicação com a sociedade urbana Nos métodos de comunicação com as diversas sociedades, houve, num passado recente, três apos principais de orientação, que podem ser denominados “católico romano”, “comunista” e protestante”, embora se deva desde já advertir contra a tendência de se identificar um “método missionário" com alguma estrutura institucional em particular. Não obstante, essas diferenças, conforme veremos, refletem de modo gerala maneira como a maioria dos católicos romanos, comunistas e protestantes influenciaram de modo significativo as estruturas sociais.

No método católico romano, dava-se maior atenção à classe alta, embora, em alguns casos, Um largo segmento da sociedade tenha sido alcançado. À tendência, entretanto, era a Igreja Católica Romana identificar-se com a lide= rança da sociedade e por meio dela influenciar controle concentrado na classe alta e no clero vem dos membros da classe média alta, que vê na coalizão entre a rica aristocracia latifundiária ea Igreja uma ameaça às ambições de melhorariana condição social, Portanto, os líderes da classe média que tiveram seus planos frustrados costumam disputar a lealdade das classes mais baixas, especialmente os elementos mais agressivos da classe média alta. As revoluções, de tempos em tempos, têm derrubado o controle clerical. Esse tipo de revolução já ocorreu em todas as nações católicas romanas independentes da América Latina. Contudo, os líderes dos movimentos liberais, depois de ganhar a revolução, quase sempre fracassam em reorganizar a sociedade com um novo conjunto de valores. Por causa do vácuo resultante, a Igreja Católica Romana acaba retornando não com o mesmo grau de controle, contudo exercendo uma atração maior sobre as massas que abandonaram seus antigos senhores.

À técnica comunista de se insinuar numa sociedade consiste em isolar um segmento das classes média baixa, geralmente a classe média baixa e a classe baixa alta, Nesse segmento, é comum haver um pequeno grupo de intelectuais frustrados de classe média, os quais podem ter sido impedidos em suas tentativas de ascensão social ou representar a minoria incapaz. Esses intelectuais se unem aos elementos da classe baixa, estes bastante sofridos nos aspectos econômico, social e político, e assumem a liderança da revolução. A ex-classe alta tem de ser então liquidada, ou por meio do confisco,a fim de destruir seu poder econômico, ou pela destruição física, ou pela lavagem cerebral. Os aspectos principais desse processo podem ser assim representados:

Média

SIA lie é Na à

Baixa

Comunicação e estrutura,

A elevada possível, naturalmente devem tud, que possuem ao partido, não a realizaçõe, 4 antecedentes pessoais. Por isso, são muito e; obedientes no partido do que seria de Sera, pois a expulsão do partido significa não Um movimento mais ou menos horizontal, Com em nossa sociedade, mas uma dura perda de privilégios e posição social, Todo esse contr, le centralizado se torna possível na sociedag, moderna por causa da natureza especializas, da comunicação e do transporte, por Mcio dy, quais um grupo relativamente pequeno de pe,. soas pode controlar milhões. Já não há mai, qualquer possibilidade de rebeliões bem-suçe. didas iniciadas a partir das bases.

O atual método protestante de influenciar a sociedade, especialmente em seus aspectos missionários, é totalmente diferente da orien. tação católica romana e da comunista. Deve-se reconhecer que, no passado, os avanços protestantes estiveram intimamente relacionados com os vastos movimentos sociais políticos no norte da Europa, nos quais as mudanças no rol de membros das igrejas foram consideravelmente influenciadas pela lealdade a certos

Tendo assumido a liderança, a nova classe alta, composta pelos membros do partido e por determinados técnicos, estabelece então uma pesada barreira entre ela e a classe média. À liderança não é recrutada na classe média (exceto no caso de certos técnicos que podem trabalhar para O Estado); as decisões e o controle da comunicação continuam sendo exercidos príncipes e governantes. Contudo, também é possível atribuir um significado exagerado às ações pessoais dos reis e esquecer que eles refetiram, bem como influenciaram, os acontecimentos que precipitaram a ruptura com à Igreja Católica Romana.

Contudo, se formos julgar o método protestante de influenciar a sociedade, conforme evidenciado no campo missionário em certos aspectos de importantes movimentos protespor uma elite, que recruta seus membros nas classes média baixa e baixa alta. Por exemplo, na Alemanha Oriental, durante os últimos anos, os alunos mais brilhantes, filhos de profissionais da classe média, eram discriminados na obtenção de oportunidades para progredir nos estudos, enquanto os filhos menos inteligentes dos operários recebiam tratamento preferencial.

Às pessoas selecionadas de acordo com esse sistema e que, por serem membros do partido, pularam da condição de classe baixa paraa mais tantes na Inglaterra e nos Estados Unidos (por exemplo, o desenvolvimento do metodismo), podemos dizer que os protestantes concentraram seus esforços no segmento da sociedade representado pela área abaulada do diagrama, isto é,nas classes média baixa e baixa alta como, em certo sentido, fizeram os comunistas. Em regiões como a América Latina, por exemplo, os membros das classes média baixa e baixa alta geralmente têm pouco a perder, identificando-se com a causa protestante, uma vez que pertencem a um grupo socialmente “deserdado”. Mas na verdade sentem que têm muito a canhar, isso sem levar em conta os benefícios que creem derivar de um relacionamento pela mediação de uma pessoa ou instituição. Esses beneficios suplementares geralmente envolvem oportunidades de educação para os filhos, assisrência médica para si mesmos e suas famílias, um novo senso de dignidade e o sentimento de pertencer à uma comunidade interdependente e mutuamente prestativa. Os mais destacados aspectos desse desenvolvimento podem ser representados da seguinte maneira (mas observe que neste diagrama a flecha indica o sentido de mobilidade);

ENDPISU APTE VERÃO: Ê

Rib hreade 1h he =X romano. À atração mais forte foi exercida sobre asclasses média baixa e baixa alta, e mesmo sobre alguns elementos das classes mais baixas, especialmente os mineiros. Esse movimento, entretanto, é característico das classes média alta e alta baixa. Nos Estados Unidos, o metodismo experimentou o mesmo tipo de movimento para cima, mas com uma interessante série de sucessivas ondas de movimentos relacionados, Essas “ondas” procuraram alcançar os que eram deixados para trás ou negligenciados e que, à medida que eram alcançados, subiram na estrutura social. Conforme os metodistas subiam, alguns grupos, como os nazarenos, safam em busca daqueles que “haviam ficado para trás”, e, conforme os nazarenos subiam, os diversos grupos pentecostais atrafam as classes mais baixas.

Os programas missionários protestantes para alcançar os intelectuais nos diversos países Made são realmente de muito valor, e por certo as classes altas não devem ser negligenciadas, pois também são objeto do amor de Deus. Não obstante, deve-se também reconhecer explicita-

Deve-se observar que o grupo assim formado tende a ter um movimento para cima. Essa mobilidade para cima resulta quase inevitavelmente de um sentido maior de responsabilidade pessoal, acúmulo de capital (pois o convertido já não gasta tanto dinheiro em certos “prazeres” proibidos), preocupação crescente com a educaçãoea valorização desta, uma nova atitude para com o trabalho, considerando-o uma virtude (parte da “ética protestante”), e oportunidades de expressão de liderança dentro da comunimente que não poucas vezes os líderes adotam à religião das massas, como destaca Donald McGavran,* bascando suas observações nas análises de Arnold Toynbee.

Para nossa tese de que os protestantes se aproximam das classes média baixa e baixa alta, há uma exceção evidente. Na India, os miss1ONÁrIOS protestantes concentraram a atenção nos párias e receberam notável resposta da parte deles. Há dois motivos importantes para o êxito missionário entre esses grupos e para à dade protestante.

Contudo, essa mesma mobilidade para cima "tende a separar as pessoas envolvidas dos própros grupos dos quais saíram. O movimento metodista na Inglaterra foi uma aproximação protestante típica das camadas inferiores da estrutura social. Surgiu como uma reação contra à estrutura mais ou menos autoritária do sistema religioso britânico, herdada do catolicismo

The Bridges of God (London: World Dominion Press, alta qualidade de liderança demonstrada por muitas dessas pessoas. O primeiro é que essas pessoas tinham tudo a ganhar e nada a perder por se identificar com a religião estrangeira, considerando que, para todos os propósitos práticos, eles estavam excluídos do próprio hinduísmo. Ao mesmo tempo, os párias não eram um simples aglomerado de indigentes que, por não ter conseguido se sair bem em alguma coisa, 1955), p. 120.

finalmente ficou à deriva nos grupos rejeitados. Ao contrário, muitos deles vieram de grupos nativos que eram forçados a executar tarefas que os tornavam cerimonialmente impuros e, portanto, excluídos do ritual hindu, Outros tornaram-se párias porque transgrediram os tabus. Esses rejeitados, apesar de seu destino miserável, não são mero lixo da sociedade, e sim uma classe religiosamente excluída que contava com muita gente de talento e de capacidade fora do comum, conforme demonstraram quando se lhes deu oportunidade.

Um motivo para a falta de atrativos do protestantismo nos muitos elementos da classe estritamente indigente que não é só pobre, mas também satisfeita com sua condição social é que ele exige um padrão muito elevado de responsabilidade pessoal, enquanto, ao mesmo tempo, falha em ajustar seu método aos diversos grupos sociais. Além disso, a igreja protestante recebeu das classes indigentes e desgarradas poucos elementos capazes de liderar c assim atrair outros membros de grupos semelhantes.

quase independentes de influências EXtery,, Esses grupos, que possuem leis próprias, Me bem homogêncos, com pouquíssima divisã,, do profissões, exceto entre os sexos. Na verdade grupos estritamente primitivos nesse se. tido são raros nos dias de hoje, Em geral consistem de pequenas tribos na Amazônia, Nova Guiné e em certas partes mais isolada, da África. As sociedades chamadas “primiti. vas”, como as tribos indígenas do México dy altiplano da América do Sul, são basicamente “camponesas”, isto é, sociedades dependentes, Muitas tribos africanas ao sul do Saara grupos nativos da Índia, do sudoeste da Ásia e na: ilhas do Pacífico, estão rapidamente se tornand,, dependentes também, embora ainda em fase de transição. O rápido desenvolvimento dos transportes e da comunicação e a exploração econômica das áreas e populações “primitivas transformaram vários desses povos de sociedades independentes em sociedades dependentes,

Uma sociedade comunitária ou campesina típica não depende apenas economicamente dos centros urbanos. Quer dependa da área de mi-

A estrutura das sociedades básicas neração ao redor de Lubumbashi (ex-Elizabethville), no Zaire (República Democrática do

Diante das sociedades urbanas, as sociedades rurais, campesinas e básicas primitivas apresentam certos contrastes marcantes. Há, naturalmente, muitas diferenças importantes entre, por exemplo, uma pequena comunidade rural das montanhas do Kentucky, no interior dos Estados Unidos, e uma vila do norte do Zaire. Não obstante, certos aspectos significativos são característicos da maior parte dos agrupamentos não urbanos, esses aspectos são particularmente relevantes aos problemas da comunicação.

De modo geral, há dois tipos principais de sociedades básicas: comunitária e primitiva. À comunitária é um tipo de sociedade que depende do centro urbano, recebendo dele consideráveis benefícios e também contribuindo muito para ele, especialmente com matéria-prima. Jáasociedade primitiva é também um agrupamento estritamente básico, de estrutura flexível ou rígida, mas sua orientação e sua economia são

Congo), quer envie seus produtos a uma cidade influente como Cuzco, no Peru, ela vive também na dependência cultural dos centros urbanos de prestígio, que irradiam tantas influências. Em contraste com a sociedade urbana, grande, heterogênea e impessoal, com sua moral frouxa, vida mais amena, atitudes seculares e modos agressivos, a sociedade campesina ou comuntária é pequena e bastante homogênea, havendo relacionamentos profundos entre seus membros, Tem modos mais brandos e passivos e evidencia fortes conceitos da moralidade tradicional, capacidade de resistência física e profundos sentimentos religiosos. Em tal sociedade, todos se conhecem e também sabem fatos sobre a vida particular de cada um na verdade, nada fica oculto aos olhos curiosos e atentos dos vizinhos. Há pouquíssima codificação formal da lei, mas os costumes são geralmente seguidos com lealdade quase fanática. De modo geral, o povo é mais honesto, especialmente no grupo fechado sociedade rural com a qual seus membros

«dentificam), mas também adotam uma atià mude mais defensiva em relação às influências ternas, sendo mais propensos a desconfiar de qotivações ocultas e a reagir de maneira cegae cecalaitrante, Sob alguns aspectos, as sociedades comunitárias há muito estabelecidas (embora casamento, consistindo de clãs, aldeias, grupos de clãs e outras formas de divisão e dependendo da forma particular que qualquer estrutura social possa assumir,

O vértice do diagrama indica a liderança de um grupo pequeno, os anciãos da sociedade, que formam um controle oligárquico, mas que também, conforme sugerido pelas linhas tracenão sejam “sociedades transicionais”) são mais resistentes às mudanças que os grupos estritamente primitivos, aos quais o mundo exterior é menos familiar. Além disso, a sociedade popular já descobriu que a única defesa contraa assimilação do mundo exterior é resistir, pasjadas, representam individualmente suas filiações familiares, Uma sociedade assim apresenta forte sentimento de unidade e uma frente mais ou menos uniforme contra os intrusos, Ela tem de ser conservadora em sua orientação, a fim de se preservar, De modo geral, toma decisões civa, mas obstinadamente, a qualquer alteração patrocinada pelo grupo de fora (o agrupamento social do qual não faz parte), Esse fato explica parcialmente por que os missionários protestantes costumam obter maior êxito quando lidam com sociedades primitivas, como as da África, que com sociedades como os índios andinos, na América do Sul, cujos padrões de resistência foram cristalizados em oposição às ameaças de domínio pela cultura dos centros urbanos, patrocinada pelos brancos.

Em contraste com a estrutura do diamante de cabeça para baixo com divisões entre as classes na linha horizontal, típico das culturas urbanas, as sociedades populares e, até certo ponto, as sociedades urbanas primitivas também podem ser representadas como formas piramidais de base larga, com divisões grosseiramente paralelas, em vez de divisões transversais:

coletivas, não por meio de alguma técnica parlamentar formal, mas de discussões informais etroca de opiniões que caracterizam a maioria das “decisões de família”, À propagação eficaz das informações em tal sociedade não ocorre em eixos horizontais ou verticais (como em nossos diagramas anteriores), e sim entre os relacionamentos dentro das famílias e dos clãs. McGavran destaca a necessidade de utilizar esses canais eficazes de comunicação como “pontes de Deus”. Métodos de comunicação com a sociedade básica (Os métodos pelos quais podemos alcançar melhor os membros de uma sociedade urbana são bem evidentes para nós, porque a maioria de nós pertence a esses agrupamentos sociais. Já os melhores métodos para se comunicar com

7 Na uma sociedade básica são, pelo mesmo motivo, estranhos para a maioria de nós, uma

À pirâmide nesse exemplo é bem larga na base, pois de modo geral as diferenças entreos que lideram e os liderados não são grandes. Ao mesmo tempo, não há classe alta, média e baixa nem subdivisões, Antes, a estrutura da sociedade divide-se essencialmente em grupos familiares relacionados entre si pelo nascimento ou por "Op. cit.

vez que os relacionamentos e as estruturas sociais e de comunicação nos são pouco familiares. Contudo, uma vez que reconheçamos a estrutura fundamental de tais sociedades, constatamos que os métodos mais bem-sucedidos nessas sociedades são os que aproveitam o fluxo natural da comunicação. Os princípios básicos de tal abordagem são quatro: 1) a comunicação eficaz baseada em amizade pessoal;

2) a abordagem inicial concentrada nos que podem passar adiante e com eficácia a mensagem dentro de seu agrupamento familiar; 3) tempo para a difusão intema das novas ideias; 4) desafio a qualquer mudança de crença ou ação dingido às pessoas ou aos grupos socialmente capazes de tomar tais decisões,

Numa sociedade básica, é essencialestabelecer uma base pessoal de amizade e aceitação antes que a comunicação se tome eficaz, No Peru, um notável missionário de épocas passadas, John Ritchie, que foi um instrumento para a criação de mais de 200 igrejas entre a população indígena, estabeleceu como regra invariável jamais visitar uma vila a não ser por convite pessoal, Ele á ia à casa do habitante É da vila que o convidara e ali permanecia dois ou três dias. Ele jamais se dirigia a uma comunidade indígena para “evangelizar” sem ser anunciado ou aguardado, pois havia chegado à conclusão, com base em anos de experiência, que o procedimento Re, q de aparecer sem convite era absolutamer,, saconselhável em tais comunidades, O Ina convertidos podiam fazé-lo, pois sempre um modo de estabelecer algum FElaciO nam, to de “Família ou clã” com os habitantes, tr, o missionário, um estranho 40 BTUPO, sem, que sua mensagem se tornaria aceitável ao, apenas se ele fosse pessoalmente “patrocinas, porum morador da vila, Seu hospedeiro tido necessariamente um cristão tinha de e, alguém interessado nas boas novas à suficie. te para fazer do missionário seu hóspede, 7, método também significava que haveria posso, ounenhum perigo de outros habitantes Org zarem um ataque para expulsar q Missiondr, pois como hóspede de um membro da ô,

Cómim. nidade, ele estava relativamente imune 4 hose;. lidade religiosa. O propósito básico do Métid, de aproximação por meio de convite não entretanto, obter proteção pessoal, e sim realiza, em uma comunicação eficaz.

Os convites para visitar novas vilas não eram jficeis de obter, pois os interessados, crentes ou ado, ganham parentes amigos em outras vilas, que invariavelmente passavam adiante à notícia 4a notável novidade, Além disso, 0 povo ficava abendo que o missionário não tentaria scimpor ninguém, mas, de acordo com o costume dos indios, se aproximava deles apenas com base na amizade, e não como um político em campaaha ou como um agitador levado por motivos duvidosos. Tornou-se, assim, uma questão de honra para os líderes das diversas vilas convidar O missionário a hospedar-se na casa deles, enquanto ele transmitia a mensagem sobre o que Deus havia feito por todos os povos, até mesmo pelos índios do altiplano que falavam a língua quíchua,

O segundo princípio, e talvez o mais importante, a ser seguido na aproximação de tal comunidade é dar o primeiro passo na direção daqueles que são capazes de passar a comunicação adiante de maneira eficaz. Em alguns exemplos, o missionário é capaz de atrair a atenção do chefe da tribo, Nos Estados Unidos,o “missionário” rural pode obter o apoio do fazendeiro mais rico da região, Entretanto, o apoio irrestrito do “homem mais importante” nem sempre é obtido de imediato, pois os líderes de uma sociedade básica são em geral vagarosos em tomar a dianteira de seu povo. Na verdade, à posição de liderança de um homem numasociedade básica depende mais do apoio íntimo e inteligente de seus seguidores que a de um líder de uma sociedade urbana impessoal, onde “o dinheiro fala mais alto”. Assim, o chefe ou cabeça de tal sociedade tende a ser cauteloso diante das novidades, pois a própria sociedade é conservadora, e o líder costuma ser mais tradicional que a maioria das pessoas. Em tais sociedades, a força jaz no conservadorismo. Por essa razão, os que obtêm sucesso em influenciar os elementos das sociedades populares devem Isso ao fato de terem se aproximado de uma pessoa-chave próxima do líder máximo, mas clá, ainda não Assumiu 4 responsabilidade como ancião do povo, Esse indivíduo geralmente possui personalidade forte, é amado pelo povo sente que o patrocínio de novas ideias pode beneficiá-lo socialmente, Contudo, cabe aqui uma palavra de cautela, Deve-se reconhecer que uma pessoa marginalizada em sua cultura não será útil para esse propósito, À posição social de tal pessoa pode significar que ela caiu no ostracismo por causa de alguma afronta à líderança tradicional ou que transgrediu os padrões éticos do povo, Pode significar que seja agora um estranho para a sociedade básica, mas que se apega a ela como um parasita porque recebe benefícios econômicos em seu contato com à sociedade popular.

Enquanto em nossas igrejas pensamos em termos de programas dinâmicos de elevada motivação, com o objetivo de obter resultados da noite para o dia, o método para lidar com as sociedades básicas deve ser de um tipo bem diferente, As pessoas que vivem num sistema tradicional, experimentando segurança emocional satisfatória no seio de sua “família maior”, a qual se mantém basicamente pela resistência às ideias do mundo exterior, não podem ser forçcadas a tomar decisões rápidas. Confrontadas por um “programa de impacto”, sentir-se-ão inclinadas a rejeitá-lo de imediato, Assim como uma família precisa de tempo para tomar uma decisão, deve-se apoiar com cuidado uma sociedade básica até que seus membros estejam prontos para agir. À essa altura, surge um problema delicado, pois a tendência do missionário é incentivar algumas pessoas especialmente receptivas a tomar logo uma decisão, a repudiar as tradições de sua tribo e a se declarar a favor de Cristo. Esse procedimento não raro faz com que o povo como um todo rejeite a mensagem, pois, até que estejam preparados para tomar uma decisão definitiva, qualquer atitude que implique a retirada de membros do convívio de uma sociedade fechada imediatamente despertao temor da perda de solidariedade. Segue-se não do líder propriamente dito alguém que, embora seja respeitado dentro de sua famíliaou uma resistência instintiva contra um ataque à sua coesa estrutura social. De longe, o trabalho mad eficaz entre as sociedades comunitárias tem sido realizado por pessoas sensíveis ao “momento apropriado” para as primeiras conversões, Dar tempo suficiente para à tomada de decisões éo terceiro princípio indispensável à comunicação Com as sociedades básicas,

Num trabalho excepcional entre os índios da América Latina, fiquei surpreso ao descobrir, quando visitei a região, que o missionário jamais fazia apelos públicos para as pessoas “aceitarem a Cristo”, Eu esperava que a origem ca formação do missionário o induzissem a esse tipo de método, Quando Jhe perguntei por que não usava esse método, ele explicou que jamais fizera tal tipo de convite porque tinha certeza de que inúmeros Índios tomariam uma “decisão” pública não tanto por convicção pessoal, mas pelo desejo de agradá-lo, Além disso, tentava manter-se bem perto do povo para perceber quando o Espírito de Deus agia na vida de alguém. Desse modo, ou a pessoa o procurava por iniciativa própria, ou ele arranjaria uma oportunidade de, numa conversa amiga e natural, sem os enfeites evangelísticos da pressão de grupo, levá-lo a uma decisão real por Cristo. Essa obra, embora não seja espetacular, está bem fundamentada e cresce rapidamente e continuará se expandindo nos próximos anos, pois

É como se convidássemos à filho do Vibisba, para passar um dia na prata com nossa fáruS e sem consultar os país dele, Sua resposta bro. diata será: “Vou perguntar à minha mãe, My verdade, a atitude correta seria fazer 0 erva diretamente à sua mãe, para que ela tosa conhecimento das condições e também da vera cidade do convite, Algo semelhante ocorre tras culturas básicas, onde os indivíduos não ages por conta própria, mas reagem como meira de famílias, clãs e tribos,

A reação de grupo à mensagem do evasgelho é o que está no cerne dos chamadas “movimentos de massa”, denominados “rugámentos populares” por McGavran, Ele defegde, e com razão, a valoração mais racional dz estrutura das sociedades nas quais as pessoas agem como grupo, Ele insiste, portanto, em que o processo de cristianização seja dividido entre o “discipulado” inicial e a instrução posterior é que a importância do compromisso inicia) dzs pessoas com um novo estilo de vida seja plenamente reconhecida e estabelecida como base, Às razões que levam a essas reações em massz não devem causar mais suspeitas que 05 motivos muitas vezes obscuros que incentivam os membros de uma sociedade urbana a se declarz: por Cristo, apenas para se descobrir maís tarde conquistou seu lugar na vida da tribo.

O quarto princípio para se aproximar das sociedades básicas é apresentar o desafio deuma mudança de crença a pessoas socialmente capazes de tomar decisões válidas. Nós, que desconhecemos o significado da vida do clã, uma vez que não somos membros de tal sociedade, mal podemos imaginar as pressões de tal organização sobre o indivíduo. Temos por certo que qualquer pessoa pode e deve tomar suas decisões sobre o que crê e sobre o que deve fazer, masisso não acontece em todas as culturas. Os memque eles se comprometeram mais do que havíam imaginado, Em qualquer um dos casos, 9 compromisso inicial do grupo ou do indivíduo fornece a base pela qual pode ser ministrada 2 instrução na fé e a plena maturidade do discpulado cristão pode ser alcançada. O problema das sociedades heterogêneas As sociedades heterogêncas são principalmente de dois tipos: sociedades urbanas que contém grupos minoritários estruturados dentro das cidades, semelhantes, por exemplo, à subculbros da sociedade básica sentem uma lealdade instintiva para com a unidade familiar maior. O indivíduo recebe ali segurança pessoal e social e lhe dá apoio completo, muitas vezes sem pensar. Mesmo um adulto pode achar impossível romper com tal unidade familiar.

tura negra dentro da vida norte-americana; sociedades urbanas que contêm subsociedades básicas.

No primeiro tipo, é preciso reconhecer três fatores: 1) as diferenças básicas, em razão das quais a pessoa, apesar de todo o seu idealismo, uferença de prestígio, que significa que a amo em grupos de menos prestígio tentam ai ou pensam que estão seguindo as motimas 15 É napo mais prestigiado; 3) a prioridade da “qunicação dentro do grupo, a fim de se oba uma comunicação eficaz. O relacionamento a sro dois grupos de estrutura urbana dentro k ama única sociedade pode ser representado q seguinte maneira:

Cidade do Macs mustro mute desesperadora é em geral meénoa recepth pa 4 inda efetiva que os fdros de muntas tribos das regiões certas do país.

As sociedades comunitárias incluídas cos fumam ser consideradas diferente s de aleturs forma, de suas vizinhas urbanas, especrmlmente quando falam outro idioma e romipas diferenciadas. Contudo, quase não se reconhecem em tais sociedades enfoques diferentes em

Média “SÍ relação à vida ou estruturas que obedeçam a diretrizes estranhas à sociedade urbana nem o fato de que a comunicação com elas tenha de ser formulada e transmitida de modo especial

PAM

No segundo tipo adro principal ao de sociedade heterogênea, à ESENTNA urbana dominante inclui ao ETUPO IHIOERAFEO SIS De VIDA sociedade de tipo básico. Uma Situação típica dessa espécie pode ser ilustrada no seguinte diagrama:

para que seja relevante.

Quase sempre, os esforços missionários fracassam em reconhecer a necessidade de elaborar métodos diferentes para as sociedades urbana e comunitária, juntando-as num único bolo sem considerar as diferentes estruturas. Os motivos prováveis para essa falta de distinção é que os miccionásios anitditanas sé enganam, pensando que as áreas urbana e rural no estrangeiro se assemelham às áreas correspondentes nos Estados Unidos. Ainda que os americanos que vivem em pequenas cidades e em comunidades rurais apresentem várias características típicas da comunidade básica, os fazendeiros nos Estados Unidos não são de modo nenhum “campone-

Diversos aspectos significativos desse diagrama devem ser reconhecidos. Primeiro: o grupo básico incluído poderá penetrar na classe média, se levarmos em conta os recursos econômicos e o prestígio geral. Segundo: o segmento inferior do grupo básico incluso geralmente não é tão baixo quanto o da cultura urbana, pois de modo geral os pobres das favelas urbanas encontram-se em circunstâncias muitíssimo piores que os pobres das comunidades rurais menores. Sem dúvida, isso se aplica, por exemplo, aos índios pobres do altiplano da América do Sul, em comparação com a população indigente urbana.

ses Exceto o povo de algumas comunidades muito isoladas, nas regiões montanhosas, sua cosmovisão, seu padrão de valores, seu comportamento em geral diante da vida e suas oportunidades educacionais são substancialmente idênticas às dos habitantes da cidade. Existe hoje diferença entre o “caipira” e o “malandro”, mas, exceto em alguns casos muito restritos, na vida americana não existe cultura campesina, caracterizada pela estrutura familiar e relacionamento de clã, pelas atitudes tradicionalistas e pela resistência a mudanças. Algumas dessas tendências existem, mas não são de modo algum tão acentuadas nem tão significativas como numa verdadeira cultura campesina.

Entretanto, quando um americano reside num país estrangeiro, ele se inclina a julgar todas as situações pelos padrões de seu país. Ele não analisa o significado dos contrastes existentes, porque seus olhos não foram abertos para isso. Portanto, ele engloba todos os grupos como um só, ignorando as diferenças básicas. Contudo, se ele quiser ser bem-sucedido na comunicação, precisará reconhecer as distinções queexistem entre as diversas classes de pessoas e tornar sua mensagem aplicável a cada circunstância e transmissível através de suas redes tradicionais de comunicação. Cada classe ou subcultura deve ser alcançada dentro de seu contexto de vida, e, na medida em que sejam interdependentes, os cristãos entre eles devem ser ajudados a reconhecer suas responsabilidades. Princípios de comunicação e estrutura social À vista do fato de o contexto social não afetar apenas o modo como as mensagens são transga estrutura social é bem evidente. Contudo, acontece entre o povo huichol, no México Pi esclarece algumas questões. Um jovem ham Roman Diaz, que se tomou cristão há aj. anos, interessou-se pela evangelização de vizinhos. Com a orientação do missionário se tomou muito útil ao seu povo, pois dy deu a ministrar alguns remédios simples Par, enfermidades facilmente diagnosticáveis, E. distribui remédios e criou a reputação de ser lim novo tipo de “curandeiro”, Quando as Pessoa, vêm consultá-lo, ele usa a rotina do curandeir, tradicional, que nunca trata de um paciente menos que, depois de conversar com ele duran. te uma hora ou mais, tenha estabelecido qu, o parentesco, por nascimento ou casamento existente entre eles. Os huichols são uma ty;. bo relativamente pequena, com longa tradiçã, de casamentos restrito ao seu grupo valor. zação da genealogia, de modo que, mais cedo ou mais tarde, alguém acaba descobrindo sey relacionamento com todos os outros membros mitidas, mas também envolver a maneira pela qual são decodificadas, a codificação das mensagens só poderá ser feita de maneira eficaz quando esses fatores sociais na comunicação forem levados em conta. Os princípios básicos que podem ser obtidos deste estudo da estrutura social talvez possam ser resumidos da seguinte maneira: 1. À reação à pregação do evangelho pode às vezes refletir uma situação social, muito mais que uma convicção religiosa. 2. A oposição à comunicação da mensagem cristã pode ser em muitos casos mais social que religiosa. 3. Alterações na estrutura social podem alterar a visão religiosa do comportamento. 4. À comunicação eficaz segue o padrão da estrutura social. 5. Um testemunho relevante irá incorporar estruturas sociais autóctones válidas. O fato de a comunicação eficaz, em qualquer contexto social, inevitavelmente acompanhar a da tribo. Depois de descobrir os laços sociais, o “curandeiro” diagnostica a enfermidade e receita os remédios, os quais então administra Os pacientes quase sempre ficam alguns dias por perto, para ver se melhoram ou se precisam de mais tratamento, Durante esse tempo, o “curandeiro” cristão conversa informalmente com todos os que o quiserem ouvir. Além disso, grande parte da instrução é dada na forma de canções tradicionais, que possuem forte conteúdo teológico e didático. Pouco a pouco, ele está provocando mudanças significativas num grupo bastante “resistente”. Do ponto de vista da comunicação, seus métodos são mais eficazes do que os de um médico estrangeiro típico, que monta uma clínica e, como especialista, deixa toda a instrução religiosa para os que são “formados em teologia”. Na cultura huichol, a cura c a religião andam juntas, e a instrução religiosa, para que seja aceita, tem de ser ministrada pelo próprio “curandeiro”.

Uma igreja eficaz sempre incorpora em sua estrutura as formas autóctones válidas de organização social. Isso não é sincretismo: é 0

ÇEsSO do tornar autóctones Os meros mva: a necessários de fazer relevante à meénq. ER im do evangelho em qualquet comunidade. are Revburn, numa análise de determinada gaÃo do Equador, na América do Sul, esboça fios aspectos sociais da cultura quíchua que dem set proveitosamente incorporados no emunho evangelístico de toda a comunide: 1) uso de grupos consanguíneos (incor«ofando o sistema de padrinhos e madrinhas A igreja protestante), 2) escolha dos chefes das festas), So áia certendntrs mese elgbanr ita, como 6 batemos é a cxcarento Cura ves que são hoje tão importantes no stetera religiosa do “paganiemo crietão 4) parr cinro de teste sem consumo de álesal (coma meia legitimo de expressão social é de solidariedade comuni tária);5) desenvolvimento de comperativas pur empreendimentos de grupos (padrão tradicional da vida comunitária indígena, que poderia ser aplicado com resultados positivos ma começe gação cristã).

famílias como líderes da igreja (esse é o atual esquema de vida indígena, na qual os chefes Jas famílias são responsáveis por diversas funções negócios da comunidade, até mesmo as

Applied Anthropology among the Sierra Quechua of

Perguntas

Às pessoas integram-se de tal forma à estrutura social na qual vivem que apenas dentro dela e por meio dela podem ser alcançadas e viver sua fé. Ecuador, Practical Anthropology, n. 1, p. 21, 1953. para estudo

1. Faça uma comparação entre os padrões necessários numa sociedade urbana e os de tomada de decisão e as técnicas de comunicação elementos imprescindíveis numa sociedade básica.

2. Nida afirma que, em geral, como um só, ignorando as essa tendência.

o missionário americano no estrangeiro “engloba todos os grupos diferenças básicas”. Apresente algumas possíveis explicações para', 81 from cursos where slug = 'perspectivas';
-- Lição 11: o Parshall entra antes do McGavran, que já estava lá
do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 84;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — Parshall, cap. 97: Indo longe demais?', 'Phil Parshall

PHIL PARSHALL trabalhou como missionário pela SIM (Servindo em Missões) durante 44 anos em Bangladesh e nas Filipinas. Ele é autor de nove livros sobre islamismo, entre eles The Cross and the Crescent: Understanding the Muslim Heart and Mind [A cruz e o crescente: como entender o coração e a mente do muçulmano], Bridges To Islam: A Christian Perspective on Folk Islam [Pontes para o islamismo: uma perspectiva cristã do islamismo popular] e Muslim Evangelism: Contemporary Approaches to Contextualization [Evangelismo aos muçulmanos: abordagens contemporâneas para contextualização].

Extraído de Evangelical Missions Quarterly, v. 34, n. 3, out. 1998. Usado com permissão.

Phil Parshall Ee pes enenos estava falando a um grupo de jovens muito moivados para evangelizar os muçulmanos. Entusiasmados, eles me contaram de um missionário que havia compartilhado com eles um novo modus operandi para ganhar os filhos de Ismael para Cristo, A estratégia baseava-se no evangelista cristão que, declarando-sc muçulmano, participa do sa/at, ou seja, das orações islâmicas oficiais dentro da mesquita. O missionário ilustrou o conceito, mencionando dois cristãos asiáticos que haviam entrado recentemente com uma ação legal para, oficialmente, se tornar muçulmanos. Isso foi realizado para que se fizessem muçulmanos aos muçulmanos, com o intuito de levar muçulmanos a Cristo.

Na verdade, receber uma identidade muçulmana e fazer orações na mesquita não é uma estratégia nova. Todavia, tornar-se legalmente muçulmano leva o empreendimento missionário a um território desconhecido. Essa é a questão que abordarei, com um senso de profunda preocupação.

AO uuuuusu RaGasC a RnaEa PHIL PARSHALL trabalhou como missionário pela SIM [Servindo em Missões) durante sa anos em Bangladesh e nas Filipinas. Ela é ator de lave INics cobre islamismo, entre eles The Cross and the Crescent: Understanding

Contextualização gradual John Travis (pseudônimo), missionário de longa data entre muculmanos na Ásia, formulou uma simples categorização para as etapas de contextualização dentro do movimento para alcançar os muçulmanos. Ele define seus seis C''s como “espectros de plantação de igreja RITA em ambiente transcultural”. é

Há alguns anos, um famoso professor de islamismo deu a entender que minha crença era de que o muçulmano convertido the Muslim Heart and Mind [A cruz e o crescente: como entender 0 Coração e à perma do muçulmano), al ado ãs para islamismo: 0 uma perspectiva cristã do islamismo popular] e Muslim Evangelism: Contemporary Approaches to Contextualization Evangelismo dos Munhanos: cooled aa Es

Extráldo de Evorigelical Mission Quarterly, v. 34, n. 3, out. 1998. Usado com permissão.

poderia e deveria permanecer na mesquita depois da conversão. Rapidamente o corrigi, afirmando que nunca defendi essa postura, nem em meus discursos nem em meus escritos. Meu livro Beyond the Mosque Além da Mesquita trata exaustivamente S obre por que, quando e como os convertidos devem se desassociar da mesquita, embora não da comunidade muçulmana propriamente dita. Entendo, porém, que deve haver um período detransição no qual o novo crente, enquanto amadurece na fé, aos poucos deixa de frequentar a mesquita. Uma retirada repentina pode ocasionar um antagonismo intenso e a consequente alienação. Veja em 2Reis 5 a maneira interessante em que Eliseu respondeu ao novo convertido Naamã, que levantou a questão de sua presença contínua no templo de Rimom. ade]

E A grande

Qudliagrama“A grande divisão” põe em perspeetiva linear as categorias Cl a Aceito a

Aetade que CÍ começa numa contextualização paixactrabalha gradualmente até chegar ao (4, “mo alto. Tudo dentro desse setor é legítimo, desde que fundamentado pelo constante uso de refetências cruzadas e sujeito à verdade bíblica.

"O podescr situado em qualquer lugar ao longo do espectro do sincretismo, dependendo de como cada questão é apresentada c entendida pela comunidade muçulmana. Pessoalmente, só posso entender conversão (ou reconversão) ao islamismo oficial como alto sincretismo, sem levar em conta a motivação.

Quando, em 1975, nossa equipe de missio-E -mários começou uma estratégia C4 (alta contexa tualização, mas os crentes não são mais vistos como muçulmanos pela comunidade muçulmana) num país muçulmano asiático, enfrentamos E considerável oposição. Um obreiro cristão que trabalha há muito tempo num país islâmico disse-me: “Você está numa descida perigosa.

divisão Um experimento ministerial Nós realmente temos ajuda, Numa área geográfica muito limitada e remota da Ásia, um experimento de C5 (“muçulmanos messiânicos” que seguem Isa [Jesus], o Messias, é são aceitos por muçulmanos como muçulmanos) tem sido contínuo há muitos anos. Esse ministério nos dá uma base muito sólida de avaliação, muito embora tenha experimentado significativa rotatividade de pessoal durante os anos. Recentemente, os pesquisadores visitaram Islampur'' para examinar o movimento (C5 e descobriram que esse movimento atinge milhares de pessoas,

Por um lado, as descobertas foram animadoras, Quase todas as pessoas-chave entrevistadas valorizavam muito a leitura do Novo Testamento e as reuniões regulares de adoração cristã. Muitos também diziam que Alá os amava os perdoara porque Jesus morreu por eles. Eles oravam a Jesus para pedir perdão, e praticamente todos acreditavam que Jesus é o único Salvador,

Em breve, estará negando a cruz”. Bem, anos depois, ainda somos C4, ainda pregamos a cruz, eo Senhor tem honrado muito nossos esforços naquele país. No entanto, agora eu é que sou contra a “descida” não em nome de nossa equipe, "mas em nome de outros que estão ministrando em várias partes do mundo muçulmano. Essa descida é gradativa e pode ser decepcionan“te na mesma proporção, sobretudo quando “conduzida por pessoas com altíssima motivação. Parece-me que devemos submeter essas questões à analise de nossos teólogos, missió- “Jogos e administradores, antes que descubramos ter chegado a um ponto verdadeiramente "não cristão. ê --MOs nomes citados nos exemplos são fictícios.

capaz de libertar o ser humano dos maus espíritos. Por outro lado, quase todos responderam que há quatro livros sagrados: a Torá, o Zabur, o Injil, e o Alcorão (esta é a crença muçulmana padrão: Lei, Profetas, Evangelhos e Alcorão), do quais o Alcorão é o mais importante. Quase metade continuava a frequentar a mesquita tradicional na sexta-feira, onde participavam das orações islâmicas, as quais afirmam que Maomé é um profeta de Deus, e quase metade não cria na Trindade. Contextualização ou sincretismo? Será isso contextualização ou sincretismo? Será esse um modelo a seguir ou a evitar? Sem dúvida, existe uma abertura e um potencial animadores aqui, No entanto, ao contrário dos defensores do não estou feliz em conservar tudo dentro de um ambiente religioso islâmico.

feta de Deus, e a divindade de Cristo é consistentemente negada, As orações muçulmanas (sala!) são feitas de forma ritualística, como em nenhuma outra religião, e são tão sacramen-

A mesquita pode ser redimida? tais para os muçulmanos quanto o é participar À mesquita está impregnada com a teologia da ceia do Senhor para os cristãos, Como nos islâmica. Nela, Maomé é afirmado como pro- sentiríamos se um muçulmano participasse ou O espectro Cl a C6 Jobn Travis Um instrumento prático para definir sels tipos de “comunidades cristocêntricas” ("C”)

encontradas no contexto muçulmano O espectro Cl a C6 compara e contrasta tipos de “comunidades cristocêntricas” (grupos de seguidores de Cristo) encontrados no mundo muçulmano. Os seis tipos são diferenciados por língua, cultura, formas de cultuar, grau de liberdade de cultuar com outros e identidade religiosa. Todos adoram a Jesus como Senhor, e os elementos principais do evangelho são os mesmos para todos os grupos. O espectro tenta lidar com a diversidade enorme que existe em todas as partes do mundo muçulmano quanto à etnicidade, história, tradições, língua, cultura e, em alguns casos, teologia,

A diversidade significa que inúmeras metodologias são necessárias para compartilhar com sucesso o Evangelho e plantar comunidades cristocêntricas entre os seguidores do islamismo no mundo, que hoje chegam a um bilhão. O objetivo do espectro é dar assistência a plantadores de Igrejas e crentes vindos do islamismo, para que descubram que tipo de comunidade cristocêntrica pode conduzir o maior número de pessoas do grupo-alvo para Cristo e que melhor se ajusta em determinado contexto, Os seis tipos são atualmente encontrados em alguma parte do mundo muçulmano.

C1 Igreja tradicional usando linguagem dos de fora* Podem ser ortodoxas, católicas, ou protestantes, sendo que algumas até antecedem ao islamismo. Milhares de igrejas Ci são encontradas em terras muçulmanas hoje, Pelo fato de muitas delas refletirem a cultura ocidental, quase sempre há uma enorme lacuna cultural entre a igreja e a comunidade muçulmana ao redor. Alguns crentes vindos do islamismo podem ser encontrados em igrejas C1. Os crentes C1 chamam a si mesmos “cristãos. C2 Igreja tradicional usando linguagem dos de dentro

É, essencialmente, idêntico ao C1, exceto pela linguagem. Embora a linguagem dos de dentro seja usada, o vocabulário religioso é provavelmente não islâmico (distintamente “cristão”). A distância cultural entre muçulmanos e o C2 é ainda grande. Muitas vezes, mais crentes vindos do islamismo são encontrados no C2 que no C1. A maioria das igrejas localizadas no mundo muçulmano hoje é C1 ou C2. Os crentes C2 chamam a si mesmos “cristãos”.

C3 Comunidades cristocêntricas contextualizadas usando formas culturais religiosamente neutras dos de dentro linguagem dos de dentro e

As formas religiosamente neutras podem assim por diante. Os elementos islâmicos, incluir a música folclórica, a vestimenta étnica, a obra de arte, e quando presentes, são “filtrados” para que se usem formas pu-

John J. Travis (pseudônimo) e sua família estão envolvidos com plantação de igrejas contextualizadas entre os muçulmanos da Ásia nas últimas duas décadas. Em parceria com a esposa, escreveu artigos para diversos livros e periódicos. Ele leciona e treina obreiros em vários países nas áreas de contextualização, cura e compartilhamento do amor de Jesus aos muçulmanos.

Extraído de Evangelical Missions Quarterly, v. 34, n. 3, Out. 1998. Usado com permissão ag comunhão? Isso realizado, ele começaria a re islamismo e, na verdade, ganharia O gsmitos de nossos membros pelo seu poder de da mesquita, buscando minar seus preceitos e práticas. O C5, para mim, parece fazer justamente isso, e nos sujeita a uma carga de ativipesado, Mé mesmo o C4 está sujeito a uma carga muçulmana de engano, porém discordo “ego sso como um nível real de indigenização.

dade antiética e não cristã,

No país em que exerci meu ministério, nossa equipe tinha um acordo: nenhum de qamente “culturais” O objetivo é reduzir a influência estrangeira do evangelho e da Igreja e contextualizar “as tomas culturais biblicamente permissívels. Podem ser encontradas numa Igreja ou num local religiosaamgnte mais neutro, As congregações C3 são compostas de uma maioria de crentes vindos do Islamismo, qe erêntes chamam a si mesmos “cristãos”,

Comunidades cristocêntricas contextualizadas usando linguagem dos de dentro e formas culturais e Islâmicas biblicamente permissíveis E semelhante à C3, porém as formas islâmicas e as práticas biblicamente permissíveis também são utillqtas (por exemplo, oração com mãos levantadas, guardar o Jejum, evitar carne de porco, álcool e cães qomo animais de estimação, usar termos islâmicos, vestimentas). As formas C1 e C2 são evitadas, e as prumides não são realizadas nos prédios da igreja. As comunidades C4 são compostas quase Intelramente crentes vindos do islamismo. Crentes C4, embora altamente contextualizados, não são normalmente vistos Como muçulmanos pela comunidade muçulmana, 83,0 Messias”, ou algo semelhante.

Crentes C4 Identificam-se como “seguldores de

Comunidades cristocêntricas de “muçulmanos messiânicos” que aceitaram à Jesus como Senhor e Salvador Qscrentes CS permanecem legal e socialmente dentro da comunidade islâmica, Um tanto semelhante ao movimento de judeus messiânicos, os aspectos da teologia Islâmica incompatíveis com a Bíblia são rejeltados ou reinterpretados, se possível. A participação no culto comunitário islâmico varia de pessoa para pessoa e de grupo para grupo. Os crentes C5 encontram-se regularmente com outros crentes C5 e compartilham sua fé com muçulmanos não salvos. Os muçulmanos não salvos podem ver os crentes C5 como tologicamente desviados e vir a expulsá-los da comunidade islâmica. Onde vilarejos inteiros aceitam a

Cristo, o CS pode resultar em “mesquitas messiânicas”. Os crentes tomunidade muçulmana e se identificam como muçulmanos que (6-Pequenas comunidades cristocêntricas subterrâneas

C5 são vistos como muçulmanos pela seguem a Isa, o Messias.

E São semelhantes aos crentes perseguidos nos regimes totalitários. Em razão do medo, do isolamento, da ameaça de ação legal extremada por parte do governo ou da comunidade ou de retaliação (até mesmo pena de morte), os crentes C6 adoram a Cristo secretamente (individualmente ou talvez esporadicamente em pequenos grupos), Muitos vêm a Cristo por meio de sonhos, visões, milagres, transmissões de rádio, folhetos e testemunho cristão enquanto estão fora de seu país ou por meio da leitura da Bíblia, por iniciativa própria. Os crentes C6, ao contrário dos C5, são normalmente discretos com relação à sua fé. Seu comportamento não é o ideal, pois Deus deseja que seu povo testemunhe e tenha comunhão regular (Hb 10,25). Todavia, os crentes C6 são parte de nossa família em Cristo. Embora Deus possa chamar alguns a uma vida ce sofrimento, aprisionamento ou martírio, ele pode se agradar de receber essa adoração secreta, pelo menos durante algum tempo. Os crentes C6 são vistos como muçulmanos pela comunidade muçulmana eidentificam-se como muçulmanos. Os *de dentro” pertencem à população muçulmana local; “os de fora” pertencem à população não muçulmana local.

nós entraria numa mesquita nem se envolve= ra com as orações islâmicas, Harry, um dos membros do grupo, entretanto, quis “experi= mentar” o salat em segredo, Numa sexta-feira, ele viajou a uma aldeia distante, tornando-se amigo dos muçulmanos de lá, e acabou por expressar seu desejo de aprender como realizar os rituais e formas das orações, Os líderes mu= culmanos, entusiasmados em ver um estrangeiro querendo aprender sobre o islamismo, deram a Harry as instruções necessárias, As 13h00, então, nosso missionário estava sentado na primeira fila da mesquita, curvando-se e prostrando-se enquanto o salat era recitado. Ninguém sabia que ele estava, na verdade, stlenciosamente orando a Jesus, Depois do culto, os aldeões muçulmanos cercaram Harry co parabenizaram por haver se tornado muçulmano, Constrangido, Harry explicou que era seguidor de Isa (Jesus) e que queria apenas aprender sobre o islã, Ao ouvir essas palavras, a multidão ficou furiosa, e ele foi acusado de profanar a santidade da mesquita, Alguém gritou que ele deveria ser morto, e um distúrbio estava a ponto de estourar. Naquele momento, o imame local, para pacificar a multidão, admitiu que havia cometido um erro ao ensinar o estrangeiro a fazer as orações e pediu perdão aos seus companheiros muçulmanos, Decidiuse então que Harry deveria deixar o vilarejo imediatamente e nunca mais voltar ali.

Outra experiência relaciona-se a Bob, missionário entre os muçulmanos, que era muito inteligente, produtivo e espiritualmente firme, Encontramo-nos numa conferência, trocamos correspondência cartas e pelo menos uma fita cassete por vários anos, Minha grande preocupação era que ele, aberta e dogmaticamente, afirmava Maomé como profeta de Deus, Para mim, Bob havia cruzado a linha e entrado no sincretismo, Seus motivos talvez fossem puros, mas a identificação com os muçulmanos fo; longe demais. Hoje, Bob está fora do ministério edivorciado da esposa. Diretrizes Em 1979, escrevi as seguintes diretrizes para evitar O sincretismo enquanto estivéssemos envolvidos com o evangelismo de muçulmanos, Dezenove anos depois, reafirmo estes princípios: 1. Devemos conhecer bem os ensinos bfblicos sobre sincretismo, Passagens do

Novo Testamento sobre a singularidade de Cristo devem ser cuidadosamente observadas, 2, O islamismo, como religião e cultura, deve ser estudado a fundo, 3. É necessária uma metodologia aberta, Uma tentativa cuidadosa de contextualização não precisa levar ao sincretismo, contanto que o envolvido esteja consciente de todos os perigos. 4. À contextualização precisa de monitoramento e análise constantes. O que as pessoas estão realmente pensando? O que a comunicação contextualizada transmite?

O que as formas específicas provocam na a o Ma e O e E AME o A «PA a o BEE E é am “O “LÁ “a ce aa E

7 nas mente do novo convertido? Há progresso no conhecimento da verdade bíblica? Às pessoas estão se tornando claramente mais espirituais? 5. Os comunicadores transculturais precisam ter cuidado ao apresentar um Evangelho que tem sido sincrético na cultura ocidental. Os A Reed, acréscimos ao cristianismo acumulados ao longo dos séculos, em razão de o Ocidente ser o centro do cristianismo, devem ser evitados tanto quanto possível. 4 gu não estou difamando a motivação de misjondrios que praticam e promovem o C5 como estratégia apropriada para ganhar muçulmanos para Cristo, Vários desses obreiros cristãos são meus amigos, sua integridade pessoal é inquesjonável e eles realmente anseiam por ver algo novador no evangelismo entre os muçulmanos, No entanto, estou apreensivo para ver aonde tudo isso levará.

Na conferência que mencionei, um jovem muçulmano convertido veio até mim e disse que havia seguido o exemplo do missionário preletor: fora à mesquita local e dissera ao imame que era muçulmano e que queria aprender mais

Perguntas

Como o missionário pode evitar o sincretismo um relacionamento com o imame, Perguntei a Abdul como ele se sentiu a respeito do que havia feito, Com um olhar de dor e tristeza, ele respondeu que se sentiu muito mal é que não faria aquilo de novo,

Antes que os envolvidos com o C5 largamente propaguem essa estratégia a mentes jovens e im pressionáveis, motivadas pelo “novo” e pelo “não comprovado”, suplico que considerem melhor a carga islâmica de decepção e também as consequências de longo prazo de suas ações, Estou convencido de que os missionários estão pisando em solo teológico e missiológico muito instável. Vamos trazer o assunto à tona e dialogar juntos, para estudo no seu ministério?

2. Deve o missionário “experimentar” com a contextualização? tar? É de não experimentar?

Quais os perigos de experimen-', 84
  from cursos where slug = 'perspectivas';

-- e o Travis logo depois do McGavran
do $$
declare cid uuid;
begin
  select id into cid from cursos where slug = 'perspectivas';
  update aulas set ordem = ordem + 10000 where curso_id = cid and ordem >= 86;
  update aulas set ordem = ordem - 10000 + 1 where curso_id = cid and ordem >= 10000;
end $$;

insert into aulas (curso_id, titulo, conteudo, ordem)
select id, 'Lição 11 · Leitura — Travis, cap. 98: Todos os muçulmanos devem deixar o “islã” para seguir a Jesus?', 'John J. Travis

JOHN J. TRAVIS (pseudônimo) e sua família estão envolvidos com plantação de igrejas contextualizadas entre os muçulmanos da Ásia nas últimas duas décadas. Em parceria com a esposa, escreveu artigos para diversos livros e periódicos. Ele leciona e treina obreiros em vários países nas áreas de contextualização, cura e compartilhamento do amor de Jesus aos muçulmanos.

Extraído de Evangelical Missions Quarterly, v. 34, n. 3, Out. 1998. Usado com permissão.

ID urante a última década, minha família e eu vivemos na Ásia, num bairro muçulmano com aguçado senso de comunidade, Minha filha, que ama muito nossos vizinhos, certo dia perguntou: “Papai, os muçulmanos vão para o céu?”. Respondi com um “sim” do tipo encontrado em Atos 15.11:ºSe um muçulmano aceitar Isa (Jesus), o Messias, como Salvador e Senhor, ele será salvo, como nós”. Afirmamos que as pessoas são salvas pela fé em Cristo, e não por fazerem parte de uma religião. Os seguidores muçulmanos de Cristo (isto é, os crentes C5) são nossos irmãos e irmãs no Senhor, embora não mudem de religião.

Um muçulmano pode verdadeiramente aceitar Jesus como Salvador e Senhor, rejeitar alguns elementos da teologia islâmica e ainda assim (por amor ao perdido) permanecer em sua família e comunidade religiosa? Encontrar a resposta para essa pergunta é essencial, em razão da extrema importância dada pelo islã à comunidade seu desdém quase universal pelos que se tornaram “traidores” e se unem ao cristianismo e de nosso desejo de ver os muçulmanos virem a Cristo. Concordo com o dr. Parshall: o tempo de missiólogos, teólogos e especialmente os que trabalham cara a cara com muçulmanos buscarem a vontade de Deus na questão do 05.

JOHN J. TRAVIS (pseudônimo) e sua família estão envolvidos com plantação de igrejas contextualizadas cine os icscdriáriãe da Ada pi últimas duas décadas. Em parceria com a esposa, escreveu artigos para diversos livros e periódicos. Ele leciona E urEua Cappsos embargos paises nas áreas de contextualização, cura e compartilhamento do amor de Jesus 305 muçulmanos.

Extraído de Evangelical Missions Quarterly, v. 34, n. 3, Out. 1998. Usado com permissão.

O estudo do caso Islampur'' Os resultados indicam que quase todos os líderes desse movimento estão firmemente apoiados nos ensinos bíblicos sobre a identidade e a obra de Cristo. Não apenas sua teologia básica é sólida, eles também são ativos em sua fé por meio da oração, leitura, audição das Escrituras e reuniões po de adoração. E O fato de que mais da metade entende a Trindade o bastante para afirmar Deus como Pai, Filho e Espírito Santo é surpreendente, pois isso seria considerado apostasia pela maior parte dos muçulmanos! Quantos pastores americanos não exultariam por encontrar a mesma vitalidadeem Sue ES egações?

Quanto à conservação de um pouco da prática e da crença islâmicas, não devemos nos surpreender que quase metade se

Os nomes usados nos exemplos são fictícios.

perto de Deus ao ouvir a leitura do 4/cata sesde Já que não entendem árabe, pode sero canto melodioso familiar que lhes toca o co«são. (Alguns crentes do tipo C4 e C5 onde eeabalho, cantam uma bela canção de adoração que SOU Muito parecida com um canto muçulano.) Também não é de surpreender quemeede continue cultuando na mesquita, além de Eequentar semanalmente as reuniões do C5. Essa prática lembra os primeiros seguidores qodeus de Cristo, que se reuniam tanto no tempo quanto nas casas (com a velha comunidade e com a nova). Um grupo de numa vila q que conheço, ora na mesquita ao meio-dia de principal da sessão, lendo à Torá, o Zabur e o Injil(que compõem a Bíblia),

Os muçulmanos não salvos mostram-se mais propensos a participar de uma sessão de leitura bíblica se também puderem ouvir algumas citações do Alcorão, Achmad, porém, cuida paraler apenas passagens que não estejam em conflito com a Bíblia.

Três últimos assuntos sobre o caso Islampur, Primeiro: as comunidades C5 consistem inteiramente de novos crentes de um grupo de pessoas bastante resistentes. Eles estão em processo, e suas lutas não são diferentes das que enfrentaram muitas congregações do prisexta-feira e logo depois se reúne numa casa pan estudar a Bíblia e orar, conduzidos por Achmad (pseudônimo), pastor C4 e ex-professor muçulmano,

Nesse caso, os crentes passaram a considerar as reuniões na mesquita superficiais e sem vida e, durante algum tempo, deixaram de frequentá-las. Sua ausência ameaçou grandeesenteo líder da mesquita, e ele tentou acabar meiro século, Devemos orar para que o mesmo Espírito Santo, em quem Paulo confiou para guiar e purificar aqueles primeiros grupos de crentes, aja da mesma forma nos novos grupos de Islampur.

Segundo: para se ter uma perspectiva mais exata, é preciso avaliar a qualidade de vida dos novos crentes em Cristo, não apenas sua teologia. O fruto do Espírito é evidente? Mostram com suas reuniões de sexta à tarde. Achmad sugeriu que retornassem à mesquita, mesmo que não fizesse sentido para eles. O respeito ao imame foi restaurado, e os novos crentes continuaram a encontrar-se por mais deum ano, Alguns inquiridores muçulmanos (até “dois professores islâmicos) agora frequentam as reuniões.

Quanto à alta consideração pelo Alcorão por parte dos crentes Islampur, uma resposta À apologética acerca desse livro sagrado deve ser E desenvolvida, pela qual a verdade nele possaser afirmada (especialmente visando à oportunidade de testemunhar), mas que não seja postoem pé de igualdade (ou superior!) ao Injil(evange*fho). Felizmente, ainda que tal apologéticanão esteja desenvolvida, os crentes de Islampur es-Ê tão lendo regularmente o Inji/e não o Alcorão. Voltando ao meu amigo Achmad, ele organi-Za à noite, em sua casa, “sessões de leitura do Livro Sagrado”. Ele costuma iniciar a reunião com uma respeitosa leitura de uma passagem “Go Alcorão. Em seguida, prossegue paraa parte eles agora um amor mais profundo pelos outros? Às Sagradas Escrituras são claras em afirmar que por qualidades como essas reconheceremos os verdadeiros seguidores de Cristo (Mt 7.20; Jo

Terceiro: existiriam esses milhares de novos crentes para serem analisados, se não fosse usado o método C5 no ministério de plantação de igrejas? Missionários C5 (cristãos se tornam muçulmanos para alcançar muçulmanos) Essa é, possivelmente, a maior preocupação do dr. Parshall, e, no geral, concordo. Tornar-se muçulmano para alcançar muçulmanos (missionários 05) é, para o cristão, um passo além da simples insistência em que os novos crentes permaneçam na comunidade religiosa de nascimento (crentes C5) por causa de sua família e amigos não salvos. Na situação atual, tenho aconselhado colegas cristãos, especialmente os expatriados, a utilizar uma expressão de fé e não entrar no islamismo para alcançar (o 696 Todos muçulmanos. Contudo, imagino que, em alguns casos, Deus pode chamar pessoas com dons específicos e bem preparadas, cujo ministério esteja firmemente apoiado na oração, para realizar o evangelismo C5. Esses missionários seriam muçulmanos no sentido árabe literal da palavra (“submisso a Deus”), e sua teologia irá se diferenciar, naturalmente, da teologia muçulmana padrão em vários aspectos fundamentais. Eles teriam de estar prontos para a perseguição, e seria melhor que fossem oriundos deum contexto muçulmano,

Se com o passar do tempo eles demonstrassem suas crenças de modo claro, e a comunidade muçulmana decidisse permitir sua permanência ali, não deveríamos louvar a Deus pela oportunidade que eles teriam de compartilhar o evangelho num lugar no qual poucos ousariam atuar? Parece que nem Abdul, o muculmano convertido, nem Harry, o missionário ocidental, foram chamados ou preparados para essa espécie de trabalho.

À respeito de como os muçulmanos “se sentiriam” diante dessa metodologia, penso que a pergunta é um tanto irrelevante. À maioria dos muçulmanos com quem tenho conversado se opõe a qualquer atividade que eles percebam ser uma tentativa de atrair muçulmanos para o cristianismo. Contudo, o método que comunica a mensagem da salvação em Cristo sem a intenção de persuadir muçulmanos a “mudar de religião”, pode de fato ser a mais apreciada por muçulmanos. Separando o evangelho de um número interminável de questões legais, sociais e culturais que dizem respeito à mudança de religião, uma mensagem mais franca e menos impeditiva pode ser compartilhada e (esperamos) abraçada. Com relação à pergunta de como os cristãos se sentiriam se os muçulmanos entrassem numa igreja com o objetivo de ganhar convertidos para O islamismo, pessoalmente os muçulmanos devem deixar o “isld” para seguir à Jesus? Reinterpretando Maomé e o Alcorão Pode alguém ser parte da comunidade islâmica não viver de acordo com a teologia muçulmana padrão? Sim, contanto que permaneça em silêncio sobre suas crenças heterodoxas. Na verdade, há milhões de “muçulmanos culturais” que têm crenças divergentes ou não sabem praticamente nada sobre o islamismo. Contudo, por causa do nascimento e pelo fato de não deixarem formalmente a “casa”, são vistos como parte da comunidade islâmica. Todavia, o objetivo dos crentes C5 (diferentemente dos C6) não é mantera fé em silêncio, mas ser uma testemunha de Cristo. Nesse meio-tempo, irão surgir, sem dúvida, questões sobre Maomé ser ou não o profeta e sobre a inerrância do Alcorão. Um seguidor de Jesus não pode aceitar tudo que é ensinado sobre o Alcorão e a respeito de Maomé.

Certos aspectos do papel de Maomé e do Alcorão devem ser reinterpretados. Isso provavelmente será a tarefa mais desafiadora dos C5. Não agir assim fará com que, ao longo do tempo, esses crentes caminhem na direção dos (contextualizados, porém sem se tornarem muçulmanos) ou na direção dos C6 (crentes subterrâneos/ silenciosos). À reinterpretação vai além do alcance desse artigo e necessitaria da contribuição de líderes muçulmanos que depositaram sua fé em Cristo. Um ponto de partida tremendo em direção a reinterpretação é encontrado no excelente livro de Accad, Building Bridges [Construindo pontes] (1997). Como pastor e estudioso árabe, ele sugere caminhos pelos quais Maomé e alguns versos do Alcorão que parecem negar a crucificação podem ser reinterpretados. Ele cita também exemplos de muçulmanos que, com sucesso, permaneceram na comunidade islâmica depois de aceitara Cristo, alguns denominando a si mesmos “muçulmanos realmente rendidos a Deus pelo sacrifício do Messias Isa”.

não tenho medo algum. De fato, por várias razões, os não cristãos muitas vezes adornam as portas de igrejas, e muitos, nesse processo, aceitam a Cristo!

Diretrizes para evitar o sincretismo num movimento C5 pics A ideia de muçulmanos seguidores de Jesus ou mesquitas messiânicas tem sido sugerida ope ROS mmissiólogos importantes, como “oligos, Kraft, Conn é Woodberry. De fato, agostnos de diretrizes para que a expressão “spas CS indo caia num perigoso sincretismo. “xo tetbalham com os novos crentes devem “actuar pelo menos o seguinte no processo “à estpulado: Sea

Neses é Senhor e Salvador: não há salvação tom dee, “8 (Ok moro crentes batizados encontram-se regalammente com outros crentes (isso tal- (o fruto do Espírito, mais amor) e um desejo de alcançar o perdido (testemunho e intercessão).

Devemos ter em mente que os crentes €5, a qualquer momento, podem ser expulsos da comunidade islâmica, Podem ser apenas transitórios, como o dr. Parshall sugere. Contudo, não seria muito melhor para o seguidor muçulmano de Jesus compartilhar o evangelho durante meses ou anos com outros muçulmanos que podem vir a expulsá-lo, que abandonar a família e à covez edu grande discrição) e participam da esa do Senhor, 3, OX novos crentes estudam o Injil (e a Torá

20 Zabyr, se estiverem disponíveis). 4 Os movos crentes renunciam e são libertos dir ocultismo e práticas islâmicas populares “to é, xamanismo, orações a santos, uso de amuletos, maldições, encantamentos e RE)

Prásicas e tradições muçulmanas (jejum, esssolas, drcuncisão, frequência à mesquita, eso de cobertura na cabeça, abstenção de porcoe álcool e outros) são realizados como expressão de amor a Deus e/ou respeitoao munidade por escolha própria e ser vistos como traidor por aqueles a quem eles amam? Conclusão Se o único grande impedimento para o muçulmano abraçar a fé em Cristo não é teológico (isto é, aceitar a Jesus como Senhor), mas cultural e de identidade religiosa (isto é, ter de abandonar a comunidade islâmica), talvez a maior partc de nossa energia missiológica deva ser dedicada à busca de um caminho pelo qual ele possa permanecer muçulmano, porém vivendo como verdadeiro seguidor do Senhor Jesus. As questões envolvidas nesse tipo de metodologia são "próximo, é não como meios para obter perdão dos pecados.

O Alkurão, Maomé, e a teologia muçulmasa tradicional são examinados, julgados e teinterpretados (onde necessário) à luz da verdade bíblica. As crenças e práticas muçulsmaras biblicamente aceitáveis são mantidas, outras são modificadas e algumas devem sex rejeitadas.

Os novos crentes mostram evidências do E “Ovo nascimento e crescimento na graça

Perguntas espinhosas e complexas e necessitam de consideração de várias disciplinas diferentes (história da igreja, islamismo, teologia, missiologia). Uma consulta a pessoas envolvidas primordialmente em alcançar muçulmanos e que combateriam as implicações do CS seria benéfica. Qualquer tipo de ministério empreendido no mundo muçulmano implica grande risco, mas por causa dos milhões de almas destinadas a uma eternidade sem Cristo e para a glória de Deus, os riscos, os esforços e a tensão valem o preço. para estudo

EL Para Travis, o maior impedimento à fé em Cristo à “giea ou de identidade cultural? Explique, entre os muçulmanos é uma questão teoló-

O que o autor sugere como diretriz em relação ao Alcorão e E” muçulmanos de Jesus?

a Maomé, por parte dos seguido-

Pu 698 Todos os muçulmanos devem deixar o “islã” para a Jesus?

seguir 3. Qual a diferença entre o missionário C5 e um movimento C5 quanto à credibilidade com relação à cultura muçulmana, fidelidade à fé bíblica e viabilidade de plantação de igreja?

Bibliografia AccaD, Fouad Elias. Building Bridges: Christianity and Islam. Colorado Springs: Navpress,

Conn, Harvey. The Muslim Convert and His Culture. In: McCurry, Don (Org.). The Gospel and

Islam. Monrovia: MARC, 1979, p. 61-77. KnarT, Charles, Dynamic Equivalence Churches in Muslim Society. In: McCurry, Don (Org).

The Gospel and Islam, Monrovia: MARC, 1979, p. 78-92.

Winter, Ralph; Frazier, David. World Missions Survey. In: Hawthorne, Steve; Winter, Ralph (Org.). Perspectives on the World Christian Movement. Pasadena: William Carey, 1981), p.

198-201. WoopBerRy, J. Dudley. Contextualization Among Muslims: Reusing Common Pillars. In: Gilliland, Dean S. (Org.). The Word Among Us. Word: Dallas, 1989, p. 282-312,', 86
  from cursos where slug = 'perspectivas';

-- o capítulo 64 não é pedido por nenhum guia: vai para os complementares
do $$
declare cid uuid; fim int;
begin
  select id into cid from cursos where slug = 'perspectivas';
  select max(ordem) into fim from aulas where curso_id = cid;
  insert into aulas (curso_id, titulo, conteudo, ordem)
  values (cid, 'Artigos complementares · Leitura — Analzira Pereira do Nascimento, cap. 64: A identidade cultural do missionário',
          'Analzira Pereira do Nascimento

ANALZIRA PEREIRA DO NASCIMENTO é coordenadora geral do Projeto Radical — Voluntários sem Fronteiras, da Junta de Missões Mundiais da Convenção Batista Brasileira. Foi missionária em Angola durante 17 anos, onde trabalhou como enfermeira, contribuiu para a organização do Seminário Teológico Batista do Huambo e de vários projetos sociais de ajuda humanitária e de geração de ocupação e de renda.

Este artigo é parte do trabalho da autora para o curso de pós-graduação na Universidade Metodista de São Paulo. Foi publicado na revista Capacitando, APMB, 2003. Usado com permissão.

Analzira Pereira do Nascimento Asi que é enviado para outra cultura, deixando seu mundo suas fronteiras, se sente num círculo vicioso; sofreu um processo doloroso de aculturação e inculturação, superou o sentimento de “não pertença” e solidão em sua nova realidade, Finalmente, conseguiu sua inclusão! Mas quando retorna para “sua” cultura, seu espaço original, sente-se um forasteiro, Aquele não é mais o “seu mundo”, Sente-se excluído, Entra em crise de identidade, Aprendendo a “transgredir” fronteiras

Es PA 6 O aunuua E INALTIRA PEREIRA DO

Deixar a pátria, a família e tudo que nos cerca implica várias perdas, Dói também a questão do “salto no escuro”: partir sem saber ao certo o que nos espera. À nova vida, por sua vez, exige novas aprendizagens e renúncias, Isso gera tensão: “O pesar está presente em todas as mudanças, perdas e transições importantes na vída, não só por ocasião da morte de uma pessoa amada, Todo evento envolve algum tipo de perda e portanto, pesar”)

À crise só não toma proporções maiores porque prevalece o sentimento de propósito, Há um sentido para tudo: vale a pena todo o desprendimento porque uma missão importante deve ser completada e está acima de tudo isso,

Além do mais, existe para o cristão um forte sentimento de transitoriedade quanto ao presente e a esperança de viver para sempre com Deus. Ele vive com uma perspectiva futura. Nos momentos de tASCIMENTO é coordenadora geral jo Projeto Radical Voluntários banana Wong as da Convenção Batista pasdeira. Foi missionária em Angola asarte 17 anos, onde trabalhou como enfermeira, contribuiu para à ganização do Seminário Teológico baptsta do Huambo é de varios sroetos sociais de ajuda humanitária é eds inn de dcupsição de ADS

Este artigo é parte do trabalho atora para o curso de pós-graduação ra Universidade Metodista de São Pato. Foi publicado na revista Cpocitando, APMB, 2003. Usado com PETISSÃO.

crise em sua vida, ele sempre se refugia nessa dimensão futura.

Apesar de a reação do cristão ser diferente, a dor da perda precisa ser trabalhada corretamente, de modo a possibilitar o restabelecimento da pessoa. O missionário ii precisa partir bem preparado e bem orientado sobre o que lhe aguarda. Se ele partir sem romantismos, consciente de que o processo é doloroso e exigirá muito desprendimento de sua parte e que o “pessoal de retaguarda” continuará dando suporte financeiro, emocional, e assim por diante, 0 choque pode ser bem menor.

Os primeiros dias são um deslumbre, pois tudo é novidade. Logo em seguida, vem o choque cultural e o conflito ético de certo/errado e normal/anormal. É preciso estar atento para esse período, que é o

Howard J. Clinebell, Aconselhamento pastoral; modelo centrado em libertação e crescimento, p. 212.

mais perigoso, quando muitos retornam ao seu lugar de origem. Não suportam a pressão emocional de situações tão diferentes com o povo local e com colegas mais antigos no campo.

O missionário deve refletir sobre a motivação, pois se não houver um firme propósito para sua permanência, tudo será uma sequência de frustrações. O que pode melhor contribuir para que haja determinação em continuar, apesarde tudo, é o fato de haver um sentido claro para tudo aquilo, e nada melhor que realizarum trabalho que faça diferença e esteja em harmonia com o propósito que o levou até lá. Vivendo na fronteira Longe de seu espaço geográfico e de sua cultura, o missionário percebe que houve em sua vida não apenas uma inculturação, mas também uma interculturação. Ele assimilou traços daquele novo mundo e também trouxe contribuições de sua comunidade de origem. Suas concepçõese paradigmas estão sendo revistos.

Paulatinamente, ele consegue conquistar seu espaço, vai superando o sentimento de “não pertença” e já não se sente excluído entre o povo local. Ele se sente, porém, num círculo vicioso. Ele partiu, deixou, renunciou, assimilou. Ele pertence a um novo grupo, mas seu passado ainda está lá, e nos momentos de crise e decisões, para alguns ele ainda é um estrangeiro.

À coragem de romper e arriscar em direção. ao outro traz experiências dolorosas. Buscaro equilíbrio para viver intensamente o presenteé o grande desafio. Alguns missionários entram em depressão por não conseguirem digerir as perdas acompanhadas da falta de compreen-

Todavia, se as motivações que O levara, até lá estão corretas, nos momentos rmais as, gustiantes ele irá refletir e com o apoio de o, “equipe de retaguarda” estará disposto à pagas preço e um dos mais altos. Só entende Guer., passa, é o “negar a si mesmo e tomar sus cruz Para mim, uma dos mais claros exemplos é, resignação é o que Viktor Frankl descreve é, sua experiência nos campos de concentração, a hibernação cultural, um retraimento diante é questões intelectuais e culturais. Um períoé. caracterizado pelo “anular-se”,

Num dos pontos altos de seu livro Em byz. ca de sentido, ele afirma: “Havendo um sentiá,, o homem é capaz de viver e até de morrer psy seus ideais e valores!” Ele costuma citar a frase de Nietzsche: “Quem tem por que viver supor, quase qualquer como”. Perdendo as fronteiras Ao retornar ao seu lugar de origem, dependerá, do tempo que viveu fora, do tipo de relacionamento estabelecido e da qualidade do trabalh; realizado, o missionário passará novamente pcs um processo de exclusão-inclusão. À insegerança é grande, pois muita coisa mudou: éexou para trás sua vida, trabalho e amigos, que faziam tanto sentido, e agora de volta encontr; pessoas que já não são as mesmas que deixou, ele também mudou tanto que já não sabe ond: é seu mundo. Novamente, uma crise com perdi e adaptações. Quem pode entender? Por qu: falar, se poucos estão sensíveis a essa dor”

Viktor Frankl relata a experiência da vol do campo de concentração como uma situzção solitária e decepcionante, com uma for:

são, sensibilidade e apoio dos que o enviaram. “Quem sente dor deseja ser escutado. As dores precisam ser escutadas O passado ocupa um lugar muito grande, quase que sufocante para quem não consegue fazer luto de algo ou alguém que perdeu. E este é o grande motivo da depressão uma perda que abriu uma grande ferida, que inflamou.””

tendência à amargura porque tudo que se o via eram frases baratas e superficiais. “A morte corta as relações sociais, joga as pessoas no mais absoluto abandono, introduz num estad de completo ''não relacionamento”. Ela provoa perdas dolorosas. Quanto maior o amor, tanto mais pesado o morrer. Ele é o “sarador ferdo” (frase de Henri Nouwen) que deu tanta,

Simone Engbrecht, Aprendendo a lidar com a depressão, p. 74. *Gottfried Brakemeier, O ser humano em busca de identidade, p. 174.

sagador ferido” que retorna, principiando por gjudá-lo a superar o luto, “A superação do luto necessita evidentemente de solidariedade humana”, comenta Brakemeier, porém vivemos

Perguntas viadora, dos amigos e da família poderá ser de grande valia no sentido de ajudá-lo a buscar novas perspectivas para futuro e novos relacionamentos afetivos, para estudo

1. Dê alguns exemplos de aldeia indígena. Como comum?

renúncias requeridas do missionário transcultural que trabalha numa seria se ele trabalhasse numa cidade europeia? Quais os pontos em

2. Qual das três fases é a mais difícil sua igreja local?

para o missionário transcultural? Como ele pode ajudar

Bibliografia

ADIWARDANA, Margaretha. Missionários: preparando-os para perseverar. Tradução de Werner

Fuchs. Londrina: Descoberta, 1999. BEULKE, Gisela. Diaconia em situação de fronteira. São Leopoldo: Sinodal, 2001. BRAKEMEIER, Gottfried. O ser humano em busca de identidade. São Leopoldo: Sinodal; São Paulo:

Paulus, 2002.

CLiNEBELL, Howard J. Aconselhamento pastoral: modelo centrado em libertação e crescimento. Tradução de Walter Schlupp e Luís Marcos Sander. 3. ed. São Leopoldo: Sinodal; São Paulo:

Paulus, 2000. ENGBRECHT, Simone. Aprendendo a lidar com a depressão. São Leopoldo: Sinodal, 2001.

FRANKL, Viktor É. Em busca de sentido. Tradução ed. São Leopoldo: Sinodal, 2000.

de Walter O. Schlupp e Carlos C. Aveline. 12.

GEERTZ, Clifford. 4 interpretação das culturas. Rio de Janeiro:

tíficos, 1989.

LTC Livros Técnicos e Cien-

HarLEY, David. Missões: preparando

Mundo Cristão, 1997.

aquele que vai. Tradução de Neyd Siqueira. São Paulo:

ROPPELL, Gert. Que queremos dizer com educação ecumênica? Tradução de Sergio Marcus Pinto

Lopes (São Bernardo do Campo: UMESP, 2001). Baseado numa publicação do Conselho

Mundial de Igrejas (CMI).', fim + 1);
end $$;

commit;
