-- =============================================================
-- Curso: Autoridade Espiritual (Watchman Nee)
-- Montado capítulo a capítulo, seguindo a NUMERAÇÃO do livro.
-- Cada aula = um capítulo; aulas.ordem = número do capítulo.
--
-- O livro NÃO tem "Desafio Prático". As atividades de cada aula
-- são perguntas de reflexão (tipo='reflexao') elaboradas a partir
-- do tema do capítulo — não bloqueiam o avanço e ficam disponíveis
-- para devolutiva pastoral.
--
-- Cabeçalhos de seção em CAIXA ALTA para renderizarem como títulos
-- (ver ehTitulo() em components/AulaConteudo.tsx).
--
-- Esta migration cria o curso e insere o CAPÍTULO 1. Os demais
-- capítulos entram em migrations seguintes (087, 088, ...) que
-- localizam o curso pelo slug e inserem a aula no ordem
-- correspondente — sem mexer no que já existe.
--
-- Idempotente: pode ser reaplicada sem duplicar curso/aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
  v_next_ordem int;
begin
  -- ---------------------------------------------------------------
  -- Curso (idempotente por slug)
  -- ---------------------------------------------------------------
  select id into v_curso_id from public.cursos
  where slug = 'autoridade-espiritual';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values (
      'autoridade-espiritual',
      'Autoridade Espiritual',
      'Estudo guiado a partir do clássico Autoridade espiritual, de Watchman Nee. Cada capítulo traz o texto na íntegra e, ao final, perguntas de reflexão para você examinar sua própria submissão à autoridade de Deus e às autoridades por ele delegadas. Dividido em duas partes — Autoridade e Submissão, e Autoridades Delegadas. Os capítulos vão sendo liberados conforme a numeração do livro.',
      '/api/og/curso/autoridade-espiritual',
      false,
      0,
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 1 — A importância da autoridade  (aula ordem = 1)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 1;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 1 — A importância da autoridade',
      1,
$conteudo$"Todo homem esteja sujeito às autoridades superiores; porque não há autoridade que não proceda de Deus; e as autoridades que existem foram por ele instituídas. De modo que aquele que se opõe à autoridade, resiste à ordenação de Deus; e os que resistem trarão sobre si mesmos condenação. Porque os magistrados não são para temor quando se faz o bem, e, sim, quando se faz o mal. Queres tu não temer a autoridade? Faze o bem, e terás louvor dela; visto que a autoridade é ministro de Deus para teu bem. Entretanto, se fizeres o mal, teme; porque não é sem motivo que ela traz a espada; pois é ministro de Deus, vingador, para castigar o que pratica o mal. É necessário que lhe estejais sujeitos, não somente por causa do temor da punição, mas também por dever de consciência. Por esse motivo também pagais tributos: porque são ministros de Deus, atendendo constantemente a este serviço. Pagai a todos o que lhes é devido; a quem tributo, tributo; a quem imposto, imposto; a quem respeito, respeito; a quem honra, honra" (Rm 13.1-7).

"Ele, que é o resplendor da glória e a expressão exata do seu Ser, sustentando todas as cousas pela palavra do seu poder, depois de ter feito a purificação dos pecados, assentou-se à direita da Majestade nas alturas" (Hb 1.3).

"Como caíste do céu, ó estrela da manhã, filho da alva! Como foste lançado por terra, tu que debilitavas as nações! Tu dizias no teu coração: Eu subirei ao céu; acima das estrelas de Deus exaltarei o meu trono, e no monte da congregação me assentarei, nas extremidades do Norte; subirei acima das mais altas nuvens, e serei semelhante ao Altíssimo" (Is 14.12-14).

O TRONO DE DEUS ESTABELECIDO SOBRE AUTORIDADE

Deus age a partir do seu trono, e o seu trono está estabelecido sobre a sua autoridade. Todas as coisas são criadas pela autoridade de Deus e todas as leis físicas do universo são mantidas através de sua autoridade. Por isso a Bíblia diz que Deus está "sustentando todas as cousas pela palavra do seu poder", o que significa que todas as coisas são mantidas pela palavra do poder de sua autoridade. Pois a autoridade divina representa o próprio Deus, enquanto o seu poder se expressa apenas pelos seus atos. O pecado contra o poder é mais facilmente perdoado do que o pecado contra a autoridade, porque este é um pecado contra o próprio Deus. Só Deus é autoridade em todas as coisas; toda a autoridade da terra foi instituída por Deus. A autoridade é uma coisa tremenda no universo — nada a sobrepuja. Portanto é imperativo que nós, que desejamos servir a Deus, conheçamos a autoridade de Deus.

A ORIGEM DE SATANÁS

O arcanjo transformou-se em Satanás quando tentou usurpar a autoridade de Deus, competir com Deus, e assim se tornou um adversário de Deus. Foi a rebeldia que provocou a queda de Satanás.

Tanto Isaías 14.12-15 como Ezequiel 28.13-17 falam da ascensão e queda de Satanás. A primeira passagem, entretanto, enfatiza como Satanás violou a autoridade divina, enquanto a segunda enfatiza sua transgressão contra a santidade de Deus. Ofender a autoridade de Deus é uma rebeldia bem mais séria do que ofender a santidade de Deus. Considerando que é uma questão de conduta, o pecado é mais facilmente perdoado do que a rebeldia, pois esta última é uma questão de princípio. A intenção de Satanás de estabelecer o seu trono acima do trono de Deus foi o que violou a autoridade de Deus; foi o princípio da autoexaltação. O ato do pecado não foi o que provocou a queda de Satanás; esse ato não passou do produto de sua rebeldia contra a autoridade. Foi a rebeldia que Deus condenou. Quando servimos a Deus não devemos desobedecer às autoridades, porque isso é um princípio satânico. Como podemos pregar a Cristo de acordo com o princípio de Satanás? Pois é possível, em nossa obra, permanecermos com Cristo em doutrina e, ao mesmo tempo, permanecermos com Satanás em princípio. Que coisa iníqua presumirmos que estamos executando a obra do Senhor! Por favor, observe que Satanás não tem medo quando pregamos a palavra de Cristo, mas como tem medo quando nos submetemos à autoridade de Cristo! Nós, que servimos a Deus, jamais deveríamos servi-lo de acordo com o princípio de Satanás. Sempre que o princípio de Cristo está operando, o de Satanás se desvanece. Satanás continua sendo um usurpador; ele será derrotado no fim dos tempos, segundo o livro do Apocalipse. Se quisermos verdadeiramente servir a Deus, temos de nos purificar completamente do princípio de Satanás.

Na oração que nosso Senhor ensinou à sua igreja, a expressão "e não nos deixes cair em tentação" destaca a obra de Satanás, enquanto a expressão "mas livra-nos do mal" refere-se diretamente ao próprio Satanás. Imediatamente após estas palavras o Senhor faz uma declaração muitíssimo significante: "pois teu é o reino, o poder e a glória para sempre. Amém" (Mt 6.13). Todo reino, autoridade e glória pertencem a Deus e somente a ele. O que nos liberta totalmente de Satanás é a percepção desta preciosíssima verdade — que o reino é de Deus. Considerando que todo o universo está sob o domínio de Deus, temos de nos sujeitar à sua autoridade. Que ninguém usurpe a glória de Deus.

Satanás mostrou todos os reinos da terra ao Senhor, mas o Senhor respondeu que o reino dos céus é de Deus. Temos de perceber de quem é a autoridade. Pregamos o evangelho a fim de colocarmos os homens sob a autoridade de Deus, mas como podemos estabelecer a autoridade de Deus na terra se nós mesmos ainda não a conhecemos? Como nos seria possível enfrentar Satanás?

AUTORIDADE, A CONTROVÉRSIA DO UNIVERSO

A controvérsia do universo centraliza-se sobre quem deve ter autoridade, e nosso conflito com Satanás é o resultado direto de atribuirmos autoridade a Deus. Para manter a autoridade de Deus temos de nos submeter a ela com todo o nosso coração. É absolutamente necessário que reconheçamos a autoridade de Deus e que possuamos uma noção básica do que ela significa.

Antes de reconhecer a autoridade, Paulo tentou acabar com a igreja; depois de se encontrar com o Senhor na estrada de Damasco, entendeu que era difícil recalcitrar (o poder humano) contra os aguilhões (autoridade divina). Imediatamente caiu ao chão e reconheceu Jesus como Senhor. Depois disso, foi capaz de se submeter à orientação que lhe foi dada por Ananias na cidade de Damasco, pois Paulo tomara conhecimento da autoridade de Deus. No momento em que foi salvo, reconheceu a autoridade de Deus além da salvação de Deus. Como podia Paulo, que era inteligente e capacitado, dar ouvido às palavras de Ananias — um humilde e desconhecido irmão que só foi mencionado uma única vez na Bíblia — se não reconhecesse a autoridade de Deus? Se não tivesse tido um encontro com a autoridade na estrada de Damasco, jamais se teria sujeitado a esse obscuro e humilde irmão na cidade. Isto nos faz ver que todo aquele que conhece a autoridade lida puramente com a autoridade, e não com o homem. Não consideremos o homem, mas unicamente a autoridade investida nele. Não obedeçamos ao homem, mas à autoridade de Deus que está nesse homem. De outro modo, como poderíamos ficar sabendo o que é autoridade? Estamos trilhando uma estrada errada se vemos o homem primeiro, antes de obedecer à autoridade. O oposto é o certo. Nesse caso não nos fará diferença quem é o homem.

Deus tem o propósito de manifestar sua autoridade ao mundo através da igreja. A autoridade de Deus pode ser percebida na coordenação dos diversos membros do corpo de Cristo. Deus usa seu poder máximo para manter sua autoridade; por isso a coisa mais difícil de enfrentar é a sua autoridade. Nós, que somos tão cheios de justiça própria e ainda assim tão cegos, precisamos, uma vez em nossa vida, ter um encontro com a autoridade de Deus para sermos quebrantados até à submissão e assim começar a aprender a obedecer a essa autoridade. Antes que um homem se sujeite à autoridade delegada por Deus, é preciso que reconheça a autoridade inerente a Deus.

OBEDIÊNCIA À VONTADE DE DEUS — A MAIOR DAS EXIGÊNCIAS DA BÍBLIA

A maior das exigências que Deus faz ao homem não é a de carregar a cruz, servir, fazer ofertas, ou negar-se a si mesmo. A maior das exigências é que obedeça. Deus ordenou que Saul atacasse os amalequitas e os destruísse totalmente (1Sm 15). Mas, após a vitória, Saul poupou Agague, o rei dos amalequitas, junto com o que havia de melhor entre os bois e as ovelhas, os cordeiros e animais mais gordos e todas as coisas valiosas. Saul não quis destruí-los; argumentou que os poupara para sacrificá-los a Deus. Mas Samuel lhe disse: "Eis que o obedecer é melhor do que o sacrificar, e o atender melhor do que a gordura de carneiros" (versículo 22). Os sacrifícios mencionados aqui eram ofertas de cheiro suave — não tendo nada a ver com o pecado, pois as ofertas pelo pecado jamais foram chamadas de ofertas de cheiro suave. Eram oferecidas para aceitação e satisfação de Deus. Por que Samuel disse que "obedecer é melhor do que sacrificar"? Porque mesmo no sacrifício pode haver o elemento da vontade própria. Só a obediência honra a Deus de maneira absoluta, pois só ela coloca a vontade de Deus no centro.

Para que a autoridade se expresse, é preciso que haja submissão. Se é preciso que haja submissão, o ego precisa ficar excluído; mas, de acordo com o ego, a submissão torna-se impossível. Isto só se torna possível quando alguém vive no Espírito. É a mais alta expressão da vontade de Deus.

A ORAÇÃO DE NOSSO SENHOR NO GETSÊMANI

Há quem pense que a oração de nosso Senhor no Getsêmani, quando o seu suor se transformou em gotas de sangue, foi devido à fraqueza de sua carne, ao temor que tinha de beber o cálice. De modo nenhum, pois a oração no Getsêmani fundamenta-se no mesmo princípio de 1 Samuel 15.22. É a oração suprema na qual nosso Senhor expressa sua obediência à autoridade de Deus. Nosso Senhor considerava o obedecer à autoridade de Deus mais importante do que o sacrificar-se sobre a cruz. Ele ora sinceramente para conhecer a vontade de Deus. Ele não diz: "Eu quero ser crucificado, eu tenho de beber o cálice." Simplesmente insiste em obedecer. Na realidade, diz: "Se houver possibilidade de não subir à cruz", mas ainda aqui não é a sua vontade que se destaca. Imediatamente ele continua, dizendo: "mas seja feita a tua vontade."

A vontade de Deus é absoluta; o cálice (isto é, a crucificação) não é absoluto. Se Deus preferisse que o Senhor não fosse crucificado, então ele não teria de subir à cruz. Antes de conhecer a vontade de Deus, o cálice e a vontade de Deus eram duas coisas separadas; contudo, depois que tomou conhecimento de que era de Deus, o cálice e a vontade de Deus se mesclaram numa só coisa. A vontade representa autoridade. Portanto, para conhecer a vontade de Deus e obedecê-la, é preciso sujeitar-se à autoridade. Mas como alguém pode sujeitar-se à autoridade se não ora ou não tem desejo de conhecer a vontade de Deus?

"Não beberei, porventura, o cálice que o Pai me deu?", disse o Senhor (Jo 18.11). Aqui ele sustenta a supremacia da autoridade de Deus, não de sua cruz. Mais adiante, tendo compreendido que beber o cálice — isto é, ser crucificado para expiação — é a vontade de Deus, imediatamente diz: "Levantai-vos, vamos!" (Mt 26.46). Indo à cruz, ele realiza a vontade de Deus. Consequentemente, a morte do Senhor é a mais alta expressão de obediência à autoridade. Mesmo a cruz, o ponto culminante do universo, não pode ser mais importante do que a vontade de Deus. Jesus considera a autoridade de Deus (a vontade de Deus) mais importante que a sua própria cruz (seu sacrifício).

No servir a Deus não somos chamados à abnegação ou ao sacrifício, mas a cumprir o propósito de Deus. O princípio básico não é o de escolher a cruz, mas de obedecer à vontade de Deus. Se o princípio sobre o qual trabalhamos e servimos inclui rebeldia, então Satanás receberá e desfrutará a glória mesmo através de nossos sacrifícios. Saul poderia oferecer bois e ovelhas, mas Deus jamais os aceitaria como sacrifícios oferecidos a ele, porque havia um princípio satânico envolvido. Eis por que as Escrituras declaram que "a rebelião é como o pecado de feitiçaria, e a obstinação é como a idolatria e culto a ídolos do lar" (1Sm 15.23).

Na qualidade de servos de Deus, a primeira coisa que temos de fazer é travar relações com a autoridade. Entrar em contato com a autoridade é coisa tão prática como entrar em contato com a salvação, mas é uma lição mais profunda. Antes de podermos trabalhar para Deus, temos de ser conquistados por sua autoridade. Todo o nosso relacionamento com Deus é regulado pelo fato de termos ou não travado relações com a autoridade. Em caso afirmativo, encontraremos a autoridade em todos os lugares e, sendo assim governados por Deus, podemos começar a ser usados por ele.

COMO NOSSO SENHOR E PAULO AGIRAM EM JUÍZO

Mateus 26 registra o julgamento duplo que nosso Senhor enfrentou após seu aprisionamento. Diante do sumo sacerdote ele recebeu julgamento religioso e, diante de Pilatos, julgamento político. Quando foi julgado por Pilatos, o Senhor não respondeu, pois não se encontrava sob a jurisdição terrena. Mas quando o sumo sacerdote o conjurou pelo Deus vivo, então lhe deu resposta. Isto é obediência à autoridade. Conforme registrado em Atos 23, quando Paulo estava sendo julgado, imediatamente se submeteu ao descobrir que Ananias era o sumo sacerdote de Deus.

Por isso, nós, que trabalhamos, temos de enfrentar face a face a autoridade. Caso contrário, nosso trabalho ficará sob o princípio rebelde de Satanás e trabalharemos sem o conhecimento da vontade de Deus. Não estaremos sob o princípio da obediência à autoridade. Mas é somente trabalhando na obediência à autoridade que podemos trabalhar de acordo com a vontade de Deus. Oh! isto realmente exige uma grande revelação!

Em Mateus 7.21-23 encontramos nosso Senhor repreendendo aqueles que profetizam e expulsam demônios e fazem muitas coisas grandiosas em seu nome. Por que foram censurados? Porque o seu ponto de partida foi o ego; eles mesmos faziam coisas em nome do Senhor. Esta é a atividade da carne. Por isso nosso Senhor declarou-os malfeitores e não seus obreiros. Ele enfatiza que só a pessoa que faz a vontade do seu Pai entrará no reino dos céus. Só isto constitui obediência à vontade de Deus, isto que se origina com Deus. Não temos de procurar trabalho para fazer, mas temos de ser enviados por Deus para trabalhar. Quando entendermos isto, realmente experimentaremos a realidade da autoridade do reino dos céus.

PARA PERCEBER A AUTORIDADE É PRECISO UMA GRANDE REVELAÇÃO

Há dois importantes aspectos no universo: confiar na salvação de Deus e obedecer à sua autoridade. Confiar e obedecer. A Bíblia define o pecado como transgressão (1Jo 3.4). A transgressão é desobediência à autoridade de Deus; e isto é pecado. Pecar é uma questão de conduta, mas transgressão é uma questão de atitude do coração. O presente século caracteriza-se pela transgressão. O mundo está cheio do pecado de transgressão, e logo o fruto desse pecado aparecerá. A autoridade no mundo está sendo cada vez mais solapada até que, finalmente, todas as autoridades serão destituídas e a transgressão governará.

Saibamos que no universo existem dois princípios: o da autoridade de Deus e o da rebeldia satânica. Não podemos servir a Deus e simultaneamente andar pelo caminho da rebeldia, revelando um espírito rebelde. Satanás ri quando uma pessoa rebelde prega a palavra, pois nessa pessoa habita o princípio satânico. O princípio do serviço tem de ser a autoridade. Vamos ou não vamos obedecer à autoridade de Deus? Nós, que servimos a Deus, temos de perceber este critério básico da autoridade. Alguém que já tenha experimentado um choque elétrico sabe que não pode ser descuidado com eletricidade. Do mesmo modo, uma pessoa que já foi ferida pela autoridade de Deus, a partir daí mantém os olhos abertos para julgar o que é transgressão nela mesma e nos outros.

Que Deus nos conceda a graça de nos livrar da rebeldia. Só depois que reconhecemos a autoridade de Deus e aprendemos a obedecer, podemos orientar os seus filhos pelo caminho da retidão.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Watchman Nee afirma que "o pecado contra a autoridade é um pecado contra o próprio Deus". Em que áreas da sua vida você percebe que tem lidado com a autoridade de Deus mais como doutrina do que como submissão real do coração?',
     'reflexao', null),
    (v_aula_id, 2,
     'No Getsêmani, Jesus colocou a vontade do Pai acima do próprio cálice. Pense em uma decisão recente: você buscou primeiro saber a vontade de Deus, ou escolheu o caminho do sacrifício/serviço a partir da sua própria vontade?',
     'reflexao', null),
    (v_aula_id, 3,
     'O autor diz que "antes de podermos trabalhar para Deus, temos de ser conquistados por sua autoridade". Você já teve um encontro pessoal com a autoridade de Deus que o quebrantou até a submissão? Descreva-o — ou peça a Deus por ele.',
     'reflexao', null);
  end if;
end
$migration$;
