-- Curso: Maturidade (Luciano Subirá) — slug maturidade. Transcrição integral (PyMuPDF/OCR).
do $migration$
declare v_curso_id uuid; v_aula_id uuid; v_next_ordem int;
begin
  select id into v_curso_id from public.cursos where slug = 'maturidade';
  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, categoria, ordem, publicado)
    values ('maturidade','Maturidade','Estudo a partir de Maturidade, de Luciano Subirá. Cada aula traz o texto na íntegra e, ao final, perguntas de reflexão para a sua caminhada com Deus.','/api/og/curso/maturidade', false, 0, 'discipulado', v_next_ordem, true)
    returning id into v_curso_id;
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 1;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Introdução$t$, 1,
$conteudo$“Você jamais chegará à maturidade espiritual apenas comparecendo aos cultos como um espectador passivo.”

(Rick Warren)

Nos últimos anos, o Espírito Santo tem-me despertado e até mesmo me incomodado a abordar mais questões ligadas ao crescimento espiritual e ao processo de amadurecimento. Fui muito ajudado, quando ainda bem jovem, pela leitura de materiais que tratavam o assunto de forma específica — não apenas indiretamente. Um exemplo é o livro Crescendo Espiritualmente, de Kenneth Hagin, que até baseia meu entendimento e minhas mensagens.

Recentemente, nosso ministério de ensino, Orvalho.Com, publicou o livro Fora do Alcance das Crianças — A Plenitude de Deus Está Esperando Você Crescer, de meu amigo Drummond Lacerda. É um compilado enriquecedor sobre maturidade cristã, matéria que o autor leciona há muitos anos no Seminário Teológico Carisma, da Igreja Batista da Lagoinha, em Belo Horizonte (MG). Lacerda ressalta o equilíbrio como um dos principais indicadores de maturidade.

Recomendo muito a leitura de ambos os livros. Ultimamente, porém, sinto a necessidade de, em meus próprios ensinos, adentrar outras esferas e perspectivas necessárias ao desenvolvimento do cristão, da fase recém-nascida à etapa adulta — conteúdo que você encontrará nestas páginas. São abordagens complementares às literaturas mencionadas, todas muito úteis.

Lembre que Jesus louvou a fé daquela mulher cananeia, que vislumbrou a sobra da mesa dos filhos como suficiente para alimentá-la. Certamente, o pão dos filhos é melhor que as migalhas! Porém, a herança não é acessada pelos filhos quando crianças — eles precisam crescer para experimentar o que, por direito de filiação, já lhes pertence. Não apenas é interesse do Pai que você cresça à estatura do varão perfeito, que é Cristo; é requisito para que você experimente o melhor dele.

Sugiro que você não apenas leia este livro que está em suas mãos, mas também reflita, estude e medite em cada princípio bíblico. Ore sobre o assunto. Examine sua vida à luz destas verdades. Permita- se acelerar — e não retardar — seu próprio crescimento. A plenitude do que Deus preparou aguarda os maduros.

Não posso deixar de mencionar também minha alegria de unir forças com a Central Gospel nesta publicação e, assim, com tão importante mensagem, poder alcançar um número ainda maior de irmãos em Cristo.

Que o Espírito Santo, enviado para guiar-nos a toda verdade, possa iluminar os olhos de seu entendimento e, mais que informação, transmita consciência espiritual e despertamento à sua vida!

Luciano Subirá$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$De que maneira você tem se comportado diante da sua própria caminhada: como um espectador passivo dos cultos ou como alguém comprometido com o crescimento espiritual?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que incômodo o Espírito Santo talvez esteja despertando em você neste momento, chamando-o a sair da estagnação e avançar rumo ao amadurecimento?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quais leituras, ensinos ou companhias Deus pode usar para aprofundar o seu processo de amadurecer na fé, e você está disposto a buscá-los?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 2;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A importância da maturidade$t$, 2,
$conteudo$S

“Na juventude, aprendemos; na maturidade, compreendemos.”

(C.H. Spurgeon)

ou grato a Deus e a toda uma geração de ministros pelo ensino sobre fé. Nas décadas de 50 e 60, uma abordagem específica começou a espalhar-se, de forma consistente, por todo o mundo. Muito antes, a justificação pela fé já voltara às pregações, especialmente a partir da Reforma Protestante, no século 16 — nos períodos seguintes, verdadeiros heróis marcaram a história cristã, conhecidos tanto pela fé que mantinham como pelo que realizavam por meio dela. Contudo, meu foco está na ênfase mais recente, multiplicada no século passado. Um ensino claro, objetivo e mais abrangente sobre a operação da fé foi necessário.

Nos dias do movimento pentecostal, ícones como Smith Wigglesworth, que se moveram em uma fé extraordinária, passaram a falar mais sobre o assunto, porém foi na segunda metade do século 20 que o tema, já em uma abordagem mais ampla, ganhou proporções mundiais. Ensinos de homens como David Young Cho, da Coreia do Sul, Robert Thom, da África do Sul, e Kenneth Hagin, dos Estados Unidos, foram traduzidos para diversos idiomas. Tais revelações abençoaram muitos — inclusive a mim. Ainda na adolescência, fui despertado a entender e a praticar a fé.

É IMPORTANTE, MAS...

Fé é importante. Na verdade, podemos classificá-la como vital e essencial na caminhada cristã, pois não há salvação sem ela. Como está escrito: Porque pela graça sois salvos, mediante a fé (Ef 2.8). O próprio Cristo declarou: Porque Deus amou ao mundo de tal maneira que deu o seu Filho unigênito, para que todo o que nele crê não pereça, mas tenha a vida eterna (Jo 3.16).

Se fosse apenas por essa razão, ela já deveria ser classificada como importantíssima. No entanto, vamos além para ver que todo relacionamento com Deus é baseado na fé. O profeta Habacuque disse: O justo viverá pela sua fé (Hc 2.4). Essa declaração é repetida três vezes no Novo Testamento (Rm 1.17; Gl 3.11; Hb 10.38).

As Escrituras ainda esclarecem que sem fé é impossível agradar a Deus (Hb 11.6), além de ser impossível receber qualquer coisa da parte dele — esta última sentença foi descrita por Tiago, ao comparar o homem que duvida à onda do mar: Não suponha esse homem que alcançará do Senhor alguma coisa (Tg 1.7). O próprio Cristo estabeleceu a fé como condição para se ver mais daquilo que Deus pode fazer: Não te disse eu que, se creres, verás a glória de Deus? (Jo 11.40).

Creio que o movimento de fé, promovido no século 20, ajudou a Igreja a crescer muito. Porém, como todo processo de restauração corre o risco de ir de um extremo a outro, houve excessos e erros. A partir da completa falta de ensino sobre fé, passou-se a acreditar que tudo, na vida cristã, pode ser alcançado apenas com ela. Sem contar as mutações na mensagem, que limitaram o alcance exclusivamente a bênçãos materiais e terrenas.

Fé sempre será importante. Entretanto, é necessário enxergar um “mas”, um “porém”. O quadro é maior e deve ser considerado por completo, senão a essência é contaminada ou, pelo menos, reduzida.

MAIS QUE FÉ

A pergunta a ser feita é: Será que a fé, sozinha, leva-nos a alcançar tudo aquilo que Deus tem para nós? Surpreendentemente, a resposta é não!

Por exemplo, não se pode negar que é necessário possuir fé para conseguir alcançar as promessas de Deus, pois está escrito: Os quais, por meio da fé, [...] obtiveram promessas (Hb 11.33). A mesma ideia se encontra na carta aos romanos, quando Paulo relaciona a fé de Abraão ao recebimento do que o Senhor havia prometido:

E, sem enfraquecer na fé, embora levasse em conta o seu próprio corpo amortecido, sendo já de cem anos, e a idade avançada de Sara, não duvidou, por incredulidade, da promessa de Deus; mas, pela fé, se fortaleceu, dando glória a Deus, estando plenamente convicto de que ele era poderoso para cumprir o que prometera.

Romanos 4.19-21

O escritor de Hebreus também acrescenta uma informação crucial: é necessário mais que fé. Enfim, a mesma Bíblia que salienta a necessidade vital da fé para alcançar as promessas divinas também indica que é preciso mais que isso para chegar lá. O que é necessário? Vamos ao texto:

Desejamos, porém, continue cada um de vós mostrando, até ao fim, a mesma diligência para a plena certeza da esperança; para que não vos torneis indolentes, mas imitadores daqueles que, pela fé e pela longanimidade, herdam as promessas. Pois, quando Deus fez a promessa a Abraão, visto que não tinha ninguém superior por quem jurar, jurou por si mesmo, dizendo: Certamente, te abençoarei e te multiplicarei. E assim, depois de esperar com paciência, obteve Abraão a promessa.

Hebreus 6.11-15

Abraão creu na promessa, conforme Romanos destaca, e teve de esperar com paciência para obtê- la. Logo, é preciso ser diligente até o fim e não apenas ter fé, mas também longanimidade.

A palavra traduzida como longanimidade, no original grego, é makrothumia (μακροθυμια) e, de acordo com Strong, significa: “paciência, tolerância, constância, firmeza, perseverança e clemência”. A Tradução Brasileira e a Nova Versão Internacional optaram pelo termo paciência, enquanto a Versão Corrigida de Almeida e a Nova Versão Transformadora escolheram “perseverança”. As três traduções sinônimas indicam a necessidade de haver uma fé somada à capacidade de não desistir.

Outros textos bíblicos também destacam o conceito mais que fé. Observe o que o apóstolo Pedro ensinou:

Por isso mesmo, empenhem-se para acrescentar à sua fé a virtude; à virtude o conhecimento; ao conhecimento o domínio próprio; ao domínio próprio a perseverança; à perseverança a piedade; à piedade a fraternidade; e à fraternidade o amor. Porque, se essas qualidades existirem e estiverem crescendo em suas vidas, elas impedirão que vocês, no pleno conhecimento de nosso Senhor Jesus Cristo, sejam inoperantes e improdutivos. Todavia, se alguém não as tem, está cego, só vê o que está perto, esquecendo-se da purificação dos seus antigos pecados. Portanto, irmãos, empenhem-se ainda mais para consolidar o chamado e a eleição de vocês, pois se agirem dessa forma, jamais tropeçarão, e assim vocês estarão ricamente providos quando entrarem no Reino eterno de nosso Senhor e Salvador Jesus Cristo.

2 Pedro 1.5-11 NVI

Pedro indicou o que deveria ser somado à fé em uma lista. Na Versão Atualizada de Almeida, em vez de “acrescentar”, foi utilizada a palavra associai. Na Tradução Brasileira, ajuntai. O termo original é epichoregeo (επιχορηγεω), cujo significado, segundo Strong, é “fornecer, suprir, dar”. Ainda engloba a ideia de “estar suprido, assistido, atendido”. Em outras palavras, a fé precisa de acréscimos. Ela não nos levará a alcançar a plenitude de Deus sozinha!

Neste livro, quero destacar uma das várias virtudes que precisam ser acrescentadas à fé: a maturidade. Atualmente, é fácil constatar que há grande deficiência nessa área. Há cristãos com anos de caminhada com Cristo, mas que possuem a mentalidade ciumenta do irmão do filho pródigo. Crentes de longa data, mas que ainda não largaram os “pecados de estimação”. Líderes religiosos há tempos, mas que cambaleiam infantilmente na convicção do próprio chamado. Filhos que nunca conseguiram acessar a plena herança prometida nas Escrituras, disponibilizada por meio da morte do testador, Cristo.

Acredito que uma das razões pelas quais não se investe devidamente no crescimento é porque também não existe uma compreensão adequada de sua importância.

O propósito desta mensagem é levar os cristãos ao entendimento de maturidade como uma “chave espiritual”. Consequentemente, isso despertará a valorização de um processo simplesmente fundamental para quem quer viver tudo o que o Pai celeste tem reservado. Sem maturidade, você e eu só conseguimos experimentar uma pequena parte disso. Portanto, se você deseja vivenciar tudo dele, tem de crescer.

A PLENITUDE DE DEUS AGUARDA OS MADUROS

Digo, pois, que, durante o tempo em que o herdeiro é menor, em nada difere de escravo, posto que é ele senhor de tudo. Mas está sob tutores e curadores até ao tempo predeterminado pelo pai. Assim, também nós, quando éramos menores, estávamos servilmente sujeitos aos rudimentos do mundo; vindo, porém, a plenitude do tempo, Deus enviou seu Filho, nascido de mulher, nascido sob a lei, para resgatar os que estavam sob a lei, a fim de que recebêssemos a adoção de filhos. E, porque vós sois filhos, enviou Deus ao nosso coração o Espírito de seu Filho, que clama: Aba, Pai! De sorte que já não és escravo, porém filho; e, sendo filho, também herdeiro por Deus.

Gálatas 4.1-7

Esse texto bíblico é nosso ponto de partida. Nele, Paulo comenta sobre um filho que, embora herdeiro, em nada difere de um escravo. Antes de explorar melhor a ilustração, quero ressaltar que o uso da frase assim também nós (v. 3) indica um paralelo entre a alegoria e a nossa vida espiritual:

1. Por um tempo, vivemos como escravos, sob a lei. Contudo, a vinda de Cristo, na plenitude dos tempos, proporcionou o direito de vivermos como filhos, e não mais como escravos. 2. Além disso, mesmo já vivendo como filhos, ainda há a necessidade de crescer e amadurecer para desfrutar a plenitude da herança que há em Cristo. Quero ressaltar as palavras-chaves filho e herdeiros, além da frase até ao tempo predeterminado. Observe que, no ensino do apóstolo, o vocábulo filho está diretamente conectado à inevitável consequência: herdeiro. Porém, ele destaca que, antes de poder usufruir a herança, é necessário chegar ao tempo predeterminado.

Paulo ilustra a aplicação espiritual com uma questão natural. Aqui se encontra uma prática aparentemente comum nos dias do apóstolo: o reconhecimento de que um filho é, por direito legal, herdeiro de tudo o que seu pai possui. Entretanto, outro elemento importante é destacado separadamente: o tempo em que o filho estaria liberado para usufruir a herança. A herança já era do filho, mas havia um tempo certo para usufrui-la.

Em outras palavras, não bastava ser herdeiro, era necessário passar um tempo sob o cuidado de tutores e curadores. Somente depois de cumprir esse tempo é que o acesso à herança seria liberado.

George Lyons, no Novo Comentário Bíblico Beacon, comenta acerca da ilustração:

Paulo tentou ilustrar o relacionamento entre Lei e Promessa e leis de herança contemporâneas (veja Hester, 1968), especificamente a prática da lei romana chamada tutela impuberis (guardião de menor) ou, mais especificamente, tutela testamentaria (guardião estabelecido por testamento). De acordo com a tutela impuberis, o filho, abaixo da maioridade (nēpios), na época da morte do pai, ficava sob custódia do tribunal, e o tribunal escolhia um guardião legal (epitropos) para administrar as questões financeiras do filho até chegar na maioridade (ēlikia). Por meio da tutela testamentaria, o pai poderia, entretanto, designar em seu testamento quem ele gostaria que fosse o guardião legal.

Por que um pai predeterminaria esse tempo? O que esperava alcançar ao submeter o filho a um período de espera e, também, ao treinamento de tutores e curadores? Qual era o propósito desse treinamento ao qual o menor era submetido?

A resposta é clara: ajudar o herdeiro a alcançar maturidade. Essa é uma poderosa chave de acesso à herança! Ela vale tanto para a vida espiritual como para a ministerial. Trata-se de um princípio importantíssimo, mas largamente ignorado pelos cristãos.

Para enxergar o quadro todo, este livro abordará assuntos como a dimensão da herança e o conceito de crescimento, com suas fases e processos necessários. Tudo o que será apresentado possui um objetivo: ajudar você a compreender sua própria herança e, mais importante, saber como acessá-la.

É muito provável que você já tenha lido aquela frase de advertência que aparece em caixas de remédio: “Mantenha fora do alcance de crianças”. Por que, então, devemos mantê-las fora do alcance de crianças?

O medicamento é algo bom ou ruim? Depende. Depende de quê? De quem tem acesso a ele. Sendo assim, nas mãos de um adulto, com o uso devido, o medicamento pode salvar a vida de alguém. Contudo, nas mãos de uma criança — que não possui maturidade para administrá-lo corretamente —, ele pode ser letal. O que mata ou salva a vida não é apenas o medicamento, e sim a maturidade de quem o utiliza.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você reconhece a maturidade como algo tão importante quanto a fé na sua vida cristã, ou tem dado pouca atenção ao seu próprio crescimento?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Em que áreas da sua caminhada você ainda apenas "aprende", mas precisa amadurecer para de fato "compreender" o que Deus tem ensinado?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que diferença faria na sua vida espiritual se você tratasse o amadurecimento como uma prioridade, e não como algo secundário?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 3;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$A herança$t$, 3,
$conteudo$O

“A condição pela qual tomamos posse de nossa herança espiritual em Cristo não é a força, mas a mansidão, pois tudo é nosso se somos de Cristo.”

(John Stott)

brasileiro, de modo geral, não tem inclinação a mensurar ou valorizar a palavra herança, mesmo quando aplicada espiritualmente. Por quê? Porque, como nação em desenvolvimento, a maioria de nós nunca recebeu uma herança. Além disso, dentre a minoria dos que receberam, grande parte não sabe o que é uma herança expressiva.

Outro dia, alguém me contou que receberia uma casa como herança. Eu, animado, disse: — Que bênção! Aquela pessoa, não tão animada, respondeu: — Pois é... Incomodado, indaguei: — Você não está empolgado com isso? Ele, então, explicou: — É que a casa, que nem vale muito, será dividida entre mais de 20 familiares. Apesar de o desenvolvimento da nação ser evidente, de modo cultural, ainda pensamos nos moldes das gerações passadas. Elas viveram e repassaram apenas a mentalidade de sobrevivência, não de construir e deixar uma herança. Até por conta da realidade financeira, isso é fato. Não temos igualdade social. A minoria dos brasileiros conheceu a riqueza, e a maioria vive com ganhos abaixo do que gostaria, ou inferiores às suas necessidades.

Logo, a ideia de herança está mais para os contos de fadas que muitos ouviram quando criança, ou para os filmes a que assistimos já na fase adulta. Isso mostra que ela parece ser apenas mera fantasia. Ainda que inconscientemente, não nos empolgamos quando ouvimos falar sobre a herança que possuímos em Deus.

A minha intenção, com este ensino, é levá-lo a entender a maturidade como uma chave que permite acessar e usufruir uma herança maravilhosa. Porém, se não conseguirmos compreender o que é, como valorizaremos o caminho para chegar a ela?

Portanto, neste capítulo, vamos discorrer sobre a nossa herança. Depois, com a possibilidade de conseguir valorizá-la por ter entendido seus fundamentos, retomaremos o tema maturidade. Então, passaremos a instruções práticas sobre como alcançá-la.

Ao falar acerca de herança, a ideia é estabelecer não só um vislumbre de quão grandiosa é, mas também expor princípios elementares relacionados a ela. Vamos ao primeiro.

A HERANÇA É DOS FILHOS

Paulo enfatizou aos cristãos de Roma:

Porque não recebestes o espírito de escravidão, para viverdes, outra vez, atemorizados, mas recebestes o espírito de adoção, baseados no qual clamamos: Aba, Pai. O próprio Espírito testifica com o nosso espírito que somos filhos de Deus. Ora, se somos filhos, somos também herdeiros, herdeiros de Deus e coerdeiros com Cristo; se com ele sofremos, também com ele seremos glorificados.

Romanos 8.15-17

Os filhos são herdeiros! Ao destacar nossa posição como filhos de Deus, o apóstolo afirma: Se somos filhos, somos também herdeiros. Portanto, o que dá o direito legal de ser incluído na herança é a filiação. É onde tudo começa.

Contudo, diferentemente do que diz o ditado popular “todo mundo é filho de Deus”, a Bíblia esclarece que nem todos o são, de fato. Não viramos filhos dele, de forma automática, quando nascemos. É uma experiência que ocorre pela fé em Cristo Jesus. Observe o que o apóstolo João falou acerca disso:

Veio para o que era seu, e os seus não o receberam. Mas, a todos quantos o receberam, deu-lhes o poder de serem feitos filhos de Deus, a saber, aos que creem no seu nome; os quais não nasceram do sangue, nem da vontade da carne, nem da vontade do homem, mas de Deus.

João 1.11-13

A frase veio para o que era seu faz referência à pessoa de Cristo, que veio para Seu próprio povo. Os judeus, de modo geral, não o receberam. Mas, a todos quantos o receberam (seja judeu, seja gentio), Ele deu-lhes o poder de serem feitos filhos de Deus.

A expressão serem feitos indica que, antes de crerem em Seu nome, eles ainda não eram filhos. Portanto, ninguém nasce filho de Deus, pois ele não nasce do sangue, nem da vontade da carne, nem do desejo humano, mas de Deus!

A Bíblia mostra que, para ser filho de Deus, é necessário que haja um novo nascimento, uma experiência espiritual — já que o nascimento natural define apenas a filiação natural. Foi acerca dessas verdades que o nosso Senhor conversou com Nicodemos. Observe:

A isto, respondeu Jesus: Em verdade, em verdade te digo que, se alguém não nascer de novo, não pode ver o reino de Deus. Perguntou-lhe Nicodemos: Como pode um homem nascer, sendo velho? Pode, porventura, voltar ao ventre materno e nascer segunda vez? Respondeu Jesus: Em verdade, em verdade te digo: quem não nascer da água e do Espírito não pode entrar no reino de Deus. O que é nascido da carne é carne; e o que é nascido do Espírito é espírito. Não te admires de eu te dizer: importa-vos nascer de novo.

João 3.3-7

Ao ouvir essa novidade, Nicodemos, mestre da lei, questiona se o significado era entrar novamente no ventre materno, ou seja, renascer de forma literal. Cristo explica que não. Primeiro, diz que o que é nascido da carne é carne, indicando o nascimento natural que traz o homem ao mundo. Depois, acrescenta que o que é nascido do Espírito é espírito. Trata-se do nascimento espiritual que permite ao homem entrar no Reino de Deus.

Duas consequências dessa experiência são apresentadas na Palavra de Deus: a regeneração e a adoção. Elas não se contradizem, apenas se complementam. Consideremos, brevemente, cada uma delas.

Regeneração

A experiência do novo nascimento — ou o ato de ser gerado de novo — é apresentada na Bíblia como regeneração. O apóstolo Pedro falou disso em sua primeira epístola: Pois fostes regenerados não de semente corruptível, mas de incorruptível, mediante a palavra de Deus, a qual vive e é permanente (1 Pe 1.23). Tiago, o irmão do Senhor, também enfatizou a mesma verdade: Pois, segundo o seu querer, ele nos gerou pela palavra da verdade, para que fôssemos como que primícias das suas criaturas (Tg 1.18).

Por que as Escrituras definem tal experiência assim? Porque nossa condição espiritual, por causa do pecado, era de morte. Paulo afirmou aos efésios: Ele vos deu vida, estando vós mortos nos vossos delitos e pecados (Ef 2.1). Quando Deus, em Cristo, reverte a condição humana de morte para a vida, somos recriados e regenerados. É um novo início, só que espiritual. O espírito morto passa à vida. Nasce um bebê espiritual.

Adoção

O conceito de regeneração sugere recomeço. Assim como uma pessoa passa a fazer parte de uma família quando nasce, assim também ocorre conosco quando Deus nos gera pela Sua Palavra.

Porém, a ideia de adoção remete a quem passa a fazer parte de uma família, mas nasceu em outra. O conceito remete a filhos não gerados naquela família. Isso não seria contraditório? Não. Como já afirmei, esse fato pode até parecer contraditório, mas não é.

É necessário compreender que o homem não deixou de ser carne porque nasceu de novo, espiritualmente. Jesus disse a Nicodemos que o que é nascido da carne é carne; e o que é nascido do Espírito é espírito (Jo 3.6). O homem, quando vem ao mundo, nasce, na perspectiva natural, da carne, fora da família de Deus. Isso é incontestável.

Qual a necessidade de um novo nascimento? Ele é necessário porque somente por meio do nascimento espiritual é que se pode entrar na família divina. Contudo, mesmo nascido de novo, o homem continua sendo carne. Eu arriscaria dizer que a regeneração é a parte da obra redentora que faz nosso espírito nascer na família de Deus; já a adoção é a parte da obra redentora que recebe o nosso corpo — gerado em outro ambiente — na família de Deus.

Dessa forma, é assim que nos tornamos filhos de Deus, tanto por regeneração como por adoção. Não é algo automático, e sim uma experiência a ser vivida em Cristo.

Se, lendo tais verdades bíblicas, você reconhece que ainda não se tornou filho de Deus, quero apresentar-lhe o caminho estabelecido na Sagrada Escritura para que desfrute dessa maravilhosa experiência. Ao final deste capítulo, você encontrará uma instrução sobre o que deve fazer. Caso queira, pode ir diretamente para lá e resolver isso agora mesmo!

QUAL É A NOSSA HERANÇA?

Já vimos que regeneração e adoção nos tornam filhos de Deus e, consequentemente, Seus herdeiros. Entretanto, é importante compreender qual é a nossa herança. O filho de uma pessoa que deixou poucos recursos financeiros é tão herdeiro quanto o filho de alguém abastado que deixou um gigantesco patrimônio. Os dois são igualmente herdeiros. Porém, a herança de um é maior que a do outro.

As Escrituras Sagradas oferecem mais que a informação de que somos herdeiros de Deus. Elas também destacam o tamanho dessa herança, e isso é fundamental. Você já questionou qual é a sua herança em Deus? Vamos percorrer o ensino bíblico e aprofundar o entendimento. Observe, mais uma vez, o que Paulo disse aos cristãos romanos:

Porque não recebestes o espírito de escravidão, para viverdes, outra vez, atemorizados, mas recebestes o espírito de adoção, baseados no qual clamamos: Aba, Pai. O próprio Espírito testifica com o nosso espírito que somos filhos de Deus. Ora, se somos filhos, somos também herdeiros, herdeiros de Deus e coerdeiros com Cristo; se com ele sofremos, também com ele seremos glorificados.

Romanos 8.15-17

A instrução dada pelo apóstolo é muito parecida com a que está em Gálatas 4.6,7, apenas com um detalhe a mais. Aos romanos, Paulo define uma posição de igualdade com o Senhor Jesus quando cita coerdeiros com Cristo. A palavra usada, no original grego, de acordo com o Léxico de Strong, é sugkleronomos (συγκληρονομος) e significa “coerdeiro, alguém que, juntamente aos outros, obtém uma parte do todo, coparticipante”.

Isso faz todo sentido quando compreendemos que nos tornamos filhos de Deus à semelhança de Cristo. Ele entrou no mundo como filho unigênito, único (Jo 3.16), mas tornou-se o primogênito entre muitos irmãos (Rm 8.29; Hb 1.6). Jesus é o nosso irmão mais velho! Como afirmou o escritor da epístola aos hebreus: Por isso, é que ele não se envergonha de lhes chamar irmãos (Hb 2.11). Isso mostra que somos tão herdeiros de Deus quanto o próprio Cristo é! Diferente de uma partilha natural de herança, na qual tudo é dividido entre os filhos, a herança espiritual é plenamente compartilhada por todos, sem necessidade de divisão. Em outras palavras, tudo o que é de um filho — incluindo o primogênito — é de todos os demais!

Não é empolgante? Saber que a herança que Jesus, como Filho, tem direito é exatamente a mesma que nós também temos. Isso é extraordinário! Veja como Paulo afirma que tudo é nosso:

Portanto, ninguém se glorie nos homens; porque tudo é vosso: seja Paulo, seja Apolo, seja Cefas, seja o mundo, seja a vida, seja a morte, sejam as coisas presentes, sejam as futuras, tudo é vosso, e vós, de Cristo, e Cristo, de Deus.

1 Coríntios 3.21-23

Vamos examinar algumas verdades contidas nesse versículo, que ajudam a mensurar o que se enquadra na frase tudo é vosso:

1. O que nos pertence. De que, exatamente, Paulo está falando? Que coisa ele afirma ser nossa?

Ele fala tanto de coisas imateriais (vida e morte) como de coisas materiais (apóstolos e o mundo). 2. A literalidade da declaração. Alguns preferem acreditar que a frase tudo é vosso não é literal.

Tratam-na como se fosse mera força de expressão ou uma espécie de linguagem hiperbólica. Se fosse o caso, o argumento deveria, então, ser aplicado à sentença completa: Tudo é vosso, e vós, de Cristo, e Cristo, de Deus — ou seja, nem tudo seria literal. Façamos uma análise de cada parte para mostrar que a literalidade se confirma. Optei pelo caminho inverso, do fim para o começo:

• Cristo, de Deus. Cristo é total e literalmente de Deus ou trata-se apenas de uma força de expressão ou exagero? É claro que Ele é totalmente de Deus! • Vós, de Cristo. Somos total e literalmente de Cristo ou trata-se apenas de uma força de expressão ou hiperbolismo? É claro que nós somos totalmente de Cristo. Se alguns não reconhecem isso por uma baixa entrega e rendição de suas vidas, não podem negar, pela perspectiva da redenção, que pertencemos a Ele (1 Pe 2.9)! • Tudo é vosso. Tudo é tudo. Portanto, a literalidade se confirma. Somos herdeiros de tudo o que é de nosso Pai celestial. 3. Quando todas as coisas serão nossas? Legalmente, elas já nos pertencem agora. A Bíblia diz que tudo é (tempo presente), e não que tudo será (tempo futuro) nosso. O apóstolo fala tanto de coisas presentes (ao citar Paulo, Apolo, Pedro e o mundo) como também de coisas futuras (vida e morte). Convém ressaltar que as coisas futuras já são nossas, embora só serão desfrutadas posteriormente. É fato que há dois aspectos na herança: presente e futuro. Contudo, muitos cristãos acreditam apenas no caráter futuro. Para estes, gosto de citar a declaração de João, em sua primeira epístola:

Amados, agora, somos filhos de Deus, e ainda não se manifestou o que haveremos de ser. Sabemos que, quando ele se manifestar, seremos semelhantes a ele, porque haveremos de vê-lo como ele é.

1 João 3.2

Então, quando somos filhos? Agora. A palavra usada nos manuscritos originais e traduzida como agora é nun (νυν). De acordo com Strong, significa: “neste tempo, o presente, agora”. Não há dúvidas sobre nossa filiação como uma realidade atual. No entanto, depois, o que nos aguarda? A Palavra de Deus diz claramente que ainda não foi revelado o que seremos.

Parece que haverá uma espécie de atualização de nosso status, uma mudança da condição de filho para algo mais. Seja o que for que o futuro nos reserve, tem a ver com a plena revelação de quem Deus é. Portanto, se somos filhos agora e não sabemos o que seremos depois, por que insistir que a herança — o direito dos filhos — é somente para depois (quando não seremos mais apenas filhos)?

John Stott, em seu clássico livro Contracultura Cristã, abordando as bênçãos no “Sermão da Montanha”, expressa sua opinião sobre quando desfrutaremos dessas promessas:

Que bênção é essa? A segunda parte de cada bem-aventurança elucida a questão. Possuem o reino dos céus e herdarão a terra. Os que choram são consolados, e os famintos, satisfeitos. Recebem misericórdia, veem a Deus, são chamados filhos de Deus. Sua recompensa celestial é grande. E todas estas bênçãos estão reunidas. Exatamente como as oito qualidades descrevem cada cristão (pelo menos em ideal), da mesma forma as oito bênçãos são concedidas a cada cristão. É verdade que a bênção específica prometida em cada caso é apropriada à qualidade particularmente mencionada. Ao mesmo tempo, é totalmente impossível herdar o reino dos céus sem herdar a terra, ser consolado sem ser satisfeito ou ver a Deus sem alcançar sua misericórdia e ser chamado seu filho. As oito qualidades juntas constituem as responsabilidades; e as oito bênçãos, os privilégios, a condição de cidadão do reino de Deus. Este é o significado do desfrutar do governo de Deus. Estas bênçãos são para o presente ou para o futuro? Pessoalmente, penso que a única resposta possível é “tanto para o presente como para o futuro”. Alguns comentaristas, entretanto, têm insistido que são para o futuro, e têm enfatizado a natureza “escatológica” das bem-aventuranças. É verdade que a segunda parte da última bem-aventurança promete que os perseguidos receberão uma grande recompensa no céu, e isto deve referir-se ao futuro (v. 12). Certamente também é apenas na primeira e na oitava bem-aventuranças que a bênção foi expressa no tempo presente, “deles é o reino dos céus” (v. 3,10); e, mesmo assim, este verbo não se encontrava aí quando Jesus falou em aramaico. As outras seis beatitudes contêm um verbo no futuro simples (serão, herdarão, alcançarão). Não obstante, está claro nos demais ensinamentos de Jesus que o reino de Deus é uma realidade presente que podemos “receber”, “herdar” ou “entrar” agora. Do mesmo modo, podemos alcançar misericórdia e consolo agora, podemos nos tornar filhos de Deus agora e podemos, nesta vida, ter a nossa fome satisfeita e a nossa sede mitigada. Jesus prometeu todas estas bênçãos a seus discípulos aqui e agora. A promessa de que “verão a Deus” pode parecer uma referência à “visão beatífica” final, e sem dúvida a inclui. Mas nós já começamos a ver Deus nesta vida, na pessoa do seu Cristo e com a visão espiritual. Já começamos a “herdar a terra” nesta vida, considerando que, se somos de Cristo, todas as coisas já são nossas, “seja o mundo, seja a vida, seja a morte, sejam as cousas presentes, sejam as futuras”. Portanto, as promessas de Jesus nas bem-aventuranças têm cumprimento presente e futuro. Desfrutamos agora das primícias; a colheita propriamente dita ainda está por vir. E, como destacou acertadamente o Professor Tasker: “O tempo verbal futuro... enfatiza sua certeza, e não simplesmente o seu aspecto futuro. Os que choram serão certamente consolados, etc.”.

Não nego o aspecto futuro da herança, nem me conformo com quem tenta negar a aparência presente dela. Muitos ignoram que parte da herança já pode ser usufruída! Essa é a lição que aprendemos na parábola do filho pródigo, no diálogo do irmão mais velho com seu pai:

Ele se indignou e não queria entrar; saindo, porém, o pai, procurava conciliá-lo. Mas ele respondeu a seu pai: Há tantos anos que te sirvo sem jamais transgredir uma ordem tua, e nunca me deste um cabrito sequer para alegrar-me com os meus amigos; vindo, porém, esse teu filho, que desperdiçou os teus bens com meretrizes, tu mandaste matar para ele o novilho cevado. Então, lhe respondeu o pai: Meu filho, tu sempre estás comigo; tudo o que é meu é teu. Entretanto, era preciso que nos regozijássemos e nos alegrássemos, porque esse teu irmão estava morto e reviveu, estava perdido e foi achado.

Lucas 15.28-32

Quando consideramos as três parábolas do capítulo 15 do Evangelho de Lucas — ovelha perdida, moeda perdida e filho perdido —, compreendemos claramente qual é o assunto sobre o qual Jesus está falando. A celebração terrena, nos três exemplos, ilustra a festa celestial quando um pecador se arrepende.

Portanto, na parábola do filho pródigo, o pai do filho perdido aponta, simbolicamente, para Deus. O irmão mais velho pode ser visto sob duas perspectivas: a que reflete o ciúme da nação de Israel, com a entrada dos gentios no plano redentor; e a que mostra o comportamento de um crente “firme” não entendendo a festa pelo retorno de um “desviado”.

O irmão mais velho estava desgostoso e indignado com a festa dada ao mais novo. O desabafo em forma de protesto indica uma mentalidade errada: Nunca me deste um cabrito sequer. De outro modo: “Você ofereceu um boi cevado em festa ao retorno de meu irmão infiel, mas a mim, nem um cabritinho”. Havia frustração e comparação no coração do irmão mais velho.

Porém, a resposta do pai precisa ser bem-entendida, pois mostra a mudança de mentalidade necessária não só àquele filho frustrado, mas também a nós. O pai respondeu de forma direta: Tudo o que é meu é teu. Era uma forma de declarar: “Meu filho, você não precisava ganhar um cabrito! Tudo o que tenho é seu. Todos os meus rebanhos são seus. Você poderia ter assado quantos cabritos quisesse para alegrar-se com seus amigos”.

Penso que essa tem sido a forma de muitos cristãos viverem o relacionamento com Deus. Ficam frustrados por coisas que acham que não lhes foram dadas, quando, na verdade, já lhes foram concedidas. Já eram deles. Tudo de que vierem a precisar já foi provido pelo Pai celestial. Observe o que Paulo afirmou aos crentes de Éfeso:

Bendito seja o Deus e Pai de nosso Senhor Jesus Cristo, que nos abençoou com todas as bênçãos espirituais nas regiões celestiais em Cristo.

Efésios 1.3 NAA

A verdade é que já temos muito mais do que podemos mensurar. Contudo, por causa de uma mentalidade errada que ignora a herança, não desfrutamos do que é nosso. Ademais, o pior é que ainda nos frustramos com Deus, como se a culpa fosse dele. Como disse o profeta Oseias, da parte do Senhor: O meu povo está sendo destruído, porque lhe falta o conhecimento (Os 4.6).

Em seu livro O nome de Jesus, Kenneth Hagin cita um episódio vivido por Charles Spurgeon (1834- 1892), o famoso pregador batista inglês:

Certa ocasião, ele foi chamado à casa de uma idosa, a qual estava confinada à cama. A desnutrição estava acabando com ela. Durante sua visita, Spurgeon notou um documento em uma moldura, pendurado na parede. Perguntou à mulher: “É seu?”.

Ela disse que sim e explicou que tinha trabalhado como doméstica no lar de uma família inglesa: “Antes de a condessa morrer, ela me deu isso. Trabalhei para ela durante quase meio século. Tive muito orgulho desse papel, por isso mandei colocar nessa moldura. Está pendurado na parede desde a morte dele, que já faz dez anos”. Spurgeon perguntou: “A senhora me daria licença para levá-lo e mandar examiná-lo mais de perto?”. “Oh! Sim”, respondeu a mulher, que nunca aprendera a ler, “é só cuidar para que eu o tenha de volta”. Spurgeon levou o documento às autoridades, as quais já o tinham procurado. Tratava-se de uma herança. A dama da nobreza inglesa legara uma casa e dinheiro à sua empregada. Aquela mulher morava em um casebre de um só cômodo, feito de caixas de madeira, e estava passando muita fome. No entanto, tinha pendurado na parede um documento que a autorizava a receber todos os cuidados e a morar em uma casa excelente. O dinheiro estava acumulando juros e pertencia a ela. Spurgeon ajudou-a a obtê-lo, mas o dinheiro não fez tão bem a ela quanto poderia ter feito antes. Acho que isso é um exemplo daquilo que tem acontecido à grande parte do mundo evangélico. Moramos em um casebre desmoronado — espiritualmente falando —, enquanto deixamos sobre uma mesa, em algum canto, a Nova Aliança. Temos orgulho dela, mas nunca nos damos ao trabalho de descobrir aquilo que nos pertence, segundo Ela nos assegura.

SENTAR À MESA

Um dos textos bíblicos que mais me encoraja a respeito da nossa herança está em um relato dos Evangelhos. É o episódio da mulher cananeia que pede a Jesus pela libertação de sua filha. Quero analisar o texto bíblico e suas lições sob a ótica de Mateus:

Partindo Jesus dali, retirou-se para os lados de Tiro e Sidom. E eis que uma mulher cananeia, que viera daquelas regiões, clamava: Senhor, Filho de Davi, tem compaixão de mim! Minha filha está horrivelmente endemoninhada. Ele, porém, não lhe respondeu palavra. E os seus discípulos, aproximando-se, rogaram-lhe: Despede-a, pois vem clamando atrás de nós. Mas Jesus respondeu: Não fui enviado senão às ovelhas perdidas da casa de Israel. Ela, porém, veio e o adorou, dizendo: Senhor, socorre-me! Então, ele, respondendo, disse: Não é bom tomar o pão dos filhos e lançá-lo aos cachorrinhos. Ela, contudo, replicou: Sim, Senhor, porém os cachorrinhos comem das migalhas que caem da mesa dos seus donos. Então, lhe disse Jesus: Ó mulher, grande é a tua fé! Faça-se contigo como queres. E, desde aquele momento, sua filha ficou sã.

Mateus 15.21-28

Em primeiro lugar, quero destacar o comportamento de Jesus. O texto indica que, diante do primeiro clamor por ajuda daquela mulher, Jesus literalmente ignorou: Ele, porém, não lhe respondeu palavra (v. 23). Depois de não responder, Jesus segue adiante. No entanto, ela não desiste e vai atrás de Cristo. Os próprios discípulos ficam sem graça por Ele continuar ignorando aquele clamor insistente, a ponto de pedirem: “Ou atenda-a ou mande-a embora de uma vez”.

Penso que eles ficaram preocupados, deduziram ser “inadequada” a reação (ou a falta dela) da parte de Jesus. Então, o Senhor resolveu explicar por que não a atenderia: Não fui enviado senão às ovelhas perdidas da casa de Israel (v. 24). Há uma verdade importante por trás dessa afirmação que precisamos entender antes de seguir com a análise da história.

Jesus estava diante de uma mulher que foi chamada por Mateus de cananeia. Esse era o nome dado aos antigos habitantes da Palestina, antes da conquista pelos israelitas. No tempo de Cristo, eles eram chamados de fenícios. Aliás, Marcos, em seu Evangelho, chamou essa mulher de grega e também de siro-fenícia: Esta mulher era grega, de origem siro-fenícia (Mc 7.26).

A palavra traduzida como “grega”, nos manuscritos originais, é hellenis (ελληνις). De acordo com Strong, é uma mulher grega, gentia, não judia. Por conta da helenização (a promoção de língua, cultura e pensamento gregos) do mundo durante o reinado de Alexandre, o Grande, essa expressão passou a ser usada pelos judeus não apenas para classificar os de nacionalidade grega, mas para todos os não judeus. Aqueles que não eram judeus eram chamados pelos judeus de “gregos”.

Portanto, Cristo está afirmando, ao ser procurado por uma mulher gentia, que Ele não veio para os gentios, e sim para os judeus; não para os gregos como aquela mulher, mas para os judeus. Jesus esclarece que essa era a razão pela qual Ele não a atendera.

Isso não significa que os gentios não teriam oportunidade, pois está escrito: Veio para o que era seu [os judeus, Seu povo], e os seus não o receberam. Mas, a todos [os demais que não eram judeus] quantos o receberam, deu-lhes o poder de serem feitos filhos de Deus (Jo 1.11,12). Jesus não estava negando a inclusão ou oportunidade dos gentios no plano divino. Ele estava respeitando uma ordem!

Por causa da aliança com Abraão, o patriarca, os judeus tinham o direito de receber o evangelho primeiro. Por isso, Paulo demonstra, em seus ensinos, que o plano da salvação segue esta ordem: primeiro o judeu, depois o “grego” (ou gentio). Mesmo destacando o fato de que os judeus vinham primeiro com relação à ordem, à sequência, o apóstolo também enfatiza que Deus não faz acepção de pessoas:

Tribulação e angústia virão sobre a alma de qualquer homem que faz o mal, ao judeu primeiro e também ao grego; glória, porém, e honra, e paz a todo aquele que pratica o bem, ao judeu primeiro e também ao grego. Porque para com Deus não há acepção de pessoas.

Romanos 2.9-11

Não há distinção entre os grupos, apenas uma ordem no desdobramento do plano da redenção. Assim, Pedro, depois de ver os gentios salvos e cheios do Espírito Santo (na casa de Cornélio), afirma: Então, falou Pedro, dizendo: Reconheço, por verdade, que Deus não faz acepção de pessoas; pelo contrário, em qualquer nação, aquele que o teme e faz o que é justo lhe é aceitável (At 10.34,35).

O Senhor Jesus também observou essa ordem ao enviar Seus discípulos: A estes doze enviou Jesus, dando-lhes as seguintes instruções: Não tomeis rumo aos gentios, nem entreis em cidade de samaritanos; mas, de preferência, procurai as ovelhas perdidas da casa de Israel (Mt 10.5,6).

Era disso que Cristo falava aos discípulos acerca daquela mulher cananeia. Em outras palavras, Ele disse que ainda não havia chegado a hora dos gentios.

Porém, naquele momento, quando os discípulos ainda processavam a informação, a mulher chegou, prostrou-se em um gesto de adoração e clamou mais uma vez: Socorre-me! Agora, diante da insistência da mulher — que talvez não tenha ouvido a explicação dada pelo Mestre —, Jesus responde de forma alegórica: Não é bom tomar o pão dos filhos e lançá-lo aos cachorrinhos.

Qual é o significado dessa afirmação? O contexto facilita a compreensão. Jesus fala a respeito de os judeus ocuparem posição prioritária em relação aos gentios. Então, usa uma ilustração que, obviamente, não era literal para os judeus, nem para os gentios. Cristo fala que um cachorrinho, embora querido e com livre trânsito em uma casa, não ocupa o mesmo lugar dos filhos. O tratamento dado aos filhos é diferenciado! Estes possuem direitos, privilégios e uma posição distinta na casa. Isso significa que, mais uma vez, a fala de Jesus destaca a ordem do plano de redenção, por direito de aliança, que dá aos judeus o primeiro lugar na fila.

Os judeus eram os filhos naquela ilustração. A mulher estava incluída entre os cachorrinhos. Tinha livre trânsito entre os judeus, mas não era parte dos “filhos”. A fala de nosso Senhor expressava o seguinte: “Eu não posso tirar aquilo que, nesse momento, é direito dos judeus e entregá-lo a você”.

O interessante é que aquela mulher entra na ilustração de Jesus para continuar a conversa: Ela, contudo, replicou: Sim, Senhor, porém os cachorrinhos comem das migalhas que caem da mesa dos seus donos. Em outras palavras: “Eu entendo completamente o que o Senhor está dizendo. Sei qual é o meu lugar e não quero usurpar o direito dos filhos para assentar-me à mesa. Contudo, o Senhor há de convir que eles não estão aproveitando tudo o que lhes é oferecido. E, assim como os cachorrinhos comem das migalhas que caem da mesa dos filhos, eu quero acesso apenas a essa rebarba, a essa sobra do que eles não aproveitaram”.

O que está por trás dessa afirmação? Muito mais do que uma resposta sábia. Ela provoca uma reação em Jesus — e não é apenas empolgação por ouvir um bom argumento. O que impressiona nosso Senhor está por trás das palavras. Observe: Então, lhe disse Jesus: Ó mulher, grande é a tua fé! Faça-se contigo como queres. E, desde aquele momento, sua filha ficou sã. O destaque está na fé, que foi expressa em palavras. Jesus chamou de uma “grande fé”.

Que entendimento essa grande fé expressava? Que as migalhas caídas da mesa eram suficientes para trazer cura e libertação. A mulher acreditava que as migalhas já eram suficientes para receber uma intervenção divina. Isso é fantástico! Se, com migalhas, já dá para receber tanto da parte de Deus, o que dizer de quando nos assentamos à mesa? Quanto podemos receber tendo o direito dos filhos?

Certamente, o pão dos filhos é maior e melhor do que as migalhas dos cachorrinhos! Penso que, se mensurarmos melhor a herança, valorizaremos o caminho de acesso a ela, principalmente no que tange ao desfrute presente, não apenas futuro. Assim sendo, voltarei a destacar a importância da maturidade no próximo capítulo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você tem valorizado a herança espiritual que Deus disponibilizou em Cristo, ou tem vivido com uma mentalidade de mera sobrevivência diante das promessas?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que bênçãos preparadas pelo Pai talvez você ainda não esteja desfrutando por não enxergar o tamanho da sua herança?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$De que forma a sua mentalidade precisa mudar para deixar de pensar como herdeiro pobre e passar a viver como filho de um Pai abundante?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 4;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Fora do alcance das crianças$t$, 4,
$conteudo$M

“Maturidade tem mais a ver com o tipo de experiência que você teve na vida, do que com quantas velas você apagou.”

(William Shakespeare)

eu amigo Drummond Lacerda, em seu livro intitulado Fora do Alcance das Crianças, ilustra muito bem a necessidade de maturidade para administrar determinadas questões. Aqui estão algumas de suas palavras:

Você já deve ter visto essa frase em muitas embalagens. Remédios, produtos de limpeza, objetos cortantes ou pequenos demais costumam conter esse aviso. Quem coloca essa advertência nos rótulos visa proteger a criança. Afinal, aquilo que deveria ser usado para limpar, curar e facilitar a vida de um adulto pode causar dor e até mesmo morte em mãos imaturas. Existem muitas bênçãos de Deus que estão fora do alcance das crianças. O Eterno só está esperando nossa maturidade para entregá-las. Muitas vezes, não é a falta de oração, jejum ou frequência nos cultos, e sim nossa falta de maturidade que tem nos afastado do que é bom.

É exatamente acerca disso que Paulo escreveu aos gálatas. Em vez de usar como exemplo a advertência na embalagem de determinados produtos, o que não existia na época, o apóstolo usa a ilustração do filho vetado de usufruir a herança antes do tempo:

Digo, pois, que, durante o tempo em que o herdeiro é menor, em nada difere de escravo, posto que é ele senhor de tudo. Mas está sob tutores e curadores até ao tempo predeterminado pelo pai.

Gálatas 4.1,2

Por que o pai estabelecia um tempo antes de o filho poder usufruir a herança? Pela evidente falta de maturidade para exercer uma sábia gestão. Tal imaturidade está implícita na palavra menor que, no grego, é nepios (νηπιος). Strong, em seu léxico, define-a como “infante, criancinha, menor, não de idade”. Também acrescenta o sentido metafórico: “infantil, imaturo, inexperiente”. Obviamente, quem precisa de tutores e curadores ainda não está em condições de governar a própria vida.

Não podemos afirmar com certeza qual era a idade em que o menino deixava de ser considerado criança e passava a ser tratado como homem. Russel Norman Champlin, no clássico O Novo Testamento Interpretado Versículo Por Versículo, comenta:

Os costumes atinentes às questões de heranças e direitos dos filhos diferiam entre os povos, como também diferia a idade em que um jovem era reputado adulto. Mas parece que dezesseis anos era a idade média em que um filho era considerado legalmente adulto. Em Atenas parece que os guardiões mantinham controle sobre as propriedades até que o jovem atingisse dezoito anos de idade, e, em algumas colônias asiáticas dos gregos, isso se prolongava até o vigésimo quinto aniversário do jovem. Provavelmente, ocorria isso como medida de segurança, na suposição de que quanto mais idade tivesse um jovem adulto, tanto maior seria a sua responsabilidade, o que significava que não dilapidaria suas próprias riquezas, ao passo que se fosse um pouco mais jovem se sentiria tentado a fazer.

Craig S. Keener, na obra Comentário Histórico-Cultural da Bíblia, discorre sobre a declaração de Paulo a partir de dados da literatura antiga:

Na lei romana, a situação da criança pequena aos cuidados do guia era, na prática, a de um escravo (ao menos no que diz respeito à propriedade; cf. Sexto Empírico, Esboço do pirronismo 3.211). A criança menor de idade precisava, se o pai fosse falecido, ficar aos cuidados de um “tutor” (p. ex., Dião Crisóstomo, Discursos 31.73). O tutor em geral era escolhido pelo testamento do pai ou, se este não o especificasse, o papel recaía sobre o parente homem mais próximo no lado paterno da família. O “administrador”, “curador” ou “guardião” da propriedade era, muitas vezes, um escravo ou ex-escravo, mas dispunha de bastante poder. Os herdeiros sob a autoridade do autor do testamento só podiam herdar as propriedades designadas no tempo especificado no documento (Gaio, Institutas 2.87) ou ao atingirem a puberdade (1.196; posteriormente em alguns lugares, Filóstrato, Vida de Apolônio 1.13). Na Antiguidade, a opinião geral era que dar ao herdeiro menor de idade acesso prematuro aos recursos herdados não era sábio (p. ex., Sipre de Deuteronômio 11.1.2).

MATURIDADE E GESTÃO

É certo que a maturidade é um fator determinante para que haja uma boa gestão da herança. Por isso, a criança devia ser ensinada e treinada — enquanto amadurecia física e emocionalmente — para, então, ser liberada a usufruir da herança.

Paulo, depois de usar a alegoria da criança que necessita tanto de tutores e curadores quanto de um tempo determinado pelo pai antes de acessar a herança, inicia o versículo seguinte com a declaração: Assim, também nós [...] (Gl 4.3). Um paralelo foi estabelecido. A mensagem é clara: nós também devemos amadurecer a fim de poder acessar a herança plena.

Um exemplo bíblico a ser considerado está na parábola do filho pródigo (Lc 15.11-32). A analogia apresentada pelo Senhor Jesus aponta para alguém que, ao receber a herança antes da hora — ainda novo e despreparado, com o pai vivo —, demonstrou, com seu comportamento, a própria imaturidade. Normalmente, só há um desfecho nesses casos: desperdício da herança.

Alguém me disse, outro dia, ter lido uma estatística acerca do altíssimo percentual de pessoas que, após ganharem na loteria, desperdiçam toda a riqueza em um pequeno período de tempo. Emendou: “Pastor, essa é a prova de que esse dinheiro é amaldiçoado!”.

Retruquei na hora: “Não sou a favor de um crente jogar na loteria, mas a estatística sobre a qual você leu não é algo meramente espiritual. Há outros dados que indicam um alto índice de fracasso em sucessões geracionais nas empresas. Muitas vezes, aqueles herdeiros recebem nas mãos algo muito maior do que a própria capacidade de gerenciar”.

Uma reportagem no portal Terra, intitulada Do luxo ao lixo: conheça ganhadores da loteria que perderam tudo, afirma: “Cerca de um terço dos ganhadores de loteria vão à falência apenas alguns anos depois de receberem os primeiros milhões, segundo pesquisa realizada nos Estados Unidos. O enriquecimento súbito e a incapacidade de administração do patrimônio muitas vezes levam as pessoas ao descontrole financeiro”.

Cito também uma matéria da Exame, assinada por João Sandrini e intitulada Por que os premiados em loterias também vão à falência:

Para o consultor financeiro André Massaro, da Moneyfit, não adianta uma pessoa ganhar dinheiro momentaneamente se ela não desenvolve consciência financeira. Quem recebe uma quantia de dinheiro com a qual não está acostumado a lidar — seja na loteria, por herança ou qualquer outro motivo — deve, inicialmente, colocar tudo em um investimento bem conservador, como a caderneta de poupança ou um fundo de renda fixa. A pessoa também deve evitar tomar decisões apressadas e refletir sobre formas adequadas de usar os recursos para melhorar o padrão de vida de forma sustentável.

Um artigo da Gazeta do Povo, intitulado Os perigos da riqueza e de autoria de José Pio Martins, destaca:

Em palestra para uma família empresária, a filha do fundador me perguntou quais os maiores perigos em que incorrem os herdeiros. Respondi que são vários, mas destaco perigos bastante sérios. O primeiro é acreditar que, por ter herdado patrimônio, o jovem automaticamente herda talento e vira empreendedor. Quem pensa assim acaba tornando-se arrogante e pavimenta o caminho do próprio fracasso. Estudos mostram que muitos herdeiros e ganhadores de loterias voltam a ser pobres justamente por pensarem que a riqueza os tornou empresários. Eles compram fazendas, abrem negócios, até que, por falta dos talentos de empreendedor, acabam na falência. Herdeiros bafejados pela riqueza patrimonial correm o risco de perder a capacidade de ouvir. Alguns já não têm essa virtude mesmo antes de a fortuna cair-lhes nas mãos. É um defeito grave. É grande a lista de empresas falidas nas mãos de herdeiros que não têm o talento nem a capacidade empreendedora dos pais, mas não se deram conta disso, tornaram-se arrogantes e não cultivaram a capacidade de ouvir. A soma de juventude, herança milionária e poder de decisão pode ser uma bomba nas mãos de jovens que não foram preparados para fugir dos vícios próprios de quem herda fortunas. Foi por aí que respondi ao questionamento da moça, a quem sugeri estudar e se preparar para progredir por mérito e conhecimento. Também sugeri um programa de treinamento para descobrir se ela tem ou não os talentos e as habilidades típicas do empreendedor.

Da mesma forma, a falta de maturidade também leva a comprometer aquilo que Deus preparou para nós: a herança espiritual.

Poucos meses depois da mudança de minha família para Curitiba (PR), no início de 2005, minha filha completou quatro anos de idade. Na época, recebemos a visita da Cristina, uma irmã que veio de Irati, cidade do interior paranaense, onde havíamos morado antes de mudar-nos para a capital.

Essa irmã, uma das primeiras convertidas na igreja que pastoreamos lá, perguntou para a Kelly, minha esposa, se ela estava adaptando-se bem à nova cidade. Afinal de contas, deixamos a vida tranquila de uma pacata cidade com milhares de habitantes para conviver no corre-corre da região metropolitana de Curitiba com milhões de pessoas.

Depois de várias perguntas sobre o trânsito, as distâncias e uma série de diferenças entre as duas cidades, minha esposa respondeu que o melhor lugar para se estar é a vontade de Deus e que estávamos muito bem, mesmo diante das mudanças.

Então, nossa visitante voltou-se para minha filha e questionou-a: — Você está gostando da sua nova cidade? A Lissa respondeu de pronto: — Gostando? Na verdade, eu estou amaaaaaaando! — É mesmo? E o que você está amando tanto nessa nova cidade? — indagou a visitante. Minha filha sequer titubeou e respondeu: — É que aqui em Curitiba tem um monte de Shopping Center! Todo mundo riu. Dava para entender a empolgação da garotinha que, na cidade anterior, não havia shopping para frequentar. Porém, o tempo revelou que aquilo era, de fato, uma grande paixão dela. Quando estava com cinco anos, Lissa disse para a mãe, enquanto voltavam de uma ida ao shopping:

— Mãe, já estou orando por um marido rico! Minha esposa, achando graça, continuou a conversa: — É mesmo, filha? E por que você está orando por um marido rico? — Porque esse negócio que você faz, de ir ao shopping só para olhar as vitrines, não é para mim não... — respondeu Lissa.

O que esperar, em termos de maturidade, de uma garotinha de cinco anos? Naquela época, se eu colocasse R$ 5 mil na mão de minha filha, ela gastaria tudo, com certeza, em uma loja só! Hoje, chegando à maioridade, ela sente vergonha dessa história. Isso é sinal de que amadureceu. E amadureceu a ponto de mudar sua oração. Ela trocou o desejo e a oração: de um marido milionário, para um missionário.

Aliás, em um dia desses, chamei minha esposa para uma conversa séria. Lembrei-a de que a extraordinária mentalidade de economia que ela sempre demonstrou foi fortemente influenciada pelo tempo em que moramos em Irati, pois fui para lá sem sustento financeiro e ainda levei comigo mais seis famílias, que dependiam de uma provisão que não viria da igreja que fomos plantar.

Vendemos a casa, o carro e até mesmo alguns móveis para levantar recursos para o novo projeto. Mas isso tudo não durou muito tempo. Então, tivemos de baixar o padrão de vida até chegarmos ao

“modo sobrevivência”, no qual aprendemos a viver com simplicidade e um baixíssimo orçamento.

Quando mudamos para Curitiba, passamos a viver uma nova fase. Nossas entradas melhoraram, mas minha esposa fez questão de que mantivéssemos o mesmo estilo de vida. Muitos anos depois, aconteceu a tal conversa séria com Kelly:

— Amor, seu excesso de economia me incomoda. Os tempos mudaram, e agora vivemos uma nova época de entradas financeiras, bem melhor do que antes de virmos para cá. Contudo, parece-me que você ainda pensa com a cabeça de anos atrás. Então, ouça seu marido, pois, como cabeça do lar, vou dar-lhe uma ordem. Se você não obedecer, estará, como Paulo disse aos romanos, resistindo à autoridade de Deus.

Ela me olhou um pouco perplexa. Nos mais de 20 anos de casados que já tínhamos, eu nunca havia falado assim com ela. Então, completei com a frase:

— Vá gastar dinheiro! Eu trabalho muito para oferecer o melhor para você e para os nossos filhos. Portanto, exijo que você gaste mais consigo!

Rindo, ela disse: — Ok, para não me rebelar, vou ao shopping gastar dinheiro... Aproveitei e sugeri que ela levasse nossa filha junto. Também pedi que não comentasse sobre a conversa. Assim, as duas foram ao shopping. Minha esposa entrou em uma loja e comprou uma peça de roupa. Depois, entrou em uma segunda e comprou outra. Quando entrou na terceira loja e disse à vendedora que ia levar algo, minha filha, com ares de preocupação, perguntou:

— Mãe, você está bem? A Kelly apenas sorriu e acenou, mostrando que sim. Então, ambas foram para mais uma loja. Nesse momento, Lissa disse:

— Mãe, vou ligar para o pai! O que está acontecendo com você? Ela riu e acalmou minha filha, que nunca tinha visto aquela “compulsão” por compras. Quando eu cheguei em casa, comecei a rir dela e disse: — Parece que o jogo virou, não é mesmo? Cadê aquela garotinha que orava por um marido rico, que dizia para a mãe que ir ao shopping só para olhar não era para ela?

A resposta me surpreendeu: — A garotinha cresceu e hoje entende as coisas de forma diferente.

Como fiquei feliz! Se eu desse uma alta soma de dinheiro à minha filha hoje, sei que ela não torraria tudo de forma irresponsável como faria no passado. A maturidade faz toda a diferença.

Diante disso, pergunto: Quando Deus olha para você, o que, exatamente, Ele vê? Uma criancinha de quatro anos ou alguém que já cresceu? Quanto o Pai celeste pode confiar a você?

É necessário crescer espiritualmente. Além disso, a maturidade deve ser desejada e buscada. O apóstolo Pedro falou acerca disso em sua primeira epístola:

Desejai ardentemente, como crianças recém-nascidas, o genuíno leite espiritual, para que, por ele, vos seja dado crescimento para salvação.

1 Pedro 2.2

Mais do que uma necessidade, o crescimento deve ser um anseio, uma meta a ser alcançada.

CRESCIMENTO EXIGE TEMPO

O crescimento não se dará da noite para o dia. Adiante, processos e fases de crescimento serão detalhados, mas quero adiantar este aspecto: crescimento requer tempo, tanto no mundo natural como no espiritual. O próprio Cristo, em Seus ensinamentos, estabeleceu o paralelo entre as duas dimensões:

Disse ainda: O reino de Deus é assim como se um homem lançasse a semente à terra; depois, dormisse e se levantasse, de noite e de dia, e a semente germinasse e crescesse, não sabendo ele como. A terra por si mesma frutifica: primeiro a erva, depois, a espiga, e, por fim, o grão cheio na espiga. E, quando o fruto já está maduro, logo se lhe mete a foice, porque é chegada a ceifa.

Marcos 4.26-29

Nenhum lavrador planta a semente em um dia e espera colher frutos na manhã seguinte, pela simples razão de que crescer demanda processo. E processo requer tempo. Como Jesus afirmou, esse processo possui etapas distintas: primeira, depois de a semente germinar, aparece a erva; segunda, vem a espiga — até aqui, passou-se um período de tempo. Então, aparece o grão cheio na espiga, mas ainda não é hora de colher, pois é necessário esperar mais um pouco até que o grão esteja maduro. Por fim, a colheita pode acontecer.

Ninguém nasce adulto. O bebê cresce e torna-se criança. A criança cresce e torna-se adolescente. O adolescente cresce a torna-se adulto. O adulto para de crescer em estatura, mas ainda amadurece espiritual e emocionalmente, além de desenvolver suas habilidades. Portanto, o tempo é um fator necessário não apenas para o desenvolvimento natural, mas também para a maturidade emocional e espiritual, bem como para que se adquiram experiência e sabedoria.

Logo, não há crescimento imediato. O tempo é indispensável, inclusive no âmbito espiritual. Essa é a razão pela qual Paulo, escrevendo a Timóteo, declara que o candidato ao ministério (episcopado) não pode ser um novo convertido: Não seja neófito, para não suceder que se ensoberbeça e incorra na condenação do diabo (1 Tm 3.6). A palavra traduzida como neófito, no original grego, é neophutos (νεοφυτος) e, de acordo com Strong, significa “recentemente plantado”, o que indica uma planta nova. Também era usada para, no sentido espiritual, falar de um recém-convertido, de alguém que recentemente se tornou cristão. A Nova Versão Internacional optou pela expressão “não pode ser recém- convertido”.

Por que o ministro não pode ser novo na fé? Apenas porque ele ainda não teve tempo de crescer espiritualmente!

NÃO DEPENDE SÓ DE TEMPO

Por outro lado, apenas tempo, por si só, não garante crescimento espiritual e emocional. O autor da carta aos hebreus deixa isso bem claro:

Pois, com efeito, quando devíeis ser mestres, atendendo ao tempo decorrido, tendes, novamente, necessidade de alguém que vos ensine, de novo, quais são os princípios elementares dos oráculos de Deus [...].

Hebreus 5.12

Pelo tempo de fé, eles já deviam ser mestres da Palavra. Contudo, não apenas não tinham condições de ensinar, como também precisavam reaprender o bê-á-bá.

Muitos vivem em lugar de estagnação espiritual. Crescimento deve ser desejado e buscado — e é responsabilidade de cada um! O apóstolo Pedro apresenta, da parte do Senhor, um imperativo: Crescei na graça e no conhecimento de nosso Senhor e Salvador Jesus Cristo (2 Pe 3.18). Não se trata de uma obra divina unilateral, visto que envolve a parte humana. Existem processos com os quais devemos cooperar.

Nas emoções, não é diferente. Os pais podem ajudar os filhos a alcançar maturidade mais depressa, ou deixá-los acomodados e, consequentemente, tardar o processo. Aliás, penso que a nova geração vive um grande retrocesso. Como pastor há 25 anos, já aconselhei muita gente. Um dos maiores problemas nos casamentos da atualidade é o baixo nível de maturidade emocional dos cônjuges. Infelizmente, há um expressivo número de adultos que se comportam como verdadeiras crianças mimadas.

Ou, nas palavras de um autor desconhecido: “Maturidade tem mais a ver com o tipo de experiência que você teve na vida, do que com quantas velas você apagou”. Cabe ainda mencionar aqui uma afirmação de Benjamin Franklin: “Na escola da experiência, as aulas são caras, mas só com elas os insensatos se corrigem”. As experiências e os processos de amadurecimento decorrentes delas, se devidamente aproveitados, podem ajudar-nos — e muito — em nosso aperfeiçoamento.

Acredito que parte desse quadro assustador tem origem em uma mudança de mentalidade que a nova geração vem desenvolvendo em relação à família. Deixe-me dar um exemplo. Recentemente, perguntei a uma pessoa muito querida se ela planejava ter mais filhos – já tinha um. A resposta foi imediata e segura: “De jeito nenhum!”. Impressionado e curioso, questionei a razão do não. Aquele pai, de pronto, rebateu: “Porque é caro demais ter um filho”.

O que essa conversa revela? Um pai mesquinho, que não quer gastar dinheiro com os filhos? Claro que não! É justamente o oposto. A conversa aponta para um pai que, por querer dar o melhor aos seus filhos, entende qual é o seu limite orçamentário e não segue aumentando a quantidade de filhos para não baixar o padrão do que ele deseja oferecer. E isso possui um lado louvável. Contudo, também destaca algo que me preocupa. Trata-se de uma nova mentalidade e um novo modelo de criação familiar que se distancia do modelo bíblico.

No padrão apresentado nas Escrituras, o aumento dos filhos era visto como algo bom e possuía uma razão. Observe:

Herança do Senhor são os filhos; o fruto do ventre, seu galardão. Como flechas na mão do guerreiro, assim os filhos da mocidade. Feliz o homem que enche deles a sua aljava; não será envergonhado, quando pleitear com os inimigos à porta.

Salmo 127.3-5

Primeiro, a Palavra de Deus compara os filhos a flechas. Depois, declara: Feliz o homem que enche deles [os filhos-flechas] a sua aljava. Qual era o motivo para tal felicidade? A razão é que, como os filhos tornavam a família maior, eles ajudavam o pai a enfrentar os inimigos à porta!

Porém, hoje, qual é a razão da hesitação dos pais em terem mais filhos? É a preocupação com os custos. O que isso revela? Que os pais modernos já não pensam no que os filhos podem fazer pela família; eles estão preocupados somente com o que a família tem de fazer pelos filhos.

Antigamente, ninguém deixava de ter filhos pensando no quanto isso custava. A mentalidade, em especial quando se tirava o sustento da lavoura, sempre foi o contrário. Quanto mais filhos alguém gerava, mais mão de obra para produzir mantimento havia em casa.

Tal mudança de mentalidade produz também uma alteração na criação. Os pais da atualidade não criam filhos para ajudar a família, e sim para sugá-la, ainda que essa visão não fique tão explícita. Dessa maneira, fortalecem, inconscientemente, o egoísmo e poupam-nos de processos que amadurecem, os quais foram testados ao longo da história — e demonstraram funcionar muito bem —, mas são descartados em nossos dias. Os filhos têm cada vez menos responsabilidades e cada vez mais privilégios. Os direitos são bem maiores e abundantes que os deveres.

Qual o resultado? Uma geração imatura que se sacrifica menos pela sua família e exige constantemente seus direitos.

Um dia desses, alguém reclamou comigo: — Esta nova geração está cada vez mais mimada! Repliquei na hora:

— E de quem é a culpa? Quem foi que a mimou? A pessoa permaneceu em silêncio. O fato é que pais reclamam dos filhos que eles mesmo desvirtuaram. Por isso, precisamos repensar o modelo de criação e a mentalidade que estamos promovendo.

Não me refiro a algo tão distante na história como os textos bíblicos citados. Até a geração passada, as coisas ainda seguiam nesse ritmo.

Permita-me dar mais um exemplo. Meus dois irmãos, o mais velho e o mais novo, começaram a trabalhar aos 12 anos de idade. Eles empacotavam compras em um supermercado e carregavam muitas caixas de produtos que precisavam ser repostos nas prateleiras. Tentei evitar essa tarefa e, até meus 14 anos, eu me virava fazendo meus negócios informais. Às vezes, chegava a ganhar mais dinheiro que eles. Sem contar que tinha mais tempo livre para divertir-me do que meus irmãos. Eu me gabava da minha liberdade e da minha “alma empreendedora”.

Isso durou até que, um dia, entrei em casa e vi meu pai conversando com um amigo da família, Orlando Furlan. Cumprimentei-o rapidamente e afastei-me quando meu pai me chamou de volta e disse:

— Cumprimente direito seu novo chefe. — Meu novo o quêêê? — perguntei. — Seu novo chefe. Acabei de arrumar-lhe um emprego de office boy, e você começa amanhã cedo — disse meu pai.

— Vou ganhar quanto? — questionei. — Não interessa quanto você vai ganhar. O assunto já está decidido — respondeu meu pai. — Pai, você sabe que eu ganho mais dinheiro com meus negócios informais do que ganharei nesse tipo de emprego — retruquei.

A resposta dele foi uma verdadeira lição para mim: — Não se trata apenas de dinheiro. Você tem de aprender a ter responsabilidades, a cumprir horários e a saber responder a um chefe.

Em outras palavras, ele estava dizendo: “Você tem de aprender a ser homem!”. Então, o jogo ficou mais duro. — A partir de hoje, você não ficará mais com todo o dinheiro que ganha. Vai dar o dízimo, tirar apenas uma pequena parte para você e entregar o restante para ajudar nas despesas de casa — ressaltou meu pai.

— Mas pai... você não precisa do meu dinheiro! — reclamei. — Não preciso, mas você precisa aprender a contribuir em casa — finalizou meu pai. O que ele estava tentando ensinar-me? Ele ensinou-me que, em qualquer família, os filhos não devem apenas ser servidos em casa, mas também devem servir; que os filhos não devem ser as “sanguessugas” que estão surgindo nesta nova geração; e que devem ser treinados para contribuir em casa, servir à família e não ser egoístas.

Porém, com o modelo atual de criação que os poupa de tudo — de tarefas domésticas a responsabilidades maiores —, criamos um problema maior do que podemos mensurar, tanto para a funcionalidade das famílias que esses filhos formarão como para suas vidas espirituais.

A consequência da postura atual dos pais é nada menos que filhos mimados que não entendem, nada aceitam, tampouco desfrutam do resultado de processos necessários à maturidade. Deus, como Pai — e modelo de paternidade a ser seguido —, não nos poupa desses processos!

Se quisermos acessar a herança plena de nosso Pai celestial, é essencial que cresçamos. Por quê? Porque a falta de maturidade traz prejuízos enormes.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Existem bênçãos de Deus que talvez estejam "fora do seu alcance" não por falta de oração, mas por falta de maturidade para administrá-las?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que pode estar afastando você do que é bom: a ausência de disciplinas espirituais ou a imaturidade que ainda precisa ser tratada?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Em que aspecto da sua vida o Senhor pode estar esperando você crescer antes de lhe confiar algo maior?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 5;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Prejuízos por causa da falta de maturidade$t$, 5,
$conteudo$I

“Aqueles que não permitem que Deus trabalhe neles, nem deveriam trabalhar para

Ele.” (Watchman Nee)

ntroduzi, no capítulo anterior, a ideia de que a imaturidade impede o acesso à herança plena. Entretanto, quero certificar-me de que estamos levando em conta todos os ângulos e desdobramentos. Não me refiro apenas à vida cristã e ao relacionamento pessoal com Deus, mas também à perspectiva ministerial, ou seja, ao serviço cristão.

Todos fomos chamados a cooperar com algo no Reino de Deus. Paulo afirma aos coríntios que, coletivamente, somos o corpo de Cristo:

Porque, assim como o corpo é um e tem muitos membros, e todos os membros, sendo muitos, constituem um só corpo, assim também com respeito a Cristo.

1 Coríntios 12.12

Contudo, o apóstolo também diz que, individualmente, somos os membros do Seu corpo:

Ora, vós sois corpo de Cristo; e, individualmente, membros desse corpo.

1 Coríntios 12.27

Ele também destaca que, como membros, cada um de nós possui uma função. A função de cada pessoa é importante para o todo, pois o corpo vive da interação dos membros:

Porque também o corpo não é um só membro, mas muitos. Se disser o pé: Porque não sou mão, não sou do corpo; nem por isso deixa de ser do corpo. Se o ouvido disser: Porque não sou olho, não sou do corpo; nem por isso deixa de o ser. Se todo o corpo fosse olho, onde estaria o ouvido? Se todo fosse ouvido, onde, o olfato? Mas Deus dispôs os membros, colocando cada um deles no corpo, como lhe aprouve. Se todos, porém, fossem um só membro, onde estaria o corpo? O certo é que há muitos membros, mas um só corpo. Não podem os olhos dizer à mão: Não precisamos de ti; nem ainda a cabeça, aos pés: Não preciso de vós. Pelo contrário, os membros do corpo que parecem ser mais fracos são necessários; e os que nos parecem menos dignos no corpo, a estes damos muito maior honra; também os que em nós não são decorosos revestimos de especial honra. Mas os nossos membros nobres não têm necessidade disso. Contudo, Deus coordenou o corpo, concedendo muito mais honra àquilo que menos tinha, para que não haja divisão no corpo; pelo contrário, cooperem os membros, com igual cuidado, em favor uns dos outros.

1 Coríntios 12.14-25

Resumindo, cada membro possui uma função que importa, que é fundamental. Ninguém é uma verruga no Corpo de Cristo, ou uma espécie de apêndice que, se retirado, não faz muita falta. Nenhum cristão deveria acreditar que não foi chamado para tarefa alguma. É certo que não fomos chamados para realizar as mesmas ações, mas todos fomos chamados para fazer alguma coisa. Cada um, na sua própria função, possui responsabilidade de cooperar com o restante do corpo.

Contudo, até para exercer dons e ministérios confiados pelo Senhor é necessário maturidade, especialmente quando falamos de liderança. Recordemos que o Senhor Jesus, aos 12 anos de idade, já impressionava os doutores da lei com Seu entendimento da Palavra de Deus:

Três dias depois, o acharam no templo, assentado no meio dos doutores, ouvindo-os e interrogando-os. E todos os que o ouviam muito se admiravam da sua inteligência e das suas respostas.

Lucas 2.46,47

Entretanto, mesmo com tal capacitação, Jesus não começou Seu ministério aos 12 anos de idade. Ele esperou até os 30 anos — idade em que os sacerdotes estavam liberados para esse nível de serviço: Ora, tinha Jesus cerca de trinta anos ao começar o seu ministério (Lc 3.23).

Não digo que jovens e adolescentes não possam ser úteis. De forma alguma! Aos 15 anos, eu já evangelizava nas ruas. Aos 18, comecei a viajar e a pregar a Palavra de Deus. Aos 19, já pregava a públicos de milhares de pessoas. Porém, há uma grande diferença entre ser um soldado na linha de frente e comandar tropas.

A mulher samaritana, de João 4, por exemplo, assim que teve um encontro com Cristo, saiu a chamar toda a cidade — tarefa na qual foi bem-sucedida. As Escrituras revelam que as pessoas foram ouvir Cristo e, depois disso, disseram à mulher: Agora não é pelo que disseste que nós cremos; mas porque nós mesmos temos ouvido e sabemos que este é verdadeiramente o Salvador do mundo (Jo 4.42).

Essa mulher foi o instrumento de Deus para a conversão de uma cidade, porém não foi ela quem passou a pregar àquele povo; este veio para ouvir Cristo. A Palavra dele foi o diferencial para a fé daquelas pessoas. A mulher conseguiu atrair muita gente, mas não se fez líder de ninguém.

O CASO DOS NEÓFITOS

Paulo, instruindo Timóteo acerca dos que almejavam o episcopado (1 Tm 3.1), apresenta uma lista de várias qualificações necessárias a quem foi vocacionado para tal encargo. Encontramos, entre elas, uma menção explícita sobre o tempo de fé que quem almeja a liderança deve ter:

Não seja neófito, para não suceder que se ensoberbeça e incorra na condenação do diabo.

1 Timóteo 3.6

A palavra neófito significa “novo na fé” e fala de alguém recém-convertido. Obviamente, não contesta a autenticidade da experiência de conversão, apenas aponta para o fato de que maturidade — elemento indispensável para se exercer a liderança — não se alcança imediatamente após o novo nascimento. Ela demanda tempo, experiência e aprendizado.

Muitos cristãos que foram impactados por uma experiência profunda com Deus e incendiados pelo chamado divino não entendem a importância da espera, nem respeitam processos. Confundem ser útil para a produtividade no Reino de Deus com ser útil para a liderança. Não se deve confundir mero serviço com posição de autoridade. Ambos são distintos!

Não estou dizendo, em absoluto, que os novos na fé (e na idade) não possam ser usados por Deus. Imediatamente após a libertação daquele endemoninhado gadareno, o Senhor Jesus declarou a ele:

Vai para tua casa, para os teus. Anuncia-lhes tudo o que o Senhor te fez e como teve compaixão de ti.

Marcos 5.19

Esse é mais um exemplo de que neófitos podem — e devem — pregar o Evangelho e servir às pessoas. Observe o resultado: Então, ele foi e começou a proclamar em Decápolis tudo o que Jesus lhe fizera; e todos se admiravam (Mc 5.20). Porém, de novo, destaco que nada indica um papel de liderança sendo imediatamente exercido; o que vemos aqui é apenas a execução de um papel de proclamação.

Liderança requer maturidade. Um garoto de 11 anos talvez já tenha condições biológicas de reproduzir-se e vir a ser pai, mas não possui a devida capacidade emocional para exercer bem esse papel. No plano espiritual, não é diferente.

Nas palavras de Soren Kierkegaard, teólogo e filósofo dinamarquês, “só quem amadureceu e se modificou pode modificar os outros”. Quem ainda nem passou por processos de amadurecimento pode ser útil em certo nível, mas quem já amadureceu tem algo mais a oferecer. Vale recordar as palavras de Paulo aos coríntios: Para que, com a consolação que recebemos de Deus, possamos consolar os que estão passando por tribulações (2 Co 1.4 NVI).

Levemos em consideração outra informação bíblica importante. Quando Paulo e Barnabé saíram em sua primeira viagem missionária para pregar o Evangelho entre os gentios, tinham diante de si um grande desafio. Em cada cidade onde pregavam, eram acrescentados novos convertidos que ainda não tinham entendimento sobre a Palavra.

Diferente do judeu que, ao converter-se, precisava olhar a lei de Moisés na perspectiva da revelação de Cristo, mas já detinha conhecimento das Escrituras, os gentios nada conheciam delas. Quando um judeu se convertia, ele já sabia que idolatria e prostituição, por exemplo, eram atos condenados por

Deus. Os gentios, por sua vez, praticavam ambos em seus cultos pagãos. Assim, precisavam ser devidamente instruídos sobre os princípios da Palavra de Deus. Em outras palavras, o trabalho de discipulado e formação de novos líderes era bem maior.

Dito isso, considere que Paulo e Barnabé ficavam pequenos períodos nas cidades em que pregavam. Estamos falando de meses. Com o tempo e em novas viagens missionárias, vemos esse período aumentando para mais de um ano e, no caso de Éfeso, chegou a dois anos (At 19.10). Todavia, não era assim no início. Eles queriam espalhar as boas novas depressa, então juntavam aquele grupo de novos convertidos, ensinavam tudo o que podiam por alguns meses e os deixavam, indo pregar em outras cidades. Observe um detalhe importante: ao partirem, não deixavam líderes à frente dos novos convertidos!

Vamos construir a cronologia da primeira viagem missionária. Ao partirem de Antioquia, Paulo e Barnabé, acompanhados de João Marcos, pregaram ao procônsul Sérgio Paulo, na Salamina, onde resistiram ao mágico Elimas (At 13.5-12). Embora o procônsul tenha-se convertido, não há registro bíblico da organização de uma igreja.

De lá, partiram para Antioquia da Pisídia (At 13.14). Nessa viagem, João havia-se apartado da equipe e regressado a Jerusalém (v.13). O resultado do trabalho em Antioquia foi impressionante:

Muitos dos judeus e dos prosélitos piedosos seguiram Paulo e Barnabé, e estes, falando-lhes, os persuadiam a perseverar na graça de Deus.

Atos 13.43

Além deles, os gentios também abraçaram a fé, e, assim, divulgava-se a palavra do Senhor por toda aquela região (At 13.49). Houve perseguição, e, além disso, expulsaram a dupla missionária daquele território, o que fez com que fossem para Icônio (v. 50,51), embora haja o registro de que deixaram, em Antioquia, muitos discípulos (v. 52).

Já na nova cidade, aconteceram conversões (At 14.4), mas os apóstolos foram novamente alvos de perseguição e fugiram para Listra (v. 5,6). Foi em Listra que Paulo curou um paralítico (v. 8-10) — isso sacudiu a cidade. Dessa vez, os judeus o atacaram:

Sobrevieram, porém, judeus de Antioquia e Icônio e, instigando as multidões e apedrejando a Paulo, arrastaram-no para fora da cidade, dando-o por morto. Rodeando-o, porém, os discípulos, levantou-se e entrou na cidade.

Atos 14.19,20

Por conta desse ocorrido, Paulo e Barnabé decidiram deixar a cidade: No dia seguinte, partiu, com Barnabé, para Derbe (At 14.20). Em Derbe, também fizeram muitos discípulos. Consequentemente, resolveram fazer o caminho de volta, passando pelas cidades onde deixaram novos convertidos para, somente então, estabelecer os primeiros líderes naquelas igrejas:

E, tendo anunciado o evangelho naquela cidade e feito muitos discípulos, voltaram para Listra, e Icônio, e Antioquia, fortalecendo a alma dos discípulos, exortando- os a permanecer firmes na fé; e mostrando que, através de muitas tribulações, nos importa entrar no reino de Deus. E, promovendo-lhes, em cada igreja, a eleição de presbíteros, depois de orar com jejuns, os encomendaram ao Senhor em quem haviam crido.

Atos 14.21-23

Por que Paulo e Barnabé não estabeleceram líderes antes? Ninguém questiona o fato de que os novos convertidos necessitam de acompanhamento. O próprio Barnabé foi enviado pelos apóstolos de Jerusalém a Antioquia para ajudar os que haviam-se convertido lá. Veja o relato bíblico:

A mão do Senhor estava com eles, e muitos, crendo, se converteram ao Senhor. A notícia a respeito deles chegou aos ouvidos da igreja que estava em Jerusalém; e enviaram Barnabé até Antioquia. Tendo ele chegado e, vendo a graça de Deus, alegrou-se e exortava a todos a que, com firmeza de coração, permanecessem no Senhor.

Atos 11.21-23

Tanto Paulo quanto Barnabé sabiam do que os recém-convertidos necessitavam. Por que não prover isso antes? Porque, diferente do caso de Antioquia, que recebeu um líder pronto e maduro enviado pela igreja em Jerusalém, as novas igrejas não tinham alguém que preenchesse esse requisito. Portanto, foi necessário esperar um tempo para ver quem crescera mais, quem se destacava na fé.

Isso mostra que eles partiram da seguinte premissa: é melhor não ter liderança do que estabelecer uma liderança imatura. Concordo. A congregação sofre mais com líderes imaturos do que com a falta de líderes! E isso não é de hoje. Desde os primórdios da igreja, a realidade se repete.

O apóstolo João denuncia o comportamento imaturo, eu diria até doentio, de um líder chamado Diótrefes:

Escrevi alguma coisa à igreja; mas Diótrefes, que gosta de exercer a primazia entre eles, não nos dá acolhida. Por isso, se eu for aí, far-lhe-ei lembradas as obras que ele pratica, proferindo contra nós palavras maliciosas. E, não satisfeito com estas coisas, nem ele mesmo acolhe os irmãos, como impede os que querem recebê-los e os expulsa da igreja.

3 João 1.9,10

Quem, em sã consciência, não gostaria de ter o apóstolo João, o discípulo amado, pregando em sua igreja? Você consegue imaginar o que seria ele narrando os feitos de Jesus, inclusive aqueles que sequer chegaram a ser registrados nos Evangelhos (Jo 20.30,31)? Eu gastaria horas e horas ouvindo João compartilhar as revelações da ilha de Patmos.

Como alguém que preside uma igreja proíbe um homem de Deus daquele calibre de ter acesso ao seu púlpito? A resposta foi dada pelo próprio João, quando afirmou que Diótrefes gostava de exercer a primazia. Em outras palavras, ninguém podia “brilhar debaixo dos holofotes” a não ser ele. Triste. Trágico!

Até os líderes mais maduros correm o risco de perder-se no caminho. Veja a declaração que o apóstolo Paulo, uma das maiores pessoas notórias do Novo Testamento, fez acerca de si mesmo:

E, para que não me ensoberbecesse com a grandeza das revelações, foi-me posto um espinho na carne, mensageiro de Satanás, para me esbofetear, a fim de que não me exalte.

2 Coríntios 12.7

A questão é simples. Se um gigante na fé como Paulo, que já tinha visto a experiência de poucos — com Deus e o ministério —, corria o risco de deixar-se enredar pela soberba, a pergunta a ser feita é: E o neófito? Aliás, essa foi a advertência do apóstolo quando vetou os novos na fé de ocuparem uma posição de governo na igreja: Para não suceder que se ensoberbeça e incorra na condenação do diabo (1 Tm 3.6).

MINHA LIÇÃO

O Senhor possui formas distintas de ensinar Seus filhos. Quero relatar aqui como começou o meu aprendizado acerca dos prejuízos da falta de maturidade. Há 25 anos, sofri um acidente de carro e, nos desdobramentos do evento, aprendi uma das lições mais importantes de minha vida. Compartilho a seguir o relato dessa experiência, extraída de meu livro O Agir Invisível de Deus:

Chovia na maior parte do tempo enquanto seguíamos pela BR-116 rumo a Curitiba. Embora o apelido da estrada fosse “Rodovia da Morte”, ela não nos amedrontava — talvez porque já havíamos feito várias vezes o trajeto de São Paulo até a capital paranaense e vice-versa, e também pelo fato de confiarmos na proteção de Deus. A viagem seguia tranquila, sem excessos, e, como de costume, passávamos a maior parte do tempo em oração. Foi assim até a divisa dos Estados, e outros quatro quilômetros e meio depois. Então aconteceu o que marcaria para sempre a minha vida, não pelas implicações naturais do ocorrido, mas pelo que Deus viria mostrar-me e ensinar-me, bem como pelo novo rumo que tomaria a minha vida. Estávamos em dois no carro, o irmão Harold McLaryea e eu. A nossa equipe ministerial contava com mais um integrante nas viagens, o irmão Robert Ros, que havia viajado antes de nós. Nós estávamos mudando a base do nosso ministério de Campinas para Curitiba, e, nesta viagem, carregávamos tudo o que coube em nossa Parati. O encosto do banco traseiro estava deitado, e o carro estava cheio até o teto, além das malas que estavam no chão do automóvel sob as nossas pernas. A soberania divina fez com que a falta de espaço poupasse o Robert do acidente, e o levou tranquilo a Curitiba num ônibus da Viação Cometa. Era o dia 23 de agosto de 1993, uma segunda-feira. Não tenho muitos detalhes em minha memória, a qual quase que completamente apagou o ocorrido e teima em permanecer “dormente”. Contudo, somei os relatos das pessoas que se envolveram e consegui informações suficientes para entender o que aconteceu. Os pneus já estavam bem gastos e o carro não estava no seguro. Assim sendo, o único culpado era eu mesmo, embora durante vários meses eu quisesse transferir a responsabilidade para Deus. Quase cinco quilômetros depois de termos entrado no Paraná, ultrapassei um caminhão, o que fez com que eu elevasse a velocidade do carro um pouco mais do que a que vínhamos mantendo — cerca de cem quilômetros por hora. O motorista do caminhão não queria perder o seu embalo, e eu forcei um pouco a ultrapassagem, para que eu pudesse terminá- la e voltar à minha pista, um pouco antes de um outro caminhão, que vinha no sentido contrário, cruzar conosco. Logo depois, após percorrermos uns duzentos metros apenas, aconteceu uma aquaplanagem. Havia chovido toda a tarde, e, naquela hora, umas cinco e meia da tarde, caía uma garoa fina, mas na pista ainda havia muita água. Não sei o tamanho da poça d’água. Só lembro que o carro perdeu a direção e saiu da pista para a esquerda. Não colidimos com ninguém. Tudo ocorreu somente conosco, mas fomos lançados diretamente a um barranco enorme, com degraus antierosão, com quarenta a cinquenta metros de desnível. Ainda me lembro do momento em que o carro saiu da pista e o Harold clamou pelo nome de Jesus. De repente o carro voou barranco abaixo, e, depois do primeiro impacto, descemos por um verdadeiro tobogã, que fez com que tudo o que estava no carro fosse arremessado fora, exceto o motorista e o passageiro, que estavam presos ao cinto de segurança. Fomos parar a uns setenta metros da rodovia. Eu bati a cabeça várias vezes, o que me fez perder a consciência. O caminhoneiro que eu havia ultrapassado assistiu à cena e parou para prestar socorro. O Harold e ele me levaram barranco acima, e logo um carro parou, levando-nos até o posto da Polícia Rodoviária mais próximo. Eles, por sua vez, nos levaram até o hospital de Campina Grande do Sul, que fica perto de Curitiba. Eu tive traumatismo craniano, levei uns trinta pontos no rosto e na cabeça, e, devido a uma fratura mais séria na mão esquerda, precisei ser submetido a uma cirurgia, para a colocação de dois pinos de platina. Por causa da intensidade das pancadas na cabeça, precisei passar dois dias em observação, na Unidade de Tratamento Intensivo. O Harold, no entanto, saiu ileso, sem nenhum arranhão. No hospital eu descobri que havíamos perdido tudo. O nosso carro foi considerado como perda total. As nossas malas foram roubadas. Quanto ao resto da nossa mudança, o que não foi danificado na queda e no barro acabou sendo roubado. No entanto, a dor que eu sentia não se devia tanto à perda em si, mas a um sentimento estranho que começou a brotar em minha alma — um misto de abandono com rejeição; algo contra o qual eu lutava, mas que, aos poucos, parecia me devorar. Por que Deus havia permitido aquilo? E as orações que havíamos feito a Ele? E Suas promessas de proteção e cuidado? Entrei em crise! Os irmãos me visitavam e tentavam animar-me, mostrando que o Senhor havia guardado nossas vidas. Eu havia contado a eles que o médico me mostrou o resultado da tomografia que acusava uma dificuldade de se distinguir a massa branca da cinzenta e lesões nas partes moles do cérebro. Isto em si não era tão complicado assim, mas indicava a intensidade do trauma. Contudo, o médico havia me dito que, considerando-se que este trauma aconteceu na fonte, a parte mais sensível da cabeça (entre os olhos e o ouvido), eu poderia até mesmo ter morrido. Havia ainda a questão do meu olho. A minha pálpebra esquerda foi restaurada no centro cirúrgico, pois ela havia se rasgado até um pouco mais da metade, e os médicos me disseram que o meu globo ocular (e consequentemente a minha visão) foi poupado de forma milagrosa. Vendo-me abatido, os irmãos em Cristo tentavam mostrar-me o lado da intervenção de Deus. No entanto, algo dentro de mim doía muito. Eu não ousava dizê-lo, mas pensava comigo mesmo que intervenção milagrosa por intervenção milagrosa não teria sido mais fácil se o Senhor tivesse colocado o meu carro de volta na pista no momento em que nos desgovernamos? Por que Deus havia permitido que nós caíssemos barranco abaixo, para então resolver nos proteger? Onde Ele estava quando eu precisei d’Ele? Se eu havia dado minha vida ao ministério e à obra do Senhor, cuidando das coisas d’Ele, por que então Deus não cuidou de mim e das minhas coisas? Eu estava pensando como um insensato e sabia disso. Eu não tinha coragem de dizer estas coisas, mas não conseguia parar de pensar nelas. Uma dor profunda me atravessava o peito, tentando me convencer de que Deus havia me abandonado na hora em que eu mais precisei d’Ele. Para a minha razão, não havia a menor sombra de dúvida de que o Senhor é justo e fiel, mesmo quando as circunstâncias insistem em aparentar o contrário. Contudo, eu não conseguia convencer as minhas emoções. Os meus sentimentos diziam uma outra coisa, e uma verdadeira batalha interior começou, chegando a durar muitos meses. Em alguns momentos eu achava que era muito drama interior para um rapaz de vinte anos e que eu talvez estivesse aumentando as coisas, mas não havia meios de me convencer e de aplacar este sentimento. Eu comecei a pregar aos dezoito anos de idade e já fazia dois anos que estávamos viajando por várias cidades e Estados, levando o mover do Espírito a muitas igrejas. Tivemos o privilégio de ver muitos milagres e poderosas intervenções de cura. O sobrenatural era frequente nas reuniões. Além disso, havia o aspecto de uma vida vitoriosa que sempre enfatizávamos, e, na verdade, era isso o que mais me incomodava, pois eu me sentia como se eu houvesse sido golpeado pelo Inimigo. Este acidente não teve nada a ver com a vida vitoriosa em que eu acreditava, mas ele derrubou os castelos espirituais que eu havia construído com um pouco de fantasia. Na época, tínhamos uma agenda de viagens bem cheia, para o ano todo, mas foi necessário darmos uma parada, pelo menos para a minha recuperação. De repente, os planos mudaram. Na verdade, não apenas mudaram, mas acabaram de vez! Então comecei a deixar as coisas “rolarem” e a pedir que Deus estivesse no controle. Foi neste período que eu acabei indo a Guarapuava, no Paraná. Estivemos várias vezes na cidade, pregando numa igreja denominacional que recebeu um forte impacto pelo mover do Espírito. Depois, o pastor teve problemas no sentido de permanecer na denominação e iniciou um novo trabalho, mas não ficou por muito tempo. Uns quatro meses após ter iniciado o trabalho, ele acabou indo a uma outra cidade. Como o único contato que aquele grupo de irmãos tinha, como nova igreja, era conosco, eles nos pediram ajuda. Comecei então a estender um auxílio ao trabalho, embora tivesse a intenção de não ficar em definitivo, pois não me considerava um pastor, mas somente um ministério de apoio itinerante. Contudo, Deus falou ao meu coração e ao coração dos irmãos daquele grupo, e decidi investir pelo menos um tempo no trabalho local. Inicialmente pedi reforço ao Luís Gomes, amigo e companheiro de muitas viagens, que na época não fazia parte da nossa equipe, mas desempenhava o seu próprio ministério. Alguns meses depois, o Harold e a Dorilene, ainda recém-casados, se uniram conosco na missão de pastorearmos a Comunidade Cristã de Guarapuava, hoje chamada Comunidade Vida. Que viravolta! Eu sempre havia declarado a muitos irmãos e amigos que a última coisa que eu desejaria neste mundo era ser pastor. E, de repente, lá estava eu! Não sei o que pensei ao certo, só sei que eu não tinha planos de ficar por muito tempo. Contudo, tenho aprendido que “o coração do homem pode fazer planos, mas a resposta certa dos lábios vem do Senhor” (Pv 16.1). Eu passei por muitas crises interiores devido a este acidente, mas fiquei cansado de “lutar” com Deus e não ter respostas, e acabei desistindo de insistir e passei a engolir minhas interrogações até quando eu aguentasse. Um ano e três meses depois do acidente, há quase um ano em Guarapuava, fomos ordenados e reconhecidos como presbitério nesta igreja. Os pastores com quem caminhávamos mais próximos vieram de Curitiba e procederam, como de costume, pedindo-nos que nos preparássemos para uma ministração profética que ocorreria juntamente com a ordenação. Nessa época, eu já desconfiava que Deus havia aproveitado tudo aquilo para nos levar a Guarapuava, mas eu tinha as minhas dúvidas, bem como o receio de eu estar acomodado demais ao transferir toda a responsabilidade da mudança ao controle divino. Foi então que algo marcante aconteceu para mim. Através dos pastores que ministraram minha vida, Deus falou ao meu coração sobre a maneira como Ele havia “quebrado algumas pontes” para aplicar Seus tratamentos comigo e guiar-me de acordo com o Seu plano. Disse também que havia me tirado daquele ministério itinerante para me estabelecer numa cidade, com o propósito de me fazer crescer e, no devido tempo, eu seria liberado a um ministério que abençoaria toda a nação. O Senhor usou os pastores Miguel Piper, Thomas Wilkins, e Francisco Gonçalves, com cada um deles acrescentando algo. Houve não somente um encorajamento trazido pelas palavras, mas também um sentimento novo, uma testificação espiritual de que era aquilo mesmo. Um novo vigor entrou em mim! Louvado seja Deus por este dia tão especial, mas os detalhes do que eu precisava ouvir vieram quase um mês depois, quando o pastor Francisco Gonçalves voltou para nos visitar e ministrar a nós. Numa conversa descontraída, falávamos sobre as nossas experiências com anjos – eu, o Luís e ele. Então acabei lhe perguntando qual havia sido a experiência mais recente que o Senhor lhe dera. Para minha surpresa, ele respondeu que havia sido durante a nossa ordenação, e que a palavra profética que ele havia proferido foi, na verdade, uma visão que Deus lhe deu e que ele havia conversado com um anjo acerca do meu ministério. Ele disse que apenas transmitiu o que ouviu na conversa. Fiquei espantado e comecei a “inquisição”, para arrancar cada detalhe dessa experiência. Não quero parecer sensacionalista ao contar a experiência em seus detalhes. Justamente pela sua humildade, o pastor Francisco nem havia me dito o que aconteceu. Ele simplesmente transmitiu a mensagem de Deus sem alardes. Contudo, naquela época, eu jamais teria aceitado essa mensagem se ela não tivesse vindo dessa forma. Enquanto o pastor Francisco orava por mim, Deus lhe abriu os olhos espirituais e ele viu um anjo em pé, ao meu lado. O mensageiro celestial se apresentou de maneira formal dizendo: “Fui enviado da parte do Deus Altíssimo para te fazer saber algumas coisas acerca destes ministérios (a referência no plural envolvia nós três). Você tem uma preocupação muito grande por eles, mas Deus lhe faz saber que eles estão nas mãos do Senhor e que estão no lugar certo, na hora certa, fazendo a coisa certa”. Após esta referência ao nosso ministério plural, a palavra passou a ser especificamente sobre a minha vida. O anjo prosseguiu: “Quanto a este aqui, ele é um guerreiro divertido. Ele não pergunta se é o tempo de Deus ou não para atravessar a ponte...”. E então a mensagem continuou, não apenas nas palavras que ele usava, mas também em visões que ilustravam o que ele estava falando. No momento em que o anjo afirmava que eu não perguntava o tempo de Deus para atravessar uma ponte, o Francisco viu uma cena: eu estava diante de uma ponte e afirmava: “Ponte foi feita para se passar”. Era uma forma de se declarar: “Se ela está aí, então eu não preciso esperar por nenhuma hora específica. É só seguir em frente!”. Foi isto o que o pastor me viu fazendo na visão. Eu passei correndo por uma, duas, três, várias pontes! E ele simplesmente sabia, mesmo sem que ninguém lhe tivesse dito, que as pontes significavam o acesso de um nível ministerial a outro. Deus lhe comunicava isto ao seu espírito à medida que a revelação vinha. Eu passava pelas pontes bem depressa, uma atrás da outra. Até que o mesmo anjo foi e quebrou algumas pontes diante de mim, para que eu não as atravessasse. Foram mostradas três pontes específicas que ele destruiu, para que eu não passasse por elas. E então veio a explicação pela boca do mensageiro celestial: “Ele estava avançando a níveis ministeriais sem que estivesse pronto, tratado para isso. Por isso foi necessário quebrar algumas pontes, mas ele é rebelde e não aceita o tratamento de Deus. Quanto àquele acidente do ano passado, diga-lhe que Satanás tentou tirar-lhe a vida, mas diga por que Deus o permitiu, embora sem deixar que a sua vida fosse tocada. O seu ministério estava crescendo muito rapidamente, sem que ele fosse trabalhado no íntimo, e, nesse ritmo, ele sucumbiria debaixo do peso do seu próprio ministério. Era somente uma questão de tempo. Por isso Deus o deteve, também para trazê-lo a esta cidade e submetê- lo ao Seu tratamento. E, quando ele estiver pronto, o Senhor o liberará para abençoar esta nação e lhe dará um ministério de proporções ainda maiores”. O impacto desta mensagem foi e ainda é muito forte em minha vida. Até hoje, quando conto esta experiência, emociono- me, e, ao mesmo tempo, me envergonho. Muitas vezes eu questionei a justiça e a fidelidade de Deus por Ele ter permitido que esse acidente ocorresse. Eu não falava isso, mas repetidas vezes eu tinha esses pensamentos. E, enquanto eu assim O julgava no meu coração, Ele estava cuidando de mim! O Senhor estava me protegendo de algo pior; Ele não me abandonou naquela hora! Ele nunca nos abandona! Ele prometeu estar conosco todos os dias, até a consumação dos séculos. Jamais haverá um dia sequer em nossas vidas que o Senhor não esteja ao nosso lado. O nosso problema é que tentamos compreender o agir de Deus, ao invés de confiarmos que Ele está no controle — mesmo que de um modo estranho aos nossos olhos e à nossa maneira de pensar. O meu coração quebrantou-se quando eu entendi o que havia acontecido. Pedi perdão ao Senhor por não ter confiado n’Ele de todo o meu coração, por ter duvidado interiormente, e murmurado contra Ele. Eu sei que Deus me perdoou, mas até hoje sinto vergonha do papelão que fiz. Como fui tolo; insensato! Muitos cristãos têm feito exatamente isto. Ficam criticando a Deus, enquanto Ele os defende, protege e provê o Seu melhor para eles. Somos os únicos injustos (e também ingratos) nesta história, e não Deus. Até então, se eu ouvisse alguém ensinar o que hoje estou ensinando, eu discordaria e possivelmente até entraria em choque. A influência que eu recebi do “ensino da fé” fez com que eu criasse uma fantasia de que o crente deveria ser intocável. Eu recebi uma grande influência dos ensinos de Kenneth

Hagin, Dave Roberson, e outros ensinadores da fé. E eu louvo a Deus por suas vidas e ministérios, pois eles têm sido instrumentos de Deus para o resgate da vida vitoriosa que há em Jesus, e eles vivem o que pregam. Contudo, o Senhor começou a mostrar-me que eu havia desenvolvido uma mentalidade errada a partir de princípios corretos. De fato, Deus prometeu vitória sobre o Inimigo, mas isto não significa que eu nunca sofreria um acidente como o que eu sofri, pois foi uma vitória sobre Satanás! Como disse o anjo, se isto não tivesse acontecido, e, consequentemente, se eu não tivesse sido freado, eu poderia até mesmo ter perdido o meu ministério. Isto sim teria sido uma derrota! O acidente, porém, não foi uma derrota; foi uma vitória! Foi a forma como Deus não apenas me livrou de um ritmo perigoso, mas também redirecionou o meu ministério e começou a tratar do meu caráter e da minha alma de uma forma mais profunda. O detalhe que eu não via nestes ensinadores da fé é que o que eles pregavam era um alvo de vida cristã, e não algo que ocorreria de forma imediata ou instantânea com ninguém, pois nem em suas próprias vidas foi assim. Hoje, tendo passado a fase do tratamento de Deus, eles estão numa outra dimensão. Contudo, creio que Deus realmente quer que avancemos para uma dimensão mais profunda de vida cristã, e que nos movamos mais intensamente no sobrenatural e em grandes conquistas. Mas que ninguém se iluda, pois isto não acontecerá sem o tratamento de Deus em nossas almas!

PERDAS DESNECESSÁRIAS

Não se trata de fatalismo, como se aquele acidente tivesse, necessariamente, de acontecer. Há muito sofrimento que poderia ser evitado se ouvíssemos as advertências divinas. Paulo admoestou seus companheiros de viagem a não partirem de Creta, alertando que a viagem seria turbulenta, mas ninguém deu atenção (At 27.9-11). O resultado? Um naufrágio. Porém, antes que o barco afundasse, o apóstolo fez questão de afirmar: Senhores, na verdade, era preciso terem-me atendido e não partir de Creta, para evitar este dano e perda (At 27.21).

É evidente que o dano e a perda poderiam ter sido evitados. Entretanto, mesmo com o erro deles e um prejuízo desnecessário, não significa que Deus, em Sua soberania, não possa extrair lucro da situação. Um avivamento acabou acontecendo na ilha de Malta, com a salvação de muitas pessoas.

Pois bem, citei esse exemplo bíblico porque vivi algo semelhante. No ano do acidente, o Espírito Santo me trouxe, muitas vezes, a impressão de que eu deveria parar o ministério itinerante e dedicar-me ao pastorado. Todavia, lutei contra isso. A última coisa que eu queria era ser pastor em uma igreja local!

Entendo que, se tivesse ouvido a instrução dele, não precisaria ter sido “parado à força” no acidente. Eu poderia ter evitado dano e perda. Entretanto, ainda assim, o Altíssimo, em Sua infinita bondade e misericórdia, tirou lucro da situação e ajudou-me a crescer a partir dela.

Fiquei nove anos em Guarapuava, esperando a hora de voltar ao ministério itinerante. Só depois disso comecei a retomar, paulatinamente, as viagens. Agora, na iminência de completar 25 anos de pastorado, é que o Senhor começou a sinalizar a chegada do tempo no qual viverei, de fato, o início do que Ele preparou para mim.

Muitas vezes, a sensação que eu tinha era de perda de tempo. Hoje, entendo que foi um grande investimento divino em minha vida, preparando-me para o Seu propósito. A combinação de 27 anos de viagens e pregações — com um aprendizado fantástico junto a líderes de toda a nação — mais outros 25 anos de ministério pastoral e enriquecedoras lições do cotidiano da igreja forneceu-me não tudo, mas o básico do que eu preciso para a nova fase ministerial.

Busquemos a maturidade!1 Evitemos, assim, os danos da falta dela. Tudo isso com a consciência de que não somos os únicos prejudicados nessa história! Infelizmente, a imaturidade como líderes faz com que “a conta seja paga” por quem nada tem a ver com nossa própria falta de dedicação ao crescimento.

1. Não discorrerei aqui sobre a importância do tempo em nossa preparação. É assunto para outro livro. No entanto, resumo o tema em uma mensagem intitulada “Esperando no Senhor”, disponível em áudio e vídeo no site do Ministério Orvalho: <www.orvalho.com>. Vale a pena conferir!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você já considerou que a sua imaturidade pode estar trazendo prejuízos não só à sua vida pessoal, mas também ao serviço que Deus lhe confiou no corpo de Cristo?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como membro do corpo de Cristo, de que maneira a sua falta de amadurecimento pode estar afetando a comunhão e o funcionamento de toda a igreja?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que função no Reino você ainda não tem cumprido plenamente por não ter amadurecido o suficiente para exercê-la?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 6;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Crescimento espiritual$t$, 6,
$conteudo$A

“Mera mudança não é crescimento. Crescimento é a síntese de mudança e continuidade, e onde não há continuidade não há crescimento.”

(C. S. Lewis)

Palavra de Deus é clara acerca do propósito divino quanto ao nosso crescimento espiritual. Ele deve ser não apenas uma meta, mas também um alvo desejável:

Desejai ardentemente, como crianças recém-nascidas, o genuíno leite espiritual, para que, por ele, vos seja dado crescimento para salvação.

1 Pedro 2.2

A expressão crescimento para salvação evidencia que o apóstolo não falava de outro tipo de crescimento que não fosse o espiritual. As Escrituras enfatizam essa necessidade, embora muitos pastores e pregadores pareçam não dar a devida atenção a um assunto tão importante.

Portanto, usarei uma grande quantidade de textos bíblicos neste capítulo. A intenção não é apenas provar que o assunto é bíblico, mas chamar a atenção para a ênfase dada na Bíblia — o que claramente se percebe em tantas declarações acerca do mesmo tópico.

O Dicionário Vine, que apresenta o significado exegético e expositivo das palavras do Antigo e do Novo Testamento, mostra que a palavra usada no versículo de 1 Pedro é auxanõ (αυξανω) e significa “crescer ou aumentar”. Veja como são detalhados significado e aplicação:

[...] Acerca do crescimento daquilo que tem vida, natural ou espiritual, é usado: (a) no transitivo, significando fazer aumentar, dito acerca de dar aumento (1 Co 3.6,7; 2 Co 9.10), o efeito da obra de Deus, conforme a analogia das Suas operações na natureza: “crescer, ficar maior”, por exemplo, plantas e frutos (Mt 6.28); é usado na voz passiva em Mt 13.32 e Mc 4.8; na voz ativa, vemos em Lc 12.27; 13.19; acerca do corpo (Lc 1.80; 2.40); de Cristo (Jo 3.30); da obra do Evangelho (At 6.7; 12.24; 19.20); do povo (At 7.17); da fé (2 Co 10.15, voz passiva); dos crentes individualmente (Ef 4.15; Cl 1.6,10, voz passiva; 1 Pe 2.2; 2 Pe 3.18); da igreja (Cl 2.19); das igrejas (Ef 2.21).

Crescimento abrange não apenas aumento, mas também desenvolvimento, progresso e avanço, rumo à maturidade. É lógico que o crescimento requer não só um processo, mas também alimento. Sendo assim, é nossa responsabilidade correr atrás daquilo que possibilita crescer, daquilo que viabiliza o crescimento.

PROGRESSO

A ideia de avanço, progresso e desenvolvimento aparece repetidamente na Palavra de Deus não só como algo louvável, mas também necessário.

Finalmente, irmãos, nós vos rogamos e exortamos no Senhor Jesus que, como de nós recebestes, quanto à maneira por que deveis viver e agradar a Deus, e efetivamente estais fazendo, continueis progredindo cada vez mais.

1 Tessalonicenses 4.1,2

Deus deseja que Seus filhos cresçam espiritualmente. Não se espera que alguém permaneça estagnado em sua vida espiritual, assim como não se espera que uma criança pare de crescer nos primeiros anos de vida.

O termo progresso refere-se, nas palavras de Paulo aos efésios, ao “aperfeiçoamento dos santos”. Escrevendo aos filipenses, o apóstolo também fala de progresso na fé:

E, convencido disto, estou certo de que ficarei e permanecerei com todos vós, para o vosso progresso e gozo da fé.

Filipenses 1.25

Na carta aos colossenses, Paulo fala da necessidade de manter-se vinculado a Cristo e relaciona isso com o crescimento espiritual:

E não retendo a cabeça, da qual todo o corpo, suprido e bem-vinculado por suas juntas e ligamentos, cresce o crescimento que procede de Deus.

Colossenses 2.19

Observe também o que o apóstolo escreveu aos efésios:

Assim, já não sois estrangeiros e peregrinos, mas concidadãos dos santos, e sois da família de Deus, edificados sobre o fundamento dos apóstolos e profetas, sendo ele mesmo, Cristo Jesus, a pedra angular; no qual todo o edifício, bem-ajustado, cresce para santuário dedicado ao Senhor, no qual também vós juntamente estais sendo edificados para habitação de Deus no Espírito.

Efésios 2.19-22

Ele declara que o edifício — uma alusão ao santuário de Deus que somos nós — cresce. Além de enfatizar o crescimento, ainda fala que somos (não que fomos, no passado, mas que ainda estamos sendo — para dar ênfase à continuidade) edificados para a habitação de Deus no Espírito. Isso não significa que o Espírito já não habita em nós, mas que há um crescimento, um progresso dentro daquilo que já é uma realidade parcial, não completa.

A palavra grega traduzida como edificados é sunoikodomeo (συνοικοδομεω) e, de acordo com Strong, significa: “construir com, construir com outros; juntar ou montar pela construção; dentre várias coisas, construir um todo”. Ela também se aplica ao corpo humano no sentido de crescimento. A ideia de um prédio em construção aponta para o crescimento dele. Muitas vezes, quando a Bíblia usa o termo edificado, ela não se refere apenas a ser abençoado ou fortalecido, mas também a desenvolvimento.

Enfatizando a importância do crescimento, na mesma epístola aos cristãos de Éfeso, o apóstolo afirma:

E ele mesmo concedeu uns para apóstolos, outros para profetas, outros para evangelistas e outros para pastores e mestres, com vistas ao aperfeiçoamento dos santos para o desempenho do seu serviço, para a edificação do corpo de Cristo, até que todos cheguemos à unidade da fé e do pleno conhecimento do Filho de Deus, à perfeita varonilidade, à medida da estatura da plenitude de Cristo, para que não mais sejamos como meninos, agitados de um lado para outro e levados ao redor por todo vento de doutrina, pela artimanha dos homens, pela astúcia com que induzem ao erro. Mas, seguindo a verdade em amor, cresçamos em tudo naquele que é a cabeça, Cristo.

Efésios 4.11-15

A razão de Cristo ter dado os cinco dons ministeriais à igreja é o aperfeiçoamento — ou desenvolvimento — dos santos. O propósito é que cresçamos em tudo, deixando o estágio da meninice até alcançar a fase adulta. Deus usará ministérios para nos ajudar a crescer, embora essa não seja a única forma pela qual podemos avançar no processo de crescimento.

As palavras traduzidas como “perfeita varonilidade”, nos manuscritos originais, em grego, são teleios e aner. De acordo com Strong, teleios (τελειος) significa: “levado a seu fim, finalizado; que não carece de nada necessário para estar completo; perfeito; integridade e virtude humana consumados; de homens; adulto, maturo, maior idade”. Já aner (ανερ) significa: “com referência ao sexo: homem; marido; noivo ou futuro marido. Com referência à idade: para distinguir um homem de um garoto”. Isso mostra que Paulo falava sobre nos tornarmos homens maduros, completamente desenvolvidos.

A Nova Versão Internacional apresentou a frase assim: E cheguemos à maturidade. A Amplified Bible optou por: Até nos tornarmos maduros. A versão de Moffat declara: Até chegarmos à maturidade. E a Nova Versão Transformadora escolheu: E amadureçamos. Crescimento e maturidade são assuntos relacionados, inseparáveis. Portanto, usarei, às vezes, de modo intercambiável, as duas expressões.

A maturidade deve ser buscada e é um avanço necessário:

Portanto, deixemos os ensinos elementares a respeito de Cristo e avancemos para a maturidade, sem lançar novamente o fundamento do arrependimento de atos que conduzem à morte, da fé em Deus.

Hebreus 6.1 NVI

Quero apresentar outra declaração de Paulo, dessa vez aos coríntios, sobre o propósito divino para o crescimento:

Eu plantei, Apolo regou; mas o crescimento veio de Deus. De modo que nem o que planta é alguma coisa, nem o que rega, mas Deus, que dá o crescimento.

1 Coríntios 3.6,7

Orientando Timóteo, Paulo destaca, novamente, a importância do assunto. Ele não o limita apenas à vida espiritual, mas inclui o aspecto ministerial ao pedir a seu discípulo que se dedique a ponto de crescer aos olhos de todos:

Medita estas coisas e nelas sê diligente, para que o teu progresso a todos seja manifesto.

1 Timóteo 4.15

O crescimento espiritual se dá em várias áreas da vida cristã. Não somos chamados a crescer em apenas um aspecto, mas em todos eles. Além disso, a verdadeira santificação não pode deixar de tocar cada área de nossas vidas. Cito, portanto, aqui, as palavras do comentarista bíblico Charles Hodge:

Tudo depende desse progresso harmonioso. Se os braços retivessem suas proporções infantis, enquanto o resto do corpo se adiantava na maturidade, o resultado seria deformidade e impotência. Ou se o julgamento e o sentimento atingissem sua força total, enquanto a memória e a consciência permanecessem como na infância, a mente seria completamente perturbada. A mesma lei de desenvolvimento simétrico é impressa sobre a vida da alma. Se é que ela existe, manifesta-se em todas as formas de bondade. Pode haver alguns tipos de excelência, onde outras estão ausentes; mas então essa excelência não se origina na vida divina; ou de um novo coração; por isso, em sua própria natureza, ela inclui toda a excelência moral. Consideramos uma contradição dizer que alguém é um bom homem e que, embora justo, é indelicado, porque a bondade inclui tanto a justiça quanto a benevolência. E não é menos contraditório dizer que alguém é religioso apesar de não ser honesto, porque a religião inclui a honestidade e a piedade. A intenção não é simplesmente que a palavra religião abranja e expresse todas as formas de excelência moral, mas que aquilo que é expresso pela religião, ou pelo novo homem, pelos princípios de graça ou de vida divina no coração, abranja em si mesmo todos os tipos de bondade.

AMOR

Uma das principais áreas em que precisamos crescer é no amor. Na carta aos tessalonicenses, vemos que essa é a preocupação de um pai espiritual com seus filhos na fé:

E o Senhor vos faça crescer e aumentar no amor uns para com os outros e para com todos, como também nós para convosco.

1 Tessalonicenses 3.12

O mesmo Paulo também manifestou alegria por ver esse tipo de progresso na vida dos irmãos da igreja de Corinto:

E o seu entranhável afeto cresce mais e mais para convosco, lembrando-se da obediência de todos vós, de como o recebestes com temor e tremor.

2 Coríntios 7.15

Qual é o motivo da satisfação do apóstolo? O entendimento de que todo cristão possui uma forma de viver nesse mundo: ele precisa, obrigatória e não opcionalmente, ser um imitador de seu Pai celestial!

Sede, pois, imitadores de Deus, como filhos amados; e andai em amor, como também Cristo nos amou e se entregou a si mesmo por nós, como oferta e sacrifício a Deus, em aroma suave.

Efésios 5.1,2

Uma das revelações de Deus que encontramos em Sua Palavra é exatamente esta: Deus é amor (1 Jo 4.8). Se essa é a essência de Sua natureza, e precisamos imitá-lo, é evidente que devemos crescer no amor.

O amor é apresentado, na carta aos gálatas, como uma característica do fruto do Espírito (Gl 5.22). O apóstolo Paulo encoraja-nos a buscar o amor mais que os dons e as manifestações do Espírito Santo:

Entretanto, procurai, com zelo, os melhores dons. E eu passo a mostrar-vos ainda um caminho sobremodo excelente. Ainda que eu fale as línguas dos homens e dos anjos, se não tiver amor, serei como o bronze que soa ou como o címbalo que retine. Ainda que eu tenha o dom de profetizar e conheça todos os mistérios e toda a ciência; ainda que eu tenha tamanha fé, a ponto de transportar montes, se não tiver amor, nada serei. E ainda que eu distribua todos os meus bens entre os pobres e ainda que entregue o meu próprio corpo para ser queimado, se não tiver amor, nada disso me aproveitará.

1 Coríntios 12.31—13.3

Porém, de forma prática, como podemos crescer nesse amor? Certamente, não é algo que podemos fazer apenas de nós mesmos. Como vimos antes, Paulo declarou aos tessalonicenses: E o Senhor vos faça crescer e aumentar no amor uns para com os outros e para com todos (1 Ts 3.12).

Precisamos do Senhor para isso! Afinal de contas, Ele é a fonte do amor e o único que pode capacitar-nos a andar em amor. Existe um recurso disponibilizado da parte de Deus. Escrevendo aos romanos, Paulo afirmou: Porque o amor de Deus é derramado em nosso coração pelo Espírito Santo (Rm 5.5).

Por outro lado, não depende só de Deus. Se assim fosse, todos já estaríamos completamente maduros e crescidos no amor. Paulo sinalizou aos coríntios que, assim como os dons devem ser desejados e buscados, o amor precisa também ser buscado: Segui o amor e procurai, com zelo, os dons espirituais (1 Co 14.1). A palavra seguir é dioko (διωκω) e, de acordo com Strong, seu significado inclui: “correr prontamente a fim de capturar um pessoa ou coisa, correr atrás; perseguir; seguir após”. Com isso, Paulo estava dizendo, em outras palavras: “Corram atrás do amor”, “persigam o amor”, “corram com afinco até alcançá-lo”.

Portanto, é nossa responsabilidade buscar em Deus os recursos que Ele nos disponibiliza a fim de crescermos em amor. Sem Sua ajuda, não chegaremos a lugar algum. Porém, sem nossa busca pelo amor, também não.

CONHECIMENTO

Outra área que a Bíblia aponta para que nela cresçamos diz respeito ao conhecimento. Pedro, em sua segunda epístola, apresenta um imperativo — não uma sugestão ou conselho — que revela que o crescimento em graça e conhecimento não é opcional:

Antes, crescei na graça e no conhecimento de nosso Senhor e Salvador Jesus Cristo.

2 Pedro 3.18

Muitos ignoram que o conhecimento de Deus é progressivo. O profeta Oseias declarou: Conheçamos e prossigamos em conhecer ao Senhor (Os 6.3). No Novo Testamento, há, várias vezes, a expressão pleno conhecimento, indicando algo a ser alcançado. Obviamente, isso mostra que ainda não temos todo conhecimento que poderíamos ter.

Na carta aos colossenses, Paulo registrou a oração que fazia:

Por esta razão, também nós, desde o dia em que o ouvimos, não cessamos de orar por vós e de pedir que transbordeis de pleno conhecimento da sua vontade, em toda a sabedoria e entendimento espiritual; a fim de viverdes de modo digno do Senhor, para o seu inteiro agrado, frutificando em toda boa obra e crescendo no pleno conhecimento de Deus.

Colossenses 1.9,10

Se há uma dimensão de conhecimento pleno (completo) e é possível avançar em direção a ela, não podemos acomodar-nos com nada menos. Entretanto, não se cresce em conhecimento de forma automática. Temos de fazer algo a respeito!

Existem duas coisas essenciais que ajudarão no processo de crescer em conhecimento: o conhecimento da Palavra de Deus e a oração.

Conhecimento bíblico

Há uma clara ordenança acerca de nosso envolvimento com as Sagradas Escrituras: Habite, ricamente, em vós a palavra de Cristo (Cl 3.16). A palavra grega usada nos manuscritos originais é enoikeo (ενοικεω) e, de acordo com Strong, significa “habitar”. Porém, além do sentido literal, também apresenta o metafórico: “viver em alguém e influenciá-lo (para o bem)”.

É óbvio que o propósito da Palavra de Cristo habitar em nós aponta para nossa própria necessidade. A Palavra de Deus não necessita de moradia. Porém, se nos enchermos dela, seremos não apenas influenciados, como também governados por ela.

O primeiro versículo que minha mãe me fez decorar, aos quatro anos de idade, foi: Guardei no coração a tua palavra para não pecar contra ti (Sl 119.11 NVI). O que ela tentava ensinar a mim? Que, mais do que alcançar a informação doutrinária, eu precisa deixar a Palavra habitar em mim de tal forma que ela me governasse e mantivesse distante do pecado. O grande evangelista D. L. Moody costumava dizer: “Ou este livro me afastará do pecado, ou o pecado me afastará deste livro”.

Diante de cada tentativa do diabo contra Jesus, na tentação do deserto, a resposta dada por nosso Senhor era sempre a mesma: Está escrito. Cristo demonstrou que nossa vida deve ser norteada e governada pelas Escrituras de modo a não cedermos ao pecado. Porém, diante disso, questiono: Como pode um cristão que mal conhece a Bíblia ser governado por ela?

Precisamos encher-nos da Palavra de Deus! Fico entristecido com crentes que não leem as Escrituras. Muitos, em anos de fé, nunca leram a Bíblia toda. Por quê? Porque não desenvolvem uma disciplina de leitura diária, constante. Vamos fazer uma conta juntos. O que é necessário para ler a Bíblia toda em um ano? Ela tem 1.189 capítulos. Se você dividir isso pelos 365 dias do ano, o resultado é 3,257. Arredondando para cima, são 3,3 capítulos por dia.

Meu filho Israel tinha recém-completado seis anos de idade quando perguntou o que precisava para ler a Bíblia toda. Fizemos essa conta e sugeri a ele duas opções: ler três capítulos em um dia e quatro no outro, ou ler três capítulos de segunda a sexta e quatro capítulos nos dias em que não havia aula (sábado e domingo). Faltavam duas ou três semanas para ele completar sete anos quando concluiu sua primeira leitura completa das Escrituras.

Ele fez isso de novo aos sete e depois aos oito anos. Aos nove, ele me procurou e disse: “Papai, estava calculando aqui e descobri que, se eu ler sete capítulos da Bíblia diariamente, lerei a Bíblia toda duas vezes ao ano”. Concordei com ele, e foi exatamente o que meu filho passou a fazer. Aos 11 anos de idade, Israel já tinha lido a Bíblia toda nove vezes.

Penso que ler as Escrituras uma vez ao ano é o mínimo. E não me diga que estamos falando de algo difícil! Até porque você ainda pode “parcelar” a leitura diária em um capítulo de manhã, outro no almoço e mais um à noite. O que nos falta é disciplina e constância.

George Müller declarou: “O vigor de nossa vida espiritual está na proporção exata do lugar que a Bíblia ocupa em nossa vida e em nossos pensamentos. A maneira como estudamos essa Palavra é uma questão da mais profunda importância. A parte mais cedo do dia que nos for disponível deve ser dedicada à meditação nas Escrituras. Devemos alimentar nosso homem interior na Palavra”.

Por outro lado, é lógico que devemos ter alicerces doutrinários. Essa é uma das marcas dos que são espiritualmente maduros. Paulo, aos efésios, destaca que uma das características dos meninos é que eles são agitados de um lado para outro e levados ao redor por todo vento de doutrina, pela artimanha dos homens, pela astúcia com que induzem ao erro (Ef 4.14).

É lógico que me preocupo com isso, não apenas porque meu principal chamado é para o ministério de ensino, mas também como pastor há 25 anos. Tenho visto e acompanhado de perto os estragos que a ignorância bíblica e doutrinária tem produzido na vida de muita gente.

Os cristãos do nosso tempo mostram-se cada vez mais rasos no conhecimento das doutrinas fundamentais. Isso os torna suscetíveis a muitos erros. O próprio Jesus afirmou: Errais, não conhecendo as Escrituras nem o poder de Deus (Mt 22.29).

Reconheço que nem toda igreja tem um forte ministério de ensino e não posso culpar os pastores, até porque muitos são verdadeiros “heróis”, que responderam ao chamado divino sem ter quem os treine e os capacite. Sei também que muitos crentes não conseguem se virar por si mesmos na busca de ensino, porque sequer sabem por onde começar. Contudo, precisamos reverter esse quadro.

Em 2017, nosso ministério Orvalho.Com iniciou uma escola bíblica on-line. Por meio dele, disponibilizamos muito material de capacitação para a vida cristã doutrinária e ministerial. Sei que muitos outros ministérios também aplicam esforços nesse sentido. Porém, não depende apenas dos outros. Você precisa fazer sua parte e correr atrás de seu crescimento no conhecimento.

Oração

Outro fator importante no conhecimento bíblico é a oração. Certa ocasião, alguém me perguntou: “Como você recebe de Deus as mensagens que prega? É quando está lendo a Bíblia?”. Minha resposta surpreendeu a pessoa: “A maior parte das mensagens que recebo não me são dadas quando estou lendo a Bíblia, mas sim quando estou orando”.

Talvez você questione qual é a relação entre uma coisa e outra. A razão para isso é porque nosso entendimento acerca da oração é incompleto. Para a maioria dos cristãos, oração se resume em nós pedirmos algo a Deus e Ele nos responder. No entanto, isso é apenas parte da verdade acerca da oração; está longe de ser a definição completa. Observe o que Deus disse pelo profeta Jeremias:

Invoca-me, e te responderei; anunciar-te-ei coisas grandes e ocultas, que não sabes.

Jeremias 33.3

É claro que o Eterno prometeu que, se o invocássemos, Ele nos responderia. Entretanto, não para aí. Deus também disse que nos anunciaria coisas ocultas que não sabemos! Isso é revelação. A oração cria um ambiente de revelação.

Penso que muitos cristãos erram por lerem pouco a Bíblia. Porém, dentre aqueles que leem, muitos não investem o tempo mínimo no lugar de oração a ponto de entrarem em um ambiente de revelação.

Precisamos encher-nos da Palavra, mas devemos, igualmente, permanecer no lugar de oração e comunhão. Oração deve ser diálogo, e não mero monólogo. Alguns de nós falam tudo o que querem e, então, encerram a conversa, sem dar chance de Deus falar ao seu coração.

Portanto, devemos permanecer mais tempo diante dele até que Sua voz alcance nosso íntimo. Não me refiro a uma voz audível, embora isso também possa acontecer ocasionalmente. Falo de ter as Escrituras vivificadas no coração. Isso é poderoso. É revolucionário.

FÉ

A Palavra de Deus também destaca o crescimento da fé. Paulo mostrou esse aspecto de crescimento espiritual nas cartas aos irmãos de Corinto e de Tessalônica:

Não nos gloriando fora de medida nos trabalhos alheios e tendo esperança de que, crescendo a vossa fé, seremos sobremaneira engrandecidos entre vós, dentro da nossa esfera de ação.

2 Coríntios 10.15

Irmãos, cumpre-nos dar sempre graças a Deus no tocante a vós outros, como é justo, pois a vossa fé cresce sobremaneira, e o vosso mútuo amor de uns para com os outros vai aumentando, a tal ponto que nós mesmos nos gloriamos de vós nas igrejas de Deus, à vista da vossa constância e fé, em todas as vossas perseguições e nas tribulações que suportais.

2 Tessalonicenses 1.3,4

A fé é uma dádiva de Deus. As Escrituras afirmam: Pela graça sois salvos, mediante a fé; e isto não vem de vós; é dom de Deus (Ef 2.8). O apóstolo deixa claro que ela não vem de nós mesmos.

E como recebemos a fé? Escrevendo aos romanos, Paulo revela o caminho: A fé vem pela pregação, e a pregação, pela palavra de Cristo (Rm 10.17). Quando a mensagem do Evangelho é proclamada, a própria Palavra possui o poder de acender a “faísca de ignição” da fé.

Entretanto, muitos cristãos parecem ignorar o que receberam do Pai celestial. Quanta fé nos foi dada? Será que já temos toda a fé que podemos ter? As Escrituras também nos ensinam sobre isso. Na epístola aos romanos, lemos: Segundo a medida da fé que Deus repartiu a cada um (Rm 12.3). Isso significa que recebemos apenas uma medida, e não a totalidade da fé.

Na carta aos coríntios, Paulo declara: Ainda que eu tenha tamanha fé, a ponto de transportar montes (1 Co 13.2). A Tradução Brasileira optou pelo uso da expressão toda fé. É lógico que o apóstolo não falaria dessa grande fé ou fé total se não houvesse mais a ser experimentado do que aquilo que já temos.

Dar-nos a medida inicial de fé é um ato divino, mas fazer com que ela cresça é nossa responsabilidade. Cito aqui uma porção de meu livro O Falar em Línguas – A Linguagem Sobrenatural de Oração, em que trato o assunto da edificação da fé:

Logo, precisamos aprender a fazer crescer a nossa fé. Como diz a Escritura Sagrada: “A justiça de Deus se revela de fé em fé” (Rm 1.17). Poderíamos exemplificar esta verdade dizendo que a vida de fé é como galgar uma escada, degrau após degrau. Há diferentes níveis de fé e nós devemos crescer neles. O Senhor Jesus mencionou os diferentes níveis de fé ao elogiar a grande fé de alguns (aquele centurião romano que tinha um servo enfermo e também aquela mulher cananeia cuja filha encontrava-se endemoninhada) e ao repreender a pequena fé de outros, como por exemplo, os próprios discípulos. Deus não quer que sua fé seja sempre pequena, mas que cresça. Há um crescimento na fé; a Bíblia diz que a fé dos tessalonicenses “crescia muitíssimo” (2 Ts 1.3). Muitos não entendem o que Jesus quis dizer quando falou sobre ter fé como grão de mostarda; saem por aí dizendo que se você tivesse um grãozinho de fé já veria milagres acontecendo, e que se você não está experimentando nada, é porque não tem fé nenhuma. Mas o Mestre não seria incoerente, afirmando em um momento que uma pequenina fé como um grão de mostarda resolve tudo, para logo em seguida repreender seus discípulos justamente por terem uma fé pequena. De modo algum! Então, o que, de fato, Jesus estava ensinando? Vejamos o texto em que se encontra o registro destas suas palavras: “Disseram então os apóstolos ao Senhor: Aumenta- nos a fé. Respondeu o Senhor: Se tivésseis fé como um grão de mostarda, diríeis a esta amoreira: Desarraiga-te, e planta-te no mar; e ela vos obedeceria” (Lc 17.5,6). Tudo começou com um pedido dos apóstolos por uma fé maior. O interesse deles é pela questão do crescimento da fé. Jesus havia ensinado algo sobre a prática do perdão que lhes parecia impossível de se viver; então, como que dizendo que o nível de fé deles não alcançava este ensino, pedem mais fé para poder perdoar como o Senhor quer. E é exatamente nesta hora e contexto que Jesus lhes responde: “Se tiverdes fé como um grão de mostarda”... Repare que Ele não disse fé do tamanho, mas falou claramente: como.1 Na verdade, o Senhor ensinava sobre a semelhança entre a fé e uma semente e não sobre o tamanho da fé. E que semelhança pode haver entre um e outro? Enxergue o paralelo que Jesus estabeleceu: os discípulos estão olhando para sua própria fé e vendo-a tão pequenina que não alcança o nível do ensino do Mestre; então reconhecem que sua pequena fé precisa crescer. Mas como fazer crescer a fé? Pedem a Jesus que faça sua fé aumentar, só que Ele não faz nada pela fé deles; Ele simplesmente ensina-os que a responsabilidade de aumentar a fé não era de Deus, mas deles mesmos! E então ensina-os como fazê-lo: usando a lei de semeadura e ceifa. Se você tem um grão de mostarda, mas reconhece que ele não é suficiente para o que você precisa, e quer aumentar seu estoque de mostarda, o que deve fazer? Plantar para que possa colher mais. Toda semente plantada se multiplica; e se o plantio for se repetindo, a mostarda irá multiplicando-se! Assim é com a fé. Não importa se o que você tem é pouco, você pode aumentar, fazer crescer sua fé. Não adianta orar para que Cristo o faça, pois Ele não vai fazer; já não fez pelos apóstolos para ensinar que é responsabilidade nossa, e não fará por nós. Há orações que Deus jamais responderá, uma vez que já tenha dado toda instrução em sua Palavra para resolvermos o problema. Para que nossa fé cresça, temos que semeá-la. E a forma pela qual se semeia a fé é mediante seu exercício; quando usamos a fé que temos em uma necessidade específica, e vemos a intervenção de Deus, colhemos mais fé. Pois à medida que a usamos, e vemos os resultados, ela se fortalece e assim vai crescendo até que possa chegar ao ponto de transportar não somente amoreiras, como também montes!

Como fazer a fé crescer

Há, pelo menos, três coisas distintas que podemos fazer para cooperar com o crescimento de nossa fé:

1. Alimentá-la pela Palavra. Já demonstramos que a fé vem por ouvir a Palavra de Deus e também é alimentada por ela. Paulo disse a Timóteo: Serás bom ministro de Cristo Jesus, alimentado com as palavras da fé (1 Tm 4.6). Cristo disse que o homem não viveria só de pão (o alimento para o corpo), mas de toda a Palavra que sai da boca de Deus (o alimento para o espírito). F. F.

Bosworth, evangelista grandemente usado por Deus em curas e milagres, falando acerca das pessoas que se questionavam por não terem fé para a sua cura, disse: “Alimentam o corpo com três boas refeições por dia, e o espírito com um só lanche frio por semana”. 2. Edificá-la por meio da oração em línguas. Paulo disse aos coríntios que quem fala em línguas edifica-se a si mesmo (1 Co 14.4). Que tipo de edificação é essa? O que acontece quando oramos na linguagem de oração do Espírito Santo? Na epístola de Judas, lemos algo esclarecedor: Vós, porém, amados, edificando-vos na vossa fé santíssima, orando no Espírito Santo (Jd 1.20). Há uma inegável edificação na fé que se dá quando oramos dessa maneira, embora não signifique que essa seja a única área de edificação que tal forma de oração proporciona. Em minha vida, tenho experimentado os benefícios da edificação na fé mediante o uso dessa ferramenta poderosa. Encorajo todos a usarem-na também. 3. Multiplicá-la por meio da semeadura. Já apresentei, há pouco, o significado do ensino de Jesus sobre ter fé como grão de mostarda. Se usarmos a fé que temos, esse exercício a fortalecerá e a levará a crescer. Quanto mais exercitamos nossa fé, mais robusta ela se tornará.

GRATIDÃO

Outra área destacada no ensino bíblico acerca de nossa necessidade de crescimento diz respeito à gratidão. Observe a instrução dada aos crentes de Colossos:

Ora, como recebestes Cristo Jesus, o Senhor, assim andai nele, nele radicados, e edificados, e confirmados na fé, tal como fostes instruídos, crescendo em ações de graças.

Colossenses 2.6,7

Um dos sinais de imaturidade e carnalidade é a murmuração, além de outros tropeços na forma de falar. A gratidão, por outro lado, é um sinal de maturidade. À medida em que meus filhos cresciam, pelo próprio entendimento que passavam a ter da vida, começavam a demonstrar uma gratidão muito maior pelo que receberam ao longo de suas vidas. Espiritualmente falando, deveríamos viver esse paralelo.

Observe o que Paulo disse aos efésios, quando os orientava acerca do que convém aos santos:

Não haja obscenidade, nem conversas tolas, nem gracejos imorais, que são inconvenientes, mas, ao invés disso, ações de graças.

Efésios 5.4 NVI

Mesmo quando o assunto é oração, somos exortados, pelas Escrituras, a não apenas pedir, mas também a agradecer a Deus: Perseverai na oração, vigiando com ações de graças (Cl 4.2). E a orientação se repete:

Não andeis ansiosos de coisa alguma; em tudo, porém, sejam conhecidas, diante de Deus, as vossas petições, pela oração e pela súplica, com ações de graças.

Filipenses 4.6

A gratidão não deve expressar-se somente em circunstâncias pontuais que nos agradam. Ela é o reconhecimento da soberania e da grandeza de Deus, mesmo naqueles momentos em que não compreendemos ou sequer conseguimos alegrar-nos.

Quando o livro de Atos dos Apóstolos fala de Paulo e Silas louvando a Deus (At 16.25), depois de terem sido açoitados injustamente e pendurados no tronco, a Bíblia ensina algo: nosso louvor e nossa gratidão não dependem das circunstâncias; além disso, mostram que o Senhor é aquele que age sempre, e não apenas no momento pelo qual estamos atravessando.

A instrução bíblica sobre gratidão é clara: Dando sempre graças por tudo a nosso Deus e Pai, em nome de nosso Senhor Jesus Cristo (Ef 5.20). A repetição do assunto em outras epístolas revela que muita ênfase era dada nesse ensino aos crentes em Jesus: Em tudo, dai graças, porque esta é a vontade de Deus em Cristo Jesus para convosco (1 Ts 5.18).

Particularmente, penso que há uma diferença entre dar graças em tudo e por tudo. Sei que a maioria das versões bíblicas traduziram Efésios 5.20 com a expressão dando sempre graças por tudo. A palavra grega usada nos manuscritos originais e traduzida como por é huper (υπερ) e significa, de acordo com Strong, “em benefício de, para a segurança de; acima, além, mais que”. Todas as outras vezes em que foi traduzida como por ou pelo(s), dava a ideia de “em benefício de”. Veja os exemplos:

1. Orai pelos que vos perseguem (Mt 5.44). 2. Quem não é contra nós é por nós (Mc 9.40). 3. Orai pelos que vos caluniam (Lc 6.28). 4. Isto é o meu corpo oferecido por vós (Lc 22.19). 5. O bom pastor dá a vida pelas ovelhas (Jo 10.11). Nas ocasiões em que não foi traduzida como por ou pelo(s), o sentido dado é “acima, além, mais que”. Vejamos alguns exemplos:

1. O discípulo não está acima do seu mestre (Mt 10.24). 2. Vi uma luz no céu, mais resplandecente que o Sol (At 26.13). 3. Deus é fiel e não permitirá que sejais tentados além das vossas forças (1 Co 10.13). 4. Porquanto foi acima das nossas forças (2 Co 1.8). 5. Para ser o cabeça sobre todas as coisas (Ef 1.22). Todavia, não podemos chegar a conclusões doutrinárias baseados em argumentos linguísticos. Sem contar que não estamos fazendo um estudo profundo. O ponto é que, não limitando a tradução de Efésios 5.20 para dar graças por tudo, podemos enxergar o quadro maior. O pai que perdeu um filho de forma prematura precisa agradecer pela perda em si? Se “dar graças por tudo” for literal, então sim! Se não, o “dar graças em tudo” faz muito mais sentido para mim. Esse pai não vai agradecer a fatalidade em si, mas pode manter-se grato a Deus mesmo na hora do luto, pois, apesar de sua dor, ele ainda serve ao Pai de misericórdias e Deus de toda consolação (2 Co 1.3).

Não creio que Paulo e Silas, enquanto estavam na prisão, agradeciam as chicotadas que levavam. Eles sabiam que aquelas circunstâncias não alteravam a bondade e o cuidado de Deus por eles. A gratidão é uma linguagem de fé e confiança na soberania do Senhor. É a capacidade de reconhecer o agir divino em todas as coisas, se não for evitando o que não queremos, é fortalecendo-nos naquelas circunstâncias ou mesmo revertendo-as para que Seu propósito se cumpra em nossa vida, como foi na de José.

Que possamos crescer em todas as áreas!

1. Apesar de algumas versões modernas da Bíblia optarem por essa interpretação equivocada, ela não consta nos originais e é uma contradição ao restante do ensino sobre a fé.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você tem desejado ardentemente o crescimento espiritual, assim como uma criança recém-nascida deseja o leite, ou tem se acomodado onde está?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Diante da ênfase que as Escrituras dão ao crescimento, por que será que você (ou tantos cristãos) acabam tratando esse tema como pouco importante?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Que passos concretos você pode dar para que o crescer espiritualmente deixe de ser apenas um ideal e se torne um alvo perseguido no dia a dia?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 7;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Fases de crescimento$t$, 7,
$conteudo$O

“Para sermos diferentes do que somos, precisamos ter consciência do que somos.”

(Eric Hoffer)

que envolve crescimento espiritual? Quais são seus processos? É de suma importância responder a essas perguntas, porque elas evidenciam a existência de distintas fases do crescimento.

A Palavra de Deus apresenta etapas naturais como um paralelo ao desenvolvimento espiritual. Embora com nomenclaturas diversas, os textos de diferentes escritores complementam-se, ajudando a enxergar o quadro completo do que o Senhor deseja revelar por meio das Escrituras.

No livro Crescendo Espiritualmente, Kenneth Hagin também fala da importância de localizarmos a nós mesmos em relação a tais fases. Isso ajuda a definir não apenas em que ponto estamos, como também em qual direção devemos avançar. Como citado na introdução, o livro de Hagin esclareceu muito minha visão acerca do crescimento espiritual. Cito uma de suas importantes definições:

A Bíblia nos ensina que há uma semelhança marcante entre o desenvolvimento espiritual e o físico. Fala a respeito de, pelo menos, três etapas no desenvolvimento espiritual que correspondem a três no físico. São elas: a primeira infância, a meninice e a varonilidade. Ao examiná-las nessa mesma ordem, notando as subdivisões de cada etapa, veremos que algumas das características aplicáveis a cada fase do desenvolvimento natural também se aplicam à etapa espiritual correspondente. E, segundo creio, podemos localizar-nos em alguma subdivisão das etapas.

Além das três etapas mencionadas, quero acrescentar, pelo menos, mais uma, completando aquilo que me parece estar claro nas Escrituras: o jovem.

Vamos às etapas: 1. Recém-nascido. 2. Menino. 3. Jovem. 4. Adulto. Como chegamos a essas definições? Por meio das afirmações de diferentes porções das Escrituras. Analisemos, portanto, os textos bíblicos e suas aplicações.

BEBÊS RECÉM-NASCIDOS

O apóstolo Pedro é quem dá destaque à fase inicial que quero classificar como “bebês recém- nascidos”:

Desejai ardentemente, como crianças recém-nascidas, o genuíno leite espiritual, para que, por ele, vos seja dado crescimento para salvação, se é que já tendes a experiência de que o Senhor é bondoso.

1 Pedro 2.2,3

As palavras usadas nos originais, em grego, são artigennetos (αρτιγενητος) e brephos (βρεφος) e significam, respectivamente, segundo Strong, “recém-nascido” e “criança não nascida, embrião, feto; criança recém-nascida, infante, bebê”. A Nova Versão Transformadora traduziu assim: Como bebês recém-nascidos, desejem intensamente o puro leite espiritual, para que, por meio dele, cresçam e experimentem plenamente a salvação (1 Pe 2.2).

Esse estágio fala dos que acabaram de experimentar o novo nascimento (Jo 3.6). Eles foram regenerados (1 Pe 1.23), ou seja, gerados de novo pela Palavra da Verdade (Tg 1.18). Ainda que, exteriormente, possam ser adultos no momento da conversão, são, interiormente, bebês recém-nascidos.

Uma das prováveis causas de negligência no cuidado com novos convertidos é esta falta de compreensão: no mundo espiritual, eles são bebês recém-nascidos; não possuem entendimento algum das coisas espirituaisnem capacidade de cuidar de si mesmos; precisam de acompanhamento e paciência, muita paciência.

Recordo-me de uma ocasião em que não gostei de determinada atitude de meu filho Israel. Por conseguinte, chamei sua atenção:

— Que coisa feia, meu filho, agir assim... Você parece criança! Ele respondeu de pronto: — Pai, é que eu sou mesmo uma criança! Atentando para o fato, comecei a rir. Se não soubermos situar a nós mesmos com relação à fase de crescimento, ou mesmo compreender em que etapa se encontram os que estão à nossa volta, tendemos a tratamentos equivocados e, até mesmo, injustos.

MENINOS

O apóstolo Paulo fala tanto de meninos como também de adultos, no mesmo texto. Observe que, antes, ele destaca a importância dos cinco ministérios:

E ele mesmo concedeu uns para apóstolos, outros para profetas, outros para evangelistas e outros para pastores e mestres, com vistas ao aperfeiçoamento dos santos para o desempenho do seu serviço, para a edificação do corpo de Cristo.

Efésios 4.11,12

O propósito de Cristo ter dado os ministérios à Igreja é evidente: Com vistas ao aperfeiçoamento dos santos. Isso significa que precisamos de aperfeiçoamento, de desenvolvimento. Qual o alvo desse crescimento? Chegar à varonilidade. Veja:

Até que todos cheguemos à unidade da fé e do pleno conhecimento do Filho de Deus, à perfeita varonilidade, à medida da estatura da plenitude de Cristo, para que não mais sejamos como meninos, agitados de um lado para outro e levados ao redor por todo vento de doutrina, pela artimanha dos homens, pela astúcia com que induzem ao erro. Mas, seguindo a verdade em amor, cresçamos em tudo naquele que é a cabeça, Cristo.

Efésios 4.13-15

E o que significa chegar à perfeita varonilidade? É alcançar a fase adulta, é tornar-se varão, homem, adulto. A Nova Versão Internacional optou por: E cheguemos à maturidade, atingindo a medida da plenitude de Cristo. Portanto, há uma fase adulta, e é interesse de Deus que cheguemos a ela.

Agora Paulo acrescenta o fator anterior à meta: a etapa da meninice. Para chegar a ser adulto, é necessário deixar de ser menino: “Não mais sejamos como meninos”. Em outras palavras, como traduziu A Nova Versão Internacional: O propósito é que não sejamos mais como crianças.

A palavra empregada por Paulo, nos manuscritos originais, é nepios (νηπιος) e significa: “infante, criancinha, menor, não de idade”. Strong ainda acrescenta o sentido metafórico: “infantil, imaturo, inexperiente”. Refere-se a uma criança que já não mais se encontra no estágio de recém-nascido, mas ainda reflete muito mais a inconstância de um garoto do que a firmeza de um jovem: Agitados de um lado para outro e levados ao redor por todo vento de doutrina.

Entretanto, tal tipo de criança, diferente do recém-nascido, já possui certo nível de autonomia. Recordo-me de que, quando cada um de meus filhos começou a andar, nós, os pais, trocamos de responsabilidade. Antes, tínhamos de carregá-los por toda a parte; depois, já não havia necessidade de colo, mas passamos a ter de correr atrás deles o tempo todo. Certa autonomia era acrescentada à medida que eles mudavam de fase. Que alívio quando deixaram as fraldas e passaram a ir ao banheiro sozinhos! Contudo, a cada nova fase dos filhos, exigia-se, automaticamente, uma etapa de cuidados diferentes por parte dos pais.

Em suma, depois de bebê recém-nascido, há o estágio de crianças já um pouco crescidas, ou a meninice. Porém, antes da fase adulta, ainda há, pelo menos, uma estação intermediária: a juventude.

JOVENS

Quem usou a expressão jovens como fase intermediária entre “crianças” e “adultos” foi João, o discípulo amado:

Filhinhos, eu vos escrevo, porque os vossos pecados são perdoados, por causa do seu nome. Pais, eu vos escrevo, porque conheceis aquele que existe desde o princípio. Jovens, eu vos escrevo, porque tendes vencido o Maligno. Filhinhos, eu vos escrevi, porque conheceis o Pai. Pais, eu vos escrevi, porque conheceis aquele que existe desde o princípio. Jovens, eu vos escrevi, porque sois fortes, e a palavra de Deus permanece em vós, e tendes vencido o Maligno.

1 João 2.12-14

O apóstolo não enfatiza o primeiro estágio como Pedro, que falou de bebê recém-nascido, mas apresenta outros três, da seguinte forma:

1. Filhinhos. Parece-me óbvia a relação entre esse termo e alguém que é novo na fé, uma vez que o escritor destaca: Os vossos pecados são perdoados, por causa do seu nome (v. 12). Ele também descreve o único tipo de conhecimento que parecem ter, a descoberta da paternidade divina: Eu vos escrevi, porque conheceis o Pai (v.13). A palavra grega traduzida como filhinhos é teknion (τεκνιον) e significa “criancinha”. Strong observa que, nos dias do Novo Testamento, filhinhos era “usado como termo que expressa a forma gentil pela qual mestres se dirigem a seus discípulos”. 2. Pais. A palavra pai, traduzida do grego pater (πατηρ), refere-se a um “gerador ou antepassado masculino; antepassado mais próximo: pai da natureza corporal, pais naturais, tanto pai quanto mãe; o originador e transmissor de algo; os autores de uma família ou sociedade”. Todos esses significados apontam para aqueles que não somente cresceram espiritualmente, mas também se tornaram maduros o suficiente para gerar novos filhos na fé. Fala dos que alcançaram a fase adulta. 3. Jovens. Há um terceiro grupo, que aparece na alegoria de João, que é composto pelos jovens.

Ainda não são adultos, tampouco pais, mas também não são mais crianças. São chamados de fortes — sois fortes, e a palavra de Deus permanece em vós (v. 14) —, em contraste ao estado indefeso de um infante. Entram na classificação de quem já sabe lutar e vencer. Por duas vezes, João afirma acerca desses jovens: Tendes vencido o Maligno (v. 13,14). O comportamento e as habilidades de cada fase de crescimento são diferentes. O recém-nascido é completamente dependente e requer cuidado e acompanhamento plenos. Os meninos demonstram um pouco mais de autonomia, mas com fortes sinais de imaturidade. Os jovens se expressam como crentes já bem-desenvolvidos, que conhecem uma caminhada vitoriosa, além de apresentar muita autonomia. Porém, só os adultos é que avançaram da autonomia para a responsabilidade de gerar e cuidar — estes se tornaram pais espirituais.

Compare as diferenças:

FASE CARACTERÍSTICAS COMPORTAMENTO

Bebês recém-nascidos (1 Pe 2.2) Novos convertidos Dependência total

Crianças/filhinhos (Ef 4.14) Sinais de imaturidade Pouca autonomia

Jovens (1 Jo 2.13,14) Crentes mais desenvolvidos Muita autonomia

Adultos/pais (Ef 4.15) Adultos que reproduzem Expressão de responsabilidade

DIETA CORRETA PARA CADA FASE

Há uma dieta adequada para cada estágio de vida. Tanto natural como espiritualmente, a nutrição correta é determinante para o crescimento.

Desejai ardentemente, como crianças recém-nascidas, o genuíno leite espiritual, para que, por ele, vos seja dado crescimento para salvação.

1 Pedro 2.2

As palavras do apóstolo foram muito claras: crescimento espiritual requer não apenas um processo — que demanda tempo —, mas também alimento. O desenvolvimento se dá mediante a devida nutrição. O ser humano não pode achar que alimento é necessário somente no mundo natural. De forma alguma!

Nosso Senhor declarou: Está escrito: Não só de pão viverá o homem, mas de toda palavra que procede da boca de Deus (Mt 4.4). O pão natural alimenta o corpo, mas o espírito é alimentado pela Palavra de Deus.

Paulo também afirmou a seu discípulo Timóteo: Serás [...] alimentado com as palavras da fé e da boa doutrina que tens seguido (1 Tm 4.6). O significado primário da palavra grega entrepho (εντρεφω) é “nutrir uma pessoa ou algo”, e as versões bíblicas alternaram entre o emprego da palavra nutrido e seu sinônimo alimentado. A referência é à alimentação não natural, mas espiritual — que se dá por meio da Palavra de Deus.

Na epístola aos Hebreus, são mencionadas pessoas que provaram a boa palavra de Deus (Hb 6.5). O interessante é que a palavra empregada nos manuscritos originais em grego é geuomai (γευομαι) que, de acordo com Strong, significa: “provar, testar o sabor de, saborear, tomar uma refeição, sentir, provar de, experimentar, comer, nutrir-se”. Obviamente, era senso comum entre os escritores do Novo Testamento que a Palavra de Deus é alimento, é comida para nosso espírito.

Vamos analisar o cardápio propício à cada fase. Assim como o recém-nascido precisa de uma dieta específica de leite materno, no plano espiritual, a alegoria se repete — é isso que Paulo menciona na primeira carta aos coríntios. Já em Hebreus, o autor usa a mesma analogia, avançando para outros estágios de crescimento. Vejamos os dois textos:

Eu, porém, irmãos, não vos pude falar como a espirituais, e sim como a carnais, como a crianças em Cristo. Leite vos dei a beber, não vos dei alimento sólido; porque ainda não podíeis suportá-lo. Nem ainda agora podeis, porque ainda sois carnais.

1 Coríntios 3.1,2

A esse respeito temos muitas coisas que dizer e difíceis de explicar, porquanto vos tendes tornado tardios em ouvir. Pois, com efeito, quando devíeis ser mestres, atendendo ao tempo decorrido, tendes, novamente, necessidade de alguém que vos ensine, de novo, quais são os princípios elementares dos oráculos de Deus; assim, vos tornastes como necessitados de leite e não de alimento sólido. Ora, todo aquele que se alimenta de leite é inexperiente na palavra da justiça, porque é criança. Mas o alimento sólido é para os adultos, para aqueles que, pela prática, têm as suas faculdades exercitadas para discernir não somente o bem, mas também o mal.

Hebreus 5.11-14

Quem se alimenta de leite no mundo natural? A criança. Especialmente quando ainda é bebê, não possui condições de processar alimento sólido — base de uma dieta que a Bíblia direciona a adultos. Em um verdadeiro paralelo com o mundo espiritual, a dieta do crente maduro é semelhante. O adulto espiritual é dotado de estrutura diferente. É claro que não me refiro ao aspecto digestivo, e sim às faculdades espirituais, que são exercitadas para discernir tanto o bem como o mal.

Há igrejas e ministros que parecem nunca ter percebido tais verdades bíblicas. Ou tratam o rebanho todo somente à base de leite, sem nunca oferecer alimento sólido para os adultos, ou vão ao outro extremo e intoxicam os bebês espirituais com informações desnecessárias, nem um pouco relevantes e práticas para quem é novo na fé. O que é alimento sólido para o adulto pode ser veneno para a criança. Paulo, aos coríntios, diz que a criança não pode suportar o alimento sólido. Logo, tem gente alimentando com feijoada os bebês recém-nascidos!

Crentes novos, sem alicerce bíblico ou maturidade, estão procurando estudar assuntos profundos e polêmicos, especialmente via internet. Bebem em tudo quanto é fonte, sem qualquer capacidade de discernir o bem e o mal. O resultado? Muitas pessoas confusas, desorientadas e até mesmo frias na fé.

Sem conseguir localizar-se nos estágios de crescimento, haverá confusão a respeito de qual dieta adotar. Entender e respeitar essa verdade é importantíssimo. Até Jesus deu o devido destaque:

Tenho ainda muito que vos dizer, mas vós não o podeis suportar agora; quando vier, porém, o Espírito da verdade, ele vos guiará a toda a verdade; porque não falará por si mesmo, mas dirá tudo o que tiver ouvido e vos anunciará as coisas que hão de vir. Ele me glorificará, porque há de receber do que é meu e vo-lo há de anunciar.

João 16.12-14

O cabeça da Igreja, Jesus, afirma que não basta Ele desejar comunicar determinadas verdades; nós precisamos de estrutura para suportá-las, em níveis diversos de revelação e entendimento. Porém, Cristo não desistiu de comunicar aquilo que os discípulos precisavam ouvir — apenas deixou para fazê-lo posteriormente, por intermédio de Seu Espírito Santo.

NATURAL, CARNAL E ESPIRITUAL

Há outras nomenclaturas bíblicas que podem ser usadas para indicar fases de crescimento ou maturidade. Atente para as palavras que Paulo empregou em sua primeira carta aos coríntios:

Ora, o homem natural não aceita as coisas do Espírito de Deus, porque lhe são loucura; e não pode entendê-las, porque elas se discernem espiritualmente. Porém o homem espiritual julga todas as coisas, mas ele mesmo não é julgado por ninguém. Pois quem conheceu a mente do Senhor, que o possa instruir? Nós, porém, temos a mente de Cristo. Eu, porém, irmãos, não vos pude falar como a espirituais, e sim como a carnais, como a crianças em Cristo. Leite vos dei a beber, não vos dei alimento sólido; porque ainda não podíeis suportá-lo. Nem ainda agora podeis, porque ainda sois carnais. Porquanto, havendo entre vós ciúmes e contendas, não é assim que sois carnais e andais segundo o homem?

1 Coríntios 2.14—3.3

O apóstolo faz referência a homem natural, carnal e espiritual. Vamos tentar entender cada um desses adjetivos e o porquê de Paulo fazer a distinção classificatória:

1. Natural. A palavra grega traduzida como natural é psuchikos (ψυχικος) e significa, de acordo com

Strong: “de ou que faz parte da respiração; que tem a natureza e características daquilo que respira; o principal da vida animal, o que os seres humanos têm em comum com os animais; governado pela respiração; a natureza sensual com sua dependência dos desejos e das paixões”. Alguns acreditam que psíquico, termo usado no original, indica o homem entregue à sua psiquê, à sua mente, à sua razão, mas essa mera definição colocaria qualquer um de nós, cristãos ou não, na mesma condição — já que todos nos movemos racionalmente. Contudo, diante da afirmação de Cristo a Nicodemos de que não se pode ver o Reino de Deus sem nascer de novo (Jo 3.3), muitos, com os quais eu, pessoalmente, concordo, optam pela definição de “homem natural” como alguém sem Cristo, um não convertido, ainda alheio ao Reino do Senhor — que é espiritual. Isso mostra que, se o homem não tem a Vida (Jesus) no plano espiritual, ele vive apenas naturalmente, é apenas homem “psíquico”. 2. Carnal. Aqui se faz menção a alguém já convertido, porém não desenvolvido espiritualmente. Isso fica evidente em 1 Coríntios 3.1, quando Paulo afirma: Não vos pude falar como a espirituais, e sim como a carnais, como a crianças em Cristo. Há uma relação entre as expressões carnais e crianças em Cristo: ambas tratam de quem foi regenerado, mas não abandonou a infância espiritual. Consequentemente, ainda se alimenta de leite, quando já deveria viver e digerir bem o alimento sólido. 3. Espiritual. As verdades profundas da Palavra de Deus não podem ser plenamente entendidas com a razão, com nossa psiquê. Esse é o motivo de Paulo afirmar que elas se discernem espiritualmente. Os espirituais são aqueles que já cresceram e se desenvolveram a ponto de terem as suas faculdades exercitadas para discernir não somente o bem, mas também o mal (Hb 5.14). Drummond Lacerda, no livro já citado Fora do Alcance das Crianças — A Plenitude de Deus Está Esperando Você Crescer, declara: “Ao inferir que os carnais são meninos, Paulo está dizendo-nos, de forma implícita, que os espirituais são os maduros”. Portanto, as palavras natural, carnal e espiritual indicam fases distintas: • O natural ainda precisa converter-se. • O carnal já se converteu, mas necessita crescer e desenvolver-se espiritualmente. • O espiritual aprendeu a andar não mais segundo a carne, mas sob o domínio e a liderança de seu espírito, cheio do Espírito Santo e da Palavra de Deus. Para facilitar o entendimento, cito mais uma vez Kenneth Hagin e seu livro Crescendo Espiritualmente:

O homem natural é aquele que ainda não passou da morte para a vida. Não nasceu de novo; não foi recriado; nunca se tornou uma nova criatura em Cristo Jesus. O homem carnal é uma nova criatura, pois nasceu de novo, mas jamais se desenvolveu, nem cresceu. A triste verdade é que o homem carnal pode ficar nessa condição durante toda a sua vida. Talvez nunca passe da etapa da primeira infância na sua condição de nova criatura. É governado pelo seu corpo, pelos sentidos, não pelo seu espírito. O homem espiritual é aquele que se desenvolveu nos aspectos divinos. Seu espírito conquistou o domínio sobre seus processos intelectuais e conseguiu o controle sobre o seu corpo e seus sentidos físicos. Deus o governa por meio da Palavra.

Não importa como denominamos cada fase, o fato é que elas existem e precisam ser compreendidas. Se as Escrituras não optaram por termos únicos, penso que temos a liberdade de alternar entre os sinônimos. Melhor do que encontrar a nomenclatura perfeita é entender cada estágio, saber localizar em qual estamos — e em qual estão aqueles a quem Deus nos confiou o cuidado —, para, a partir disso, trabalhar com a dieta correta, rumo à maturidade.

Novamente, recorro às palavras de Drummond Lacerda:

Enquanto não houver o diagnóstico, nenhum remédio deverá ser ministrado ao doente. A cura começa com o reconhecimento. A maturidade também pode começar quando conseguimos enxergar onde estamos sendo imaturos. Deixar Deus nos mostrar onde estamos em nossa maturidade é importante para que possamos crescer.

No próximo capítulo, você encontrará comportamentos comuns a cada fase. O objetivo é que você consiga responder à pergunta que não quer calar: Em que fase você se encontra? Localize-se, ajuste o que é necessário e programe a dieta — só não pare de crescer, porque há muito de Deus reservado exclusivamente aos maduros.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Em qual fase do desenvolvimento espiritual você acredita estar hoje: a primeira infância, a meninice ou a maturidade?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Por que é tão importante localizar com sinceridade em que ponto da caminhada você se encontra, em vez de presumir que já chegou mais longe do que realmente está?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Reconhecendo a sua fase atual, em que direção o Senhor está chamando você a avançar?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 8;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Comportamento nas fases$t$, 8,
$conteudo$U

“Um dos sinais indicativos de maturidade é a capacidade de discordar sem se tornar desagradável.” (Charles Swindoll)

m dos maiores indícios de que estamos em determinado estágio de crescimento é o nosso comportamento. Logo, tanto a maturidade quanto a falta dela ficam evidentes na maneira como nos comportamos. Uma declaração do apóstolo Paulo revela um tópico importante dentro da temática do amadurecimento. Mais que apenas reconhecer as fases, o apóstolo aponta que cada etapa possui marcas, comportamentos específicos. Observe:

Quando eu era menino, falava como menino, sentia como menino, pensava como menino; quando cheguei a ser homem, desisti das coisas próprias de menino.

1 Coríntios 13.11

Creio ser importante analisar as atitudes comuns a cada uma das etapas de crescimento. Antes, porém, exponho um detalhe importante nessa transição de fases e, consequentemente, de comportamento. Faço uso de mais um comentário de Drummond Lacerda, no livro Fora do Alcance das Crianças – A Plenitude de Deus Está Esperando Você Crescer. Em referência à declaração de Paulo em 1 Coríntios 13, Lacerda avalia a postura da meninice:

Existe um jeito de falar, pensar e sentir que é próprio de menino. Ou seja, a imaturidade pode ser vista pela vida sentimental, pela fala e pelos pensamentos. Na verdade, se alguém pensa de forma imatura, consequentemente vai falar e ter sentimentos coerentes com essa infantilidade. Contudo, Paulo nos conta que desistiu dos pensamentos, das palavras e dos sentimentos infantis. Isso nos ensina que é uma decisão deixar a imaturidade. Para crescer, precisamos decidir abandonar as coisas próprias da meninice.

Seria inadmissível para mim, hoje, ouvir meu filho, já adulto, gritando lá do banheiro: “Paiêêê, vem me limpar!”. Por quê? Porque esse comportamento era aceitável apenas quando ele tinha seus três anos de idade. Agora já não é mais. Semelhantemente, eu ficaria incomodado se minha filha Lissa, já crescida e pronta para ir morar e estudar fora, ainda estivesse pedindo colo. Uma coisa não combina mais com a outra. Parar de agir como se agia quando criança é uma comprovação de amadurecimento.

Essa é a razão da afirmação de Paulo aos efésios: Até que todos cheguemos [...] à perfeita varonilidade [...] para que não mais sejamos como meninos (Ef 4.13,14).

Somando as duas falas do apóstolo, aos coríntios e aos efésios, entendemos que alcançar a plena maturidade, a fase adulta, significa deixar as coisas de menino — ou desistir delas. Isso mostra que cada fase de crescimento é marcada por algumas atitudes e comportamentos, bem como pelo abandono de outras, aceitáveis anteriormente.

Há, ainda, uma terceira declaração de Paulo que merece ser citada e analisada aqui:

Irmãos, não sejais meninos no juízo; na malícia, sim, sede crianças; quanto ao juízo, sede homens amadurecidos.

1 Coríntios 14.20

Com os conselhos sede crianças e sede homens amadurecidos, a Palavra de Deus indica como agir. Não há bipolaridade no pensamento de Paulo quando ordena que sejamos crianças e adultos ao mesmo tempo. Trata-se de assumir o comportamento devido a quem está em determinado estágio de crescimento. Há uma diferença entre o adulto, já crescido, que escolhe “ser criança” e andar sem malícia e a própria criança, que não cresceu ainda e, portanto, não sabe avaliar seu comportamento. De qualquer forma, não há como ignorar, biblicamente, que cada fase de crescimento se revela em atitudes específicas.

Vamos analisar peculiaridades das quatro fases pontuadas no capítulo anterior. Relembrando: 1. Recém-nascido. 2. Menino. 3. Jovem. 4. Adulto.

RECÉM-NASCIDO

Assim como na família, também encontramos, no Reino de Deus, comportamentos marcantes em cada etapa de crescimento. Em uma casa, é fácil identificar quem é o recém-nascido e quem é o responsável pelas contas do mês, tanto por atitudes como por responsabilidades.

Para retratar um novo na fé, a Bíblia usa, entre outros, o termo neófito. Vimos que ele não está apto para exercer liderança (1 Tm 3.6) — ainda. A razão é muito simples: esse bebê não se desenvolveu espiritualmente. Ele ainda não experimentou o crescimento para a salvação.

Quais sinais podem ser destacados no comportamento de uma criancinha recém-nascida no espírito?

Dependência

A primeira característica a sublinhar é a completa dependência de um adulto. Uma criança recém- nascida não dispõe de autonomia alguma. Depende de um adulto para ser carregada, alimentada, trocada. O nível de cuidado por ela exigido é enorme.

Quem experimenta o novo nascimento até pode ser, fisicamente, adulto. Contudo, na fé, espiritualmente, ainda é uma criancinha. Como tal, necessita de acompanhamento e cuidado.

Ela precisa de alguém que lhe prepare e lhe sirva o alimento espiritual. Não podemos deixá-la entregue a si mesma.

Infelizmente, o que acontece em nossos dias é que muitos gerados em Cristo, mediante o novo nascimento, são abandonados à própria sorte.

Quando o Evangelho, por conta da perseguição, espalhou-se até Antioquia, com muitos novos convertidos, a Igreja em Jerusalém imediatamente enviou Barnabé para lá. Veja o relato bíblico:

Então, os que foram dispersos por causa da tribulação que sobreveio a Estêvão se espalharam até à Fenícia, Chipre e Antioquia, não anunciando a ninguém a palavra, senão somente aos judeus. Alguns deles, porém, que eram de Chipre e de Cirene e que foram até Antioquia, falavam também aos gregos, anunciando-lhes o evangelho do Senhor Jesus. A mão do Senhor estava com eles, e muitos, crendo, se converteram ao Senhor. A notícia a respeito deles chegou aos ouvidos da igreja que estava em Jerusalém; e enviaram Barnabé até Antioquia. Tendo ele chegado e, vendo a graça de Deus, alegrou-se e exortava a todos a que, com firmeza de coração, permanecessem no Senhor.

Atos 11.19-23

Por que enviaram Barnabé para ajudá-los? Porque os novos na fé não podiam ficar sem alguém que cuidasse deles. Não se abandona bebês recém-nascidos à própria sorte! Concordo com as palavras de Kenneth Hagin no clássico livro Crescendo Espiritualmente:

Seremos responsabilizados pelos “bebês” espirituais que nasceram na família de Deus, em nossas campanhas e igrejas.

Além da dependência e da necessidade de cuidado com o próximo, quero frisar outras características destacadas pelo irmão Hagin: inocência, ignorância e irritabilidade.

Inocência

Outra característica é que, à semelhança de um bebê natural, o bebê espiritual apresenta a marca da inocência. Mesmo a latente natureza caída, embora já transmitida a cada ser humano (Rm 5.12), leva um tempo para manifestar-se.

Há uma idade em que o fruto da árvore do conhecimento do bem e do mal (Gn 2.17) parece “fazer efeito”. O profeta Isaías informa que ela se dá quando a criança passa a saber desprezar o mal e escolher o bem (Is 7.16). Difícil é determinar, de criança para criança, quando ocorre. Entretanto, é inegável que existe um momento no qual esse nível de discernimento se manifesta.

Penso ser por isso que criancinhas recém-nascidas são chamadas de “anjinhos” ou “coisinhas mais inocentes”. De fato, nessa fase, elas são inocentes. Nasceram sem passado ou qualquer tipo de história.

A máxima repete-se na realidade espiritual, quando experimentamos regeneração em Cristo:

E, assim, se alguém está em Cristo, é nova criatura; as coisas antigas já passaram; eis que se fizeram novas.

2 Coríntios 5.17

A Nova Versão Transformadora traduziu assim: Logo, todo aquele que está em Cristo se tornou nova criação. A velha vida acabou, e uma nova vida teve início! (2 Co 5.17). Fomos criados novamente. Nascemos de novo. Assim como a nova criação, há também uma nova realidade: Tudo se fez novo! Tudo é realmente... tudo.

A consequência? Não carregamos culpa alguma! O passado foi limpo e justificado pelo sangue de Jesus! Veja como a Palavra de Deus é enfática com relação a essa inocência:

Agora, pois, já nenhuma condenação há para os que estão em Cristo Jesus.

Romanos 8.1

Quem intentará acusação contra os eleitos de Deus? É Deus quem os justifica. Quem os condenará? É Cristo Jesus quem morreu ou, antes, quem ressuscitou, o qual está à direita de Deus e também intercede por nós.

Romanos 8.33,34

Ignorância

Criei dois filhos e recordo muito bem que cada um deles passou pela fase em que não tinham conhecimento das coisas e, em especial, ignoravam o perigo. Se não cuidamos, eles colocam a mão em algo quente, ou mesmo em uma tomada de energia elétrica, ou nas hélices de um ventilador.

Quando recém-nascidos, os bebês colocam as mãos na boca. Basta crescerem um pouquinho e, se não vigiarmos, pegam qualquer coisa que encontram pelo chão e levam à boca. Apesar de precisarem de uma dieta restrita ao leite, sem alimento sólido nos primeiros meses, eles não sabem disso. Não possuem poder seletivo algum ou conhecimento acerca do que é ou não é perigoso. Mais uma razão para cuidar de perto dos nossos bebês — espirituais também.

Há várias figuras bíblicas que falam dessa falta de noção de perigo ou mesmo incapacidade para defender-se. A analogia do bebê é apenas uma. Obviamente, faço uso dela porque reflete uma fase de crescimento, objeto de nosso estudo. Contudo, eu poderia recorrer aqui ao exemplo da ovelha, usado por Deus para simbolizar Seu povo nas Escrituras. É um dos animais mais indefesos que podemos mencionar, por isso precisa ser vigiado de perto pelo pastor.

A soma dessas figuras deve gerar em nós um senso de responsabilidade e cuidado com os mais novos, especialmente quanto ao ensino. Eles não podem ser deixados à mercê de qualquer conteúdo. A internet, hoje em dia, provê muita coisa boa, com a viabilidade do ensino a distância e da possibilidade de estudar-se onde e quando quiser. Não sou contra isso; pelo contrário, eu mesmo disponibilizo uma Escola Bíblica on-line no site de meu ministério. O ponto é que nossos bebês espirituais não deveriam procurar seu próprio alimento! Os cuidadores, por sua maturidade, já desfrutam de uma capacidade mais acurada de discernimento — são eles que deveriam orientar os novos a respeito do que é ou não bom ingerir.

Irritabilidade

A irritabilidade também é uma marca dos bebês, tanto naturais como espirituais. Lembro que bastava alterar um pouco a rotina de nossa família que meus filhos, quando bem novinhos, ficavam irritados. Às vezes, o motivo era a mudança no horário de dormir, que afetava o sono; outras vezes, mudava o tipo da comida, o horário de comer ou o ambiente diferente para a alimentação. Muito poderia ser citado, mas o cerne é que ficar irritado é uma reação de crianças pequenas. À medida que crescem, aumenta também a capacidade de adaptação e compreensão.

Mencionei, no capítulo anterior, que Abraão deu um banquete quando seu filho foi desmamado. Isso era motivo de festa. Normalmente, a alegria maior é dos pais — a criança nem sempre aceita muito bem a transição. Ela chora, faz manha, se exaspera e, às vezes, irrita os pais também. No plano espiritual, precisamos saber lidar com os bebês espirituais que, ao mesmo tempo em que se irritam, irritam os pais.

O rei Davi, em um de seus salmos, frisou que o comportamento irritável de uma criança pode ser acalmado pela atitude correta da mãe, o que é igualmente verdadeiro em nosso relacionamento com Deus:

Senhor, não é soberbo o meu coração, nem altivo o meu olhar; não ando à procura de grandes coisas, nem de coisas maravilhosas demais para mim. Pelo contrário, fiz calar e sossegar a minha alma; como a criança desmamada se aquieta nos braços de sua mãe, como essa criança é a minha alma para comigo.

Salmo 131.1,2

Minha leitura da fala do salmista é mais ou menos assim: “Da mesma forma como a mãe acalma, em seu colo, a irritabilidade da criança recém-desmamada, eu aquieto minha alma das respostas que ainda não tenho em Ti, ó Deus”. Em um perfeito paralelo, Davi diz que há necessidade de paciência por parte de quem cuida, tanto natural como espiritualmente. Além disso, acentua que esse é o tratamento concedido pelo próprio Pai celestial: pegar no colo, pacientemente, quando a criança se irrita.

Transcrevo, mais uma vez, um comentário do irmão Hagin, do livro que tanto me ajudou, desde a juventude, a entender os processos de crescimento espiritual:

Precisamos crescer espiritualmente de tal modo que, em vez de alguém precisar chegar até nós para visitar-nos, para insuflar-nos a pressão, apoiar-nos, orar conosco e alimentar-nos, nós mesmos possamos estar lá fora, ajudando o próximo. Ao chegar a hora do desmame, devemos dar graças a Deus por isso. Na realidade, se uma criança for corretamente desmamada, desviará o rosto da mamadeira na época certa. Caso contrário, estaremos com o problema de uma choradeira interminável.

MENINO

A fase da meninice, do comportamento de menino, também possui características específicas. Vamos relembrar: quando Paulo, escrevendo aos efésios, usa a expressão para que não mais sejamos como meninos (Ef 4.14), ou, aos coríntios, quando eu era menino (1 Co 13.11), a palavra traduzida como menino é, no original grego, nepios (νηπιος) e significa “infante, criancinha; menor, não de idade”. Strong destaca o sentido metafórico: “infantil, imaturo, inexperiente”. A palavra indica uma criança, embora seja evidente que já não mais está na categoria de recém-nascido.

Analisemos, portanto, comportamentos que indiciam a fase da meninice.

Inconstância

Quando garoto, meus pais costumavam dar a mim e aos meus irmãos tarefas domésticas. Tanto eu quanto eles demonstrávamos ter “o dom das tarefas inacabadas”. Começávamos a varrer a casa, mas, depois de um ou dois cômodos, interrompíamos a tarefa, abandonando a vassoura em um canto qualquer; ou começávamos a lavar a louça e, por alguma razão, o apelo para brincar na rua com os amigos era tão forte que pensávamos: “depois terminamos”, embora nunca, de fato, lembrávamos de concluir.

O curioso é que, depois de crescido, tornei-me pai e descobri, ao criar meus próprios filhos, que esse comportamento é generalizado. Você vai encontrá-lo sempre, em qualquer criança. É um dos sinais de imaturidade, que faz paralelo com a vida espiritual.

Paulo, aos crentes de Éfeso, fala acerca disso:

Para que não mais sejamos como meninos, agitados de um lado para outro e levados ao redor por todo vento de doutrina, pela artimanha dos homens, pela astúcia com que induzem ao erro.

Efésios 4.14

A expressão traduzida do original grego como agitados de um lado para outro é kludonizomai (κλυδωνιζομαι) e significa: “ser agitado pelas ondas”. De acordo com Strong, o sentido metafórico é “ser agitado mentalmente”. Em outras palavras, quem está na fase da meninice — que já deixou de ser bebê recém-nascido — carrega a marca da instabilidade, da oscilação. Espiritualmente, pode manifestar-se até mesmo no aspecto doutrinário.

Tal característica reflete-se, ainda, no comportamento ministerial. Quando pessoas muito novas na fé adentram o terreno do serviço, a volubilidade acaba por ser, em algum momento, notada. Penso ter sido esse o caso de João Marcos, auxiliar de Paulo e Barnabé, na primeira viagem missionária.

O capítulo 12 de Atos termina mostrando que os dois levaram João consigo, de Jerusalém a Antioquia: Barnabé e Saulo, cumprida a sua missão, voltaram de Jerusalém, levando também consigo a João, apelidado Marcos (At 12.25). Essa atitude, registrada nas Escrituras, faz-me acreditar que ambos estavam, em comum acordo, decididos a investir no ministério do rapaz. Ao partirem para a nova viagem missionária convocada pelo Senhor, levam novamente João:

Enviados, pois, pelo Espírito Santo, desceram a Selêucia e dali navegaram para Chipre. Chegados a Salamina, anunciavam a palavra de Deus nas sinagogas judaicas; tinham também João como auxiliar.

Atos 13.4,5

Porém, João, na condição de auxiliar, faz um trajeto curto, ao menos se comparado ao projeto todo. Ele os acompanha em Selêucia, Chipre, Salamina e, finalmente, Ilha de Pafos. Ali, por razões não descritas, desiste da viagem e retorna a Jerusalém:

E, navegando de Pafos, Paulo e seus companheiros dirigiram-se a Perge da Panfília. João, porém, apartando- se deles, voltou para Jerusalém.

Atos 13.13

Posteriormente, em uma nova viagem missionária, Barnabé quer levar o rapaz, mas Paulo discorda. Aliás, a Palavra de Deus revela que foi o motivo de grande desavença e até separação ministerial de Paulo e Barnabé:

Alguns dias depois, disse Paulo a Barnabé: Voltemos, agora, para visitar os irmãos por todas as cidades nas quais anunciamos a palavra do Senhor, para ver como passam. E Barnabé queria levar também a João, chamado Marcos. Mas Paulo não achava justo levarem aquele que se afastara desde a Panfília, não os acompanhando no trabalho. Houve entre eles tal desavença, que vieram a separar-se. Então, Barnabé, levando consigo a Marcos, navegou para Chipre. Mas Paulo, tendo escolhido a Silas, partiu encomendado pelos irmãos à graça do Senhor. E passou pela Síria e Cilícia, confirmando as igrejas.

Atos 15.36-41

Sei que, normalmente, muitos pregadores tomam partido do lado de Barnabé, que era alguém que sabia investir e dar oportunidade a outros. Inclusive, ele foi peça-chave no desenvolvimento ministerial do próprio apóstolo Paulo. Isso não significa, entretanto, que Barnabé era infalível, ou que Paulo, necessariamente, estivesse errado em sua decisão.

Permita-me mostrar, em três argumentos, porque penso assim: 1. Quem foi apoiado pela igreja, quando os dois homens de Deus discordaram e vieram a separar- se? O texto bíblico aponta que quem foi encomendado pelos irmãos à graça do Senhor para continuar a missão foi Paulo (v. 40). Barnabé foi para outra direção. Isso está escrito e não pode ser ignorado! 2. Paulo nunca desistiu permanentemente de João Marcos. A prova está em afirmações encontradas em três de suas cartas. Posteriormente, o apóstolo revela o que pensava acerca de João e como ele foi trazido para perto mais uma vez:

• Aristarco, meu companheiro de prisão, envia-lhes saudações, bem como Marcos, primo de Barnabé. Vocês receberam instruções a respeito de Marcos, e se ele for visitá-los, recebam- no. Jesus, chamado Justo, também envia saudações. Esses são os únicos da circuncisão que são meus cooperadores em favor do Reino de Deus. Eles têm sido uma fonte de ânimo para mim (Cl 4.10,11 NVI). • Somente Lucas está comigo. Toma contigo Marcos e traze-o, pois me é útil para o ministério (2 Tm 4.11). • Marcos, Aristarco, Demas e Lucas, meus cooperadores (Fm 1.24). 3. A postura de Paulo, em minha opinião, expressava o seguinte discurso: “João, você tem, de fato, um chamado divino. Eu acredito em você e não vou desistir de você. Contudo, porque deu provas de que ainda é instável como um menino, vou esperá-lo crescer antes de dar-lhe novas oportunidades”.

O que isso quer dizer? Meninos na fé não precisam ser poupados de serviço, porém não apresentam condições de assumir determinadas responsabilidades. Além disso, não é incomum que, nessa etapa, haja muito trabalho inacabado, muitas tarefas não terminadas, muitas metas não cumpridas. Por um lado, líderes devem incentivar o desenvolvimento; por outro, precisam permanecer compreensíveis.

Curiosidade

Certa ocasião, quando eu ainda era garoto, meu irmão mais velho disse: “Não vou contar o que acontece quando você coloca as pontas desse fio de cobre (desencapado) na tomada de energia elétrica”. Como ele não me contou, eu, curioso, fui tentar descobrir... Que choque levei!

Essa fase é marcada não apenas pelo bom desejo de aprender, que leva a fazer perguntas sábias, surpreendentes. A curiosidade, por si, também pode conduzir a descobertas erradas e prejudiciais.

Na vida espiritual, esse período expõe muitos crentes imaturos à fofoca. Estão sempre curiosos, acerca de quase tudo. Por um lado, digo “quase” porque alguns sequer demonstram um pequeno interesse por desvendar a Palavra de Deus; por outro, com o restante, a curiosidade — até mesmo a bisbilhotice — impera.

Tagarelice

Outra marca dos meninos que não pode ser ignorada: a tagarelice. Assim que adentram a fase da meninice, desandam a falar. Alguns mais que outros, porém quase todos se tornam, durante um tempo, bem tagarelas.

Esse é tanto um sinal de imaturidade no plano natural como de imaturidade de um crente carnal.

No muito falar não falta transgressão, mas o que modera os lábios é prudente.

Provérbios 10.19

Hagin aponta que essa tagarelice da criança espiritual costuma desdobrar-se em três tipos de pecados cometidos com a língua:

1. Maledicência. 2. Falar vaidades. 3. Falar tolices.

Ciúmes e contendas

Quando Paulo argumenta com os irmãos de Corinto que não pôde falar como a espirituais, e sim como a carnais, como a crianças em Cristo (1 Co 3.1), a palavra traduzida como crianças também é nepios. O apóstolo classifica-os, portanto, no estágio da meninice. Na sequência, destaca duas características: Porquanto, havendo entre vós ciúmes e contendas, não é assim que sois carnais e andais segundo o homem? (1 Co 3.3).

Para tratar desse tipo de comportamento, utilizo mais uma citação do livro de Drummond Lacerda:

A presença de ciúmes e contendas é um dos selos da carnalidade. Ao observar o texto, vemos que Paulo coloca problemas de relacionamento interpessoal como uma prova contundente de que existe infantilidade espiritual. Isso nos mostra que expomos nossa espiritualidade pela forma como nos relacionamos com o outro. É interessante que a igreja para a qual Paulo está escrevendo esta carta não tem falta de nenhum dom espiritual (1 Co 1.7). Paulo escreve a Corinto, ensinando sobre os dons espirituais e como eles deveriam funcionar, porque esta igreja tinha a manifestação dos dons espirituais de forma muito constante. Todavia, Paulo chama esses irmãos de meninos carnais. Isso porque espiritualidade não tem a ver com falar em línguas estranhas, profetizar ou ter visões, mas sim com amar as pessoas à nossa volta. Amamos e oramos para que os dons do Espírito estejam em atuação na Igreja, contudo não podemos nos iludir e achar que só porque alguém está sendo usado por Deus, está sendo aprovado por Ele. Você pode falar em línguas estranhas e pregar de forma eloquente, mas, se perde facilmente a paciência e é duro demais com sua esposa, então você é carnal. Se canta, debaixo de uma forte unção, porém, briga com as pessoas da banda, você é um menino espiritual. Se, pelas suas mãos um projeto tem sucesso, mas as pessoas não aguentam ficar perto de você, você ainda não chegou à maturidade. Se possui conhecimento da Bíblia, porém machuca o irmão que está ao seu lado, você ainda está na meninice!

Nosso comportamento denuncia a fase em que estamos! Paulo apontou aos coríntios que eles não apenas incorriam em ciúmes e contendas, mas também em preferências: Quando, pois, alguém diz: Eu sou de Paulo, e outro de Apolo, não é evidente que andais segundo os homens? (1 Co 3.4). O comportamento imaturo dos coríntios se repete na vida de todo menino espiritual.

Para concluir, uso mais uma porção do livro de Lacerda:

Os imaturos elegem os seus preferidos e desprezam os que não preferem. São seletivos. Amam a quem gostam e desprezam aqueles com quem não se identificam. Para combater esse pensamento carnal dos coríntios, Paulo diz que um planta, o outro rega, contudo quem dá o crescimento é Deus. De forma que quem planta e rega não fez coisa alguma, mas, sim, Deus que deu o crescimento (1 Co 3.6,7). Para lidar com a mentalidade carnal dos coríntios, que gerava partidarismo, Paulo aponta para dois argumentos: trabalho em equipe e a vital ação de Deus. Quando amadurecemos, sabemos que a obra de Deus não é feita por uma pessoa só. Os imaturos creem que foi através de um homem que o avivamento aconteceu e as coisas fluíram. Contudo, sempre há irmãos que regaram a semente com oração. Há pessoas que, de forma silenciosa, ensinaram princípios que se mostraram fundamentais para a grande colheita. Os imaturos, muitas vezes, pensam assim, por estarem debaixo de uma mentalidade de independência e não de interdependência. Querem buscar a Deus sem depender da ajuda de ninguém. Acreditam que podem alcançar o sucesso sem se relacionar bem com as pessoas. Pois, se sou de Paulo, que plantou, logo não preciso de Apolo, que regará. O que importa é o que eu faço e não dependo de outra pessoa para fazer o meu trabalho em Deus avançar. O pensamento que “glorifica uma pessoa” oculta a ideia de que não precisamos dos outros. Os imaturos glorificam uma pessoa, os maduros veem o conjunto que fez a colheita.

Egoísmo

Minha esposa sempre trabalhou com crianças nos contextos escolar e eclesiástico. Ela ama isso. Formou-se em pedagogia por paixão e chamado. Desde bem jovem, dedicou-se a esse tipo de trabalho. Ela sempre dizia que uma das primeiras frases que a criança aprende é: “É meu!”. Assim, nega-se a compartilhar aquilo que possui.

É exatamente por isso que o que se requer dos maduros é justamente o contrário: Nada façam por ambição egoísta ou por vaidade (Fp 2.3 NVI). Vale recordar aqui as palavras de Tiago, uma das colunas da igreja em Jerusalém (Gl 2.9):

Contudo, se vocês abrigam no coração inveja amarga e ambição egoísta, não se gloriem disso, nem neguem a verdade. Esse tipo de “sabedoria” não vem dos céus, mas é terrena; não é espiritual, mas é demoníaca. Pois onde há inveja e ambição egoísta, aí há confusão e toda espécie de males.

Tiago 3.14-16 NVI

Antes de seguir, um conselho: leia estas linhas em constante autoanálise. Peça ao Espírito Santo a habilidade de discernir a si próprio e também permita ser discernido por outras pessoas que, muitas vezes, enxergam melhor suas atitudes do que você mesmo. Tenho crescido por meio desses distintos processos que Deus usa, além de vê-los, de forma clara, nas Escrituras.

JOVEM

O jovem é aquele que atingiu o maior nível de maturidade e autonomia dentre as demais fases, com exceção da adulta. Vamos recordar quem usou a expressão jovens:

Filhinhos, eu vos escrevo, porque os vossos pecados são perdoados, por causa do seu nome. Pais, eu vos escrevo, porque conheceis aquele que existe desde o princípio. Jovens, eu vos escrevo, porque tendes vencido o Maligno. Filhinhos, eu vos escrevi, porque conheceis o Pai. Pais, eu vos escrevi, porque conheceis aquele que existe desde o princípio. Jovens, eu vos escrevi, porque sois fortes, e a palavra de Deus permanece em vós, e tendes vencido o Maligno.

1 João 2.12-14

João retrata os jovens como um terceiro grupo, localizado na etapa intermediária entre “crianças” e “adultos”. Ainda não são adultos, tampouco pais, mas também não são mais crianças.

Qual sua característica principal? São chamados pelo apóstolo de fortes: Sois fortes, e a palavra de Deus permanece em vós (v.14). Em contraste ao estado indefeso de uma criança, os jovens entram na classificação de quem já sabe lutar e vencer. Não é à toa que João repete duas vezes: Tendes vencido o Maligno (v.13,14).

Estamos em guerra contínua. Diferentemente dos santos do Antigo Testamento, não lutamos contra a carne e o sangue, mas contra forças espirituais das trevas. Os jovens espirituais estão aptos a participar e a vencer esse tipo de batalha, assim como os jovens naturais podem ser convocados para a guerra.

Acerca da realidade da guerra espiritual, o apóstolo Paulo escreveu aos efésios:

Quanto ao mais, sede fortalecidos no Senhor e na força do seu poder. Revesti-vos de toda a armadura de Deus, para poderdes ficar firmes contra as ciladas do diabo; porque a nossa luta não é contra o sangue e a carne, e sim contra os principados e potestades, contra os dominadores deste mundo tenebroso, contra as forças espirituais do mal, nas regiões celestes. Portanto, tomai toda a armadura de Deus, para que possais resistir no dia mau e, depois de terdes vencido tudo, permanecer inabaláveis. Estai, pois, firmes, cingindo-vos com a verdade e vestindo-vos da couraça da justiça. Calçai os pés com a preparação do evangelho da paz; embraçando sempre o escudo da fé, com o qual podereis apagar todos os dardos inflamados do Maligno. Tomai também o capacete da salvação e a espada do Espírito, que é a palavra de Deus; com toda oração e súplica, orando em todo tempo no Espírito e para isto vigiando com toda perseverança e súplica por todos os santos.

Efésios 6.10-18

Isso significa que há possibilidade de batalhas, tempestades e adversidades mais intensas na juventude espiritual — simplesmente porque já há força e vigor suficientes para vencer. Muitos bons soldados de Cristo são forjados nessa fase.

Não estão em tempo de abraçar responsabilidades como a de reprodução, mas pode-se dizer que estão em treinamento não só teórico, mas também prático.

ADULTO

Por pura lógica, podemos trabalhar o extremo oposto das características próprias de bebês, crianças (ou meninos) e jovens ao destrinchar o comportamento esperado de um adulto.

Autonomia

Adultos são muito mais autônomos que bebês — dependentes em tudo —, meninos e, também, jovens. Não os classifico como independentes, pois o adulto sempre será, no mínimo, interdependente; mas a capacidade de sobrevivência já se manifestou.

Não creio que exista o ponto no qual ser cuidado por alguém se torne desnecessário. Entretanto, na fase adulta, há autonomia e disposição para servir em níveis incomparáveis às demais etapas de crescimento. Além de um senso mais apurado de responsabilidade consigo mesmo, já há capacidade para cuidar de outros.

Inocência

Irmãos, não sejais meninos no juízo; na malícia, sim, sede crianças; quanto ao juízo, sede homens amadurecidos.

1 Coríntios 14.20

A inocência é uma marca a ser conservada enquanto crescemos. O apóstolo orienta-nos a preservar essa característica de criança enquanto nos comportamos como adultos em outras áreas. Trata-se de uma marca que não deveria mudar com o crescimento.

Acrescento a esse versículo uma afirmação de Hagin:

Embora a inocência seja típica da etapa da primeira infância do cristianismo, é uma característica que nunca devemos deixar para trás em nosso processo de crescimento. Devemos manter esse estado de inocência; caso contrário, cairemos na condenação do diabo e seremos derrotados na vida espiritual.

Fomos justificados em Cristo Jesus. Nossos pecados foram perdoados, e a culpa foi removida. A malícia e o pecado deixaram de reinar em nossa vida. No entanto, a advertência bíblica é clara: Não vos amoldeis às paixões que tínheis anteriormente na vossa ignorância (1 Pe 1.14). Manter-se puro não é apenas um desafio; é uma ordenança do Senhor. E não permitir que a malícia de outrora retorne é nossa responsabilidade. Nas palavras do autor da carta aos hebreus:

Cuidado, irmãos, para que nenhum de vocês tenha coração perverso e incrédulo, que se afaste do Deus vivo. Ao contrário, encorajem-se uns aos outros todos os dias, durante o tempo que se chama “hoje”, de modo que nenhum de vocês seja endurecido pelo engano do pecado, pois passamos a ser participantes de Cristo, desde que, de fato, nos apeguemos até o fim à confiança que tivemos no princípio.

Hebreus 3.12-14 NVI

Paciência

Bebê se irrita fácil. Em contrapartida, o adulto espiritual deveria ter a capacidade de não se irritar, até mesmo porque o oposto — a paz — é fruto do Espírito (Gl 5.22). Logo, adulto não deveria ser carnal nesse ponto.

Veja como Romanos 12.12 fala dessa característica de um adulto: Sede pacientes na tribulação. Já em Hebreus, vemos que são os pacientes que herdam as promessas: E assim, depois de esperar com paciência, obteve Abraão a promessa (Hb 6.15).

Descobri nas Escrituras que cada tipo de pessoa merece, de acordo com seu comportamento, um tipo específico de tratamento. Observe o que Paulo ensinou aos tessalonicenses:

Irmãos, pedimos que advirtam os indisciplinados. Encorajem os desanimados. Ajudem os fracos. Sejam pacientes com todos.

1 Tessalonicenses 5.14 NVT

De acordo com a instrução do apóstolo, os indisciplinados (ou insubordinados) precisam de advertência; os desanimados, de encorajamento; já os fracos, de ajuda ou amparo. Às vezes, confundem-se os papéis. Já vi líderes consolando os insubordinados e admoestando os desanimados e fracos. Isso está fora do padrão das Escrituras! Cada um deve ter o tratamento que sua condição exige. O único conselho que serve para todos, independentemente do comportamento, é a paciência. Paulo recomenda: Sejam pacientes com todos.

Os maduros sabem discernir não só o trato adequado a cada tipo de comportamento, mas também sabem ser pacientes para com todos. Eles se destacam principalmente no meio de um ambiente de intrigas, pois conseguem portar-se de forma distinta. Como disse Paulo aos coríntios: Porque até mesmo importa que haja partidos entre vós, para que também os aprovados se tornem conhecidos em vosso meio (1 Co 11.19). Isso mostra que uma das formas de descobrir quem são os maduros é vê-los em meio a intrigas e perceber quem tem uma postura equilibrada, correta — inclusive, expressando paciência para com os imaturos.

Constância

Em contraposição à inconstância dos imaturos, estabilidade e constância são marcas de maturidade. Paulo esbanjava essa qualidade e a tinha de sobra, de acordo com os relatos de seu ministério. Ele era “imparável”, mesmo diante das piores circunstâncias:

E, agora, constrangido em meu espírito, vou para Jerusalém, não sabendo o que ali me acontecerá, senão que o Espírito Santo, de cidade em cidade, me assegura que me esperam cadeias e tribulações. Porém em nada considero a vida preciosa para mim mesmo, contanto que complete a minha carreira e o ministério que recebi do Senhor Jesus para testemunhar o evangelho da graça de Deus.

Atos 20.22-24

A vida de Paulo não era baseada no que ele enfrentava, tampouco nos sentimentos que o ambiente gerava, mas na solidez de um relacionamento com um Deus que ele conhecia muito bem, a ponto de afirmar: Sei em quem tenho crido (2 Tm 1.12).

Enquanto alguns, diante de circunstâncias negativas, desanimam (Mt 13.20,21), outros, maduros como Paulo, demonstram constância:

Digo isto, não por causa da pobreza, porque aprendi a viver contente em toda e qualquer situação. Tanto sei estar humilhado como também ser honrado; de tudo e em todas as circunstâncias, já tenho experiência, tanto de fartura como de fome; assim de abundância como de escassez; tudo posso naquele que me fortalece.

Filipenses 4.11-13

Nem tempestades, nem ventos de doutrina, nem gritos de elogio, nem sussurros de críticas. Nada derruba o maduro — ele aprendeu a manter os pés sobre uma Rocha inabalável. É importante lembrar que ser maduro não é sinônimo de nunca ter-se deixado levar ou abalar. A diferença é que não combina mais maturidade com montanha-russa. Não é mais comum o vaivém na vida devocional, nos aceites emocionais, nos ímpetos doutrinários. Há muito mais equilíbrio.

Sem tropeço no falar

Crianças são falantes, tagarelas. Já adultos não tropeçam no falar. Os conselhos bíblicos sobre esse tema, ainda que abundantes no livro de Provérbios, encontram-se por toda a Bíblia.

Tiago, irmão do Senhor, afirmou: Porque todos tropeçamos em muitas coisas. Se alguém não tropeça no falar, é perfeito varão, capaz de refrear também todo o corpo (Tg 3.2). A Tradução Brasileira optou por é um homem perfeito. A palavra grega traduzida como perfeito é teleios, que, entre outras coisas, significa: “levado a seu fim, finalizado; que não carece de nada necessário para estar completo; perfeito; integridade e virtude humana consumadas; adulto, maduro, maior idade”. Basicamente, trata a língua como o órgão que, dominado, denuncia um dono maduro, praticamente “perfeito”. Não há como diminuir o impacto dessa declaração.

Conforme Tiago alerta, a língua é fogo. O que acontece com os maduros é uma capacidade de controlar, segurar. Já não cabem mais as desculpas “falo mesmo”, “sou sincero demais”.

Altruísmo

Antes de dizer aos filipenses que deveriam ter o mesmo sentimento que houve também em Cristo, referência de “varão perfeito”, Paulo afirma:

Não tenha cada um em vista o que é propriamente seu, senão também cada qual o que é dos outros.

Filipenses 2.4

Já aos coríntios, o apóstolo destaca que, em vez de brigar por seu próprio direito, aqueles supostos maduros deveriam agir diferente. Ele os questiona:

O só existir entre vós demandas já é completa derrota para vós outros. Por que não sofreis, antes, a injustiça? Por que não sofreis, antes, o dano? Mas vós mesmos fazeis a injustiça e fazeis o dano, e isto aos próprios irmãos!

1 Coríntios 6.7,8

É indício de maturidade saber realmente considerar o que é do outro, com olhos não fixos apenas no próprio umbigo. Os maduros preferem perder a brigar. Optam por dar a outra face, andar a segunda milha e entregar a capa com a túnica.

Capacidade de reprodução

Por fim, uma diferença básica, estabelecida pelo apóstolo João, entre os jovens e os adultos, é a paternidade ou capacidade de reprodução.

Vimos que a palavra “pai”, traduzida do grego pater (πατηρ), refere-se a um “gerador ou antepassado masculino; antepassado mais próximo: pai da natureza corporal, pais naturais, tanto pai quanto mãe; o originador e transmissor de algo; os autores de uma família ou sociedade”. Todos esses significados indicam alguém que cresceu espiritualmente e tornou-se maduro o suficiente para gerar novos filhos na fé. Fala de quem alcançou a fase adulta, que é marcada, entre outras características, por reproduzir.

Porque, ainda que tivésseis milhares de preceptores em Cristo, não teríeis, contudo, muitos pais; pois eu, pelo evangelho, vos gerei em Cristo Jesus.

1 Coríntios 4.15

Essa terminologia, de paternidade espiritual, de gerar filhos, era comumente empregada por Paulo. Veja, por exemplo, o que ele declarou em sua carta a Filemom: Solicito-te em favor de meu filho Onésimo, que gerei entre algemas (Fm 1.10).

Quando adultos, aquilo que semeamos na caminhada é colhido não só por nós mesmos, mas também por outros. O que nos encheu extravasa. Frutos e folhas de nossa árvore são alimento e cura para gerações. Suportamos a responsabilidade de cuidar de outros, porque já caminhamos muitos dos passos que eles estão começando a trilhar.

Sabemos como é andar com sapatos novos. Nossa vida tornou-se farta de exemplos de provação e vitória para encorajar aqueles que ainda são sufocados pelos espinhos. Compreendemos mais e, certamente, importamo-nos mais.

Os maduros entendem que a vida é muito maior que eles próprios e que, apesar de ainda falhos, podem reproduzir a natureza perfeita do Mestre — Aquele que já caminhou muitas milhas ao lado deles.

Acima de tudo, a fase adulta é marcada por quão parecidos tornamo-nos com Jesus.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Olhando para o seu jeito de falar, sentir e pensar, que sinais revelam em qual fase de crescimento espiritual você realmente se encontra?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que "coisas próprias de menino" o Senhor está pedindo que você abandone para de fato amadurecer na fé?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como você reage a divergências e contrariedades, e o que isso revela sobre o seu nível de maturidade espiritual?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Estatura de Cristo$t$, 9,
$conteudo$D

“A conformidade com o mundo não pode ser vencida por coisa alguma, a não ser pela conformidade com Jesus.”

(Andrew Murray)

eus deseja que Seus filhos cresçam. Esse é o Seu propósito, claramente definido nas Escrituras. Além disso, é necessário ter em mente que não é o homem que define até que ponto ele próprio deve crescer. Há um alvo estabelecido pelo próprio Senhor, de todo filho persegui-lo até o fim:

E ele designou alguns para apóstolos, outros para profetas, outros para evangelistas, e outros para pastores e mestres, com o fim de preparar os santos para a obra do ministério, para que o corpo de Cristo seja edificado, até que todos alcancemos a unidade da fé e do conhecimento do Filho de Deus, e cheguemos à maturidade, atingindo a medida da plenitude de Cristo. O propósito é que não sejamos mais como crianças, levados de um lado para outro pelas ondas, nem jogados para cá e para lá por todo vento de doutrina e pela astúcia e esperteza de homens que induzem ao erro. Antes, seguindo a verdade em amor, cresçamos em tudo naquele que é a cabeça, Cristo.

Efésios 4.11-15 NVI

O alvo é a maturidade, o completo crescimento. Paulo define isso com as seguintes palavras: E cheguemos à maturidade, atingindo a medida da plenitude de Cristo. O objetivo final, portanto, é alcançar a “medida” de Cristo. A maioria das versões bíblicas inclui a palavra estatura juntamente à medida. A Nova Versão Transformadora optou por traduzir assim: Chegando à completa medida da estatura de Cristo. Qual é essa medida da estatura de Cristo?

A palavra estatura, nos manuscritos originais, em grego, é helikia (ηλικια). O significado é: “idade, tempo de vida, prazo ou duração da vida, idade adulta, maturidade”. Em sua definição, Strong ainda acrescenta “idade apropriada para qualquer coisa, estatura, de estatura perfeita e graciosa”, além do sentido metafórico: “um estágio próprio alcançado para algo”. Devemos aliar todas essas definições ao fato de que a estatura referida é a do próprio Cristo, ou seja, a medida de maturidade é, simplesmente, aquela que nosso Senhor Jesus atingiu.

Sendo assim, é nosso propósito chegar à mesma estatura espiritual que Cristo alcançou. Não é mera interpretação de versículos ou busca por precisão de tradução das palavras gregas. Trata-se de doutrina bíblica, claramente fundamentada nas Escrituras — e deveria ser muito mais ensinada do que tem sido atualmente.

PROPÓSITO DE EXISTÊNCIA

Gosto de refletir sobre o propósito divino para nossa vida. Quem não entender o alvo provavelmente terá dificuldades de alcançá-lo. É necessário saber para que o Pai celestial criou o homem e o que Ele espera de cada um de Seus filhos. Sem essa clareza, como saber que direção tomar na vida espiritual?

Observe a declaração de Paulo aos crentes romanos:

Porquanto aos que de antemão conheceu, também os predestinou para serem conformes à imagem de seu Filho, a fim de que ele seja o primogênito entre muitos irmãos.

Romanos 8.29

O texto fala tanto da Sua presciência divina como de Seu propósito. Predestinar significa destinar de antemão. Portanto, temos aqui o alvo estabelecido pelo Criador: que nos tornássemos conformes (com a forma de, amoldados) à imagem de seu Filho.

Cristo não é apenas o referencial de conduta, mas o alvo. Devemos tornar-nos parecidos com Ele, esse é o objetivo. Crescer até a Sua estatura perfeita — a estatura de Jesus.

Consideremos outros textos bíblicos que enfatizavam as mesmas verdades:

Porquanto para isto mesmo fostes chamados, pois que também Cristo sofreu em vosso lugar, deixando-vos exemplo para seguirdes os seus passos.

1 Pedro 2.21

Aquele que diz que permanece nele, esse deve também andar assim como ele andou.

1 João 2.6

O ensino apostólico era enfático: cada cristão deveria reproduzir a natureza e o comportamento do Senhor Jesus. Deveria ser um imitador de Cristo. Além de Pedro e João, Paulo também ensinava isso às igrejas: Sede meus imitadores, como também eu sou de Cristo (1 Co 11.1).

O curioso, para mim, é como uma ênfase bíblica pode ser tão ignorada em nossos púlpitos. Não desmereço a diversidade de assuntos necessários em nossos cultos, nem advogo a ideia de que deveríamos falar apenas acerca da maturidade de Cristo como alvo de nossa existência. No entanto, entre só falar nisso e quase nunca tocar no assunto, há uma enorme diferença!

Aos coríntios, Paulo aborda o plano inicial de Deus: a queda e o retorno ao propósito. A queda interrompeu temporariamente o plano, e o retorno foi possível por intermédio de Cristo Jesus. Atentar para o quadro todo ajuda a entender melhor a ideia divina:

Pois assim está escrito: O primeiro homem, Adão, foi feito alma vivente. O último Adão, porém, é espírito vivificante. Mas não é primeiro o espiritual, e sim o natural; depois, o espiritual. O primeiro homem, formado da terra, é terreno; o segundo homem é do céu. Como foi o primeiro homem, o terreno, tais são também os demais homens terrenos; e, como é o homem celestial, tais também os celestiais. E, assim como trouxemos a imagem do que é terreno, devemos trazer também a imagem do celestial.

1 Coríntios 15.45-49

Observe o uso, por parte do apóstolo, dos termos primeiro e último Adão. Por que Jesus é chamado de último Adão? O que Ele e o homem estabelecido por Deus no jardim do Éden têm em comum?

Obviamente, não é o pecado. As Escrituras são explícitas sobre a permanência de Jesus em santidade: Foi ele tentado em todas as coisas, à nossa semelhança, mas sem pecado (Hb 4.15).

Para saber o que há em comum entre os dois, precisamos entender o propósito da criação do primeiro homem. Adão foi formado para ser o cabeça de toda uma raça, uma matriz reprodutora. Sua missão era reproduzir segundo a sua própria espécie, exatamente como plantas e animais. Qual natureza, especificamente, seria reproduzida? A do próprio Deus!

Criou Deus, pois, o homem à sua imagem, à imagem de Deus o criou; homem e mulher os criou.

Gênesis 1.27

O problema se instalou após a queda, quando a natureza divina foi comprometida pelo pecado e suas consequências. A partir desse momento, a qualidade da “matriz reprodutora” foi comprometida:

Portanto, assim como por um só homem entrou o pecado no mundo, e pelo pecado, a morte, assim também a morte passou a todos os homens, porque todos pecaram.

Romanos 5.12

Como a morte, consequência do erro de um homem, passou a toda humanidade? Adão era um cabeça de raça, com o poder de reproduzir conforme a sua espécie — e reproduziu morte.

Qual o ponto em comum com Cristo, então? Jesus foi enviado pelo Pai celeste para ser um segundo cabeça de raça. Sua vinda foi a retomada do plano inicial, o conserto daquilo que fora comprometido ainda no começo da humanidade. Diferentemente do primeiro Adão, o último não falhou. Jesus nasceu sem pecado e viveu em completa vitória sobre ele.

Se, por um lado, o ponto comum entre Jesus e Adão é o fato de serem cabeças de raça, o contraste é a natureza que poderiam reproduzir. Por isso, Paulo afirmou: O primeiro homem, formado da terra, é terreno; o segundo homem é do céu. Como foi o primeiro homem, o terreno, tais são também os demais homens terrenos; e, como é o homem celestial, tais também os celestiais (1 Co 15.47,48).

Essa é a razão da explicação que Jesus deu a Nicodemos sobre a necessidade do novo nascimento:

O que é nascido da carne é carne; e o que é nascido do Espírito é espírito. Não te admires de eu te dizer: importa- vos nascer de novo.

João 3.6,7

Ao nascer da carne, ou seja, naturalmente, cada ser humano herdou a natureza do primeiro Adão. A única forma de deixar de reproduzir a primeira matriz é ser gerado de novo; mas esse novo nascimento não se dá na dimensão natural, e sim na espiritual. Quando Cristo disse que quem nasce do Espírito é espírito, não definiu apenas quem é o responsável pela nova criação, mas a natureza desse acontecimento: ele é espiritual.

Qual a razão para um novo nascimento? O objetivo de Deus não é apenas que escapemos da condenação eterna do inferno, e sim que cumpramos o propósito original: ser semelhantes a Jesus. Por isso, o apóstolo Paulo declarou: E, assim como trouxemos a imagem do que é terreno, devemos trazer também a imagem do celestial (1 Co 15.49).

O fato de tornarmo-nos parecidos com Cristo não é opcional. Não há duas categorias de cristãos; os que desejam ser semelhantes ao seu Senhor e os que não. Todos fomos chamados a imitá-lo! O propósito de nossa existência é ser como Ele é.

Porém, isso não se dá de forma instantânea — envolve um processo. Então, além de desejar crescer até a estatura do Varão Perfeito, é de suma importância compreender como fazê-lo.

FORMAÇÃO DE CRISTO EM NÓS

Na epístola aos gálatas, Paulo faz referência a tal processo. Sua afirmação é muito esclarecedora:

Meus filhos, por quem, de novo, sofro as dores de parto, até ser Cristo formado em vós.

Gálatas 4.19

Primeiro, ele chama os cristãos de filhos, o que inevitavelmente remete ao conceito de “ser gerado”. Aliás, em 1 Coríntios 4.15, ele havia dito: Porque, ainda que tivésseis milhares de preceptores em Cristo, não teríeis, contudo, muitos pais; pois eu, pelo evangelho, vos gerei em Cristo Jesus.

Na sequência, o apóstolo usa a figura “dores de parto”, que ainda é parte da ideia de “gerar”. Aqui, encontramos um aspecto interessante. Apesar de usar o termo gerei, com conjugação passada, Paulo fala de dores de parto, o que indica que o processo de “gerar” ainda não estava concluído. E quando termina? A resposta vem em seguida: até ser Cristo formado em vós. O termo até revela exatamente quando o processo acaba.

Não creio que o apóstolo quis dizer que nenhum de nós foi, ainda, gerado espiritualmente, ou que só seremos quando o processo chegar ao fim. Acredito que sua intenção foi acentuar o fato de que seu próprio trabalho não terminaria enquanto Cristo não fosse completamente formado naqueles discípulos. Paulo lembrava os gálatas de que ainda não haviam alcançado o que deveriam. Em outras palavras, o apóstolo enfatiza que há um processo em curso: a formação de Cristo no cristão.

Uma grande indicação bíblica de que há, sim, um processo subsequente à conversão é percebida pelo uso da palavra formado. O que significa ser Cristo formado em nós? Com certeza, não quer dizer que, ao fazer morada em nossos corações, Jesus vem como o menino nascido na manjedoura, que precisaria, então, crescer dentro de nós! O sentido de formado remete a desenvolvimento. De quem? De Cristo. Em quem? Em nós. Isso significa desenvolver, em nossa forma de viver, semelhanças com Jesus. Quer dizer que existe, portanto, um processo de transformação de quem somos em quem Ele é.

Aliás, a própria expressão Cristo em nós deveria ser mais bem entendida pelos cristãos. Observe o que Paulo declarou aos crentes de Colossos:

O mistério que estivera oculto dos séculos e das gerações; agora, todavia, se manifestou aos seus santos; aos quais Deus quis dar a conhecer qual seja a riqueza da glória deste mistério entre os gentios, isto é, Cristo em vós, a esperança da glória.

Colossenses 1.26,27

A esperança de viver a expressão plena da glória de Deus está relacionada à realidade de Cristo em nós — ser como Ele é libera a glória divina.

O ensino bíblico também revela que é o Espírito Santo quem possui a missão de transformar-nos na imagem de Jesus. Essa transformação é diretamente conectada ao crescimento da glória em nossa vida:

E todos nós, com o rosto desvendado, contemplando, como por espelho, a glória do Senhor, somos transformados, de glória em glória, na sua própria imagem, como pelo Senhor, o Espírito.

2 Coríntios 3.18

A expressão de glória em glória novamente fortalece a compreensão de que existe um processo de crescimento. O propósito final é a nossa transformação à semelhança de Cristo. O agente executor da obra é o Espírito Santo. Um dos significados da palavra glória é “brilho, esplendor”. No caso da transformação de glória em glória, entendo que a Bíblia está falando a respeito da reprodução do mesmo brilho e esplendor de Jesus. Ele, que é a luz do mundo, disse que nós também somos a luz do mundo. Podemos dizer que Cristo é como o sol, tem luz própria, e nós somos como a lua e refletimos o brilho dele.

Ainda quero apresentar mais uma peça ao quebra-cabeça para ajudar a completar o quadro. Observe a afirmação de Paulo aos crentes de Éfeso:

Para que, segundo a riqueza da sua glória, vos conceda que sejais fortalecidos com poder, mediante o seu Espírito no homem interior; e, assim, habite Cristo no vosso coração, pela fé, estando vós arraigados e alicerçados em amor.

Efésios 3.16,17

Normalmente, nossa ideia de “Cristo habitar em nosso coração” remete unicamente à experiência de conversão. Não nego esse aspecto da vida cristã. O próprio Jesus disse que Ele e o Pai fariam morada em nós (Jo 14.23). Porém, não é acerca disso que Paulo trata com os efésios.

O apóstolo se dirige a crentes, a pessoas convertidas, quando usa a frase habite Cristo no vosso coração. Isso se comprova desde o início da carta, endereçada aos santos que vivem em Éfeso, e fiéis em Cristo Jesus (Ef 1.1), que já haviam recebido e crido no Evangelho: Depois que ouvistes a palavra da verdade, o evangelho da vossa salvação, tendo nele também crido (v. 13). Paulo ainda confirma o testemunho de fé de seus destinatários: Tendo ouvido a fé que há entre vós no Senhor Jesus (v. 15).

É para esses convertidos — em cujos corações o Senhor Jesus já teria entrado — que o apóstolo inicia a sentença e, assim, habite Cristo no vosso coração. Ele poderia ter usado “dessa maneira” para introduzir a ideia. Fato é que, antes de falar da consequência, ele lembra de uma causa.

A Nova Versão Internacional traduziu assim: Para que Cristo habite no coração de vocês. A Nova Versão Transformadora optou por: Então Cristo habitará em seu coração. A aplicação prática da habitação de Cristo em nós está associada ao que Paulo havia declarado antes. O raciocínio anterior não pode ser ignorado.

Vejamos o que foi registrado em Efésios 3.16: Segundo a riqueza da sua glória, vos conceda que sejais fortalecidos com poder, mediante o seu Espírito no homem interior. As expressões glória, poder, Espírito e homem interior são chaves e devem ser compreendidas em conjunto. Elas podem ser explicadas da seguinte forma: a missão do Espírito é fazer-nos crescer em glória (2 Co 3.18), e, para isso, Ele manifesta o Seu poder transformador em nosso homem interior.

Assim sendo, nota-se que a expressão habite Cristo em vós aparece depois de o autor ressaltar uma transformação. Caráter, natureza e comportamento divinos sendo inseridos no estilo de vida daqueles homens — dessa forma, habitaria Cristo neles. É mais do que se tornar habitação de Jesus no ato da conversão; trata-se de reproduzirmos Sua imagem em nossa própria vida.

Essa transformação depende do poder do Espírito Santo. É fundamental estar sujeito à obra do Espírito no íntimo. É Ele quem tem a missão e o poder de transformar o homem de glória em glória na imagem do Senhor Jesus. Todavia, Sua obra não é automática, tampouco unilateral — requer cooperação e entrega de nossa parte. Se quisermos manifestar o fruto do Espírito, precisamos sujeitar nossa carne à cruz:

Mas o fruto do Espírito é: amor, alegria, paz, longanimidade, benignidade, bondade, fidelidade, mansidão, domínio próprio. Contra estas coisas não há lei. E os que são de Cristo Jesus crucificaram a carne, com as suas paixões e concupiscências.

Gálatas 5.22-24

Paulo decretou serem coisas inseparáveis: só quem crucifica a carne, com suas paixões e desejos, pode viver o domínio e a transformação do Espírito Santo!

Diferentemente daquilo em que alguns acreditam, o Espírito Santo nunca impõe Seu agir. Se não fosse assim, Estêvão não teria dito aos judeus, pouco antes de seu martírio: Vós sempre resistis ao Espírito Santo (At 7.51). Se fosse por imposição, como alguém poderia resistir ao Espírito de Deus?

A obra divina de transformação na imagem de Jesus não é automática nem unilateral, requer nossa participação ativa de crucificar a carne para que o poder do Espírito aja em nosso interior.

Tendo isso em vista, o que falta para vivermos o crescimento até a medida da estatura de Cristo? Penso que a chave é o entendimento correto — tanto do alvo a ser alcançado como da nossa responsabilidade no processo. Por isso, é essencial que a Igreja pregue e ensine mais acerca dessas verdades.

Antes de prosseguir, vamos falar de impossibilidade. Deus nunca pediria algo ao homem que não fosse possível; de outra forma, Ele negaria Sua própria natureza, que é justa. Se o Senhor estabeleceu, como alvo, que você e eu alcançaremos a mesma medida de maturidade que Cristo alcançou, se a Bíblia aponta que é justamente esse o propósito de nossa existência, é porque isso é possível — por mais que o diabo queira, a qualquer custo, que acreditemos na impossibilidade. Isso porque, se não crermos, ele terá o suficiente para limitar nosso crescimento.

Calma, você não luta sozinho. Lembre que o poder transformador pertence ao Espírito, e dele é a missão de transformar. Também saiba que foi esse mesmo Espírito que capacitou Jesus a vencer o pecado enquanto homem — sim, o mesmo Espírito que está, hoje, em você.

A você cabe a responsabilidade de crucificar a carne para liberar o agir de Deus. A você cabe estar sujeito, dia após dia, a esse agir. O poder transformador do Espírito o conduzirá fase por fase, até que esteja apto a desfrutar da herança reservada aos maduros.

APRENDER COM CRISTO

Há uma afirmação na carta aos efésios que penso ser reveladora. Paulo fala da necessidade de o cristão abandonar o velho comportamento, em contraste à forma como se ensinava:

Isto, portanto, digo e no Senhor testifico que não mais andeis como também andam os gentios, na vaidade dos seus próprios pensamentos, obscurecidos de entendimento, alheios à vida de Deus por causa da ignorância em que vivem, pela dureza do seu coração, os quais, tendo-se tornado insensíveis, se entregaram à dissolução para, com avidez, cometerem toda sorte de impureza. Mas não foi assim que aprendestes a Cristo, se é que, de fato, o tendes ouvido e nele fostes instruídos, segundo é a verdade em Jesus, no sentido de que, quanto ao trato passado, vos despojeis do velho homem, que se corrompe segundo as concupiscências do engano, e vos renoveis no espírito do vosso entendimento, e vos revistais do novo homem, criado segundo Deus, em justiça e retidão procedentes da verdade.

Efésios 4.17-24

Observe a frase não foi assim que aprendestes a Cristo. Os apóstolos não ensinavam apenas a respeito de Cristo, mas ensinavam a Cristo. Há uma diferença entre uma coisa e outra. Falar acerca de Jesus gera informação sobre quem Ele é. Ensinar a Cristo é orientar cada cristão a reproduzir a imagem e o comportamento de seu Senhor.

Um livro que li ainda na adolescência e me ajudou muito foi o clássico de Charles Sheldon, Em Seus Passos, o Que Faria Jesus?. Escrito em 1896, nos Estados Unidos, apresenta uma história fictícia em que Henry Maxwell, pastor da Primeira Igreja da cidade de Raymond, entra em crise após o dia em que recebe, em sua igreja, um homem pobre e necessitado. O episódio leva Maxwell a questionar valores e a colocar seu modo de vida e suas prioridades em perspectiva. Surge diante daquele pastor a seguinte questão: “O que Jesus faria?”.

A partir disso, em seus sermões, ele propõe aos fiéis que se comprometam por um ano a não fazer nada sem antes questionar o que Jesus faria na mesma situação. O desenrolar da história descreve como toda uma cidade foi revolucionada a partir daquela simples reflexão antes de agir. A evidente mudança de comportamento de cada um daqueles cristãos chacoalhou o município inteiro. Ainda me pergunto qual seria o impacto na sociedade de hoje se cada um de nós, de fato, passasse a viver e a agir como Jesus.

O romance de Sheldon, mesmo não sendo real, não é diferente da forma como a Igreja trabalhava nos tempos apostólicos. Ela ensinava sobre Cristo! Orientava os novos discípulos a andar nos passos de seu Senhor (1 Pe 2.21). Pregava sobre andar como Ele andou (1 Jo 2.6). Todos deveriam imitar Cristo (1 Ts 1.6).

E os apóstolos aprenderam com quem? Com o próprio Jesus. Ele deu-lhes ensinamentos e demonstrou ser o padrão, o referencial. Depois de lavar os pés dos discípulos, dando uma aula prática de humildade e serviço, declarou:

Ora, se eu, sendo o Senhor e o Mestre, vos lavei os pés, também vós deveis lavar os pés uns dos outros. Porque eu vos dei o exemplo, para que, como eu vos fiz, façais vós também. Em verdade, em verdade vos digo que o servo não é maior do que seu senhor, nem o enviado, maior do que aquele que o enviou. Ora, se sabeis estas coisas, bem-aventurados sois se as praticardes.

João 13.14-17

Jesus é o padrão e o modelo. Ele quer transferir Seu estilo de vida e comportamento para nossa vida! Foi nosso Senhor quem disse: Aprendei de mim, porque sou manso e humilde de coração (Mt 11.29).

Que Ele seja nosso alvo, nossa meta de crescimento. Que a reprodução de Sua imagem e de Seu caráter encontre lugar em nosso viver. Que, por caminhar tão perto, tornemo-nos como Ele é!$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você tem buscado a estatura de Cristo como alvo do seu crescimento, ou tem definido por conta própria até onde quer amadurecer?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$De que maneira você ainda é "levado de um lado para outro" por ventos de doutrina, e o que isso revela sobre o quanto precisa crescer?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O que significaria, na prática, seguir a verdade em amor e crescer em tudo naquele que é a cabeça, Cristo?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Desconfortos necessários$t$, 10,
$conteudo$N

“A sabedoria amadurece por meio do sofrimento.”

(Blaise Pascal)

o capítulo 3, vimos que a mentalidade atual de formação familiar está equivocada, o que gera problemas maiores do que podemos mensurar. Uma nova geração mima seus filhos e trata-os como sanguessugas, que vivem para sugar a família, e não para colaborar com ela. Embora toda generalização nos faça falhar com alguns, hoje em dia, o senso comum sobre criação de filhos é esse.

Distanciam-se — e muito — de nós aqueles dias em que os filhos levantavam cedo para tirar o leite da vaca, alimentar os animais e ajudar os pais a manter ativa a provisão do lar. Sei que os tempos mudaram e não prego um retorno à roça ou ao estilo de vida de antigamente. O que pretendo mostrar é que, mesmo em um mundo urbano e altamente tecnológico como o que vivemos, a necessidade de transmitir aos filhos responsabilidades como parte da educação não deveria ter mudado.

Não importa se a família é abastada o suficiente para ter inúmeros empregados em casa, todo filho e filha deveriam ser submetidos às tarefas domésticas! Quando Paulo declarou que o filho, enquanto menor, em nada difere de um escravo (Gl 4.1,2), não se referia apenas à posição de não poder acessar a herança. Os filhos também eram incumbidos de responsabilidades e, assim como os servos, trabalhavam para seus pais. Na parábola do filho pródigo, mesmo tendo muitos servos, vemos que aquele pai delegava trabalho aos seus filhos (Lc 15.29).

Aliás, esse exemplo não é incomum nas Escrituras. O próprio Jesus cita em outra de Suas parábolas:

E que vos parece? Um homem tinha dois filhos. Chegando- se ao primeiro, disse: Filho, vai hoje trabalhar na vinha. Ele respondeu: Sim, senhor; porém não foi. Dirigindo-se ao segundo, disse-lhe a mesma coisa. Mas este respondeu: Não quero; depois, arrependido, foi. Qual dos dois fez a vontade do pai? Disseram: O segundo. Declarou-lhes Jesus: Em verdade vos digo que publicanos e meretrizes vos precedem no reino de Deus.

Mateus 21.28-31

O trabalho engrandece, aperfeiçoa, ajuda a desenvolver não apenas habilidades, como também maturidade. Entretanto, pais que poupam seus filhos do desconforto de tarefas domésticas, ou mesmo de trabalharem cedo, estão, na verdade, eximindo-os de crescer. Que tipo de esposa será uma filha que cresceu sem nunca ter lavado a louça ou cozinhado alguma coisa? A mulher virtuosa de Provérbios 31 não vai “possuí-la” no dia do casamento! Requer treinamento, ensino dos pais, exercício durante a vida de solteira.

Da mesma forma, como um garoto que nunca colocou a mão na massa e cresceu só jogando videogame se tornará um trabalhador dedicado, da noite para o dia? Ele se transformará em passe de mágica, simplesmente porque casou? Claro que não! Esse tipo de habilidade se desenvolve e, para isso, demanda tempo e treinamento.

Todo crescimento, avanço e progresso proporcionarão o que quero denominar de desconfortos necessários. Mesmo na vida espiritual. Muitas vezes, dores e tristeza precedem e pavimentam a chegada de alegria e da realização. Observe esta declaração de Jesus:

Em verdade, em verdade eu vos digo que chorareis e vos lamentareis, e o mundo se alegrará; vós ficareis tristes, mas a vossa tristeza se converterá em alegria. A mulher, quando está para dar à luz, tem tristeza, porque a sua hora é chegada; mas, depois de nascido o menino, já não se lembra da aflição, pelo prazer que tem de ter nascido ao mundo um homem. Assim também agora vós tendes tristeza; mas outra vez vos verei; o vosso coração se alegrará, e a vossa alegria ninguém poderá tirar.

João 16.20-22

O Mestre falava de Sua partida, da dor e da tristeza que os discípulos teriam de enfrentar. Contudo, encorajava-os a atentar para aquilo que estava adiante, por vir. Como exemplo, cita a mulher quando entra em trabalho de parto e passa por um desconforto necessário para que o novo estágio de conquista e realização se concretize. Tal declaração não se limita somente àqueles discípulos, mas também aos nossos dias. Ela se encaixa em muitos aspectos e distintos momentos de nossa própria vida — e sempre se relacionará ao nosso aperfeiçoamento.

CORREÇÃO

Consideremos a questão da correção. É inegável que, inicialmente, ela não produz alegria ou bem- estar. Também é incontestável que, posteriormente, alegria e bem-estar surgirão como resultados da aplicação dela, por meio da permissão desse desconforto necessário ao crescimento dos filhos. Repare na instrução bíblica:

Toda disciplina, com efeito, no momento não parece ser motivo de alegria, mas de tristeza; ao depois, entretanto, produz fruto pacífico aos que têm sido por ela exercitados, fruto de justiça.

Hebreus 12.11

Observe que o propósito da correção, que é um ato de amor dos pais, é o aperfeiçoamento dos filhos. Vamos voltar alguns versículos para analisar o contexto:

E estais esquecidos da exortação que, como a filhos, discorre convosco: Filho meu, não menosprezes a correção que vem do Senhor, nem desmaies quando por ele és reprovado; porque o Senhor corrige a quem ama e açoita a todo filho a quem recebe. É para disciplina que perseverais (Deus vos trata como filhos); pois que filho há que o pai não corrige? Mas, se estais sem correção, de que todos se têm tornado participantes, logo, sois bastardos e não filhos. Além disso, tínhamos os nossos pais segundo a carne, que nos corrigiam, e os respeitávamos; não havemos de estar em muito maior submissão ao Pai espiritual e, então, viveremos? Pois eles nos corrigiam por pouco tempo, segundo melhor lhes parecia; Deus, porém, nos disciplina para aproveitamento, a fim de sermos participantes da sua santidade.

Hebreus 12.5-10

De que correção a Bíblia está falando? O texto apresenta um paralelo entre a correção dos pais terrenos e a do Pai celestial. Há dois níveis de correção: natural e espiritual; entretanto, a base de entendimento da correção espiritual é a natural. Assim como o pai terreno ama seus filhos a ponto de importar-se em corrigi-los para que cresçam, semelhantemente o Pai celestial ama Seus filhos a ponto de corrigi-los para que sejam participantes de Sua santidade.

Contudo, o que acontece quando os pais resolvem poupar seus filhos da disciplina? A Palavra de Deus revela as consequências naturais da negligência: filhos sem limites envergonharão seus pais e não crescerão em sabedoria ou maturidade.

A vara e a disciplina dão sabedoria, mas a criança entregue a si mesma vem a envergonhar a sua mãe. Quando os perversos se multiplicam, multiplicam-se as transgressões, mas os justos verão a ruína deles. Corrige o teu filho, e te dará descanso, dará delícias à tua alma.

Provérbios 29.15-17

A insensatez está ligada ao coração da criança, mas a vara da disciplina a livrará dela.

Provérbios 22.15 NVI

Além de sequelas e impactos na vida natural, ainda há consequências espirituais, fato que muitos pais ignoram. O questionamento a ser feito é: Se a pessoa não cresceu com disciplina e correção dos pais terrenos, como entenderá e aceitará a correção do Pai celestial?

Quando os pais poupam seus filhos do desconforto — mais que necessário — da correção, estão impedindo que eles cresçam natural e espiritualmente. Há toda uma geração de crentes mimados que não consegue entender ou mesmo aproveitar a correção de Deus. Detalhe: não é porque os pais terrenos foram omissos que o Pai celestial também o será. De modo algum!

Observe como Paulo aborda o desconforto da correção:

Porquanto, ainda que vos tenha contristado com a carta, não me arrependo; embora já me tenha arrependido (vejo que aquela carta vos contristou por breve tempo), agora, me alegro não porque fostes contristados, mas porque fostes contristados para arrependimento; pois fostes contristados segundo Deus, para que, de nossa parte, nenhum dano sofrêsseis. Porque a tristeza segundo Deus produz arrependimento para a salvação, que a ninguém traz pesar; mas a tristeza do mundo produz morte. Porque quanto cuidado não produziu isto mesmo em vós que, segundo Deus, fostes contristados! Que defesa, que indignação, que temor, que saudades, que zelo, que vindita! Em tudo destes prova de estardes inocentes neste assunto.

2 Coríntios 7.8-11

Este será sempre o efeito imediato da correção: tristeza. Nunca vi meus filhos festejarem porque foram corrigidos. Contudo, o efeito posterior da correção não pode ser ignorado — vi, em meus próprios filhos, o crescimento gerado pela repreensão. Assim também tenho visto, com o tempo, a gratidão deles pelo que aprenderam e pelo quanto cresceram, isso porque seus pais se importaram o suficiente a ponto de corrigi-los.

PROCESSOS NECESSÁRIOS

O amadurecimento não se dá sem tempo. Em contrapartida, só tempo não garante crescimento de ninguém, especialmente quando falamos dos aspectos emocional e espiritual. De qualquer forma, é necessário primeiro experimentar certos processos naturais, que possuem paralelo na dimensão espiritual.

Pais que poupam seus filhos do desconforto de responsabilidades, tarefas, trabalho e limites não estão contribuindo para o desenvolvimento deles. Pais precisam ser firmes e determinados a não mimar, nem poupar os filhos daquilo que precisam para crescer. Em minha casa, determinei que meus filhos, além de cumprirem tarefas domésticas, começassem a trabalhar cedo, ainda na adolescência. Assim como meu pai me ensinou, também transmiti o conceito de que não se trata apenas de ganhar e valorizar o próprio dinheiro, mas de aprender a cumprir compromissos, horários, responder aos chefes. O processo é mais importante que os afazeres em si.

Veja bem, Deus — nosso referencial de Pai — não poupa Seus filhos de processos que os ajudem a crescer. Confira:

Meus irmãos, tende por motivo de toda alegria o passardes por várias provações, sabendo que a provação da vossa fé, uma vez confirmada, produz perseverança. Ora, a perseverança deve ter ação completa, para que sejais perfeitos e íntegros, em nada deficientes.

Tiago 1.2-4

A palavra traduzida como perfeito é teleios (τελειος). O significado apontado por Strong é: “levado a seu fim, finalizado; que não carece de nada necessário para estar completo; aquilo que é perfeito”. Também aponta para a ideia de “integridade e virtude humana consumadas” e, ainda, era usada para descrever “homem, adulto, maduro, maior idade”. A Nova Versão Internacional optou por traduzir o efeito das provações em nossa vida assim: A fim de que vocês sejam maduros e íntegros, sem lhes faltar coisa alguma.

Em outras palavras, Tiago está dizendo que parte do processo para chegar à maturidade envolve passar por provações. Se esse caminho for evitado, acabaremos deficientes. A razão? É um meio necessário, que auxilia no amadurecimento.

O Senhor Jesus, na parábola do semeador, revela que muitos, depois de receberem a Palavra de Deus com alegria, desanimam diante das provações:

O que foi semeado em solo rochoso, esse é o que ouve a palavra e a recebe logo, com alegria; mas não tem raiz em si mesmo, sendo, antes, de pouca duração; em lhe chegando a angústia ou a perseguição por causa da palavra, logo se escandaliza.

Mateus 13.20,21

Você já se questionou por que Deus, mesmo ciente de que muitos desistiriam frente às tribulações, não fez nada para evitar que elas fossem parte da vida do homem? Aliás, além de não as impedir, o Senhor as apresenta como necessárias. Veja o que as Escrituras revelam por meio da pregação de Paulo e Barnabé aos novos convertidos:

E, tendo anunciado o evangelho naquela cidade e feito muitos discípulos, voltaram para Listra, e Icônio, e Antioquia, fortalecendo a alma dos discípulos, exortando- os a permanecer firmes na fé; e mostrando que, através de muitas tribulações, nos importa entrar no reino de Deus.

Atos 14.21,22

A declaração é precisa. Não adianta inventar uma explicação diferente para o sentido do texto. A palavra traduzida como importa aparece na maioria das outras versões com o sinônimo “é necessário”, significado exato dos originais. Em outras palavras, todo cristão necessita passar por tribulações. O Senhor não nos pouparia de um fator tão importante ao crescimento porque alguns decidiriam desistir no meio do processo!

As palavras angústia, na parábola do semeador, e tribulações, na pregação de Paulo e Barnabé, são, na verdade, a mesma nos manuscritos originais: thlipsis (θλιψις). De acordo com Strong, significa: “ato de prensar, imprensar, pressão”. O sentido metafórico inclui: “opressão, aflição, tribulação, angústia, dilemas”. O termo era adotado para descrever a prensa das azeitonas, por exemplo, com o objetivo de extrair azeite. A mensagem é que tais circunstâncias reservam a capacidade de extrair o melhor de nós, apesar do desconforto.

Não faço apologia ao sofrimento contínuo. A mesma Bíblia que fala de momentos de desconforto também fala de alegria e bênçãos. A verdade é que o ensino bíblico não enfatiza apenas um ou outro aspecto, e sim os dois. Ambos compõem aquilo de que necessitamos para o amadurecimento.

Quando entendemos o tratamento do Pai celestial para conosco, isso deve mudar também a maneira como criamos nossos filhos. Mais uma vez, ressalto: filhos não submetidos a processos necessários ao amadurecimento apresentam dificuldade de entender também o amor e o cuidado paternal de Deus. Isso porque a lente deles foi distorcida por uma criação distinta da forma como Deus faz com Seus próprios filhos.

Por amor aos nossos filhos, devemos ser firmes. Temos o dever de não os poupar dos desconfortos necessários ao crescimento. Permita-me exemplificar a execução dessa minha crença em um momento importante da vida de meu filho Israel.

Aos 18 anos de idade, ele estava saindo de casa para estudar fora. Ganhou uma bolsa de estudos para ingressar na Universidade da Casa Internacional de Oração (IHOPU), em Kansas City, nos Estados Unidos. Na época, Israel iniciou um relacionamento com a filha de meu pastor e já falava em casamento. Portanto, o que vou narrar agora envolve um contexto diferente do que é comum para rapazes da mesma idade. Eu o chamei para uma conversa franca e disse:

— Mesmo que você tenha ganhado a bolsa e não vá ter custos com os estudos, viver fora custa. Seu salário, do serviço que prestará a distância, não é suficiente. Deus lhe deu um mantenedor mensal que decidiu ofertar em sua vida regularmente, mas as duas rendas também não são suficientes. Então, estou disposto a complementar a diferença e ajudar nos estudos.

Ele vibrou com a notícia, mas emendei: — Preste atenção, porque o que vou dizer agora é sério e não tem volta. Detalhe: meus filhos cresceram sabendo que o que digo é semelhante aos decretos dos reis da Média e da Pérsia: irrevogável. Prossegui:

— Você já está falando, nessa idade, em casamento, e eu aprovo. Mas orei acerca disso e creio ter uma orientação do Espírito Santo. Vou submetê-lo a um intensivo para ajudá-lo a tornar-se homem em ritmo acelerado. E vamos começar pela questão financeira. Aprenda a fazer orçamento e a planejar seus gastos. Quem quer casar precisa disso. Portanto, para o seu próprio bem e crescimento, se você gastar mais do que pode, não vou socorrê-lo ou ajudá-lo além do valor mensal combinado, que será sempre enviado no primeiro dia de cada mês. Caso isso aconteça, nem adianta você me ligar que eu não vou amolecer e voltar atrás. Você terá de virar-se sozinho.

Ele consentiu e garantiu que entendeu. Tudo correu bem nos dois primeiros meses. No final do terceiro, faltando três dias para acabar o mês, tive uma surpresa. Falávamos quase todos os dias, mas naquele dia, em particular, ele começou a conversa dizendo:

— Então, pai... sei que ainda faltam três dias para acabar o mês... mas será que você não poderia adiantar o dinheiro do próximo mês?

— Claro que não — respondi de pronto. — Mas, pai, são só três dias! — exclamou meu filho. — Eu digo o mesmo: são só três dias para você esperar o dinheiro chegar no prazo combinado — retruquei.

— É que meu dinheiro já acabou — disse Israel. — O problema é seu, não meu. E combinamos isso antes, de forma clara — asseverei. — Pai, é que você não está entendo a gravidade da situação. Não tenho mais dinheiro para nada, nem para comer. Não tomei café da manhã hoje, nem almocei. Estou zerado de grana! — relatou meu filho.

Meu coração ficou apertado. E muito. Como não se compadecer de um filho com fome, sem dinheiro para comer? Porém, sentia, naquele momento, o Espírito Santo me lembrando da importância dos processos de amadurecimento. Decidi não ceder e repliquei:

— Filhão, só tenho um conselho a dar: jejue. Ele protestou do outro lado: — Pai, são três dias! — Que eu me lembre você já fez, pelo menos, dois desses jejuns de três dias, ingerindo apenas água, para buscar ao Senhor. E você está aí para isso. Vá para a Casa de Oração e, se necessário, fique lá até acabar os três dias. Não vou mandar dinheiro algum antes do prazo que combinamos — esclareci.

É claro que foi uma decisão dolorosa e difícil para mim e, com certeza, para ele também. Então, terminei a conversa com aquela mesma frase que eu não gostava de ouvir do meu pai:

— Um dia você vai me entender e me agradecer por isso. É lógico que não comentei nada com a mãe do garoto. Depois do jejum, quando já havia feito a transferência financeira e ele já tinha voltado a comer, é que fui dar a notícia da forma mais positiva possível:

— Amor, esse seu filho é uma bênção! Ela concordou. Então, acrescentei: — Você acredita que o garoto fez mais um jejum de três dias, só na água? — Uau, glória a Deus por isso! — exclamou minha esposa. — Está certo que eu tive minha parcela de contribuição para que isso acontecesse — disse a ela. — Ah, você é um pai muito encorajador e incentivador — replicou minha esposa. — Para ser honesto, eu acho que, dessa vez, foi mais do que um encorajamento de minha parte — afirmei.

Ela franziu a testa, com cara de curiosa, e perguntou: — Como assim? Contei a versão integral. Ainda lembro o rosto dela, com ares de: “Você fez isso com meu bebê?”. Garanti o quanto eu era grato por todo amor e carinho que ela dedicara a meus filhos. Reconheci a importância disso na formação do caráter deles. Contudo, afirmei que seria tão firme quanto fosse necessário para ajudar nosso filho a amadurecer. Pedi que confiasse em mim, não apenas como pai, mas também como um homem de Deus.

Sei muito bem o que aconteceria se eu socorresse Israel logo na primeira vez que se perdeu no orçamento. Ele não teria a devida preocupação com o planejamento financeiro. Afinal de contas, ainda que inconscientemente, ele teria sempre o pensamento de que o papai está por perto para salvá-lo dos problemas.

Tenho visto muitos errarem nesse ponto. A Bíblia diz que, ao casar-se, o filho deve deixar pai e mãe (Gn 2.24). A palavra hebraica azab (בזע), usada nesse texto, significa: “deixar, soltar, abandonar; afastar- se de, deixar para trás”. Acho que isso, por si só, já diz tudo. O cordão umbilical precisa ser cortado! Contudo, mesmo com essa ordenança bíblica, alguns pais não treinam seus filhos a deixá-los. O resultado? Filhos imaturos que acabam perdendo — e muito — com isso.

Filhos deveriam ser ensinados e preparados para ser autossustentáveis antes de estabelecer a própria família: Cuida dos teus negócios lá fora, apronta a lavoura no campo e, depois, edifica a tua casa (Pv 24.27).

Sei que meu filho ainda não havia casado, mas precisava de treinamento para conseguir desligar-se, efetivamente, de toda dependência — financeira e emocional. Por isso, decidi submetê-lo aos mesmos processos pelos quais nosso Pai celeste permite que passemos.

Deus usa uma analogia para ilustrar a forma como Ele tratou a nação de Israel: Como a águia que desperta a sua ninhada, paira sobre os seus filhotes, e depois estende as asas para apanhá-los, levando- os sobre elas (Dt 32.11 NVI). Há uma informação importante aqui. Quando a águia toma um filhote nas asas? Isso só se dá quando chega a hora do voo de treinamento, momento em que a mãe águia decide que o filhote não deve mais permanecer no ninho, porque chegou a hora de aprender a voar.

O Senhor está dizendo que “forçará” nossa saída do ninho para que aprendamos a voar! Maturidade também se produz a partir do trato correto dos pais para com os filhos. Eles não devem ficar isentos de desconfortos, para que não sejam poupados do crescimento proveniente deles. Assim como o Senhor não nos poupará, não podemos poupar nossos filhos.

O QUE VEM DEPOIS?

O que fortaleceu minha decisão de ser firme com meu filho? Pensar no que viria depois: o aprendizado, o crescimento e os resultados do processo.

Pedro cita não só a alegria que temos na grande redenção recebida (1 Pe 1.3-5), mas também ressalta desconfortos necessários ao desenvolvimento. Ele encerra com destaque à glória que será dada a Deus depois do processo:

Nisso exultais, embora, no presente, por breve tempo, se necessário, sejais contristados por várias provações, para que, uma vez confirmado o valor da vossa fé, muito mais preciosa do que o ouro perecível, mesmo apurado por fogo, redunde em louvor, glória e honra na revelação de Jesus Cristo.

1 Pedro 1.6,7

Depois de reconhecer a exultação pela salvação, o apóstolo destaca que seremos contristados ou entristecidos. Graças a Deus, ele afirma que há um prazo de duração: “por breve tempo”. Não se trata de um estilo de vida permanente. Note que o uso da palavra necessário indica tanto que precisamos do processo como também que ele só será utilizado quando realmente for preciso.

A relação entre o valor da fé e o ouro apurado também não pode ser ignorada. Assim como o fogo purifica o ouro, nossa fé também será purificada em “provas de fogo”. Porém, quando o Senhor nos permite passar por elas, nunca deseja o nosso mal. Pelo contrário, Ele garante: Quando passares pelo fogo, não te queimarás, nem a chama arderá em ti (Is 43.2).

Quando amigos de Daniel foram lançados pelo rei Nabucodonosor na fornalha, as Escrituras atestam: Viram que o fogo não teve poder algum sobre os corpos destes homens; nem foram chamuscados os cabelos da sua cabeça, nem os seus mantos se mudaram, nem cheiro de fogo passara sobre eles (Dn 3.27). Costumamos dizer que o fogo não queimou absolutamente nada em Sadraque, Mesaque e Abede-Nego, porém isso não é verdade. O fogo teve poder para queimar apenas única coisa: as amarras que os prendiam. Por isso, o rei perguntou: Não lançamos nós três homens atados dentro do fogo? (v. 24). A conclusão do imperador indica com clareza a mudança de estado daqueles homens: Eu, porém, vejo quatro homens soltos (v. 25).

As provas de fogo que enfrentamos não carregam o propósito de desolar-nos, mas sim de destruir aquilo que nos prende e, à semelhança da prensa da azeitona, extrair o melhor de nós. Deus não abandonou seus servos no fogo. O quarto homem na fornalha é a prova.

Tribulações não significam abandono da parte de nosso Senhor. Elas integram um processo sob a supervisão e o cuidado do próprio Deus, que resultará em bem. Não podemos ignorar essas verdades bíblicas! Observe a conversa de Jesus com Pedro:

Simão, Simão, eis que Satanás vos reclamou para vos peneirar como trigo! Eu, porém, roguei por ti, para que a tua fé não desfaleça; tu, pois, quando te converteres, fortalece os teus irmãos.

Lucas 22.31,32

Quais lições podemos extrair dessa conversa? Em primeiro lugar, Cristo não fez questão de poupar Seu discípulo de uma “peneirada” maligna. Em segundo, Ele garantiu que ter permitido o processo não refletia abandono de Sua parte. É só observar a afirmação: Roguei por ti, para que a tua fé não desfaleça.

Finalmente, vemos a ênfase no resultado, no que viria depois: Quando te converteres, fortalece os teus irmãos. Da mesma forma que aqueles três saíram melhores da fornalha por terem as amarras desfeitas pelo fogo, Jesus garantiu a Pedro que ele também sairia melhor da “peneirada”. Foram maus bocados. Ele negou o Senhor e entrou em crise. Contudo, emergiu como alguém melhor. Líderes são forjados no fogo das provas e em circunstâncias difíceis. São elas que fortalecem nosso caráter, que nos empurram em direção ao amadurecimento.

Experimente criar um filho sem nunca dizer não, sem nunca permitir que ele passe por fatores limitadores ou privações. Você entenderá melhor o paralelo. Quando a Bíblia retrata Adonias, filho de Davi, que tentou usurpar o trono antes da morte de seu pai, contrariando a clara sinalização de que Salomão seria o sucessor, ela também apresenta um motivo para aquele comportamento: Jamais seu pai o contrariou, dizendo: Por que procedes assim? (1 Re 1.6). Pais que poupam de limites, confronto e correção comprometem o futuro de seus filhos.

Muitos pais, além de não cooperarem com Deus na formação dos filhos, ainda atrapalham. Penso que Jacó mimou tanto o filho José que Deus precisou tirá-lo de casa para, assim, forjar o homem maduro que José precisava ser para cumprir o propósito divino.

Recordo bem da conversa que tive com meu filho depois daquele jejum compulsório. Garanti a ele que continuaria não oferecendo socorro, caso as reservas financeiras se esgotassem antes do combinado. Também disse que, depois de aprender a lição sobre responsabilidade, era hora de passar às lições de fé e dependência de Deus:

— Se acontecer um imprevisto e, mesmo com todo planejamento e responsabilidade, seu dinheiro acabar, não me ligue pedindo recursos. Se você fez a sua parte, o possível, quero que saiba que pode contar com ajuda celestial. Quantos milagres de provisão você presenciou, dentro de casa, enquanto crescia?

— Muitos, pai. Muitos — respondeu Israel. — Pois bem, está na hora de você servir não apenas ao Deus de seu pai, mas ao seu Deus. Você deve descobrir o quanto Ele cuida de você e está disposto a supri-lo de forma sobrenatural. Portanto, em uma nova necessidade, não me ligue. Vá buscar a Deus primeiro; não porque eu não me importe, mas porque eu o amo e quero vê-lo crescendo em todas as áreas, inclusive em sua fé — disse ao meu filho.

Ele recebeu a instrução de coração aberto. Alguns meses depois, o dinheiro acabou dois dias antes do prazo da nova remessa. Ele decidiu não me ligar e pensou consigo: “Quem jejua três dias pode jejuar dois”. Contudo, enquanto orava, vinha à sua memória a conversa que tivemos.

Israel começou a clamar que o Senhor fizesse algo. De repente, o Espírito Santo o moveu a sair da sala de oração e partir para a cafeteria. O Senhor garantiu em seu íntimo: “Seu café já está pago”. Ele imediatamente se levantou e foi até lá. Para encurtar a história, o rapaz que estava na frente dele na fila disse: “Seu café hoje é por minha conta”. Não apenas pagou-lhe o café, como também colocou o troco no bolso do Israel!

O resultado? Ele teve o que classifico, em tom de brincadeira, como um “surto de fé”. Ninguém mais segurava a fé do garoto depois daquele dia! Ele teve outras experiências como essa, mas vou falar melhor sobre o resultado do “jogo duro” no próximo capítulo.$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Você consegue enxergar os desconfortos da sua vida como instrumentos que Deus usa para amadurecê-lo, ou tem fugido de toda dificuldade?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Que responsabilidades e provas o Senhor talvez esteja colocando diante de você justamente para forjar o seu crescimento?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quando a sabedoria amadurece por meio do sofrimento, o que Deus pode estar querendo formar em você através do que hoje lhe parece duro demais?$p$, 'reflexao', null);
  end if;

  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, $t$Confiança plena$t$, 11,
$conteudo$T

“Maturidade não é tão somente diferenciar o bom do ruim. É ver o bom em tudo o que parece ruim.” (Charles Grandison Finney)

ive de ser firme com meu filho quando ele foi estudar fora do Brasil. Ao decidir que não o socorreria caso não fosse responsável com o próprio orçamento, eu não pensava no conforto do momento, e sim no crescimento futuro que ele poderia e deveria experimentar. Eu sabia, com certeza, que a mente de um garoto de 18 anos teria dificuldade de perceber a lógica por trás daquela decisão. Mais que isso, imaginava que Israel questionaria o amor do próprio pai. Porém, decidi não detalhar demais meus motivos. Reservei-me o direito de apenas dizer que um dia ele entenderia e, ainda, agradeceria pela minha postura.

O crescimento que percebi na vida de Israel, em pouco tempo, alegrou-me. Assim, tornou-se evidente o desenvolvimento tanto no cumprimento fiel de responsabilidades como em fé e dependência de Deus acima do comum.

Aquele café da manhã provido divinamente não foi a única experiência. O quadro milagroso de provisão repetiu-se diversas vezes no tempo em que meu filho estudou em Kansas City. A fé dele estava sendo forjada e provocada a crescer, assim como acontece com os músculos de quem se exercita: quando “feridos” no exercício, eles reagem e se desenvolvem. Fui testemunha desse amadurecimento.

Então Israel decidiu casar — ainda muito novo e morando nos Estados Unidos. Minha instrução permaneceu: não o sustentaria. Cuidar de sua própria casa seria responsabilidade dele. Cada homem deve estar preparado para tal responsabilidade ao formar família.

Com o casamento, ele mudaria de cidade e passaria a morar em outro Estado. Porém, ao sentarmos juntos para conferir o orçamento da vida de casado, descobrimos que haveria um furo mensal de 500 dólares. Foi assim que meu filho descobriu que se sustentar como solteiro é bem diferente de sustentar uma família.

Como estudante, Israel não possuía permissão para trabalhar. Contudo, após o casamento, por minha nora ser cidadã americana, ele receberia o green card em alguns meses, o que lhe permitiria trabalhar legalmente e, assim, complementar a renda. Suas reservas cobriam a lacuna orçamentária até o fim desse processo. Israel garantiu que nem eu nem seu sogro precisaríamos preocupar-nos com isso.

Cerca de um mês após o casamento, ele me ligou para contar que recebera uma proposta de emprego. O pastor da igreja que Priscilla, sua esposa, frequentava propôs que Israel se tornasse pastor de jovens e adolescentes, com um salário que, com outras funções acumuladas, não somente cobriria os 500 dólares faltantes, como também proporcionaria um razoável superávit.

Obviamente, eu vibrei com a notícia. Respirei aliviado, na verdade. Então, foi nesse momento que meu filho me surpreendeu com as seguintes palavras:

— Mas eu disse ao pastor que só aceitaria o trabalho se fosse como voluntário. — O quêêêê? — disparei do outro lado. — Isso mesmo, pai. Acabei de ofertar meu primeiro ano de trabalho todinho — disse Israel. — Meu filho, agora você casou, tem família para sustentar e não pode ser irresponsável com seus deveres! — protestei.

— Pai, o pastor me disse a mesma coisa quando expus essa condição. Mas, lembre-se de que você não me ensinou somente a importância de ser um homem responsável com meus deveres, como também me treinou para ser um homem de fé. Eu entendo que o Espírito Santo está dirigindo-me a isso e escolhi obedecer e confiar. Vou dizer-lhe o mesmo que falei ao pastor: O senhor verá o que Deus vai fazer por mim — ressaltou meu filho.

Fiquei em silêncio e apenas recordei as preocupações que eu mesmo dei ao meu pai quando escolhi passos de fé, em obediência à direção que recebera. Resolvi confiar que Israel sabia o que estava fazendo, mesmo sem vislumbrar como a necessidade mensal de sua nova família seria suprida.

Naquele mês, ele postou no canal dele, no YouTube, um lyric video de uma canção que ele mesmo compôs e gravou, intitulada “Me Leva Pra Casa”. No primeiro ano, ela alcançou a marca de 50 milhões de visualizações. Além de ter alavancado e promovido muito o canal, a partir da monetização gerada pelos anúncios da rede, o vídeo rendeu o valor total do salário que ele ofertara. Sem contar outras diversas provisões maravilhosas que o casal experimentou.

Como pai, admirei a distância o crescimento na fé e a maturidade que meu filho agora demonstrava não só como homem natural, mas também espiritual. O resultado final sempre justifica o desconforto do processo.

Entretanto, ao lidar com processos de crescimento que classifiquei anteriormente como desconfortos necessários à maturidade, passamos por algumas crises. Não me refiro apenas ao aperto das circunstâncias, mas principalmente aos conflitos interiores, frutos de sentimentos com que precisamos lidar em nosso íntimo.

CONFLITOS INTERIORES

Questionamentos acerca do amor e cuidado divinos inevitavelmente nos atingirão ao longo desses processos. É certo. Necessitaremos, em meio ao trilho do desenvolvimento, de uma fé firme, bem fundamentada na Palavra de Deus e no entendimento correto acerca da revelação divina. Isso é essencial ao crescimento e também para que permaneçamos firmes em nossa confiança.

No início deste livro, vimos que fé é essencial na relação com o Senhor. A fim de melhor exercê-la, sua natureza necessita ser compreendida. Um dos aspectos importantes é que a fé se apoia no caráter de Deus, ou seja, a revelação clara de quem é o Pai celestial é imprescindível. Ele é fiel e infalível. Ele não erra em Seu governo e em Suas decisões, sabe exatamente como cuidar de tudo — inclusive de nossa vida — e merece confiança plena. Ele é digno de uma fé firme, porque Ele não falha.

De um lado, o processo de amadurecimento também requer plena confiança; de outro, o crescimento na fé reflete esse amadurecimento.

Cada filho precisa aprender a andar em um nível de crença inabalável no Pai e em Seu compromisso de cuidado. Afinal de contas, foi o Senhor mesmo quem prometeu que jamais nos abandonaria:

Seja a vossa vida sem avareza. Contentai-vos com as coisas que tendes; porque ele tem dito: De maneira alguma te deixarei, nunca jamais te abandonarei. Assim, afirmemos confiantemente: O Senhor é o meu auxílio, não temerei; que me poderá fazer o homem?

Hebreus 13.5,6

Observe a frase anterior ao compromisso de não abandonar: Porque ele tem dito. O escritor estava dizendo “aqui temos uma promessa divina”, ou “Ele disse, Ele prometeu”. Não importa aquilo que acontece à minha volta, as circunstâncias pelas quais atravesso, e sim a promessa de Deus. Sua Palavra merece mais confiança que as circunstâncias ao redor.

Confiar em nosso Pai celeste é uma escolha. Trata-se de decidir levar em consideração o que Ele é, mediante a revelação de Sua Palavra, e não tentar interpretá-lo mediante as situações que enfrentamos.

Consideremos o exemplo de Jó. Enquanto sua esposa se deixou abater pelo peso das circunstâncias, a ponto de dizer ainda conservas a tua integridade? Amaldiçoa a Deus e morre (Jó 2.9), Jó respondeu com firmeza: Falas como qualquer doida; temos recebido o bem de Deus e não receberíamos também o mal? (Jó 2.10). Por que ele questionou a sanidade da mulher, quando ela sugeriu renegar o Senhor? Porque Jó sabia muito bem que Deus, cujo caráter é infalível, está acima de qualquer suspeita!

Não entender a situação pela qual passamos ou mesmo o porquê das aflições não significa deixar de confiar no Senhor. É possível crer sem compreender. O que acontece à nossa volta não muda o fato de que Ele prometeu cuidar de nós. Na verdade, o ambiente não deveria afetar nossa visão, fazendo-nos olhar diferente para as promessas. No meio de um turbilhão de perdas e dores, Jó ainda conseguiu afirmar: Porque eu sei que o meu Redentor vive e por fim se levantará sobre a terra (Jó 19.25). A fé sabe quem Deus é e o que Ele pode fazer.

Penso que era exatamente isso que Paulo queria expressar quando declarou: Porque sei em quem tenho crido e estou certo de que ele é poderoso para guardar o meu depósito até aquele Dia (2 Tm 1.12). Gosto dessa declaração. O apóstolo não diz saber em que ele cria, e sim em quem. Não cremos em algo, cremos em alguém. E a pessoa em quem depositamos nossa plena confiança é totalmente digna dela; Seu caráter é inquestionável.

Não há melhor forma de enfrentar e superar as “dores do crescimento” do que estar no lugar de absoluta confiança e fé naquele que nunca nos sabotará. Deus nos chama a confiar em Seu amor, em Seu interesse, em Suas boas intenções para conosco. Veja a declaração divina feita à nação de Israel, quando esteve no exílio babilônico:

Eu é que sei que pensamentos tenho a vosso respeito, diz o Senhor; pensamentos de paz e não de mal, para vos dar o fim que desejais.

Jeremias 29.11

Por que o Senhor precisou afirmar eu é que sei que pensamentos tenho a vosso respeito? Porque os israelitas começaram a presumir o que Deus pensava acerca deles! Chegaram a conclusões com base nas circunstâncias difíceis e desanimadoras, não nas declarações do próprio Deus, não no que Ele havia dito, não nas Suas promessas.

Então, veio o protesto divino: “Vocês não sabem o que Eu estou pensando. Eu é que sei! Não me julguem. Não distorçam Meu propósito e Minhas intenções”. Naquele momento, o Senhor aproveitou para comunicar e garantir que Seu desejo era o bem, e não o mal do povo. Deus lembrou os israelitas de confiar em quem Ele é, em vez de julgá-lo a partir dos gritos das situações. A voz de Deus merece mais crédito que os uivos das circunstâncias.

ENXERGUE O HISTÓRICO, NÃO O MOMENTO

Meu filho me ligou para agradecer por não lhe ter poupado, lá atrás, do desconforto das circunstâncias que o ajudaram a crescer. Seu discurso foi mais ou menos assim:

“Pai, eu estava agradecendo a Deus pelo que tenho vivido e experimentado nele e me bateu uma gratidão enorme a você também. Obrigado por não ter sido maleável, nem ter tido dó de ajudar-me a crescer, mesmo em situações nada agradáveis. Nunca esquecerei aquele jejum compulsório dos três dias, só na água. Não foi nem um pouco agradável ouvir você dizer que não mandaria dinheiro para eu comer. Mas o resultado do choque que você me deu se tornou visível em pouco tempo. Se você me tivesse poupado daquele momento de desconforto, teria me poupado também de todas as bênçãos que resultaram dele. Você me disse que um dia eu entenderia e agradeceria, e é para isso que estou ligando. Muito obrigado, pai. Eu amo você.”

Chorei de gratidão a Deus. Não apenas pelo momento em que Israel entendeu o motivo de eu fazer o que fiz, mas principalmente pelo resultado, agora tão evidente. A capacidade de meu filho reconhecer a importância do processo que, mesmo em meio ao desconforto, o havia ajudado a crescer já era, por si, a maior evidência de que os bons efeitos já se manifestavam.

Por outro lado, é importante salientar que as circunstâncias faziam coro com o discurso de gratidão do rapaz; elas testemunhavam a responsabilidade que antes eu esperava dele como homem e agora realmente via; elas também testemunhavam sua capacidade de confiar e andar na dependência de

Deus. Um sentimento parecido com o que tive no dia do casamento dele tomou conta de mim: era um senso de “missão cumprida”.

Entretanto, eu ainda estava curioso. Antes que a conversa terminasse, indaguei: — Filho, o que você sentiu no momento em que me recusei a enviar dinheiro e o deixei passar fome? Raiva? O que passou na sua cabeça naquele dia, há dois anos? Achou que seu pai havia perdido o juízo? Fale-me sobre isso, por favor.

— Raiva, eu não senti, não, pai. Mas bateu dentro de mim uma certa indignação, com pensamentos e sentimentos que se uniam em questionamento: que tipo de pai é esse, que não estende a mão para ajudar o filho em uma situação de necessidade? — respondeu ele.

— E como você lidou com isso? — voltei a questioná-lo. — Levando em consideração todo o seu histórico como pai, em vez de avaliar apenas o momento — disse meu filho.

— Explique isso melhor — pedi. — Quando eu pensava em tudo o que você fez por mim, a vida toda, só enxergava evidências de amor e cuidado. Não me recordava de você ter deixado de apoiar-me em nada. Então, achei melhor dar tempo ao tempo e esperar que o próprio tempo me mostrasse que, mais uma vez, você sabia exatamente o que estava fazendo. E concluí que, mesmo sem entender, eu podia confiar que sua decisão, por mais contraditória que parecesse aos meus sentimentos, tinha uma única intenção: ajudar- me mais uma vez. O fato de você escolher um processo que eu não entendia para ajudar-me a crescer não significava que você não era confiável. Talvez incompreensível naquele momento, mas ainda digno da minha confiança plena. Portanto, resolvi confiar em você, pai. E valeu a pena! Você estava mesmo certo e cooperou, mais uma vez, com meu amadurecimento.

Naquele ponto da conversa, o Espírito Santo falou ao meu coração: “Quero que você use esse exemplo ao ensinar. Lembre meus filhos de que, mesmo quando eles não entendem meus processos, devem confiar que Eu nunca falho com nenhum deles”.

Quando o momento pelo qual você atravessar for difícil, não incorra no erro da mulher de Jó, de tentar avaliar Deus pela ótica das circunstâncias. Lembre todo o histórico dele. Recorde a Sua fidelidade, revelada em cada situação, pois é isso que ajuda a definir, em nossa mente, quem Ele é. O Senhor nos ama, possui um compromisso estabelecido pelas Suas próprias promessas de cuidar de cada um de nós. Ele se comprometeu em jamais — enfatizo: jamais — nos abandonar. Em outras palavras, Ele sempre será confiável.

Veja a declaração de nosso Senhor:

Pedi, e dar-se-vos-á; buscai e achareis; batei, e abrir-se- vos-á. Pois todo o que pede recebe; o que busca encontra; e, a quem bate, abrir-se-lhe-á. Ou qual dentre vós é o homem que, se porventura o filho lhe pedir pão, lhe dará pedra? Ou, se lhe pedir um peixe, lhe dará uma cobra? Ora, se vós, que sois maus, sabeis dar boas dádivas aos vossos filhos, quanto mais vosso Pai, que está nos céus, dará boas coisas aos que lhe pedirem?

Mateus 7.7-11

Jesus não ensinava apenas sobre oração e petição, mas sobre confiança no Pai celeste, que ouve e atende. Orientava a acreditar que Deus deseja o melhor para Seus filhos. Ao citar os pais terrenos para abordar a paternidade divina, Cristo não fez uma mera comparação — Ele estabeleceu um contraste. Mostrou que, enquanto os pais naturais são falhos, o Pai celestial, não. É isso que significa a expressão quanto mais.

Os pais terrenos são maus, classificou Jesus. Ele falava de gente falha, imperfeita e que precisa, pela própria natureza de inclinação ao pecado, de transformação. Obviamente, não apontava uma má intenção, e sim uma incapacidade desses pais.

O autor de Hebreus também destaca a limitação dos pais terrenos na escolha de métodos de didática e disciplina: Pois eles nos corrigiam por pouco tempo, segundo melhor lhes parecia (Hb 12.10). Novamente, mais do que uma comparação, há um contraste. Enquanto os pais terrenos tentam acertar, o Pai celestial nunca erra!

Meus pais não acertaram sempre nos detalhes dos processos e métodos que escolheram para ensinar e corrigir a mim e a meus irmãos. Eu também não consegui acertar em tudo, enquanto procurava cumprir o papel paterno com Israel e Lissa. Certamente, tentei dar a eles o que me parecia ser o melhor tratamento, seja no âmbito da correção ou da educação; apenas tentei, não significa que consegui. Como qualquer outro pai, mereço a classificação de imperfeito.

Contudo, é fundamental acreditar no que a Palavra revela sobre a natureza e o caráter de Deus. Ele é um pai perfeito! É sempre fiel e infalível. Merece a nossa plena confiança. Nunca se permita duvidar, por um instante sequer, do amor e do cuidado dele por você.

INCAPACIDADE DE ENTENDER A AÇÃO DIVINA

Por que precisamos de fé no cuidado divino? Porque nem sempre entenderemos os processos divinos. Nossa capacidade de raciocínio e entendimento está muito aquém da sabedoria divina:

Porque os meus pensamentos não são os vossos pensamentos, nem os vossos caminhos, os meus caminhos, diz o Senhor, porque, assim como os céus são mais altos do que a terra, assim são os meus caminhos mais altos do que os vossos caminhos, e os meus pensamentos, mais altos do que os vossos pensamentos.

Isaías 55.8,9

Ora, o homem natural não aceita as coisas do Espírito de Deus, porque lhe são loucura; e não pode entendê-las, porque elas se discernem espiritualmente.

1 Coríntios 2.14

Assim como Israel ainda não tinha experiência de vida nem entendimento suficiente para compreender minhas escolhas como pai que deseja contribuir para o amadurecimento do filho, nós também não possuímos a menor condição de entender a mente de Deus, nem de chegar perto de compreender os processos por Ele escolhidos para o nosso crescimento.

É claro que demoramos para descobrir e reconhecer tudo isso, exatamente como somos lentos para compreender nossos próprios pais. Nossos filhos também, por sua vez, são assim conosco. Muitas vezes, replicamos o comportamento para com o Senhor.

Um relato bíblico ilustra bem esse tipo de atitude. Enquanto Pedro ouvia Jesus falar sobre lavar seus pés, sua mente trabalhava contra aquilo (Jo 13.2-11). Parecia, no mínimo, inconcebível. Cristo, o Messias, assumir o papel de servo, de escravo, e humilhar-se daquela forma? De jeito nenhum! O futuro grande líder da igreja de Cristo não conseguia entender, tampouco aceitar. Mas, o que o Messias lhe diz? Algo parecido com o que eu mesmo falei ao meu filho: “Um dia você vai entender-me”. Observe:

Respondeu Jesus: “Você não compreende agora o que estou lhe fazendo; mais tarde, porém, entenderá”.

João 13.7 NVI

Há um padrão aqui. Quer seja na forma como criamos nossos filhos, quer seja na maneira como o Pai Celestial decide tratar os Seus. Se não possuímos condições de acompanhar o nível de entendimento daquele que está treinando-nos e preparando-nos para viver plenamente o Seu propósito, então, o que se requer de nós é confiança.

O que meu filho Israel relatou ter-lhe sustentado quando fui duro é exatamente o que deve sustentar-nos quando não conseguirmos entender os processos escolhidos pelo Pai celestial para tratar conosco. Ele é fiel e digno de toda a nossa confiança! Não pelo momento, mas pelo histórico, por Suas promessas, por quem Ele é.

Fé é mais do que a capacidade de mudar as circunstâncias. Ela também envolve a capacidade de suportar o que enfrentamos até que as circunstâncias mudem. Observe o ensino de Tiago:

Irmãos, tomai por modelo no sofrimento e na paciência os profetas, os quais falaram em nome do Senhor. Eis que temos por felizes os que perseveraram firmes. Tendes ouvido da paciência de Jó e vistes que fim o Senhor lhe deu; porque o Senhor é cheio de terna misericórdia e compassivo.

Tiago 5.10,11

O “recado” é contundente. Deus não é avaliado pelas circunstâncias temporais que Jó enfrentou e suportou, mas pelo fim que Jó experimentou, pelo que veio depois:

Mudou o Senhor a sorte de Jó, quando este orava pelos seus amigos; e o Senhor deu-lhe o dobro de tudo o que antes possuíra.

Jó 42.10

É evidente que a versão final desse homem de Deus é melhor que a versão do início da narrativa bíblica. Isso se percebe não apenas nas circunstâncias, mudadas e melhoradas pela intervenção divina, mas em uma de suas próprias declarações finais: Eu te conhecia só de ouvir, mas agora os meus olhos te veem (Jó 42.5).

O conhecimento de Jó acerca de seu Deus havia mudado. Amadurecido, ele passou a conhecer melhor o Criador. O Senhor deseja auxiliar-nos, em meio a desconfortos necessários, a crescer e a amadurecer no conhecimento dele.

Nesse contexto, o que se requer de cada um de nós não é a compreensão do que enfrentamos. Não é ter habilidade para explicar o que acontece conosco ou à nossa volta. O que se espera de nós é que confiemos plenamente nele, pois escrito está:

Por isso, não abram mão da confiança que vocês têm; ela será ricamente recompensada. Vocês precisam perseverar, de modo que, quando tiverem feito a vontade de Deus, recebam o que ele prometeu; pois em breve, muito em breve “Aquele que vem virá, e não demorará. Mas o meu justo viverá pela fé. E, se retroceder, não me agradarei dele”. Nós, porém, não somos dos que retrocedem e são destruídos, mas dos que creem e são salvos.

Hebreus 10.35-39 NVI

Aleluia! Sigamos crendo e confiando de todo coração naquele que nos ama, é fiel e possui planos extraordinários a nosso respeito. Entendendo ou não o momento pelo qual passamos atualmente, desfrutemos do processo de amadurecimento que nos levará, lá na frente, a ser agradecidos pelo que não compreendíamos. Confiar sempre, desistir jamais!

BIBLIOGRAFIA 1

Anderson, Neil T. & Saucy, Robert L. Santificação: como viver retamente em um mundo corrompido. São Paulo: Vida, 2000.

Champlin, Russel Norman. O Novo Testamento Interpretado Versículo por Versículo. São Paulo: Hagnos, 2014.

Ferreira, Aurélio Buarque de Holanda. Dicionário Aurélio da Língua Portuguesa. Curitiba: Editora Positivo, 2010.

Hagin, Kenneth E. Crescendo Espiritualmente. Rio de Janeiro: Graça Editorial, 2004.

_____________. O Nome de Jesus. Rio de Janeiro: Graça Editorial, 2014.

Keener, Craig S. Comentário Histórico-Cultural da Bíblia. São Paulo: Vida Nova, 2017.

Lacerda, Drummond. Fora do Alcance das Crianças: A Plenitude de Deus Está Esperando Você Crescer. Curitiba: Orvalho.Com, 2018.

Lyons, George. Novo Comentário Bíblico Beacon. Rio de Janeiro: Central Gospel, 2016.

Stott, John R. W. Contracultura cristã: A Mensagem do Sermão do Monte. São Paulo: ABU, 1981.

Subirá, Luciano. O Agir Invisível de Deus. Curitiba: Orvalho.Com, 2012.

_____________. O Falar em Línguas: A Linguagem Sobrenatural de Oração. Curitiba: Orvalho.Com, 2011.

Vine, W. E.; Unger, Merril F.; White Jr, William. Dicionário VINE. Rio de Janeiro: CPAD, 2002.

1. As consultas ao Dicionário de Palavras no Hebraico e Grego foram feitas no aplicativo da Olive Tree, na versão Atualizada de Almeida, com números de Strong.

Quer saber mais sobre a Editora Central Gospel?

Em www.editoracentralgospel.com, você tem acesso a novidades e conteúdo exclusivo. Visite o site e faça seu cadastro!

A Editora Central Gospel também está presente em:

Editora Central Gospel Ltda Estrada do Guerenguê, 1851 - Taquara

Cep: 22.713-001 Rio de Janeiro – RJ

TEL: (21) 2187-7000 www.editoracentralgospel.com

Disponível também no formato ebook

www.editoracentralgospel.com

Silas Malafaia em Foco

Malafaia, Silas

9788576896395

224 páginas

Compre agora e leia

Em Silas Malafaia em foco, o leitor encontrará temas como aborto, catolicismo, depressão, dízimo, família tradicional, homossexualidade, inveja, perdão, política, sexo e muitos outros, todos tratados com muita objetividade e com sólido embasamento bíblico. O que realmente pensa um dos pastores mais polêmicos do Brasil sobre os mais importantes temas da atualidade? Este livro traz as respostas para as perguntas que as pessoas sempre quiseram fazer ao pastor Silas sobre os assuntos mais diversos. Em Silas Malafaia em foco, o leitor encontrará temas como aborto, catolicismo, depressão, dízimo, família tradicional, homossexualidade, inveja, perdão, política, sexo e muitos outros, todos tratados com muita objetividade e com sólido embasamento bíblico. Parte das perguntas encontradas no livro foi feita por participantes das redes sociais do pastor Silas, maneira pela qual ele tem se aproximado cada vez mais de seu público, podendo, dessa forma, propagar o evangelho e firmar sua posição como voz profética para a nação brasileira.

Compre agora e leia

Vencendo o gigante chamado câncer

Oliveira, Cristian

9788576896401

112 páginas

Compre agora e leia

Neste livro, Pr. Cristian Oliveira, de forma comovente e inspiradora, retrata seus dias de luta contra o seu gigante particular: um câncer colorretal. Jovem, dinâmico e absolutamente dedicado à Igreja de Cristo, este servo de Deus viu-se, da noite para o dia, diante de um desafio particular: olhar para si; ouvir a si; cuidar de si. Nas páginas deste livro, o leitor — que tanto pode estar vivenciando essa experiência pessoalmente, como pode ter perto de si alguém atravessando o vale da sombra da morte —será desafiado a mergulhar em um novo mundo; a desenvolver pensamentos inspiradores; a lutar contra o medo; a construir um "ambiente de cura" — para si, particularmente, ou para alguém que lhe seja caro —; e, sobretudo, a "dar a volta por cima".

Compre agora e leia

Esta não é a vida que eu esperava... Mas estou encontrando esperança e cura

Partow, Donna

9788576896388

224 páginas

Compre agora e leia

Todos nós queremos viver felizes para sempre. Enquanto Donna compartilha suas histórias pessoais, você se identifica com sua vida, suas lutas e seus sonhos desfeitos. Neste livro, ela examina questões que são comuns a todas as mulheres, incluindo: Decepção em relacionamentos • Escolhas tolas • Famílias não muito perfeitas • Busca por amor • Desejo de fazer a diferença Se você está pronto para descobrir uma melhor abordagem para a vida, com a promessa de esperança e cura —, este livro é para você. As ferramentas que farão mudanças positivas em sua história estão todas aqui: estudo bíblico aprofundado, questões de aplicação, memorização das Escrituras e muito mais. Como Donna diz: "Se Deus pode dar nova vida ao meu coração e alma cansados, então existe esperança para todos!".

Compre agora e leia

Questões da atualidade

Vieira Chaves, Gilmar

9788576896364

184 páginas

Compre agora e leia

Vive-se atualmente o tempo da chamada pós-modernidade. Como você vai ver no último capítulo deste livro, esse período caracteriza-se pela dissolução dos conteúdos morais e éticos. Aquilo em que se crê ou que se aprendeu dos antepassados não importa mais. O que importa em um conteúdo é se ele vende, agrada à maioria, traz bons lucros e boas vendas. Assim, o povo de Cristo é atacado o tempo todo por padrões de beleza, consumo, estética, arte ou cultura, que não somam na caminhada cristã. Pelo contrário, deturpam os valores do evangelho. Essa é uma das questões discutidas neste livro enriquecedor e intrigante. Você vai desejar lê-lo todo de uma só vez, tal a importância dos seus temas, que envolvem também as questões da vida política do país, do direito, da economia, de saúde e os debates teológicos de grande relevância.

Compre agora e leia

Soluções para os males da alma

Tracy, Steven R.

9788576896371

328 páginas

Compre agora e leia

O abuso acontece de diferentes formas: física, sexual, verbal, espiritual ou negligência. É o primeiro livro bíblico, psicologicamente informado e com abordagem compreensiva para auxiliar os seguintes grupos no entendimento e tratamento de toda forma de abuso:Equipe pastoral e ministerialLíderes de células e líderes de jovensEducadores e estudantes de seminárioConselheiros pastorais e clínicosSTEVEN R. TRACY é professor de teologia e ética na Phoenix Seminary, em Phoenix, Arizona. Ele se graduou na Western Conservative Baptist Seminary (MDiv, ThM), e recebeu um PhD no Novo Testamento da Universidade de Sheffield, na Inglaterra. Ele e sua esposa, Celestia, que é uma terapeuta familiar, são os fundadores do Mending the Soul Ministries [Ministério Remendando a Alma].

Compre agora e leia$conteudo$)
    returning id into v_aula_id;
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Mesmo sem entender todos os motivos, você consegue confiar plenamente que o Pai sabe o que faz ao permitir certos processos na sua vida?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Em que área você precisa parar de questionar o amor de Deus e simplesmente descansar na certeza de que um dia entenderá e agradecerá?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como a sua fé e dependência de Deus podem ser forjadas justamente nas situações em que você é levado a confiar acima do comum?$p$, 'reflexao', null);
  end if;

end $migration$;
