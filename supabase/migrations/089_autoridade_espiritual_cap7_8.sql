-- =============================================================
-- Curso: Autoridade Espiritual (Watchman Nee)
-- CAPÍTULOS 7 e 8
-- Idempotente. Localiza o curso pelo slug 'autoridade-espiritual'.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
begin
  select id into v_curso_id from public.cursos where slug = 'autoridade-espiritual';
  if v_curso_id is null then
    raise exception 'Curso autoridade-espiritual não encontrado. Aplique a migration 086 primeiro.';
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 7 — Os homens devem obedecer à autoridade delegada
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 7 — Os homens devem obedecer à autoridade delegada', 7,
$conteudo$"Todo homem esteja sujeito às autoridades superiores; porque não há autoridade que não proceda de Deus; e as autoridades que existem foram por ele instituídas" (Rm 13.1). "Sujeitai-vos a toda instituição humana por causa do Senhor; quer seja ao rei, como soberano; quer às autoridades, como enviadas por ele, tanto para castigo dos malfeitores, como para louvor dos que praticam o bem" (1Pe 2.13-14).

AUTORIDADES INSTITUÍDAS POR DEUS

Deus é a fonte de toda a autoridade no universo. Considerando que todas as autoridades governantes foram por ele instituídas, então toda a autoridade é delegada por ele e representa a sua autoridade. O próprio Deus estabeleceu este sistema de autoridade a fim de se manifestar. Onde quer que as pessoas encontrem autoridade, encontram Deus. Os homens podem vir a conhecer Deus através de sua presença; mas mesmo sem ela podem vir a conhecê-lo através de sua autoridade. Hoje em dia o lugar onde ele mais se manifesta é nos seus mandamentos.

Aqueles que são estabelecidos por Deus devem exercer autoridade em lugar dele. Considerando que todas as autoridades governantes foram instituídas e ordenadas por Deus, devem ser obedecidas. Se nós realmente aprendêssemos a obedecer a Deus, não teríamos nenhum problema em reconhecer sobre quem repousa a autoridade de Deus. Mas se nós conhecemos apenas a autoridade direta de Deus, possivelmente violamos mais da metade de sua autoridade. Não podemos escolher entre a autoridade direta de Deus e sua autoridade delegada. Temos de nos submeter à autoridade delegada como também à autoridade direta de Deus, pois "não há autoridade que não proceda de Deus".

No que se refere às autoridades terrenas, Paulo não só exorta positivamente para que haja sujeição, mas também adverte negativamente contra a resistência. Aquele que resiste à autoridade resiste à lei do próprio Deus; aquele que rejeita a autoridade delegada por Deus rejeita a autoridade do próprio Deus. Aquele que resiste à autoridade resiste a Deus, e aquele que resiste incorrerá em julgamento. A consequência da resistência à autoridade é morte. O homem não tem escolha na questão da autoridade.

1. NO MUNDO

Embora os governantes das nações não creiam em Deus e seus países estejam sob o domínio de Satanás, o princípio da autoridade ficou imutável. Quando nosso Senhor estava na terra, sujeitava-se às autoridades do governo como também à autoridade do sumo sacerdote. Pagou impostos e ensinou aos homens a dar a César o que é de César. Nosso Senhor jamais tomou parte em qualquer rebelião. Paulo mostra-nos em Romanos 13 que todos os que se encontram em posição de autoridade são servos de Deus. Temos de nos sujeitar à autoridade local sob a qual vivemos, como também à autoridade de nosso próprio país. A lei não constitui terror para a boa conduta, mas para a má. O princípio básico de todas as leis de Deus é punir o mal e recompensar o bem.

O cristão obedece à lei não só para fugir à ira de Deus, mas também por causa de sua consciência. Os filhos de Deus não deveriam levianamente criticar ou acusar o governo. Em qualquer circunstância, a insubordinação à autoridade é motim contra Deus. Se somos insubordinados, estaremos ajudando o princípio do anticristo. Vamos nos fazer a pergunta: quando o mistério da anarquia está operando, somos um impedimento ou uma ajuda?

2. NA FAMÍLIA

"As mulheres sejam submissas a seus próprios maridos, como ao Senhor; porque o marido é o cabeça da mulher, como também Cristo é o cabeça da igreja" (Ef 5.22-23). "Filhos, obedecei a vossos pais no Senhor, pois isto é justo. Honra a teu pai e a tua mãe (que é o primeiro mandamento com promessa)" (Ef 6.1-2). "Servos, obedecei em tudo aos vossos senhores segundo a carne... em singeleza de coração, temendo ao Senhor" (Cl 3.22).

Deus estabelece sua autoridade no lar, mas muitos dos seus filhos não prestam suficiente atenção a este setor da família. As epístolas mais espirituais, como Efésios e Colossenses, não ignoram este assunto; especificamente mencionam a sujeição no lar, pois sem ela será difícil servir a Deus. Quando os membros de uma família entendem a autoridade, muitas dificuldades no lar desaparecem.

Deus estabeleceu o marido como autoridade delegada de Cristo, com a esposa no papel de representante da igreja. Seria difícil para a esposa ficar sujeita ao seu marido se não visse a autoridade delegada que lhe foi concedida por Deus. Ela tem de entender que o ponto principal é a autoridade divina, não o seu marido. Da mesma forma, "Filhos, obedecei a vossos pais no Senhor", porque Deus estabeleceu os pais como autoridade. Estar sujeito aos pais requer percepção da autoridade divina. E os servos devem servir aos seus senhores "como a Cristo... como servos de Cristo, fazendo de coração a vontade de Deus". Se honramos a autoridade do Senhor em nossas vidas, os outros respeitarão a autoridade do Senhor em nós.

3. NA IGREJA

"Agora vos rogamos, irmãos, que acateis com apreço os que trabalham entre vós, e os que vos presidem no Senhor e vos admoestam; e que os tenhais com amor em máxima consideração, por causa do trabalho que realizam" (1Ts 5.12-13). Deus estabeleceu autoridades na igreja, tais como os "presbíteros que presidem bem" e "os que se afadigam na palavra e no ensino". São aqueles a quem todos deveriam obedecer. Os mais jovens também devem aprender a sujeitar-se aos mais velhos. "Outrossim, no trato de uns com os outros, cingi-vos todos de humildade" (1Pe 5.5). É coisa muito vergonhosa que alguém conscientemente exiba sua posição e autoridade.

Deus também instituiu autoridades no mundo espiritual. Há autoridades e posições gloriosas no mundo espiritual sob as quais os anjos são colocados. Embora algumas tenham fracassado, os anjos não se atrevem a injuriá-las, uma vez que são superiores. "Contudo, o arcanjo Miguel, quando contendia com o diabo, e disputava a respeito do corpo de Moisés, não se atreveu a proferir juízo infamatório contra ele; pelo contrário, disse: O Senhor te repreenda" (Judas 9). Por quê? Porque numa certa ocasião Deus estabeleceu Lúcifer como o chefe dos arcanjos; e Miguel, sendo um arcanjo, estivera sob sua autoridade. Quando Miguel foi impedido por Satanás, ele poderia, com espírito de rebeldia, ter-se havido com esse rebelde, abrindo a sua boca e injuriando-o. Mas ele não se atreveu. Tudo o que disse foi: "O Senhor te repreenda." Que coisa dignificante é a autoridade delegada no reino espiritual! Não deve ser desprezada; qualquer injúria contra ela resultará em perda de poder espiritual.

SEJA DESTEMIDAMENTE SUJEITO À AUTORIDADE DELEGADA

Que risco foi para Deus instituir autoridades! Que perda Deus sofre quando as autoridades delegadas que instituiu não o representam devidamente! Contudo, indômito, Deus estabeleceu tais autoridades. É muito mais fácil para nós destemidamente obedecer às autoridades do que para Deus instituí-las. Assim como Deus ousadamente estabeleceu autoridades, vamos corajosamente obedecê-las. Se algo ficar faltando, a falta não estará conosco, mas com as autoridades.

Quando enviou seus discípulos, o Senhor lhes disse que "quem vos der ouvidos, ouve-me a mim, e quem vos rejeitar, a mim me rejeita" (Lc 10.16). Como o Senhor foi destemido quando lhes delegou sua autoridade! Teve a fé e a ousadia de lhes confiar a sua autoridade. Talvez as pessoas argumentem: "E se a autoridade estiver errada?" A resposta é: se Deus teve coragem de confiar sua autoridade aos homens, então precisamos de coragem para obedecer. Se a pessoa com autoridade está certa ou errada não nos diz respeito, uma vez que é diretamente responsável para com Deus. Os obedientes só precisam obedecer; o Senhor não nos considerará responsáveis por qualquer erro devido à obediência, mas, antes, considerará responsável a autoridade delegada pelo erro cometido. A insubordinação, entretanto, é rebeldia, e, por esta, aquele que se encontra debaixo da autoridade terá de responder a Deus.

REJEITAR A AUTORIDADE DELEGADA É UMA AFRONTA A DEUS

Toda a parábola registrada em Lucas 20.9-16 focaliza a questão da autoridade delegada. Deus não veio pessoalmente para receber o que lhe era devido depois que arrendou a vinha aos lavradores. Três vezes enviou seus servos e na quarta vez enviou o seu próprio Filho. Todos foram seus delegados. Aos olhos de Deus, aqueles que rejeitam seus servos rejeitam-no pessoalmente. É impossível que ouçamos a palavra de Deus e não as palavras dos seus delegados. Não é preciso humildade para ser obediente à autoridade direta de Deus, mas é preciso modéstia e quebrantamento para ficar sujeito à autoridade delegada. Se uma pessoa não se despojar completamente da carne, não será capaz de aceitar e atender à autoridade delegada. É a natureza rebelde do homem que o faz desejar obedecer à autoridade direta de Deus sem ficar sujeito às autoridades delegadas que Deus estabeleceu.

Todo o Novo Testamento se apoia na autoridade delegada. A única exceção se encontra em Atos 5.29, quando Pedro e os apóstolos responderam ao concílio judeu que lhes proibia ensinar em nome do Senhor Jesus: "Antes importa obedecer a Deus do que aos homens." Isto porque a autoridade delegada, neste caso, transgrediu distintamente a ordem de Deus e pecou contra a Pessoa do Senhor. Uma resposta como essa só poderia ser dada nesta situação particular. Em todas as outras circunstâncias temos de aprender a nos sujeitarmos às autoridades delegadas. Jamais deveríamos produzir obediência através da rebeldia.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'O autor diz que, se conhecêssemos só a autoridade direta de Deus, "possivelmente violamos mais da metade de sua autoridade". Faça um inventário honesto: em quantas autoridades delegadas (lar, igreja, trabalho, governo) você de fato se submete de coração?', 'reflexao', null),
    (v_aula_id, 2, 'Sobre a pergunta "e se a autoridade estiver errada?", Nee responde que o erro fica por conta dela diante de Deus, mas a insubordinação fica por conta de quem deveria obedecer. Como isso muda o seu modo de reagir a uma autoridade imperfeita?', 'reflexao', null),
    (v_aula_id, 3, 'Atos 5.29 ("antes importa obedecer a Deus do que aos homens") é a única exceção — quando a ordem contradiz claramente a ordem de Deus. Você consegue distinguir o que é de fato essa exceção do que é apenas a sua vontade própria não querendo se submeter?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 8 — A autoridade do corpo (a Igreja)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 8 — A autoridade do corpo (a Igreja)', 8,
$conteudo$"Porque, assim como o corpo é um, e tem muitos membros, e todos os membros, sendo muitos, constituem um só corpo, assim também com respeito a Cristo... Mas Deus dispôs os membros, colocando cada um deles no corpo, como lhe aprouve... O certo é que há muitos membros, mas um só corpo. Não podem os olhos dizer à mão: Não precisamos de ti; nem ainda a cabeça, aos pés: Não preciso de vós" (1Co 12.12-21).

A AUTORIDADE SE EXPRESSA DE MANEIRA MAIS COMPLETA NO CORPO

A mais ampla expressão da autoridade de Deus se encontra no corpo de Cristo, sua Igreja. Embora Deus tenha estabelecido o procedimento da autoridade neste mundo, nenhum daqueles relacionamentos (governantes e povo, pais e filhos, maridos e esposas, senhores e servos) pode dar à autoridade sua expressão mais ampla. Considerando que as muitas autoridades governantes na terra são todas institucionais, sempre há a possibilidade da aparência de subordinação sem que haja realmente sujeição do coração. Esses exemplos de sujeição ficam dentro do raio de ação dos relacionamentos humanos; consequentemente são temporais e estão sujeitos à separação. Portanto fica claro que a sujeição absoluta e perfeita não se pode encontrar neles.

Só o relacionamento entre Cristo e a igreja pode expressar totalmente a autoridade e a obediência. Pois Deus não chamou a igreja para ser uma instituição; ordenou que fosse o corpo de Cristo. A igreja é o corpo de Cristo, enquanto Cristo é o Cabeça da igreja. Os relacionamentos de pais e filhos, senhores e servos, e até mesmo maridos e esposas, todos podem ser interrompidos, mas o corpo físico não pode ser separado de sua cabeça; são um para sempre. Do mesmo modo, Cristo e a igreja também não podem nunca ser separados. A autoridade e a obediência encontradas em Cristo e na igreja são de uma natureza tão perfeita que ultrapassam todas as outras expressões de autoridade e obediência.

Apesar do amor que os pais têm para com seus filhos, estão sujeitos ao uso ilegal de sua autoridade. Semelhantemente, os governos podem emitir ordens erradas ou os senhores podem abusar de sua autoridade. Neste mundo, a autoridade, assim como a obediência, são todas imperfeitas. Isto explica por que Deus desejou estabelecer uma autoridade perfeita e uma obediência perfeita em Cristo e na igreja, sendo ele o Cabeça e ela o corpo. Mas nenhuma cabeça fará mal ao seu próprio corpo; a autoridade da cabeça não está sujeita a erro, mas é perfeita. Do mesmo modo, a obediência do corpo à cabeça é perfeita. Logo que a cabeça concebe uma ideia, os dedos se movem naturalmente, harmoniosamente, silenciosamente. A intenção de Deus para nós é que prestemos obediência completa; ele não se satisfará até que sejamos colocados no mesmo grau de obediência do corpo para com a sua cabeça.

Deus vai operar em seu povo até que o relacionamento entre Cristo e a igreja siga o mesmo padrão do relacionamento entre Deus e o seu Cristo. A primeira fase do trabalho divino é fazer-se ele mesmo o Cabeça de Cristo. A segunda fase é tornar Cristo o Cabeça da igreja. A terceira fase é tornar o reino deste mundo no reino de nosso Senhor e do seu Cristo. A primeira fase já foi realizada, a terceira está por vir. Atualmente nos encontramos na fase do meio. A igreja está no meio, servindo de pivô. Sobre os nossos ombros está a responsabilidade de manifestar autoridade.

PARA O CORPO OBEDECER À CABEÇA É A COISA MAIS NATURAL

Deus providenciou para que a cabeça e o corpo participassem de uma só vida e natureza. Portanto, é a coisa mais natural para o corpo obedecer à cabeça. Em nossos corpos físicos alguns movimentos são conscientes, enquanto outros são automáticos. Nosso coração bate automaticamente; não espera que se dê uma ordem. Esta é a obediência da vida. A cabeça solicita a obediência do corpo sem alarde ou compulsão, sem nenhum conflito, e em perfeita harmonia. Mas hoje em dia há pessoas que só obedecem ordens. Isto não é apropriado, pois por trás da ordem jaz a vontade, e a vontade é a lei da vida. A obediência forçada não segue o padrão da obediência. Resumindo, a igreja é o lugar não só da comunhão dos irmãos e irmãs, mas também o local da manifestação da autoridade.

RESISTIR À AUTORIDADE DOS MEMBROS É RESISTIR À CABEÇA

Embora a autoridade do corpo às vezes seja manifestada diretamente, muitas vezes ela se manifesta de maneira indireta. O corpo não está apenas sujeito à cabeça; além disso, seus diversos membros ajudam-se mutuamente e estão sujeitos uns aos outros. As mãos direita e esquerda não têm comunicação direta; é a cabeça que as movimenta. A mão não pode ver cores, por isso tem de aceitar a autoridade do olho. Precisamos reconhecer nos outros membros a autoridade da Cabeça. Se o pé rejeitasse a mão, seria o mesmo que rejeitar a Cabeça. Mas se aceitamos a autoridade de um membro, é o mesmo que aceitar a autoridade da Cabeça. A função de cada membro constitui a sua autoridade.

AS RIQUEZAS DE CRISTO SÃO AUTORIDADE

É impossível fazer de cada membro um corpo completo; cada um de nós tem de aprender a permanecer na posição de membro e aceitar as operações dos outros membros. Nenhum membro pode dar-se ao luxo de ser independente. A autoridade é apenas uma outra expressão das riquezas de Cristo. Só aceitando as funções dos outros — aceitando sua autoridade — recebe-se a riqueza de todo o corpo. Submeter-se à autoridade dos outros membros é possuir suas riquezas. A insubordinação cria pobreza.

Geralmente interpretamos mal a autoridade como algo que nos oprime, nos magoa, nos perturba. Deus não tem um conceito assim. Ele usa autoridade para suprir nossas falhas. Sua motivação para a instituição da autoridade é conceder-nos suas riquezas e suprir as necessidades dos fracos. Deus, na maioria das vezes, garante a sua graça indiretamente — isto é, coloca sobre nós irmãos e irmãs na igreja que são mais desenvolvidos espiritualmente, para que aceitemos o julgamento deles como nosso. Com isto nos tornamos aptos a possuir as riquezas deles sem que passemos por dolorosas experiências. A riqueza de cada membro é a riqueza de todos. Rebelar-se é preferir o caminho da pobreza. Resistir à autoridade é rejeitar os meios da graça e da riqueza.

A VIDA TORNA FÁCIL A OBEDIÊNCIA

Para o mundo, assim como foi para os israelitas, é difícil obedecer, porque não há um elo de vida. Mas para nós, que temos um relacionamento vital, desobedecer é que é difícil. Há uma unidade interna — uma vida e um Espírito, o Espírito Santo orientando e controlando tudo. Sentimo-nos felizes e em paz quando nos sujeitamos uns aos outros. Ficando sujeitos à autoridade dos outros membros, experimentamos uma grande emancipação. A obediência é natural; desobedecer é difícil.

O Senhor chamou-nos para aprender a obediência no corpo, na igreja, como também no lar e no mundo. A igreja é o lugar onde temos de começar a aprender obediência. É o lugar do cumprimento como também o lugar da provação. Se fracassarmos ali, fracassaremos em qualquer lugar. Autoridade e obediência encontram-se no corpo de Cristo; ambas se tornam subjetivas e as duas se mesclam numa só. Eis aí a mais alta expressão da autoridade de Deus. Se fracassarmos em reconhecer a autoridade aqui, não há outra saída.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Nee diz que a autoridade não foi dada para nos oprimir, mas para "suprir nossas falhas" com as riquezas dos outros membros. Você tende a ver a autoridade como ameaça ou como provisão? Por quê?', 'reflexao', null),
    (v_aula_id, 2, 'No corpo, "a mão não pode ver cores, por isso tem de aceitar a autoridade do olho". Em que área você insiste em "enxergar por si mesmo" quando deveria receber a função (a autoridade) de outro membro do corpo?', 'reflexao', null),
    (v_aula_id, 3, 'A igreja é "o lugar onde temos de começar a aprender obediência; se fracassarmos ali, fracassaremos em qualquer lugar". Como tem sido, na prática, a sua submissão dentro da sua comunidade local?', 'reflexao', null);
  end if;
end
$migration$;
