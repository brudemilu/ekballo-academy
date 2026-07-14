-- =============================================================
-- Curso: Igreja Simples (Thom S. Rainer & Eric Geiger)
-- Transcrição do livro na íntegra, dividida por capítulo na ordem
-- de leitura. aulas.ordem = posição de leitura (Apresentação = 1,
-- Capítulo 1 = 2, ... Capítulo 9 = 10).
--
-- As atividades de cada aula são as "Perguntas para discussão em
-- grupo" do próprio livro (tipo='reflexao') — não bloqueiam o avanço
-- e ficam disponíveis para devolutiva pastoral. Cabeçalhos de seção
-- em CAIXA ALTA renderizam como títulos (ver ehTitulo() em
-- components/AulaConteudo.tsx).
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
  -- Curso (idempotente por slug; garante publicado=true)
  -- ---------------------------------------------------------------
  select id into v_curso_id from public.cursos where slug = 'igreja-simples';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values (
      'igreja-simples',
      'Igreja Simples',
      'Estudo a partir de Igreja Simples, de Thom S. Rainer e Eric Geiger. Fruto de uma ampla pesquisa com igrejas norte-americanas, o livro mostra que as congregações mais vibrantes compartilham algo em comum: um processo de discipulado simples e claro, articulado em quatro movimentos — clareza, movimento, alinhamento e foco. Em nove capítulos, cada aula traz o texto na íntegra e, ao final, as perguntas para discussão em grupo do próprio livro, para você repensar como a sua igreja tem feito discípulos.',
      '/api/og/curso/igreja-simples',
      false,
      0,
      v_next_ordem,
      true
    )
    returning id into v_curso_id;
  else
    update public.cursos
      set titulo = 'Igreja Simples',
          descricao = 'Estudo a partir de Igreja Simples, de Thom S. Rainer e Eric Geiger. Fruto de uma ampla pesquisa com igrejas norte-americanas, o livro mostra que as congregações mais vibrantes compartilham algo em comum: um processo de discipulado simples e claro, articulado em quatro movimentos — clareza, movimento, alinhamento e foco. Em nove capítulos, cada aula traz o texto na íntegra e, ao final, as perguntas para discussão em grupo do próprio livro, para você repensar como a sua igreja tem feito discípulos.',
          imagem_url = '/api/og/curso/igreja-simples',
          publicado = true
    where id = v_curso_id;
  end if;

  -- ---------------------------------------------------------------
  -- Apresentação  (aula ordem = 1)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 1;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Apresentação$t$,
      1,
$conteudo$RECONHECIMENTOS

Tenho estudado a igreja por mais de vinte anos. Embora eu perceba que apenas comecei a entender esta instituição dada por Deus, sob alguns aspectos parece que já a estudei de todos os ângulos. Ainda assim sabia que algo estava faltando.

Há alguns anos um jovem cheio de energia veio ao meu escritório para me mostrar uma pesquisa que havia feito. Não conseguia ficar parado. Aquele era o seu jeito, ainda mais naquela situação. Ele estava tremendamente empolgado com o resultado de sua pesquisa até aquele ponto.

Afirmando objetivamente, ele descobrira que as igrejas mais saudáveis nos Estados Unidos tendiam a ter um processo de discipulado simples. Elas tinham clareza sobre o processo e intencionalmente conduziam os cristãos por ele. Estavam focadas nos elementos do processo e alinhavam toda a congregação nele.

Eric Geiger era aquele jovem, então com vinte e poucos anos; hoje mais velho, com 30 anos. Sua pesquisa estava bem feita. Suas descobertas eram precisas.

Fizemos mais algumas pesquisas e os resultados nos davam ainda mais certeza.

Estou grato pela inteligência do Eric, seu entusiasmo, sua persistência e sua humildade enquanto o velho (eu!) oferecia direção e algumas sugestões para melhoras.

Eric e eu escrevemos este livro na primeira pessoa do plural para facilitar a fluência, mas também identificamos quando estamos falando especificamente sobre um de nós.

Minha gratidão também se estende a minha família na LifeWay Christian Resources, onde sirvo como presidente. Os homens e mulheres que fazem parte dessa família são alguns dos maiores e mais inteligentes cristãos que conheço.

Agradeço também a Ken Stephens, presidente da Broadman & Holman (B&H), pela oportunidade de iniciar uma nova série de trabalhos com a B&H, dentre os quais este livro é o primeiro. O constante encorajamento dele e o seu senso de humor são sempre uma fonte de alegria para mim.

Como posso agradecer à minha grande família? Em todos os livros que escrevo você me vê falando dos meus filhos: Sam, Art e Jess. Uma pessoa recentemente me perguntou se seria possível que esses jovens fossem realmente tão bons como eu os descrevo. A realidade é que não há como exagerar o quão extraordinários eles são. Todos que os conhecem concordam comigo.

É claro que o objeto do mais profundo amor em toda a família Rainer é Nellie Jo. Esposa e mãe com a maior das honrarias. A vida não é ótima, querida? A LifeWay não é um lugar maravilhoso? Nashville não é um ótimo lugar para se viver? Eu amo demais você e adoro fazer esta jornada chamada vida com você. O melhor ainda está por vir.

- Thom Rainer

Já se disse que é preciso uma comunidade para se educar uma criança. Bem, é necessário uma também para se escrever um livro. Estou eternamente grato a Deus pela comunidade de pessoas que ele colocou na minha vida.

Agradeço ao Thom por me levar nessa jornada. Há muita conversa sobre investir na próxima geração de líderes. Alguns diriam que aos trinta anos eu sou parte dessa próxima geração. Thom tem vivido este sermão. Muito obrigado, Dr. Rainer, por acreditar em mim e se tornar meu parceiro neste projeto.

Agradeço a todos que investiram horas na fase de pesquisa deste projeto. Agradeço a centenas de líderes de igreja que participaram com sinceridade e honestidade. Obrigado Dra. Paulette Johnson por sua capacidade estatística. Obrigado à LifeWay por rodar o modelo para a primeira fase do projeto. Obrigado Bette Spellerberg, Stuart Swicegood e Russ Krueter por fazerem os contatos iniciais com os líderes das igrejas.

Agradeço ao Dr. Rick Blackwood, meu pastor, líder, amigo e mentor. Obrigado Rick, por me dar a oportunidade de servir a você e a Christ Fellowship em Miami. Os risos, orações, alegrias e frustrações que nós experimentamos juntos têm sido ricos e recompensadores.

Eu agradeço a equipe da Christ Fellowship. Somos sempre lembrados da graça e da bondade de Deus. Não só podemos servir a Jesus e a nossa grande igreja e ainda trabalhamos juntos. Oro para que continuemos a gostar de caminhar juntos.

Agradeço aos membros da Christ Fellowship, Miami. Oro para que continuemos firmes no movimento de levar o evangelho adiante. Fazer parte desta igreja é fantástico!

Agradeço a Broadman & Holman por toda energia e tempo que eles colocaram neste projeto. Quando encontrei com Ken Stephens, o presidente, pela primeira vez ele disse: "Bem-vindo à nossa família". Eu me senti como numa cena do Poderoso Chefão. Quase tentei beijar o seu anel. Quase! Foi um grande momento e espero que haja muitos outros.

Agradeço aos seguintes líderes com quem tive a honra de servir e estudar: Jerry Key, Dr. Michael Hawley, Ben Wasson, Chuck Allen, Dr. Terry Fields, Dr. Dino Senesi e Dr. Brad Waggoner. Fui abençoado pelo seu investimento em mim. Espero que vocês vejam algum fruto do seu trabalho.

Agradeço aos meus pais e meu irmão. No meio de uma mudança enorme vocês se mantiveram constantes. Mesmo quando eu estava longe de Deus, vocês me amaram. O seu encorajamento permanente tem me sustentado por anos.

Agradeço à minha esposa Kaye. Sou tão agradecido a você! Eu a amo muito. Você é a expressão de Deus mais tangível em minha vida. Os dias difíceis são muito mais fáceis de aguentar com você. Os grandes dias são muito mais empolgantes com você.

Acima de tudo, agradeço a Jesus. Entrego este trabalho para você como uma oferta para ser usada para sua glória.

- Eric Geiger

PARTE 1

A REVOLUÇÃO DO SIMPLES$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$A tese central do livro é que as igrejas mais saudáveis têm um processo de discipulado simples, marcado por clareza, movimento, alinhamento e foco. Olhando para a igreja ou o grupo que você lidera ou frequenta, quão claro é hoje o caminho pelo qual uma pessoa cresce na fé? Você conseguiria descrevê-lo em poucas palavras?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Os autores observaram que muitas igrejas acumulam atividades e programas sem um processo intencional que conduza as pessoas adiante. Em sua própria caminhada, você sente que está se movendo com propósito e foco, ou apenas participando de muitas atividades dispersas? O que você precisaria simplificar para crescer com mais intencionalidade?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 1 — A revolução do simples começou  (aula ordem = 2)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 2;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 1 — A revolução do simples começou$t$,
      2,
$conteudo$No meio da complexidade, encontre a simplicidade.
— Albert Einstein

Relaxe. Este livro não é sobre outro modelo de igreja. Se você é um líder de igreja viu modelos suficientes e a maioria deles está na sua estante. Ou pior ainda, você misturou vários desses modelos e produziu um plano esquizofrênico. Se este é o caso, nem você nem as pessoas da sua igreja sabem qual é o seu modelo eclesiástico. Nós vemos isso o tempo todo.

"Mas agora, baixe a sua guarda. Nenhum programa novo será imposto aqui. Não haverá nada novo para acrescentar à sua agenda. Se algo acontecer será encorajá-lo a eliminar algumas coisas, simplificar. Este livro vai ajudá-lo a preparar um processo simples de discipulado em sua igreja. Ele vai ajudá-lo a implantar o modelo que você escolheu. Vai ajudá-lo a simplificar".

Mantenha os seus olhos nas palavras do início de cada capítulo. Quatro palavras simples: Clareza, Movimento, Alinhamento, Foco. Estas quatro palavras vão falar muito antes de concluirmos este livro.

Depois de centenas de consultas com líderes de igrejas locais e um projeto de pesquisa significativo, nós concluímos que os líderes de igreja precisam simplificar. Eles estão constantemente perguntando, "Como podemos dar conta de todo este trabalho? Como podemos montar este quebra-cabeça?" Muitos líderes de igreja com quem conversamos estão procurando uma alternativa para uma vida não tão simples.

A vida "não tão simples"

O pastor Rush está voltando para casa de uma conferência sobre o ministério da igreja. Ele gostou muito deste período longe das mensagens desafiadoras, dos longos períodos de oração e adoração. Mas odeia como se sente agora. O caderno de anotações da conferência está no seu colo repleto de coisas que aprendeu e tudo o que ele quer fazer. Quer abri-lo, mas não pode. Quer pensar no futuro, mas sua mente está tomada pelos detalhes que envolvem o resto da semana.

Enquanto o avião decola, ele sente o peso das responsabilidades que o esperam. Algum momento, entre três e nove mil metros de altura, coloca suas anotações (e os seus sonhos) na sua mala.

É quarta-feira à tarde. Se sente um pouco culpado por não ter estado no programa de visitação ontem. Ele se sente mais culpado ainda por ter gostado da noite livre. O programa de visitação de terça-feira era a menina dos olhos dele, o programa mais importante quando chegou à igreja vários anos atrás. Logo se tornou a paixão de muitas pessoas na igreja. Ele está grato por aquelas pessoas terem assumido a sua paixão, mas se sente como um traidor por se ressentir de ter que ficar mais uma noite fora de casa.

Hoje à noite ele tem que (ele gostaria de querer) liderar a reunião de oração na igreja. Diz para si mesmo que vai compartilhar algo que Deus lhe ensinou num momento de devoção pessoal. Fazendo isso terá tempo de responder a alguns telefonemas antes da reunião de oração. A experiência lhe diz que as mensagens sobre a sua mesa e os e-mails em seu computador serão muitos. Ele sabe que eles já estão lá.

O comitê de finanças vai se reunir depois da reunião de oração, portanto não chegará em casa antes das 21 horas. Ele não é o líder da reunião, mas tem que estar presente. Quem sabe os seus filhos ainda estarão acordados quando chegar em casa.

Amanhã ele vai tomar café da manhã com um dos homens da diretoria da igreja. Não sabe sobre o que é o encontro, mas pensa que só vai aumentar a lista de suas responsabilidades.

Depois terá uma reunião da equipe e talvez algumas visitas em hospitais. Amanhã à noite ele e a esposa estão em um grupo pequeno. Recentemente encorajou a todos na igreja que estivessem em um grupo pequeno e ele quer liderar pelo exemplo. Realmente ele gosta do grupo quando chega lá, mas gostaria de não sentir aquele peso e ora para que eles não se sintam da mesma maneira que ele está se sentindo agora.

Ele tem pouca coisa feita referente aos sermões dos cultos do próximo domingo. Está no meio de uma série sobre relacionamentos. Ensinou sobre relacionamento com o cônjuge na última semana e deseja vivenciar alguns dos princípios práticos que compartilhou: sair uma noite, piqueniques e assim por diante.

Ele quer fazer isso acontecer de alguma maneira esta semana. Sexta à noite poderia dar certo. Então se compromete a não ir à noite esportiva na escola local para a qual havia sido convidado. Ele sabe que vai desapontar um dos membros da diretoria que o encorajou a se fazer mais visível na comunidade.

Sábado à tarde, depois do jogo do seu filho, ele vai investir a maior parte do dia na sua mensagem. Parece que mais um "sábado, a noite especial" está reservado para o público do domingo pela manhã.

Este final de semana ele vai falar sobre "relacionando-se com vizinhos 'perdidos'". Gostaria de ter algumas histórias pessoais para contar, mas a vida está simplesmente muito corrida ultimamente. Então se lembra de todas as vezes que chegou à sua garagem tarde da noite, depois de ficar na igreja ou em atividades relacionadas com ela. Ainda não encontrou-se com o novo casal que se mudou duas casas abaixo. Ele diz para si mesmo que eles acabaram de se mudar há algumas semanas, mas então se lembra de que foi, no mínimo, há seis meses.

Ele sabe que se não está se relacionando com os seus vizinhos, convidando-os para ir à igreja e até Cristo, também não pode pedir para que a sua congregação o faça. Cogita a possibilidade de mudar a mensagem, mas já anunciou sobre o que vai pregar. Balança então a cabeça e afunda um pouco mais na cadeira.

Ele está tentado a testemunhar para a pessoa sentada ao seu lado no avião, só para ter uma história pessoal para a sua mensagem — nada como uma boa história de avião para cativar as pessoas. Repreende a si mesmo pela motivação errada. O passageiro está dormindo mesmo. Deve ser bom.

O pastor Rush abre a mala, coloca as anotações da conferência de lado e pega o seu bloco de papel.

Ele tem a reunião semanal da equipe depois do compromisso no café da manhã. Este será o único momento que terá para se preparar. Decide ser breve, anotando apenas alguns itens para discutir. Ele sabe que há algumas questões na equipe que precisam ser tratadas, mas não tem nem o tempo nem a energia emocional para lidar com elas.

Ele começa a pensar na sua mensagem de domingo à noite (que é diferente da que vai pregar domingo pela manhã). Recentemente recebeu algumas críticas sobre a qualidade de suas mensagens no domingo à noite. Ele sabe o porquê. Elas não têm sido bem desenvolvidas. Tem tentado trabalhar nelas mais cedo na semana, tirando algum tempo gasto com o preparo da mensagem do domingo de manhã.

Neste domingo à noite haverá uma festa de rua no bairro. Sua esposa irá enquanto ele estará na igreja. Pensa — pelo menos um de nós conhece os nossos vizinhos. É claro que as pessoas vão imaginar porque ela não está na igreja. Esta tensão está crescendo. Afunda mais um pouco no assento.

Ele sabe que deve haver um jeito melhor. Sabe e continuamente admite isso para si mesmo e para o Senhor. Mas não há tempo para descobrir esse jeito (o que quer que seja), muito menos para colocá-lo em prática.

Como em outras conferências, pastor Rush ficou impressionado, mas estava voltando para casa quase deprimido.

Durante esses períodos, o pastor Rush havia se disciplinado a lembrar do seu chamado para o ministério. Quando ele tinha seus vinte e poucos anos entregou sua vida ao ministério pastoral. Mentalmente volta àqueles dias quando se defronta com o caminho de sua carreira.

Deus lhe dera uma insaciável paixão pela igreja, pela Palavra e pelo seu povo. Ele sabia que Deus o havia separado para servir à igreja. Ainda sabe; ainda tem uma profunda preocupação. O incômodo no seu coração, para fazer discípulos através do ministério da igreja local, ainda está lá. Esta convicção não desapareceu, só cresceu. Mas sabe que muitas coisas se colocaram ao lado e até acima disso.

Sim, ele está nisso por causa das pessoas.

A nove mil metros de altura, o pastor Rush está pensando no povo de sua igreja. Ele está orando e pensando. Algumas questões difíceis estão aparecendo. As pessoas em sua igreja estão sendo transformadas? A sua igreja está fazendo verdadeiros discípulos, o tipo de discípulos que Jesus fez? Ou todo mundo está simplesmente ocupado?

Ele dá uma olhada no passageiro dormindo ao seu lado. Em seu colo está a revista da companhia aérea e está aberta numa propaganda de página dupla sobre um aparelho popular de mídia. No topo da propaganda diz Simples. Por curiosidade o pastor Rush pega a mesma revista na bolsa do assento à sua frente. Acha a página para analisar melhor a propaganda. É interessante, ele sorri para dentro.

Simples realmente soa bem.

A Revolução

Simples é o que há!

Complexidade está por fora. Fora de moda pelo menos.

Ironicamente as pessoas estão famintas pelo simples porque o mundo se tornou muito mais complexo. A quantidade de informação acessível a nós é continuamente crescente. A habilidade de interagir com o mundo todo é possível. A tecnologia está avançando consistentemente a uma velocidade incrível.

O resultado é um mundo complicado, vidas ocupadas e no meio da complexidade as pessoas querem encontrar a simplicidade. Eles anseiam por isso, procuram, pagam e até sonham com isso. Simples é o que há. Simples funciona. As pessoas respondem ao simples.

A revolução do simples começou.

A Apple sabe disso

Eles são os pioneiros do simples. São parte da revolução contra a complexidade e estão pressionando na frente tecnológica. Pegue um iPod e encontre um único botão grande. Conecte ao seu Apple de mesa e o download de músicas começa automaticamente. Conecte o cabo USB de sua impressora e ela está pronta para ser usada. "Plug and play" - plugue e use - o mantra da geração da informática faminta pelo simples.

Até o desenho gráfico da Apple é simples. Veja a sua logomarca. Uma maçã com uma única cor substituiu a antiga multicolorida. O trabalho artístico em seus produtos e suas lojas é sutil. Os seus "adoradores" são missionários verbais da simplicidade que eles oferecem. Se você conhece alguém com um Apple você sabe o que eu quero dizer. Você já foi desafiado a se juntar a tarefa da Apple nesta revolução pelo simples?

O iPod é um estudo de caso em ação. Se você não conhece um iPod, é um aparelho portátil de música e vídeo que pode ser ouvido com fones de ouvido ou num carro. É o símbolo da geração atual e é mais simples do que qualquer outro aparelho, tocador de cassete ou CD. Em um golpe incrível, que as outras companhias reconhecem que estão imitando, a Apple foi capaz de pegar a tecnologia avançada e torná-la simples.

O desenho externo tem apenas um botão redondo. Ele tem quatro pontos de toque ao redor do círculo e um toque no meio, mas parece que tem um botão só. O iPod é mais caro e tem um desempenho pior que muitos concorrentes vendidos pelos seus competidores, mas ele domina o mercado. Ele é simples e as pessoas respondem a isso.

O iMac é uma prova a mais. O iMac é a versão Apple do computador de mesa. A atração é que todos os componentes de um computador estão consolidados numa única unidade. O monitor contém o processador central, os alto-falantes, a rede, as portas USB e o CD-ROM. Vem numa única caixa com um teclado e um mouse. Esta simplicidade torna fácil a decisão de comprar. Há uma única escolha.

É fácil de montar porque tem poucas partes. Como a própria Apple faz o software que vem no iMac, há apenas um número para telefonar se algo der errado. Uma decisão, uma caixa, um contato, um preço. Simples!

A Google sabe disso

A Google é uma das companhias que cresceram mais rápido na história dos Estados Unidos. Ela transformou a sofisticada tecnologia por trás da pesquisa na Internet simples e rápida para os usuários. A popularidade da Google disparou enquanto os usuários da Internet estão aos montes usando esta ferramenta de pesquisa. As pessoas amam e respondem ao visual simples da pesquisa Google. Talvez as pesquisas na Internet através da Google cheguem a 75% do total. Está claro que ela está no comando do mercado de pesquisa. Para a Google - e seus investidores — a revolução do simples tem sido bem compensadora.

A quantidade de branco em sua página inicial grita simplicidade. Clique em "google.com" e apenas de vinte a quarenta palavras se encontram em sua página inicial. É isso! É o simples levado a um nível totalmente novo. Se um simples superdimensionado não fosse um paradoxo nós o usaríamos aqui. Compare a Google com outras ferramentas de busca como Yahoo ou MSN onde os usuários são confrontados com centenas de palavras na página inicial.

A Google mantém a sua página de pesquisa simples para o benefício dos usuários. A filosofia por trás da simplicidade é que os usuários não são capazes de processar muita informação, e que muita informação é lenta e enfadonha. A Google acredita que os usuários não devem ser assaltados com informação que não é relevante ou aplicável a eles.

Os designers gráficos sabem disso

A arte gráfica reagiu contra a complexidade e confusão desta era pós-moderna abraçando o que alguns têm chamado de "a nova simplicidade". Dê uma olhada em algumas revistas de ponta sobre design gráfico como I.D. ou How, e você verá dicas da revolução do simples.

Ou simplesmente veja o revolucionário do simples John Maeda, um líder no mundo gráfico. Maeda é um professor de Design no MIT (Instituto de Tecnologia de Massachusetts), em Cambridge, Massachusetts (EUA). Em 1999, a revista Esquire o reconheceu como uma das vinte e uma pessoas mais importantes para o século 21. Em 2001, ele também recebeu o mais alto grau de honra na carreira para designers nos Estados Unidos, o National Design Award (Prêmio Nacional de Design), e a mais alta honra da carreira no Japão, o Mainichi Design Prize (Prêmio Mainichi de Design).

Maeda não é apenas um dos mais renomados designers do mundo; ele também é um advogado do simples. Ele é um dos diretores do SIMPLICITY (simplicidade), um programa experimental de pesquisa no Laboratório de Mídia do MIT. A pesquisa foi idealizada para desenvolver tecnologia que seja simples de entender e operar. O objetivo do projeto é ajudar os usuários a se libertarem da complexidade intimidatória e do excesso de informação da tecnologia moderna. É uma revolta financiada contra a complexidade. Maeda também escreve diariamente em seu blog, seu diário eletrônico. O nome de seu blog, como você pode imaginar, é simplicidade.

Southwest Airlines sabe disso

A Southwest é a mais lucrativa e bem-sucedida companhia aérea americana. É também a mais simples. Não há assentos determinados, só grupos. E os grupos se baseiam pelo horário de chegada do passageiro. A comida é mínima.

Também não há aeroportos de conexão. Os aviões voam as menores distâncias entre dois pontos. Em outras palavras você não terá que parar em Atlanta ou Chicago (estas cidades americanas concentram o destino da maioria das conexões aéreas dos EUA) toda vez que pegar um avião. Toda essa simplicidade economiza tempo do passageiro e ganha dinheiro para a companhia.

Papa John's sabe disso

Papa John's faz uma ótima pizza. De acordo com o seu fundador, John Schnatter, o segredo do sucesso de sua empresa é a simplicidade. Veja essa declaração no website deles:

No Papa John's nós temos uma fórmula simples para o sucesso: concentre em uma única coisa e tente fazer isso melhor do que qualquer outro. Mantendo o cardápio do Papa John's simples nós conseguimos concentrar na qualidade de nosso produto usando somente ingredientes de alta qualidade.

As pessoas incorporaram o cardápio simples e a filosofia simples. O que começou como uma simples loja há pouco mais de vinte anos se transformou na terceira maior franquia de pizzas dos Estados Unidos.

Designers de interior sabem disso

Real Simple é o nome de uma revista popular e site de design interior (www.realsimple.com). As pessoas estão reagindo ao conceito. Real Simple é a revista de maior sucesso lançada nos últimos dez anos. A revista promove designs interiores simples e ensina os leitores a manterem a casa, a cozinha e as refeições simples.

Até mesmo a rainha do design interior, Martha Stewart, conhece o "simples". Não porque ela tenha vivido a vida simples em uma cela de prisão, mas porque ela defende o design simples. Perfeito e simples são duas palavras que comumente se ouve em seu programa e se vê em seus artigos.

Os gurus do marketing sabem disso

Os executivos de propaganda e marketing estão usando slogans e propagandas simples. Você sabe disso porque tem visto. Mas isso não é tudo. A revolução é mais profunda do que isso. Eles estão marqueteando os seus produtos como soluções para nossa vida complicada. A mensagem é: "Este produto vai simplificar a sua vida". Eles sabem que as pessoas se interessam pelo simples.

Em um notável livro de marketing, "Simplicity Marketing", Steven Cristol e Peter Sealy ensinam executivos a colocarem seus produtos prometendo aos clientes uma vida mais simples. Eles argumentam que uma marca eficiente vai reduzir o estresse do cliente. O valor que muitos produtos oferecem é a redução da saturação.

Veja o exemplo da propaganda da Dieta de South Beach. O mercado de dietas está saturado. Novas dietas e estratégias para perder peso aparecem o tempo todo, mas a Dieta de South Beach prometeu aos clientes em potencial o que as outras falharam em oferecer: simplicidade e menos estresse.

O fundador e autor do movimento Dieta de South Beach explica a essência de sua dieta assim: "O que começou como um investimento de tempo parcial no mundo da nutrição me levou a desenvolver uma dieta simples, medicamente segura e sem estresse para a maioria das pessoas que tentam". Você viu? Simples e sem estresse. Além disso, um jeito de ter a sua sobremesa favorita sem açúcar, o que mais se pode querer?

Ok. Acho que agora você já percebeu. O simples é o que há. O simples funciona. As pessoas reagem ao simples. Mas este livro é para aqueles que estão apaixonados pelo ministério da igreja. Essa revolução do simples tem alguma coisa de relevância para a igreja e seus líderes?

Continue lendo.

Igrejas crescentes e vibrantes sabem disso

Em nossa extensa pesquisa, com mais de quatrocentas igrejas evangélicas, descobrimos a revolução da Igreja Simples. Comparamos igrejas vibrantes e que crescem com igrejas que não crescem e lutam com dificuldades. Líderes dos dois grupos de igrejas responderam ao mesmo questionário, que foi preparado para medir quão simples era o processo de discipulado delas.

Esperávamos que as igrejas vibrantes tivessem melhores resultados. Acreditávamos que houvesse uma relação direta entre um processo simples e a vitalidade da igreja, mas os resultados foram muito maiores do que imaginávamos. Nosso consultor de estatística disse que descobrimos algo grande.

Haverá mais discussão sobre este estudo em outros capítulos, mas aqui está uma conversa de elevador: as igrejas vibrantes são muito mais simples em comparação com as outras. A diferença é tão grande que a possibilidade dos resultados ocorrerem com uma igreja por acaso é menor do que um para mil. O pessoal da estatística chama esta taxa de "nível .001".

Quando um pesquisador encontra uma taxa de "nível .05", ele liga para os seus amigos e conta vantagem. Ele sabe que achou algo que vale a pena. Quando um pesquisador encontra algo com a taxa "nível .01", ele liga para o seu editor e se prepara para escrever. Encontrar algo do "nível .001" não acontece com frequência. É fora de série. Se você é chegado em estatística, isso é "altamente significativo".

A relevância é que em geral as Igrejas Simples são vibrantes e crescem. As igrejas com processos simples de alcançar e amadurecer as pessoas estão expandindo o Reino. Os líderes de igreja que prepararam um processo simples de fazer discípulos estão efetivamente avançando o movimento do evangelho. As Igrejas Simples estão causando um grande impacto.

Por outro lado, Igrejas Complexas estão anêmicas e com dificuldades. Igrejas sem um processo ou com processos complicados de fazer discípulos estão patinando. Como regra geral, igrejas pesadas e complexas não são vivas. Nossa pesquisa mostra que essas igrejas não estão crescendo. Infelizmente, a igreja ocupada e cheia de atividades é o padrão. A Igreja Simples é a exceção, porém nossa pesquisa mostra que não deveria ser assim.

A revolução da Igreja Simples já começou.

A maioria das igrejas está muito ocupada para perceber isso. Elas estão à margem do movimento, bem longe da revolução que está acontecendo.

O que não estamos dizendo

Primeiro, não estamos sugerindo que a abordagem simples do ministério é uma mudança de doutrina ou convicção. Thom já escreveu vários livros sobre a primazia da boa, bíblica e ortodoxa doutrina para igrejas que crescem. Neste assunto não tem acordo.

Segundo, não estamos dizendo que as igrejas devem ser simples porque está na moda ou é culturalmente chique. A revolução vai contra a moda cultural. As igrejas que são simples não estão espelhando a cultura. Elas não estão imitando o mundo com o objetivo de alcançar o mundo.

Na verdade é o oposto. Você precisa entender isso!

A cultura não é simples. Nem perto disso. Nosso mundo não é simples. Diariamente lidamos com um excesso de informação e decisão. À medida que o mundo vai ficando cada vez menor (globalização através da tecnologia), as coisas vão ficando mais e mais complexas. No meio de todo este barulho, toda essa correria, todas as mudanças, todos os negócios e toda a incerteza, as pessoas anseiam por simplicidade.

Exatamente porque as coisas estão tão corridas e fora de controle é que as pessoas reagem ao simples. A ocupação e a complexidade da vida tornam o simples um grande produto, algo desejado. Igrejas Simples sabem disso intuitivamente. E porque estão consumidas com o chamado para fazer discípulos elas implantaram um formato simples de ministério eclesiástico. Prepararam um processo simples de alcançar e amadurecer pessoas. Portanto, essas igrejas estão atraindo a atenção e o compromisso das pessoas.

Terceiro, não estamos dizendo que as igrejas devem ter processos simples por razões pragmáticas (embora esteja funcionando). O mais importante é que hajam alicerces teológicos e filosóficos sobre os quais os processos simples se estabelecem. Vamos lidar com isso por todo o livro, mas aqui vai uma prévia: embora Deus jamais mude, ele escolheu trabalhar através de um processo divino.

Por exemplo, Deus escolheu criar o universo através de um processo sequencial e organizado. O amadurecimento da criação, inclusive o homem, acontece num processo. O crescimento espiritual (santificação) é o processo no qual o crente é transformado na imagem de Cristo. As Igrejas Simples decidiram se alinhar com o jeito de Deus trabalhar. Elas decidiram fazer parceria com o processo de discipulado revelado nas Escrituras. Escolheram estruturar a igreja em torno de processos simples.

Quarto, também não estamos declarando que o design da Igreja Simples é fácil. Há uma grande diferença entre simples e fácil. Simples é básico, descomplicado e fundamental. Fácil é sem esforço.

O ministério jamais será fácil. É confuso e difícil porque pessoas são confusas e difíceis. Um processo simples não é fácil de implantar ou manter. Liderança na igreja local é extremamente desafiador. Liderar uma igreja local não é nem fácil nem simples, mas a estratégia de uma igreja não tem que ser complicada. O design do ministério pode e deve ser simples.

O revolucionário

Se alguém sabe sobre simplicidade, esse é Jesus.

Se alguém é revolucionário, esse é Jesus. Ele é o revolucionário original do simples. Ele entrou num cenário religioso complicado e poluído. Estava congestionado com os saduceus, fariseus, herodianos, zelotes e essênios. Ele não seguia as regras deles; não aguentava a hipocrisia deles. Ele preferia gastar seu tempo com cobradores de impostos e pecadores.

Os líderes judeus haviam desenvolvido um sistema religioso com 613 leis. Eles escolheram o número 613 porque este era o número de letras do texto dos dez mandamentos. Acharam 613 mandamentos no Pentateuco (os primeiros cinco livros do Antigo Testamento). Dividiam esta lista em dois tipos: mandamentos afirmativos (faça isso) e mandamentos negativos (não faça isso).

Havia 248 mandamentos afirmativos, um para cada parte do corpo humano, como eles assim entendiam. Havia 365 mandamentos negativos, um para cada dia do ano. Depois eles dividiram a lista em mandamentos compulsórios e não compulsórios. Então passavam os seus dias discutindo se aquela divisão e a classificação dos mandamentos dentro de cada divisão eram adequadas.

Entra Jesus. Jesus tem a habilidade de tomar o complexo e transformá-lo em simples. Um exemplo clássico é Mateus 22.37-40, onde Jesus dá o que ficou conhecido como o Grande Mandamento. Aqui está a cena. Jesus acabara de desbancar os saduceus. Literalmente! Ele os silenciou com sua sabedoria (Mateus 22.34). Os próximos eram os fariseus. Quem sabe eles conseguem fazer melhor e derrubar este revolucionário.

Os fariseus se juntam para uma reunião. Eles preparam uma estratégia para o debate. O objetivo deles é humilhar a Jesus diante da multidão. Escolhem o mais inteligente entre eles, um advogado, para enfrentar Jesus. Ele pergunta a Jesus qual é o maior mandamento na lei. De todos os 613 mandamentos ele está perguntando a Jesus qual é o maior. Jesus respondeu: "Ame o Senhor, o seu Deus de todo o seu coração, de toda a sua alma e de todo o seu entendimento. Este é o primeiro e maior mandamento. E o segundo é semelhante a ele: Ame o seu próximo como a si mesmo. Destes dois mandamentos dependem toda a lei e os profetas".

Pense na importância daquele momento. Ele disse que toda a lei (e acrescentou os profetas) está resumida nesta frase simples e perfeita. Jesus não estava diminuindo o padrão da lei. Não estava abolindo a lei. Ele estava captando todo o seu espírito, toda a sua essência, em uma única afirmação. Jesus disse que tudo depende disso. Ele resumiu 613 mandamentos em dois. Jesus pegou a complexidade e o desenvolvimento da lei e tornou-a muito simples.

O seu jugo

Jesus era um rabino, um mestre. Na cultura judaica, cada rabino tinha uma carga de ensino. Sua carga era a sua instrução, seu contentamento e sua mensagem. Muitos rabinos colocavam cargas de ensino sobre as pessoas que eram impossíveis e legalistas. Essas cargas empurravam as pessoas para longe da graça de Deus em vez de atraí-las.

Essas cargas estressavam as pessoas e as desanimava. Jesus entrou neste cenário e um dia disse à multidão:

Venham a mim, todos os que estão cansados e sobrecarregados, e eu lhes darei descanso. Tomem sobre vocês o meu jugo e aprendam de mim, pois sou manso e humilde de coração, e vocês encontrarão descanso para as suas almas. Pois o meu jugo é suave e o meu fardo é leve. (Mateus 11.28-30)

Jesus disse "meu jugo é suave". Os seus ensinos estavam em total contraste com o dos rabinos religiosos de seus dias. Ele não estava oferecendo um conjunto longo e complicado de leis, regras e regulamentações. Ele estava oferecendo graça. Ele estava oferecendo um relacionamento simples com Deus.

Jesus e congestionamento

Como um revolucionário do simples, Jesus se sentia incomodado com as regras sem sentido e desfocadas. Pelo menos uma vez Jesus limpou o templo. O templo parecia ser um lugar onde as pessoas iriam buscar a Deus, mas essa não era a realidade. As pessoas haviam perdido o foco. Marcos descreve três áreas que estavam congestionadas e que deixavam Jesus furioso.

Primeiro, as pessoas estavam comprando e vendendo no templo. As pessoas que vinham adorar a Deus tinham que comprar os sacrifícios. Os líderes permitiram que os vendedores montassem um shopping no templo. Os historiadores revelam que tradicionalmente os vendedores ficavam instalados fora do templo. Agora o "camelódromo" era dentro da área do templo. A reação de Jesus foi expulsar aqueles que estavam vendendo pombas.

Segundo, os cambistas estavam trocando o dinheiro para os gentios. Os gentios precisavam de dinheiro judeu para comprar os sacrifícios e eles eram explorados através da taxa de câmbio. Em vez de o templo ser uma casa de oração para os gentios (todas as nações), estava cheio de gente os roubando financeiramente. A reação de Jesus foi derrubar as mesas dos cambistas.

Terceiro, o templo se tornara um atalho para as pessoas atravessarem a cidade. As pessoas estavam usando o pátio dos gentios para transportar coisas. Jesus acabou com isso.

O seu comportamento no templo nos dá uma visão extraordinária do coração de Deus. Jesus é terminantemente contra qualquer coisa que dificulte o caminho para as pessoas se encontrarem com Deus. Naquele dia ele citou Isaías dizendo:

"Não está escrito, 'A minha casa será chamada casa de oração para todos os povos?' Mas vocês fizeram dela um 'covil de ladrões'" (Marcos 11.17).

Muitas de nossas igrejas se tornaram complexas. Tão complexas que as pessoas têm dificuldade de se encontrar com a mensagem simples e poderosa de Cristo. Tão complexas que muitas pessoas estão ocupadas fazendo igreja em vez de ser igreja.

Caixões "top de linha"

Em Mateus 23 Jesus confrontou os líderes da hipocrisia e complexidade espiritual. Tudo parecia muito bonito por fora, mas por dentro era deplorável. Ele também disse a eles que eles eram como sepulcros caiados ou caixões "top de linha". Tudo era muito bem apresentado. Mas por baixo daquela beleza havia morte. Por trás das aparências havia um vazio.

Igual a muitas igrejas.

O acúmulo de coisas pode fazer parecer que está tudo bem. O excesso de atividade é um ótimo disfarce para a falta de vida. A complexidade é uma grande desculpa. Às vezes as igrejas podem ser como caixões "top de linha".

Vários líderes de Igrejas Complexas com quem falamos admitiram que as suas igrejas cheias de atividades tinham necessidade de vida. Muitos sabiam que no seu calendário lotado faltava direcionamento. Vários também admitiram que toda aquela atividade produzia pouco impacto. Geralmente uma grande quantidade de atividades não gera mudança de vida. Apenas dá a impressão que as coisas estão acontecendo e que há vida.

O líder de uma Igreja Complexa comentou: "o projeto confirmou uma realidade que eu demorei em admitir: não estamos percebendo a transformação espiritual na vida das pessoas. Ficamos satisfeitos em estar ocupados".

Outro nos mandou um e-mail dizendo: "responder à sua pesquisa me mostrou quão desesperadamente nós precisamos desenvolver um processo simples de transformação espiritual. Neste momento apenas temos muitas programações. Já comecei a avaliar tudo que estamos fazendo".

Talvez estejamos perdendo terreno não "apesar" da nossa superabundância de atividades, mas "por causa" dela.

A vida não tão simples

O Pr. Rush está em seu gabinete. Antes de retornar aos telefonemas e e-mails ele resolve esvaziar a sua pasta. Pega suas anotações da conferência, mais alguns CDs e um manual que comprara. Coloca esse material na estante.

O novo material agora está guardado junto com o material de outras conferências. Ele já viu o número suficiente de programas e modelos de igreja. A maioria é coisa boa e funcionou em algum lugar, menos aqui. Pelo menos ainda não! Não da forma como ele sonhava, imaginava e orava.

Ele se lembra do conselho que recebera de um palestrante numa conferência: selecione as melhores idéias de outras igrejas e implante-as em sua própria igreja. Tentou fazer isso. Pegou várias partes de diferentes modelos de igreja. Programou uma imensidão de atividades. A igreja do Pr. Rush está vivendo uma esquizofrenia ministerial.

A esquizofrenia não é uma doença clínica. Você não vai encontrar nos livros de psicologia, mas ela está presente em muitas igrejas. Você já a percebeu antes, apenas não diagnosticou como esquizofrenia ministerial. Ela está tomando conta da igreja local como uma praga. Acontece quando igrejas e líderes de igrejas não sabem quem eles são. Não está claro para eles qual é a sua identidade fundamental. Correm de forma desordenada e frenética.

Acontece com mais frequência quando as igrejas tentam misturar vários modelos de igreja em um só. Elas o fazem com boas intenções. Como o Pr. Rush, os líderes de igrejas são encorajados a escolher o melhor no meio de uma variedade de modelos de igreja. O problema é que a filosofia por trás de cada modelo varia. Às vezes varia pouco; mas às vezes varia muito. Inevitavelmente uma multiplicidade de filosofias de ministério vai acabar criando colisões; e isso nunca é agradável.

Quando filosofias de ministério trombam, a esquizofrenia acontece. A igreja não tem certeza de quem ela é. Os programas e ministérios caminham em muitas direções. É como se a igreja tivesse várias personalidades. Ninguém sabe exatamente o que esperar.

A esquizofrenia espiritual não é propriamente um ambiente favorável à transformação espiritual. As pessoas são levadas para um lado, depois para outro. Com certeza não é este o quadro que Paulo pintou da igreja na qual os crentes deveriam "permanecer firmes num só espírito, lutando unânimes pela fé evangélica" (Filipenses 1.27).

O Pr. Rush senta-se em sua cadeira e olha para a estante cheia de recursos. Ele tem a sensação de que a igreja não está caminhando numa direção clara e coerente. Sabe que algo precisa mudar, sente a pressão. A expectativa da diretoria, da equipe e dos outros é grande. Porém, as suas expectativas e o seu fardo são muito maiores.

Algo tem que mudar, mas o Pr. Rush não sabe por onde começar. Ele entende "o que". Até tem uma noção "do que" a igreja deveria estar fazendo. Acredita que a igreja deveria estar comprometida com evangelização, oração, ajudar as pessoas a construir relacionamentos com outros crentes, ver as pessoas crescendo em profundidade no serviço e na adoração.

Ele também tem uma noção do "por que". Deseja profundamente que Deus seja glorificado. Mas está com dificuldades no "como". Uma questão está queimando a sua mente: como posso estruturar tudo isso para que o conjunto faça discípulos?

Ele está começando a diagnosticar o problema. Não há um programa de discipulado que consiga colocar todas as coisas juntas. Não existe um processo claro no qual se coordena um ministério e mantém todos no mesmo patamar. Não há uma visão abrangente. O Pr. Rush implantou programas e ministérios sem perguntar qual a contribuição deles para o todo.

Como em muitas igrejas, o sucesso na igreja do Pr. Rush é medido pelo desempenho de uma determinada atividade. As partes são avaliadas, mas nunca o todo. Ele nunca avaliou cada programa semanal à luz de um processo simples de discipulado. Na verdade, não há nenhum processo: não há nem um começo, nem um final claro. Há apenas um amontoado de programações.

O Pr. Rush está tendo um daqueles momentos: "ah, agora eu entendi". Talvez você esteja também. Esses momentos são sagrados, mas também são amedrontadores. Eles são sagrados porque levam a mudanças, e são amedrontadores pelo mesmo motivo, levam a mudanças.

O Pr. Rush sente simultaneamente um alívio e uma frustração. Alívio porque ele está percebendo o problema, e frustração porque ele sabe que o problema existe. Ele e a sua equipe estão apenas fazendo as programações funcionarem. Ele se comprometeu com o ministério para fazer discípulos, e se tornou um gerenciador de atividades.

Ele não observou a floresta porque ele está ocupado com cada uma das árvores. O Pr. Rush sabe que tem que dar um passo atrás. Precisa olhar para sua igreja com novos olhos.

Ele precisa observar o quadro todo.

Vendo o quadro completo

José Diaz viu o quadro completo. Um dos dias mais felizes da sua vida foi domingo de manhã, 7 de agosto de 2005. Aconteceu na Christ Fellowship em Miami (na igreja em que Eric serve como pastor-executivo). Pela primeira vez José pode participar do culto sentado ao lado de seu pai, Luís Diaz. Luis já se tornara cristão há muitos anos, mas nunca havia ido à igreja com seu filho José.

Ele não podia. Ele estivera na prisão por 26 anos.

No domingo, 7 de agosto de 2005, eles participaram juntos do culto. Luis Diaz havia sido libertado há quatro dias porque um teste de DNA havia provado a sua inocência. Ele havia sido condenado por engano. Por causa dessa nova evidência ele não era mais tido como o estuprador da "Bird Road" - Estrada do Pássaro. Tornou-se um caso de repercussão nacional.

O estuprador da Bird Road esteve vagando de 1977 a 1979. Muitas vítimas o descreveram como homem latino que falava inglês, 1,80m de altura, pesando cerca de 90 kg. Ele às vezes roubava coisas das vítimas.

Depois de ser atacada, uma primeira vítima identificou Luis Diaz no posto de gasolina onde ela trabalhava.

Quatro dias depois ela deu a polícia uma descrição: homem latino, 1,80m de altura, pesando cerca de 90 kg, falando inglês e tem um carro de duas portas verde ou preto. Luis Diaz havia estado no posto com seu Chevrolet verde de quatro portas. A vítima chamou a polícia informando o número da placa do carro, e depois o identificou como seu violentador através da foto na carteira de motorista dele. Luis Diaz pesava cerca de 60 kg, e tinha apenas 1,60 de altura. Ele era casado, tinha três filhos e não falava nada de inglês. Desta vez não registraram queixa.

Os ataques continuaram e o povo foi ficando cada vez mais preocupado. A polícia se concentrou em Luis Diaz. Outra vítima o identificou numa série de fotos. Ele foi preso em agosto de 1979. Dois dias depois, quatorze vítimas participaram de uma identificação pessoal. Cinco vítimas identificaram Diaz. Mais tarde várias outras vítimas identificaram Luis Diaz através de vídeo. Os procuradores levantaram oito acusações contra ele.

Luis Diaz insistia que era inocente e foi a julgamento em maio de 1980. Não havia nenhuma evidência física que ligasse Luis Diaz ao crime. Uma busca na casa de Luis Diaz não encontrou nenhum objeto roubado das vítimas. Nenhuma arma jamais foi encontrada. No carro de Luis Diaz não havia nem sêmen nem sangue, embora quatro vítimas tenham sido atacadas dentro do carro do estuprador. A maioria das vítimas havia descrito o estuprador como mais alto e mais pesado.

Por causa do seu trabalho como cozinheiro, Luis Diaz cheirava a cebola depois do seu turno de trabalho à noite. Nenhuma das vítimas mencionou nenhum odor. Apesar de todas as evidências em contrário, Luis Diaz foi considerado culpado e condenado a várias prisões perpétuas.

Em 1993, duas vítimas mudaram a sua identificação sobre Luis Diaz. José, seu filho, começou a pesquisar sobre testes de DNA e como eles poderiam ser usados para mudar condenações erradas. Sabia que seu pai era inocente. Ele escreveu cartas e fez parcerias com grupos como "Projeto Inocência" (Innocence Project) para conseguir uma autorização para um teste de DNA. Testes de DNA com duas vítimas provaram que a mesma pessoa as havia estuprado. E não era Luis Diaz.

Todas as acusações foram retiradas e Luis Diaz foi libertado depois de vinte e seis anos.

José Diaz pressionou para ter a evidência do teste de DNA. José Diaz insistiu em ver o quadro completo. Ele viu a floresta e não apenas as árvores no caso de seu pai.

Os poucos testemunhos eram apenas partes do quadro, uma árvore na floresta. O quadro completo envolvia a evidência física, testes de DNA, falta da arma e os antecedentes policiais. O quadro completo contava uma história diferente. José deu um passo atrás e observou com novos olhos. E ele convenceu outros a fazerem o mesmo. Porque José estava comprometido com o quadro completo, fez parte do processo que libertou seu pai.

Como José Diaz, líderes de igreja são chamados a libertar prisioneiros. Não de cadeias físicas, mas de cadeias espirituais. Os líderes são chamados a oferecer liberdade àqueles que estão presos pelo pecado (veja Lucas 4.18).

Como José Diaz os líderes de igreja precisam ver o quadro completo. Os líderes precisam ver a floresta e não apenas as árvores. Para ser simples é preciso ver o quadro completo. O congestionamento geralmente toma conta porque os líderes veem apenas em parte. Mais e mais coisas são acrescentadas sem se entender como isso afeta o todo.

Para se ter uma Igreja Simples os líderes precisam garantir que tudo que a igreja faz forma um conjunto para produzir mudança de vida. Eles precisam preparar um processo simples que mantém tudo junto, um processo simples que leva as pessoas à maturidade espiritual.

Designers

Líderes de Igrejas Simples são designers. Eles produzem oportunidades para o crescimento espiritual. Os líderes de Igrejas Complexas são programadores. Eles tocam programas de ministérios.

Os líderes de igreja que são programadores focam em uma atividade de cada vez. O seu objetivo, embora eles nunca falem isso, é fazer de cada atividade a melhor. Líderes de igreja que são designers estão focados no resultado final, no quadro completo. Estão preocupados tanto com as atividades em si como com o que acontece entre elas.

Os líderes de Igrejas Simples que pesquisamos eram designers, especialistas. Não eram os produtores de crescimento espiritual e de vitalidade na igreja. Só Deus é o produtor de crescimento. Mas como o apóstolo Paulo, esses líderes de igreja eram especialistas em construção (veja 1Coríntios 3.10). Organizaram bem o ambiente onde a produção de vida se torna propícia. Eles prepararam um processo simples que conduz as pessoas pelos estágios do crescimento espiritual.

Para se ter uma Igreja Simples é preciso preparar um processo simples de discipulado. O processo precisa ser claro. Precisa conduzir as pessoas à maturidade. Ele precisa estar totalmente integrado à igreja e é preciso se desvencilhar de todo o congestionamento em torno dele.

É muito mais fácil escrever e ler este parágrafo do que colocá-lo em prática. Líderes de igreja têm dificuldade para implantar processos. Na verdade, os líderes de igreja admitem que esta é a maior dificuldade deles no ministério. Eles são muito fracos em preparar um processo compreensivo para suas igrejas como um todo. Não é de se surpreender que a maioria das igrejas esteja estagnada ou diminuindo. É difícil de ver a floresta quando os líderes estão constantemente trombando com as árvores.

Junte-se a nós para explorar a revolução da Igreja Simples. Você não só verá os resultados de uma pesquisa extensiva, mas também vai aprender a ser um designer. Você vai aprender a preparar um processo simples de discipulado.

Imagine uma igreja na qual você como líder pode articular claramente a formação de uma pessoa que começa a caminhada cristã e, com o passar do tempo, se torna um seguidor maduro de Cristo. Imagine que sua igreja não é mais apenas ocupada, mas viva com ministérios e atividades que fazem diferença.

Assim é a revolução da Igreja Simples. Bem-vindo à jornada.

No final de cada capítulo nós incluímos "Perguntas para discussão em grupo". Encorajamos que você discuta os conceitos apresentados neste livro com uma equipe. Use essas questões com a sua equipe e voluntários que servem com você.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Em nossa cultura qual tem sido a resposta das pessoas ao simples?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quais as maneiras em que você se relaciona com o Pr. Rush?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Se você pudesse dar um conselho ao Pr. Rush, qual seria?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$A nossa igreja é simples ou complexa? Por quê?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Por que é tão difícil ver o quadro completo no ministério?$p$, 'reflexao', null),
    (v_aula_id, 6, $p$O que você acha que é necessário para se preparar um processo para o ministério da igreja?$p$, 'reflexao', null),
    (v_aula_id, 7, $p$Onde você se encontra nesta escala? (Programador ... Designer)$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 2 — A Igreja Simples (e a não tão simples) em ação  (aula ordem = 3)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 3;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 2 — A Igreja Simples (e a não tão simples) em ação$t$,
      3,
$conteudo$Ser simples é ser grande.
— Ralph Waldo Emerson

Nós dois possuímos casa na Flórida. A Flórida é ótima, especialmente o sul da Flórida (Thom/Naples, Eric/Miami). A cultura é rica. A comida é incrível. A água é linda. E a lista só cresce: o clima, as praias, as palmeiras, o sol, a pescaria, frutas frescas, a lagosta, o caranguejo, o mergulho e um fantástico "Futebol (Americano) Universitário". E o clima.

Já falei do clima?

O clima é o cartão de visitas. Clique em "weather.com" durante o inverno e confira o clima no sul da Flórida antes de você sair para limpar a neve, colocar uma camisa de flanela, ou tomar o seu remédio para gripe. Desculpe incomodar, mas estou só falando a verdade em amor.

As fotografias não conseguem captar plenamente o clima maravilhoso. Você não consegue realmente sentir através dos guias turísticos disponíveis nas livrarias. Palavras e imagens não são suficientes. Você tem que experimentar. Tem que observar de perto. O vento fresco do oceano. A brisa assobiando entre as palmeiras. O ar refrescante. O sol quente. O clima precisa ser experimentado, cheirado e sentido... em fevereiro.

O clima é o cartão de visitas.

Exceto durante a temporada de furacões. O pessoal da Flórida agora fala grego — não porque são ativos na igreja onde o pastor prega a partir do texto original. Eles sabem grego porque o alfabeto grego foi usado para dar nome aos furacões. A recente temporada de furacões foi a pior de todas.

Uma temporada ativa de furacões torna desejável o inverno no Nordeste ou Centroeste. Bem, quase...

O noticiário não capta plenamente o clima num furacão: a ansiedade, a espera. Assistir ao cone do erro (ou cone da morte) no noticiário imaginando se vai atingir e onde vai atingir. Colocar as proteções de janela, estocar água, ter gasolina para o gerador. Os furacões são um transtorno mesmo antes de chegar.

Se um furacão nos atinge, toda a vida muda. Muito mais do que pode ser compreendido através do noticiário. Mais do que se pode absorver pela leitura de um artigo. Mais do que pode ser sentido navegando pelas imagens na Internet.

As pessoas que sobreviveram ao furacão Andrew, em Miami, em 1992, ainda falam sobre ele. É um marco! Há a vida "antes do Andrew" e a vida "depois do Andrew". Andrew foi um furacão de categoria cinco, a pior possível. Somente três furacões de categoria cinco chegaram aos Estados Unidos desde que se mede furacões. Andrew foi também o desastre natural mais caro na história dos Estados Unidos, antes do Katrina atingir Nova Orleans e a costa do golfo do México.

As imagens e o noticiário não poderiam jamais captar o que as pessoas experimentam. Uma noite de terror. O assobio do vento, os tornados, o som das casas sendo destruídas. A manhã seguinte quando não se reconhece nada, semanas sem energia, meses sem telhado. A perda de tudo.

Palavras e imagens são insuficientes.

Para captar, tanto o maravilhoso como terrível clima da Flórida, você tem que experimentá-lo. É a única maneira pela qual você pode realmente senti-lo. A experiência leva ao entendimento. Muitas coisas na vida têm que ser observadas durante a ação para que possam ser plenamente entendidas. Para entender completamente você tem que estar lá.

Simplesmente tem que experimentar.

Você alguma vez usou esta frase para descrever alguma experiência que teve? Algo que experimentou, mas não consegue descrever direito. O momento foi tão poderoso, foi claro e vivo, reverberou profundamente dentro de você. E tem dificuldade para descrevê-lo. Então desiste de tentar explicar; então resume: "você tinha que ter estado lá".

Este é o caso com a "Igreja Simples".

Você tem que estar lá. Tem que ver em funcionamento.

OLHANDO SIMPLES

Nós vimos. Observamos a Igreja Simples funcionando. Nós queremos que você também veja. Queremos que você esteja lá. A pesquisa e as suas implicações farão muito mais sentido se você puder ver. Os dados vão influenciá-lo mais se você puder estar lá. Então, está convidado.

Estamos convidando você a se juntar a nós numa consultoria. Vamos ver a Igreja Simples funcionando. E você vai ver uma igreja não tão simples.

Algum tipo de consultoria eclesiástica pode ser feita por telefone ou por e-mail. Recomendações em assuntos como estacionamento, planejamento da equipe, programa de implantação e análise comunitária não requer uma visita necessariamente. Por exemplo, deve haver estacionamento suficiente para atender a capacidade do auditório e do edifício de educação religiosa (incluindo os jovens e as crianças). A média é 1,8 pessoa por espaço de estacionamento. A igreja deveria planejar para oferecer opções de estacionamento baseadas nesta estimativa, para que o estacionamento não funcione como uma tampa que impedirá o crescimento. Uma consulta como esta pode acontecer por telefone.

Esse tipo de consulta, porém, tem seus limites. Relatórios e fotos não são suficientes. A cultura de uma igreja não aparece no papel ou ao telefone. A cultura da igreja é sentida, é percebida. Ela é sentida, cheirada, degustada e observada em funcionamento. Só pode ser alcançada mediante uma visita local.

Navegar no site é como uma visita de vários dias às instalações físicas da igreja. Antes de uma visita, a igreja é avaliada no papel para que o aproveitamento da visita seja maximizado. Reuniões da equipe, os cultos e a interação entre as pessoas precisa ser observada. Entrevistas pessoais serão feitas com a equipe e com os voluntários. Uma análise é feita sobre a saúde, a cultura e o potencial da igreja.

Neste capítulo você vai se juntar a nós para uma consultoria ao vivo com duas igrejas. Uma das igrejas é uma Igreja Simples. A outra não é. Elas têm um tamanho e um ambiente parecido. Ambas as igrejas são reais, mas os seus nomes foram trocados.

Você vai ver o que nós vimos e ouvir o que ouvimos. Veja abaixo da superfície. Observe as coisas com um novo olhar. Escreva as suas observações. Pense criticamente, analise e avalie. Esteja lá.

PRIMEIRA IGREJA

Nossa primeira visita é à Primeira Igreja. A Primeira Igreja já existe há quarenta anos. Ela é reconhecida em sua denominação como sendo uma igreja sólida com ótimas programações. Na verdade, algumas igrejas até copiaram as suas programações. Ela é conhecida também por ter em sua equipe pessoas talentosas e bem conhecidas. Os membros da equipe dela são do tipo que dão palestra em eventos, oram no púlpito das convenções e escrevem artigos.

A igreja está estagnada há cinco anos. Não tem crescido e um número mínimo de pessoas tem conhecido a Cristo. Embora as coisas não estejam fantásticas, ela está bem. A igreja tem passado por mudanças na equipe, mas sem grandes transtornos. Tem havido algum desconforto na congregação, mas nenhum grande racha. Em outras palavras ela ainda não está em crise.

E sem chegar à crise é difícil mudar.

IGREJA DA CRUZ

Nossa segunda visita é a Igreja da Cruz. A Igreja da Cruz não é tão conhecida. Nunca tínhamos ouvido falar da igreja até a consultoria. Está num local do país bem menos conhecido e não reconhecemos o nome de ninguém em sua equipe.

A igreja existe há pouco menos de vinte anos. Nos últimos anos ela cresceu muito. A análise inicial foi empolgante. As pessoas conheceram a Jesus e permaneceram na igreja. Elas se engajaram no ministério e estão contribuindo para o corpo de Cristo.

DECLARAÇÕES DA PRIMEIRA IGREJA

Na viagem para a Primeira Igreja revisamos vários documentos que a igreja nos mandara. A maioria das igrejas tem este tipo de documentos: boletins, cartas circulares, manual de trabalho, orçamento anual, divulgações e propagandas ministeriais. Nós os lemos procurando discernir o foco da igreja, as principais prioridades, e a abordagem ministerial.

A maioria das igrejas tem muita informação para comunicar, mas a Primeira Igreja tem muitas declarações. Há uma declaração de missão, uma declaração de propósito, uma declaração de visão, e uma declaração de estratégia. Uma declaração é diferente da outra; e todas são longas.

Olhando o material dos ministérios percebemos que cada departamento também tem declarações diferentes. Cada declaração tem o objetivo de descrever o foco ou a direção da igreja. Há mais de dez declarações diferentes no material que revisamos.

O que isso significa?

A declaração de missão impressa no boletim é "levar as pessoas não salvas a se tornarem seguidores totalmente comprometidos com Cristo". Obviamente alguém foi influenciado pelo ministério da Igreja Willow Creek. A declaração de propósito impressa no folder da igreja mostra cinco palavras com "M": Magnificação, Multiplicação, Maturidade, Ministério e Missão. Algum líder foi impactado por Rick Warren e o movimento da Igreja com Propósitos. A declaração de visão no material impresso é "amando esta comunidade para Cristo". Ou seria essa uma declaração de estratégia?

Seja como for, era mais uma declaração.

Seria mais fácil memorizar o livro de Tiago do que memorizar todas essas declarações... e muito mais vantajoso.

As declarações têm alguma coisa a ver umas com as outras? Será que elas refletem como a igreja na realidade exerce o seu ministério? Ou simplesmente estão colocadas no alto de uma estrutura ou paradigma já existente? A confusão com muitas declarações indica que talvez haja uma multiplicidade de filosofias e abordagens ministeriais no mesmo lugar. É particularmente difícil perceber como que todas essas declarações se encaixam.

Não temos certeza de qual é o foco da igreja. Esses documentos não deixam isso claro. Talvez as entrevistas com a equipe e com os líderes leigos-chave poderão esclarecer. Entramos no estacionamento. Você está feliz de estar aqui... e vivo. E pensa consigo mesmo, Thom é realmente um mau motorista.

ENTREVISTANDO O PASTOR DA PRIMEIRA IGREJA

Encontramo-nos rapidamente com o pastor da Primeira Igreja. Ele é simpático e estava animado com o tempo que íamos passar juntos. Você pode perceber que ele se vê lutando entre dar a impressão que está tudo certo e admitir que está frustrado. Ele se tornou muito incomodado e cansado com a atividade em sua igreja. Não porque seja preguiçoso, mas porque essas atividades não estão produzindo o fruto espiritual que ele esperava ver.

O pastor também demonstra que sente que a igreja está desajustada e caminhando em múltiplas direções. Ele está empolgado com as grandes coisas que estão acontecendo em vários ministérios na igreja e não gostaria de jogar um balde de água fria naqueles que estão à frente deles. Ao mesmo tempo sente que nem todos estão caminhando na mesma direção.

Perguntamos qual era o seu desejo para a igreja. O que o pastor acredita que Deus está chamando a Primeira Igreja para fazer? Ele fala de uma igreja onde as vidas são transformadas. Bom! Perguntamos como que a sua igreja se organizava para fazer isso acontecer. Ele tem dificuldades de responder. O pastor indica que esta é razão pela qual pediu para que fossemos lá.

ENTREVISTANDO OS LÍDERES DA PRIMEIRA IGREJA

Durante as entrevistas com os líderes leigos perguntamos qual era o foco da igreja. Listamos uma miríade de respostas:

• "preparar ótimas celebrações de cultos e grandes eventos para as pessoas";
• "ter um ministério infantil excelente";
• "cuidar das necessidades da nossa família igreja";
• "enfrentar as injustiças sociais e políticas em nossa comunidade";
• "ter grupos pequenos que sejam relacionais";
• "ter grupos pequenos que ensinam a Bíblia".

De todas as declarações de visão/missão que nós lemos no carro, nenhuma foi mencionada pela equipe ou pelos outros líderes. Nem de perto! As pessoas na igreja não internalizaram aquelas declarações. Eles estão realmente confusos sobre qual é a direção da igreja. Pedimos para a equipe repetir a declaração de visão ou propósito. Poucos foram capazes de fazê-lo. Apesar dos folders bem feitos com declarações bem elaboradas, não está claro "o que" na Primeira Igreja. A igreja não está unida em torno de um propósito singular.

Se "o que" da Primeira Igreja não está claro, o "como" não está nem no radar. Se o propósito está nebuloso, o processo para fazer o propósito acontecer nem apareceu ainda. Quando perguntamos à equipe e aos líderes leigos qual era o processo de discipulado da igreja, todos nos olharam confusos. Perguntamos de várias formas, e várias vezes. Como vocês estruturam a igreja para fazer discípulos? Como vocês organizam a atividade de seus ministérios para levar as pessoas à transformação espiritual? Mais olhares confusos e gente gaguejando.

A melhor resposta: "basicamente, isso simplesmente acontece".

Infelizmente na Primeira Igreja o que deveria "simplesmente acontecer", não acontece.

DECLARAÇÃO DA IGREJA DA CRUZ

A caminho da Igreja da Cruz revisamos o mesmo tipo de material. O número e tipo de folders, cartas circulares, boletins e outros documentos são mais ou menos os mesmos. A qualidade dos boletins e folders é semelhante. O desenho gráfico é equivalente.

Uma grande diferença se apresenta. Há apenas uma declaração — apenas uma.

Enquanto a Primeira Igreja tem muitas declarações, a Igreja da Cruz tem apenas uma. Há um tema geral. Uma declaração, e é pequena. Embora ela seja adaptada para cada faixa etária, a essência é a mesma. Está claro que a Igreja da Cruz existe para "amar a Deus, amar as pessoas, e servir ao mundo". Simples. O seu foco é levar as pessoas a amar a Deus, amar aos outros e servir ao mundo. É claro, conciso, e é reforçado em todos os seus meios de comunicação. Mas ficamos curiosos para saber se isso estava mesmo no DNA da igreja. Estávamos curiosos para saber se esta declaração domina a cultura da Igreja da Cruz. Esta declaração reflete a realidade? Ela direciona os ministérios? Entramos no estacionamento desejosos de entrevistar a equipe e os líderes leigos-chave para saber o que está por trás desta única declaração.

ENTREVISTANDO O PASTOR DA IGREJA DA CRUZ

Quando encontramos o pastor da Igreja da Cruz dissemos a ele que percebemos imediatamente que havia muita consistência com o tema "amar a Deus, amar aos outros, servir ao mundo". Ele deu sinais de que esse era o cerne da igreja.

Você se sente confiante uma vez que esta é a segunda consultoria. Então você vai direto ao ponto e começa um diálogo com o pastor.

"Então, esse é o seu propósito, certo?"

"Eu acredito que você possa dizer isso."

"Fale para nós sobre o seu processo. Como você faz para que o seu propósito aconteça?"

"Amar a Deus, amar os outros, servir ao mundo é o nosso processo".

"Eu pensei que você tivesse dito que era o seu propósito".

"São ambos, nosso propósito e nosso processo."

"Ah."

Interessante, genial, simples! Em vez de um abismo separando o propósito do processo, ambos são um e o mesmo. Em vez de separar "o que" do "como", a Igreja da Cruz os combinou. O propósito e o processo estão casados na Igreja da Cruz. Os dois se tornaram um. O propósito dela (amar a Deus, amar os outros e servir ao mundo) é um processo.

Nós perguntamos a ele o que o havia levado a isso. Isso foi o que aconteceu.

Muitos anos atrás o pastor sabia que algo estava faltando. A cada ano as pessoas visitavam a igreja, se tornavam membros ou se tornavam cristãos. Ainda assim a igreja não estava crescendo. E o número de pessoas que saía era equivalente ao que entrava. A porta de trás era tão grande quanto a da frente.

E o mais importante, as pessoas não estavam sendo transformadas. A igreja não estava saudável. Novos programas e eventos especiais eram implantados constantemente para resolver o problema, mas quanto mais movimentada ficava a igreja, maior o problema se tornava.

Os problemas são sempre maiores quando todo mundo está cansado.

Ele começou a fazer algumas perguntas difíceis. Decidiu dar um passo atrás e observar o todo, ver a floresta e não apenas as árvores. E se convenceu de que o que estava faltando era um processo simples que levasse as pessoas na direção da maturidade espiritual.

O pastor sabia tanto pela Bíblia, como pela experiência que a transformação espiritual é um processo. Ele desejava preparar um processo simples que facilitasse o processo da transformação espiritual. Então se comprometeu a desenvolver um processo de fazer discípulos que fosse harmonioso e que executasse os propósitos da igreja.

O pastor investiu meses orando pelos seus sonhos para a igreja. Estava esperando que algo novo e profundo viesse à tona. Nada de novo ou profundo emergiu. Não houve nenhum momento santo e especialmente espiritual. Continuou orando e lendo. Ele se contentou com um antigo sonho, uma visão antiga: fazer discípulos.

Só para você saber, ele roubou isso de Jesus. Uma visão bíblica plagiada é sempre algo bom.

O sonho do pastor não era nem original, nem único. Era simplesmente "fazer discípulos" (Mateus 28.19), discípulos que se tornariam maduros em Cristo (Efésios 4.13). Esta revelação o levou a um pensamento mais profundo e a mais perguntas. Como deve ser um discípulo maduro? Gastou muito tempo nas Escrituras lidando com esta questão.

Ele acreditava que Deus desejava discípulos que andassem intimamente com Cristo, vivessem em comunidade com os outros e servissem a igreja e o mundo. Estes aspectos do discipulado o fascinavam. Também acreditava que isso era um processo e que as pessoas não se tornavam discípulos assim de um dia para o outro. O pastor começou a se reunir com os outros discutindo como estruturar a Igreja da Cruz de forma a ajudar as pessoas a se tornarem esse tipo de discípulos.

O grupo se reunia e orava. Eles queriam uma visão a qual a igreja pudesse realmente captar. Para eliminar a confusão decidiram que haveria uma única declaração que definiria o processo de discipulado. A que melhor expressava isso foi: "amar a Deus, amar os outros e servir ao mundo".

O pastor explica que a declaração enfatiza o processo de discipulado. Primeiro, a pessoa ama a Deus. Este primeiro passo é o aspecto do discipulado mais básico e essencial, mas não termina aí. Depois que a pessoa desenvolve uma relação de amor com Deus, ele ou ela começa a amar os outros. A pessoa se compromete a crescer comunitariamente com os outros. Depois de amar a Deus e aos outros o resultado natural é servir as pessoas. E o processo continua; é permanente.

ENTREVISTANDO OS LÍDERES DA IGREJA DA CRUZ

Depois do encontro com o pastor entrevistamos alguns membros da equipe e alguns líderes-chave. A grande maioria das pessoas com quem conversamos fala com liberdade sobre amar a Deus, amar aos outros e servir ao mundo. As pessoas na Igreja da Cruz captaram o processo. Descobrimos que este processo é discutido regularmente em reuniões da equipe, de líderes leigos, e frequentemente se faz referência a eles nos cultos. Há um desenho do processo no escritório e todos os dias os membros da equipe podem vê-lo com facilidade. Está no DNA da igreja.

A Igreja da Cruz está comprometida a amar a Deus, amar aos outros e servir aos outros. É fantástico que está no papel e na mente das pessoas. Mas como eles fazem acontecer este ideal? Como esta visão se dá na vida regular da igreja? Começamos a fazer estas perguntas para os líderes.

Um membro da igreja respondeu assim: "O culto me ajuda a amar mais a Deus, é no grupo pequeno que realmente aprendo a amar mais aos outros. Também estou na recepção, que eu sei é algo pequeno, mas sinto que desta maneira estou servindo aos outros".

Um líder da igreja disse: "Semanalmente pedimos para as pessoas fazerem três coisas. Virem ao culto para se apaixonarem ainda mais por Deus e sua Palavra. Irem a um grupo pequeno para amar os outros em comunidade. Servirem em um ministério para impactarem os outros. Amar a Deus, amar aos outros e servir a Deus. Nós realmente tentamos manter isso bem simples".

Um antigo membro da equipe comenta: "Cremos que o nosso processo e nossas atividades devem estar em parceria. Discutimos qual é a melhor atividade para cada estágio do processo, e nos comprometemos a fazer somente essas coisas". Em outras palavras eles decidiram organizar as suas atividades semanais em sequência. Assim, as pessoas podem passar pelo processo simplesmente se deslocando de uma atividade para a outra.

PROGRAMAÇÃO NA PRIMEIRA IGREJA

Aprendemos muito andando pela Primeira Igreja por vários dias: observando a preparação dos programas; conversando com as pessoas empolgadas com o que elas fazem ou participam. Observamos muito porque havia muito que observar.

Toda semana, aos domingos, a Primeira Igreja tem culto pela manhã, culto à noite. Escola Bíblica Dominical de manhã; quarta à noite há classes de discipulado e grupos nos lares; terça de manhã, reunião de homens e mulheres; e quinta à noite, visitação.

Caso você tenha perdido a conta, são oito programas principais. Oito programas em sete dias; e esta programação é só para os adultos. Não inclui o que todas as outras faixas etárias oferecem, coisas como o coral jovem e o coral infantil. Isso é cada semana, toda semana. É o padrão; é isso que se espera que as pessoas façam.

Ficamos imaginando como que os membros da Primeira Igreja podem conhecer os seus vizinhos, os não-frequentadores de igreja.

Participamos de alguns desses programas. Eles são bons, as pessoas gostam, é difícil dizer qual deles deve ser eliminado. No entanto, está claro que as atenções estão divididas. É difícil buscar excelência quando você está focado em tantas coisas ao mesmo tempo. Essa realidade aparece nas pequenas coisas. Todos os programas têm poucos líderes. O pessoal do som é requisitado a toda hora em todos os lugares. Algumas pessoas reclamam que seus ministérios não recebem divulgação suficiente.

Enquanto estávamos circulando, fizemos algumas perguntas básicas aos líderes e aos membros da equipe. "A qual desses programas vocês esperam que a maioria das pessoas participe?" ou "Qual é o programa para o qual as pessoas devem convidar seus amigos e vizinhos?" As respostas não são claras e coerentes. Alguns dizem todos os programas, outros debatem sobre quais seriam esses programas.

Não há um processo, portanto não é de se surpreender que não haja um ponto de partida. Também não há relação entre todas as declarações que lemos e os programas apresentados.

Quando perguntamos para quais programas eles pretendem encaminhar os novos membros ou visitantes, todos ficam confusos. Alguns se tornam defensivos. As pessoas têm a tendência de se tornarem defensivas e justificam a existência do programa no qual estão envolvidas em particular. Os programas são um fim em si mesmos. Eles não são usados como ferramentas para levar as pessoas à maturidade espiritual.

Também ficamos sabendo de todos os eventos especiais. Há muitos deles, mas o principal deles é o programa de Natal. É enorme! É um item significativo no orçamento e as pessoas investem meses se preparando para ele. Eles começam em agosto e envolve todo mundo. E, inclusive vários animais, e não são animais empalhados não: eles têm muito orgulho de usar animais reais. Mas alguns dos membros da equipe ficam amargurados por causa do programa de Natal, porque dizem que esgota todo mundo até março.

Perguntamos a alguns membros quão eficiente era o programa de Natal. Ficou claro que aquela era uma pergunta estranha para eles. Então nossa pressuposição é que o objetivo seria alcançar as pessoas da comunidade e aí perguntamos quantos visitantes apareciam. E quantos daqueles que vinham não iam a nenhuma igreja. Nós descobrimos que a maioria dos visitantes era pessoas de outras igrejas. "Mas é uma grande tradição". Há uma história no Evangelho de Marcos sobre as tradições e sobre um programa se tornando o foco. Jesus estava colhendo alguns grãos, e os religiosos reclamaram com ele. O Mestre estava com fome, mas eles estavam reclamando porque ele estava "trabalhando" no sábado. O sábado havia sido dado para que o homem pudesse descansar, mas aqueles religiosos haviam mudado o seu foco. Na mente deles, o sábado como um programa tinha que ser protegido. O foco se tornou o dia em si e não o resultado que se esperava na vida das pessoas.

Jesus disse: "O sábado foi feito por causa do homem, e não o homem por causa do sábado" (Marcos 2.27).

Os programas são feitos para os homens, e não os homens para os programas. Se o objetivo é manter algumas coisas funcionando, a igreja está com problemas. O objetivo final tem que ser sempre relacionado com as pessoas. Os programas são apenas ferramentas.

PROGRAMAÇÃO NA IGREJA DA CRUZ

Aprendemos muito andando pela Primeira Igreja por vários dias, agora vamos aprender com a Igreja da Cruz.

O processo simples está presente semanalmente através das atividades que a igreja oferece. A programação semanal é uma ferramenta para ajudar as pessoas a amarem a Deus, amarem aos outros e servirem ao mundo. Se os programas não fossem usados para conduzir as pessoas através do processo, então a visão/processo não faria nenhum sentido.

O primeiro passo no processo é amar a Deus, e os cultos no final de semana ajudam as pessoas a fazerem isso. O culto é a porta de entrada da igreja para os visitantes, as pessoas novas e para os não cristãos. É também o evento semanal ao qual as pessoas chegam mais perto de Deus através de um culto inspirador e de um ensino bíblico dinâmico.

O segundo passo no processo é amar aos outros, então o próximo programa é elaborado para ajudar as pessoas a se relacionarem. Os cultos de final de semana não conectam muito bem as pessoas. Como na maioria das igrejas, as pessoas sentam-se olhando para frente e têm muito pouca interação umas com as outras.

A equipe concluiu que os grupos pequenos eram o melhor ambiente para as pessoas amarem umas às outras numa comunidade bíblica. Alguns grupos pequenos funcionam na própria sede aos domingos ou às quartas. Outros grupos se reúnem em casas e restaurantes. As pessoas são encorajadas a se envolverem com algum grupo.

O terceiro passo no processo é servir ao mundo, e a equipe ministerial envolve as pessoas em ministérios. As pessoas gostam do espírito de companheirismo quando trabalham em equipes enquanto experimentam a alegria de servir aos outros. Enquanto algumas equipes se concentram na igreja, outras se concentram na comunidade. Os novos membros ouvem na classe de preparação que eles não deveriam se tornar membros se não planejam servir.

Na Igreja da Cruz, há três programas principais. Um para cada fase do processo. Eles estão estratégica e sequencialmente colocados de acordo com o processo. O objetivo é conduzir as pessoas de programa em programa de maneira que elas possam progredir naturalmente através do processo de transformação espiritual. As pessoas que vêm aos cultos são encorajadas a participarem de algum grupo pequeno. As pessoas no grupo pequeno são encorajadas a servirem em alguma equipe.

Parece ser tudo que eles fazem: três programas semanais. É uma elaboração muito simples.

REUNIÕES DE EQUIPE

Durante a visita às duas igrejas fomos convidados a participar das reuniões da equipe ministerial. Nas duas ocasiões sentamos em cadeiras fora da mesa. Estávamos lá só para observar.

Ambas, Primeira Igreja e Igreja da Cruz, têm a sua reunião da equipe na terça. Ambas as reuniões começam com uma devocional e um período de oração. Ambas demoram mais ou menos o mesmo tempo. Ambas têm uma pauta. Ambos os encontros acontecem na sala de reuniões. À distância, as reuniões parecem similares. O final delas é muito diferente.

Podemos aprender muitas coisas assistindo a reuniões como estas e comparando-as. Nós percebemos algumas diferenças cabais em algumas facetas comuns às reuniões de equipes ministeriais de igrejas.

O CALENDÁRIO NA PRIMEIRA IGREJA

Se você serve como membro de uma equipe, você está familiarizado com "o calendário". Ele faz parte de toda reunião da equipe. A Primeira Igreja e a Igreja da Cruz, ambas têm calendário. Todos nós temos, até os nascidos na Flórida, eles sempre existirão. Revisá-lo nas reuniões da equipe é necessário, não importa o quão enfadonho isso possa ser.

A Primeira Igreja gasta muito tempo da reunião lidando com o calendário. Este tempo, no entanto não parece ser perdido. Tem tanta coisa no calendário que este tempo é necessário. O gerenciamento de todas as atividades requer uma coordenação e supervisão muito bem feita. Toda semana o espaço disponível tem que ser programado, os folhetos de comunicação precisam ser confeccionados e a limpeza das instalações precisam ser programadas diferentemente.

A equipe disputa um lugar no calendário querendo apenas um evento em particular para um determinado dia da semana. Eles usam o típico formulário de requisição de espaço no calendário, e a pessoa que entregou o formulário primeiro quer que aquele dia se torne sagrado para o seu evento. Muito tempo é gasto coordenando o calendário específico dos ministérios com o calendário geral da igreja.

O CALENDÁRIO DA IGREJA DA CRUZ

O tempo de análise do calendário na Igreja da Cruz é diferente. A equipe ministerial da Igreja da Cruz gasta menos de cinco minutos lidando com o calendário. Depois de observar a reunião da equipe da Primeira Igreja, este contraste parece absurdo.

Será que eles são maus gerentes? Será que eles estão ignorando todos os detalhes que precisam ser cuidados? Por que levam tanto tempo a menos para lidar com o calendário?

Não é que eles não são capazes de coordenar; simplesmente o calendário é bem vazio. Uma social da equipe é o único evento não regular no próximo mês. O tempo que a equipe da Primeira Igreja gasta discutindo o calendário, a Igreja da Cruz gasta discutindo as atividades semanais. Durante esta reunião em particular, a equipe avalia como os cultos do final de semana estão contribuindo para o processo de discipulado.

OS NÚMEROS NA PRIMEIRA IGREJA

Durante a reunião da equipe as duas igrejas avaliam o número de pessoas que estão frequentando. Isso é surpreendente porque geralmente as igrejas que não crescem não fazem isso. A Primeira Igreja não tem crescido há vários anos. Cada membro da equipe das duas igrejas recebe um relatório semanal de quantas pessoas participaram das diversas atividades. Porém, a análise desses relatórios é diferente.

A Primeira Igreja olha a quantidade de pessoas envolvidas em cada atividade. Cada atividade é analisada separadamente do todo. Cada membro da equipe avalia os números do seu evento favorito e afirma: está tudo ótimo. Para os jovens é o evento da quarta-feira à noite. Para o líder da música é o número de pessoas no coral. Para o ministério infantil é o número de crianças na atividade de domingo pela manhã.

OS NÚMEROS NA IGREJA DA CRUZ

A Igreja da Cruz avalia o número de pessoas nos diferentes estágios do processo ministerial. Eles avaliam quantas pessoas estão no estágio amar a Deus (cultos dominicais); o estágio amar aos outros (grupos pequenos); e no estágio servir ao mundo (equipes de ministério). Eles usam um relatório trimestral que mostra o crescimento ou diminuição desses programas em relação ao processo deles.

Durante esta reunião eles estavam preocupados porque o estágio amar a Deus (a frequência nos cultos) havia crescido 10% no último trimestre, mas o estágio servir ao mundo não havia crescido proporcionalmente. O processo simples deles foi preparado para conduzir as pessoas dos cultos dominicais aos grupos pequenos, e para as posições de serviço, portanto esse relatório os alarmou. Eles discutiram maneiras de encorajar as pessoas novas a começarem a servir.

Você percebeu a diferença?

Aqui está! Leia isso com atenção. A equipe da Primeira Igreja analisa os números verticalmente, enquanto a equipe da Igreja da Cruz os analisa horizontalmente.

A Primeira Igreja avalia os números de cada atividade separadamente de todos os outros programas. Eles olham para cada evento isolado de todos os outros. A análise é do programa e não do processo geral. Cada membro da equipe ou líderes de ministério tem uma visão afunilada só no seu programa. Eles olham para cima e para baixo, não para os lados.

A equipe ministerial da Igreja da Cruz vê as coisas de forma diferente, eles olham para os lados.

A Igreja da Cruz organizou seus eventos para conduzir as pessoas pelo seu processo. Eles monitoram esse movimento através dos padrões de participação. Quando analisam relatórios focam na assimilação. Eles estão interessados no movimento, e movimento é horizontal. A Igreja da Cruz olha os números para analisar o movimento das pessoas no processo.

NOVAS IDEIAS

Novas ideias e novas oportunidades surgem várias vezes nas reuniões de equipe.

Onde há líderes e voluntários apaixonados sempre há uma abundância de novas ideias. Combine esta paixão e as muitas necessidades que são importantes na vida dos membros da igreja, e você tem a equação perfeita para novos programas e eventos especiais.

Você já viu isso. Todos sabem que há uma necessidade. E é uma necessidade legítima, não apenas um desejo apresentado. Talvez as pessoas não estejam sendo fiéis com as suas finanças, ou os casamentos estão se desfazendo. Deus coloca no coração de alguém que é preciso fazer algo sobre isso. Até aqui tudo bem. O que acontece depois é o que diferencia uma Igreja Simples de uma Igreja Complexa.

Durante este período de consultoria na Primeira Igreja e na Igreja da Cruz, nós observamos em primeira mão. As duas equipes estão preocupadas com os casamentos e as famílias de suas igrejas. Durante as duas reuniões oportunidades para capacitar as famílias foram discutidas. Ambos chegam a uma solução: uma simples e a outra complexa. Observe a diferença.

A PRIMEIRA IGREJA E AS NOVAS IDEIAS

A Primeira Igreja está promovendo dois eventos especiais este mês. Um será um dia inteiro de sábado com uma conferência para casais. O outro será o evento de um seminário de dois dias sobre criação de filhos. O ministério infantil é responsável pelo seminário sobre criação de filhos e o ministério dos adultos pela conferência sobre casamento.

Ninguém quer admitir que esses dois eventos estão competindo em grande parte pelo tempo das mesmas pessoas. Ironicamente, alguns nem veem isso como um problema. Eles não percebem que esses eventos estão em conflito um com o outro porque acontecerão em finais de semana diferentes. Eles acham que as famílias deveriam estar dispostas a dedicar, no mesmo mês, dois finais de semana inteiros para atividades da igreja. E mais, esses eventos devem ser encaixados entre todas as outras atividades normais do final de semana na igreja. Grande tempo familiar!

A promoção dos dois eventos está tomando um tempo enorme. As secretárias estão gastando metade do seu tempo fazendo telefonemas, lidando com os fornecedores e encaminhando pelo correio o material de divulgação. Os ministérios estão gastando tempo para organizar os eventos e implorando para que as pessoas venham.

O número de inscrições foi pequeno e a frustração foi grande. Não estão investindo tempo adequado nas programações semanais. A maioria das pessoas não percebe quanto tempo é gasto. Eles veem apenas o produto final.

A IGREJA DA CRUZ E AS NOVAS IDEIAS

A Igreja da Cruz tem as mesmas necessidades. A equipe está profundamente preocupada com as famílias da igreja, assim como a equipe da Primeira Igreja. Os casamentos estão desmoronando e pais precisam de orientação em como educar seus filhos.

A Igreja da Cruz age de forma diferente. Embora eles usem um material semelhante ao da Primeira Igreja, eles o oferecem em um formato diferente. Não há nenhum evento especial no calendário. Em vez disso, eles escolheram atender a essa necessidade através do seu próprio processo ministerial. Escolheram oferecer o mesmo conteúdo através das atividades que já existiam.

A Igreja da Cruz começou vários grupos pequenos que vão lidar com esses assuntos. Os conteúdos serão oferecidos e as pessoas vão se engajar em grupos pequenos. Eles farão novos relacionamentos com pessoas que estão experimentando o mesmo tipo de dificuldades.

A Igreja da Cruz quer conduzir as pessoas dos seus cultos para os grupos pequenos, e esses grupos pequenos estão fazendo acontecer. As pessoas estão experimentando as duas coisas: o conteúdo desejado e a experiência de um grupo pequeno. Mais pessoas se engajaram porque elas não precisavam ficar longe de casa um final de semana inteiro.

O número de inscrições foi alto e a frustração baixa. A equipe está usando o tempo para organizar e promover os programas que já estão no processo. As pessoas não estão sendo bombardeadas com muitas opções. Não há competição interna. A Igreja da Cruz é capaz de conduzir as pessoas pelo processo de discipulado e simultaneamente atender as necessidades. É ganhar ou ganhar.

DECISÕES SOBRE A EQUIPE MINISTERIAL

Gastar tempo com a equipe durante a consultoria sempre leva a percepções-chave, especialmente nas conversas de corredor. Uma das perguntas de corredor que os líderes de igreja mais fazem é: "Onde eu posso encontrar um ministro para liderar este ministério?" Ambas, a Primeira Igreja e a Igreja da Cruz, estão procurando pessoas para a equipe. Durante as conversas sobre possíveis pessoas para ocupar determinados cargos, algumas percepções-chave emergem.

ESCOLHA PARA A EQUIPE DA PRIMEIRA IGREJA

A Primeira Igreja está procurando a melhor equipe possível. Faz sentido, certo? Esta realidade é claramente declarada pelos líderes envolvidos na busca de novos membros para equipe. O objetivo é ajuntar uma equipe de estrelas, o melhor disponível para cada função. O pressuposto é que isso causará um grande impacto na igreja e na comunidade. O pressuposto tem aparência de sabedoria, mas é falso.

Mostrou-se falso para a Primeira Igreja. A equipe atual está cheia de pessoas capacitadas, mas eles estão correndo em direções diferentes. A filosofia declarada é "contratar 'puros-sangues' e deixá-los correr". Parece bom. Mas quanto mais conversamos com a equipe percebemos mais claramente que há múltiplas filosofias entre a equipe. Contratar os melhores não uniu a equipe. Cada pessoa vem firme e apaixonada pelo seu ministério, mas sem um compromisso com o todo. As pessoas não foram escolhidas e contratadas para se juntar a um movimento coerente e unificado.

O problema não está na falta de entrevista ou de referências. O problema não é a falta de paixão. A Primeira Igreja aparentemente entrevista exaustivamente e a equipe parece que caminha com Deus. O problema é que não há um processo abrangente para recrutar e empolgar a equipe. O recrutamento de pessoas talentosas com diferentes filosofias e abordagens de ministério é o alicerce para a frustração e o desastre.

Aqui está uma pequena demonstração da equipe da Primeira Igreja (os nomes foram trocados). O pastor João é o responsável pelo ministério com estudantes. O pastor William é responsável pelo ministério de educação de adultos e isso inclui a Escola Bíblica dominical e os grupos pequenos. Ambos são apaixonados por evangelização. É nisso que eles focam em tudo nos seus ministérios. Eles ficaram conhecidos por construir ministérios evangelísticos. Foi isso o que atraiu ao pastor e o grupo de recrutamento nesses dois membros da equipe. Parece que eles deveriam se dar bem, que eles formariam uma grande equipe. Não exatamente.

Os dois concordam teologicamente, seus olhos brilham quando eles falam de evangelização e do chamado para fazer discípulos. Ambos creem que os perdidos precisam ouvir o evangelho. Porém, não estão no mesmo compasso filosoficamente. Eles abordam a evangelização de forma diferente. O pastor William acredita no treinamento formal para a evangelização. Ele organizou seu ministério com esta abordagem. O pastor João acredita na evangelização pelo serviço, e organizou o seu ministério baseado nesta abordagem. No papel as duas filosofias coexistem, mas na realidade elas colidem uma com a outra.

Na quinta à noite o pastor William oferece capacitação formal para a evangelização e convida toda a igreja. Ele está sempre promovendo esta atividade; convence o pastor titular a incentivar do púlpito, e também não entende porque o pastor João não incentiva os estudantes para participarem. No sábado de manhã o pastor João oferece oportunidades para evangelização de serviço, onde adultos e adolescentes servem às pessoas de maneira prática.

Os apoiadores de William acreditam que a abordagem de João é superficial, e os apoiadores de João acreditam que a abordagem de William é fria. Alguns pais que participam do grupo de William não querem que seus adolescentes participem do grupo de João. Silenciosamente os dois grupos estão sempre competindo. William e João estão teologicamente alinhados, mas filosoficamente não. Os dois são o melhor disponível na área deles, mas ambos têm dificuldade em fazer parte da equipe e, em parte, o problema de um é por causa do outro.

Eles se cumprimentam nos corredores, abraçam as famílias, mas há uma grande distância. Nenhum deles está errado, ou é menos piedoso. São apenas diferentes na sua essência e o pastor não deseja ser o árbitro.

ESCOLHA PARA A EQUIPE NA IGREJA DA CRUZ

A Igreja da Cruz também está procurando membros para a equipe, mas as suas perguntas são diferentes. O que eles estão procurando é diferente. Como a Primeira Igreja, eles querem pessoas que tenham um caráter impecável e que sejam competentes no seu ministério. Porém, eles estão procurando pessoas que estejam alinhadas com o processo ministerial deles. Isso é importante para eles.

Cada um dos membros da equipe foi escolhido com base no processo amar a Deus, amar aos outros e servir ao mundo. Alguns candidatos talentosos e muito bem recomendados não foram considerados por que tinham suas próprias preferências e essas preferências não se alinhavam com o processo ministerial. Assim, o candidato em potencial não foi considerado.

A Igreja da Cruz está mais preocupada em ter uma equipe alinhada do que uma equipe de estrelas.

Se eles estão procurando um ministro para estudantes, vão procurar alguém que lidere os estudantes a amar a Deus, amar aos outros e servir ao mundo. Se estão procurando um pastor para os adultos, vão procurar alguém que vai levar os adultos a amar a Deus, amar aos outros e servir ao mundo. Eles são rigorosos com isso durante as entrevistas. São apaixonados pelo seu processo e são consistentes.

Os membros da equipe com quem falamos não se sentem restringidos. Eles se sentem livres. Sentem-se livres porque também estão apaixonados pelo processo. Não assinaram apenas uma declaração, mas algo do qual desejam fazer parte. Estão empolgados de estarem envolvidos com uma igreja que enxerga o ministério da mesma maneira que eles. Alguns ajudaram a criar o processo, outros se comprometeram com ele depois de se juntarem a equipe.

Os limites são claros, e eles são encorajados a implantarem e executarem os seus ministérios com criatividade e liberdade. Os membros da equipe não são cópias uns dos outros. Eles não se vestem iguais e nem falam as mesmas coisas. Não gostam do mesmo tipo de música, nem leem os mesmos livros, mas estão alinhados sobre como o ministério deve acontecer na Igreja da Cruz.

OS AVISOS

Pode parecer estranho terminar esse capítulo com os avisos. Porém, a maioria dos cultos termina com algum tipo de aviso.

Nós aprendemos que os avisos dados durante os cultos falam muito sobre a igreja. Eles tipicamente mostram quais são as prioridades da igreja. Durante os avisos as pessoas ouvem o que está acontecendo na vida da igreja. Elas são convidadas a participar de algo.

Ambas, Primeira Igreja e Igreja da Cruz fazem avisos. Ambas usam um pastor para fazerem isso, ambas colocam os anúncios em momentos semelhantes no culto. É no conteúdo que está a diferença dos anúncios.

OS AVISOS NA PRIMEIRA IGREJA

A Primeira Igreja dá uma grande quantidade de avisos. As pessoas são convidadas para tudo. No domingo que estivemos lá eles anunciaram oito coisas diferentes, todas com empolgação. Todas com aquele tom de "isso vai mudar a sua vida e você tem que vir". É uma espécie de comercial sem o "0800".

À medida que os avisos demoram vários minutos, olhamos para os lados. Começamos a imaginar como aquelas pessoas iriam decidir de que atividade elas iriam participar nesta semana. Ficamos imaginando o que se passava na cabeça delas.

É um resumo apropriado do que foi a nossa visita à Primeira Igreja. Há muita atividade, muita ocupação, muita complexidade. Tudo isso pode ser justificado pelo responsável. Simplesmente não se encaixa na perspectiva geral. Não há uma perspectiva geral, não há um processo que guie o ministério.

OS AVISOS NA IGREJA DA CRUZ

Os avisos na Igreja da Cruz demoraram aproximadamente quatro minutos. Foram três avisos; aqui estão eles:

Há uma recepção especial para os visitantes de primeira vez. Há uma classe de novos membros na semana que vem para quem estiver interessado em se tornar membro da igreja. E para aqueles que quiserem se filiar a um grupo de estudos há uma mesa de informações na saída.

Cada aviso é sobre o percurso para o próximo estágio. As pessoas no auditório sabem exatamente para o que elas estão sendo convidadas. Não são bombardeadas com muitas informações. Três avisos simples; mas o que você esperava?

É também um resumo apropriado de nossa visita à Igreja da Cruz. Há muito foco, muita claridade, tudo se encaixa na perspectiva geral. Tudo é guiado pelo processo simples de fazer discípulos.

A EXPERIÊNCIA DA IGREJA SIMPLES

Deixamos a Primeira Igreja impressionados com a equipe e com os membros. O compromisso deles com Cristo é real. Mas muitas pessoas na Primeira Igreja estão cansadas e confusas em como "ser igreja".

Da mesma maneira, deixamos a Igreja da Cruz impressionados com as pessoas e seus membros. Mas não vimos nem cansaço nem frustração no rosto das pessoas. Ao contrário, vimos empolgação, alegria e antecipação.

Duas igrejas reais, duas experiências diferentes.

A sua igreja é mais parecida com a Primeira Igreja ou com a Igreja da Cruz?

Você gostaria que a sua igreja fosse mais parecida com a Igreja da Cruz?

É possível para sua igreja fazer uma mudança tão radical?

É para essas perguntas que voltamos nossa atenção agora.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Como nos parecemos com a Primeira Igreja?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como nos parecemos com a Igreja da Cruz?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Qual igreja você prefere servir ou frequentar?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Que conselho você daria para o pastor da Primeira Igreja?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Descreva o conceito de processo. Por que isso é importante?$p$, 'reflexao', null),
    (v_aula_id, 6, $p$Como um processo ministerial nos ajuda a eliminar algumas coisas?$p$, 'reflexao', null),
    (v_aula_id, 7, $p$Como um processo ministerial pode unir uma equipe?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 3 — Igreja Simples: uma reconstrução total  (aula ordem = 4)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 4;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 3 — Igreja Simples: uma reconstrução total$t$,
      4,
$conteudo$A habilidade de simplificar significa eliminar o desnecessário para que o necessário possa falar.
—Hans Hofmann

Clareza → Movimento → Alinhamento → Foco

Reconstrução total: edição casa é um programa de televisão bem-sucedido. Geralmente é engraçado, inspirador e emocionante. No final de cada episódio dá um enorme nó na sua garganta.

O nó na garganta geralmente aparece quando o ônibus vai embora e a família vê a sua nova casa pela primeira vez. O nó aumenta à medida que você observa a família andando pela sua casa totalmente reconstruída. O nó está a ponto de arrebentar quando o último cômodo é apresentado para um dos membros da família.

Este último cômodo é um "cômodo especial" que Ty, o líder da equipe, idealizou. É um ato de graça. Assistir a reação do recebedor dessa graça é empolgante. A graça sempre é.

A igreja pode aprender com este programa de televisão.

De acordo com 1Pedro 4.10, somos os gerentes da graça de Deus. Ele nos entregou a sua graça. Ele a confiou a nós. Somos os gerentes, os mordomos, e despenseiros da sua graça. A igreja precisa derramar a graça de Deus no mundo para que as pessoas possam crescer na sua graça.

Como as casas no programa de televisão, muitas igrejas precisam de uma reconstrução total. E o objetivo dessa reconstrução precisa ser o encontro das pessoas com a graça de Deus. Para que as pessoas possam experimentar bem e crescer na graça de Deus muitas igrejas precisam ser redesenhadas.

No programa Reconstrução total: edição casa, famílias são escolhidas para terem suas casas reformadas, consertadas, redesenhadas ou reconstruídas. As famílias sempre estão necessitando desesperadamente este tipo de serviço. Ty e a sua equipe de designers aparecem na casa da família e anunciam que eles foram selecionados. Então, a família é levada para uma semana de férias geralmente em algum lugar na Flórida.

Enquanto eles estão fora o milagre de uma nova casa acontece. A equipe de designers e todos os outros trabalham praticamente vinte e quatro horas por dia para que isso aconteça. Leva uma semana. Se você alguma vez esteve envolvido com um projeto de construção de igreja você terá inveja da quantidade de serviço que é feita em uma semana. Pressupomos que a equipe de designers tem algum tipo de ligação com as autoridades de obras para as devidas licenças.

Às vezes algumas casas precisam de muitos ajustes. Paredes são derrubadas, um cômodo extra é adicionado, a decoração, os jardins e a combinação de cores são modernizados.

Em outras ocasiões a casa é completamente reconstruída. A antiga planta é abandonada e uma nova casa é desenhada em um papel totalmente branco. A casa atual é demolida e uma nova é construída do zero.

O mesmo é verdade para igrejas.

Algumas igrejas precisam de ajustes, enquanto outras precisam de uma reconstrução total. Independente disso, nossa pesquisa mostra que Reconstrução total: edição igreja é necessário para muitas igrejas.

Não estamos falando das cores ou da decoração.

Não estamos nos referindo ao piso do auditório ou à planta do departamento infantil.

Não estamos falando do prédio.

Estamos falando do programa para o discipulado. Estamos falando da organização do ministério da igreja. Nós estamos falando de como a igreja está organizada e estruturada para que as pessoas possam ser transformadas pela graça de Deus.

PROJETANDO

Assim como Ty e sua equipe são designers, os líderes de igreja também são.

Os líderes de igreja precisam criar oportunidades onde as pessoas encontrarão a graça de Deus. Os líderes de Igrejas Simples são designers e não programadores. Eles se tornam especialistas em projetar um processo ministerial que conduza as pessoas ao crescimento e à vitalidade espiritual.

O crescimento espiritual é um processo, e sempre foi. Portanto, faz todo sentido que os líderes de igreja organizem as suas igrejas em torno do processo de crescimento espiritual. Em 1Coríntios 3, os crentes são chamados de crianças de Deus (v.1), lavoura de Deus (v.9), e edifício de Deus (v.9).

Somos crianças de Deus. Começamos como bebês espirituais porque nascemos de novo (João 3.3). Nosso movimento na direção de nos tornarmos adultos espirituais é um processo. E este processo é crítico. Da mesma maneira que os bebês precisam do ambiente correto para crescer fisicamente, as pessoas precisam do ambiente correto para crescer espiritualmente.

Somos a lavoura de Deus. As lavouras não dão fruto por determinação ou ordem. Elas florescem num processo, e para que isso aconteça apropriadamente, precisam do ambiente correto e dos nutrientes corretos.

Somos o edifício de Deus, a casa espiritual de Deus. Primeiro nos construiu (nos criou). Depois nos comprou de volta (nos redimiu) com seu próprio sangue. Em seguida ele se mudou e fez moradia em nossas vidas. E não terminou. Continua trabalhando em nós. Ele está sempre redecorando. Essa transformação contínua é o trabalho do Espírito Santo.

Nossas esposas e o Espírito Santo têm muito em comum. Não é o suficiente para nossas esposas mudar para uma casa conosco. Isso é só o começo. Redecorar é uma necessidade; não é um evento e pronto. É algo que não tem fim.

O mesmo acontece com o Espírito Santo, o trabalho contínuo é inevitável. Nunca termina, é um processo para a vida toda.

Crianças, lavouras e edifícios crescem em processo. Eles não amadurecem da noite para o dia. Não são construídos em um dia. São constantemente redecorados.

Crianças, lavouras e edifícios precisam do ambiente certo para facilitar o processo de crescimento. As crianças precisam de educação, toque, comida e amor. As lavouras precisam de água, cuidado e cultivo. Os edifícios precisam de trabalhadores, materiais e pessoas como Ty.

Os líderes de Igrejas Simples sabem disso.

Os líderes de Igrejas Simples não só entendem que a transformação espiritual é um processo, como lidam com esta realidade. E o fazem através da implantação de um processo ministerial que facilite o crescimento espiritual das pessoas. Preparam um processo simples e abandonam todo o resto. Eles se baseiam em seu processo simples para criar ambientes que conduzam ao crescimento espiritual.

DEFININDO UMA IGREJA SIMPLES

Aqui está. Eis a definição para Igreja Simples: uma Igreja Simples é uma congregação organizada em torno de um processo objetivo e estratégico que conduz as pessoas através dos estágios do crescimento espiritual.

Esta definição carrega um peso com ela. Vamos examinar a definição, uma frase de cada vez.

A igreja é organizada. Ela não foi colocada junta sem cuidado. Não é planejada ao acaso. O ministério é mais do que "simplesmente acontece". Ele é pensado, é estruturado, é desenhado, preparado com cuidado.

É também organizada em torno...

A organização da igreja está centrada em alguma coisa. Os programas e ministérios giram em torno de algo. Eles não são apenas acrescentados ao calendário ou propaganda da igreja. Tudo é organizado em torno de algo e este algo não é um conceito abstrato e nebuloso. A organização para o discipulado numa Igreja Simples gira em torno do processo.

Uma Igreja Simples é organizada em torno de um processo objetivo e estratégico...

O processo é objetivo. Não é confuso, é fácil de entender. Os líderes sabem e é fácil para as pessoas entenderem. O processo é mantido simples intencionalmente; ele não é aumentado e não muda de tempos em tempos.

A igreja mantém o processo simples. A complexidade não é bem-vinda. Não se aumenta o número de atividades ao processo. A igreja rejeita a multiplicidade de novos programas e modelos que lhe são oferecidos.

Uma vez que o processo é o "como", ele é também estratégico. O processo está ligado ao propósito ou visão da igreja. Os dois estão costurados juntos. O processo é projetado para ser executado, para impactar as pessoas. Ele é desenhado sequencialmente para que as pessoas possam ser conduzidas através dele.

O processo conduz as pessoas...

O processo simples e estratégico conduz as pessoas. O processo flui logicamente. As pessoas são atraídas a Cristo e à igreja e então são movidas aos pontos de contato. As atividades são usadas como ferramentas para promover esta condução, este movimento.

E o movimento através do processo direto e estratégico intencionalmente espera um resultado final desejado...

O processo conduz as pessoas através dos estágios do crescimento espiritual.

O propósito é estabelecer uma parceria com Deus para conduzir as pessoas através dos estágios do crescimento espiritual. A mudança de vidas é o objetivo principal, o resultado final desejado. Cristo formado nas pessoas, esse é o objetivo.

A Igreja Simples entende que as pessoas estão em lugares diferentes na sua jornada espiritual, e que o crescimento espiritual é um processo. A igreja é organizada em parceria com Deus para conduzir as pessoas ao crescimento espiritual.

Infelizmente, muitas igrejas desprezam esta verdade.

Elas não são simples. Não organizaram um processo simples de discipulado. Não se organizaram em torno de um processo de transformação espiritual. E elas estão tendo um impacto mínimo.

Essas igrejas precisam de uma reconstrução total. Elas precisam desesperadamente de um novo projeto ministerial.

Fazemos essas afirmações com convicção porque nossas pesquisas indicam que a estratégia da Igreja Simples é eficaz. Um processo simples faz uma diferença enorme. O estudo é convincente.

Temos que voltar ao começo antes de sermos convencidos. Precisamos conduzir você a como nos tornamos defensores da estratégia da Igreja Simples. Acompanhe como o projeto começou e como se desenvolveu.

INICIANDO O PROJETO

Dois eventos nos levaram a iniciar este extensivo projeto de pesquisa.

Primeiro, à medida que interagíamos com igrejas crescentes e vibrantes, observamos que essas igrejas tinham um processo claro de discipulado. Elas fluíam, eram eficientes, e simples. Por outro lado, observamos que as igrejas com dificuldades não tinham um processo claro. Elas eram complexas e confusas em seus programas.

Tivemos um pressentimento.

E este era um pressentimento baseado na observação cuidadosa, não apenas um sentimento aleatório depois do jantar. Parecia haver uma relação entre ser simples e ser eficiente. O simples parecia funcionar, mas não o havíamos testado ainda. Decidimos submeter a nossa observação ao processo metodológico da pesquisa.

Segundo, constantemente ouvíamos o pedido de ajuda dos líderes de igreja. Muitos se sentiam bombardeados e sobrecarregados. Bombardeados pelos modelos, programas e novas ideias. Sobrecarregados com a correria e o peso de manter tudo junto e organizado. Eles estavam cansados e inquietos.

Talvez você também esteja.

Vislumbramos o projeto de uma Igreja Simples como a solução e queríamos defender essa ideia. Gostaríamos de oferecer isso, mas não poderíamos fazê-lo sem antes testar.

Nossas observações e o nosso desejo de oferecer ajuda real aos líderes nos jogaram dentro deste projeto. Começamos um extensivo projeto de pesquisa envolvendo incontáveis horas de trabalho, a experiência e a percepção de experientes líderes, o processamento dos dados pelos pesquisadores e centenas de conversas com líderes de igreja.

Agora, como o projeto de pesquisa se deu.

A FASE DA PESQUISA

Queríamos descobrir se havia uma relação entre ser simples e ser eficaz. Então começamos a explorar a relação entre o processo da Igreja Simples e a vitalidade da igreja.

Estávamos tentados a usar a abordagem do estudo de caso em nosso projeto. Tentados porque teria sido o caminho mais fácil. No método de estudo de caso, várias igrejas são observadas e as conclusões são tiradas com base nessas observações. O método de estudo de caso é muito respeitado entre os pesquisadores, mas esta abordagem limita o tipo de aplicação que pode ser feito em benefício de outras igrejas. Então abandonamos a ideia.

Em vez disso avaliamos centenas de igrejas de maneira que pudéssemos aplicar a pesquisa de forma mais abrangente.

Para podermos analisar centenas de igrejas preparamos um questionário para avaliar a organização do processo da igreja local. Identificamos várias igrejas vibrantes que tinham um processo simples. Estudamos essas igrejas e concluímos que cada uma delas tinha quatro elementos-chave: clareza, movimento, alinhamento e foco.

Aí reunimos uma equipe de líderes de igreja experientes para preparar um questionário baseado nesses quatro elementos. A equipe era formada por pastores, plantadores de igreja, líderes denominacionais, professores de seminário e consultores eclesiásticos. Batizamos o questionário de "Questionário para idealização do processo". Ele avalia quão simples é a organização do processo de uma igreja local e também avalia quão forte a igreja é nesses quatro elementos.

Embora não reivindiquemos falta de erros nessa pesquisa, a equipe estava fortemente unida com relação aos itens que deveriam estar presentes nela. Inclusive brincávamos nos referindo ao conclave como o "Concílio do Simples", de tão forte que era a concordância. Era incrível porque a equipe estava repleta de líderes fortes com formações bem diferentes. Foi maravilhoso.

O questionário foi testado com um grupo de igrejas para termos certeza de que era consistente e confiável. Ele se mostrou altamente consistente e confiável. Na verdade o questionário se mostrou confiável durante todo o projeto. Se você gosta de estatísticas, o "Chronbach Alpha Index" (uma ferramenta para avaliar a confiabilidade de uma pesquisa) dessa pesquisa foi ".97". A maioria dos pesquisadores considera ".80" suficiente. A nota "1.0" é considerada perfeita. Uma avaliação ".97" é fantástica quando você está usando um questionário novo.

Depois que o "Questionário para idealização do processo" ficou pronto nós o aplicamos aos líderes de igreja. Igrejas de várias denominações evangélicas diferentes foram incluídas neste estudo. Igrejas de todos os Estados Unidos participaram com uma representação de 37 estados diferentes. As igrejas eram de tamanhos diferentes, em ambientes diversos e com diferentes datas de fundação.

A pesquisa com essas igrejas aconteceu em dois estágios. No primeiro estágio tivemos dois grupos que preencheram a pesquisa. O primeiro grupo consistia de igrejas saudáveis que estavam crescendo. Essas igrejas haviam crescido 5% ao ano nos últimos três anos. Poucas igrejas conseguem isso. Infelizmente menos de 2% de todas as igrejas na América experimentam esta porcentagem consistente de crescimento.

O segundo grupo era o grupo para comparação, eram igrejas que não estavam prosperando. Essas igrejas não estavam crescendo ou até diminuíram de tamanho no mesmo período de três anos.

Neste primeiro estágio 319 igrejas participaram do estudo. Eram 166 do grupo crescente e vibrante e 153 do grupo comparativo. Os resultados foram maiores do que nós imaginávamos. As igrejas vibrantes tiveram resultados muito maiores do que o grupo comparativo. Elas provaram ser simples.

Então aplicamos o segundo estágio do projeto com outras igrejas. Queríamos confirmar os resultados com um grupo diferente de igrejas.

Isso não era realmente necessário. Já haviam dados suficientes, era estatisticamente seguro. Nossos estatísticos nos garantiram que já tínhamos encontrado algo "altamente significativo". Poderíamos ter começado a escrever, falar e pregar o Simples. Já estava convincente o suficiente.

Nós simplesmente queríamos ter certeza. Estávamos nos preparando para fazer grandes afirmações e recomendações. Dizer para as igrejas complexas que elas deveriam ser simples seria algo revolucionário. Dizer para as igrejas complexas e congestionadas que elas precisavam de uma reconstrução total é como aceitar um desafio gigante. Era empolgante, mas queríamos estar duplamente seguros antes de nos lançarmos nisso.

No segundo estágio da pesquisa 88 igrejas participaram. Eram 44 igrejas crescentes e vibrantes e 44 do grupo comparativo. Nós aplicamos os mesmos critérios na segunda fase da pesquisa que aplicamos na primeira. Os resultados foram ainda mais convincentes.

Estava na hora de aceitarmos este enorme desafio.

Está na hora das igrejas enfrentarem uma reconstrução total.

Está na hora de ser simples.

OS RESULTADOS

O "Questionário para idealização do processo" tem uma abrangência de cem pontos. A pontuação máxima é de 120 e a mínima é de 20 pontos. Tanto o questionário como a pontuação foram preparados para avaliar quão simples uma igreja local é. Quanto maior a pontuação da igreja, mais simples ela é. Durante a primeira fase da pesquisa a pontuação média das igrejas crescentes e vibrantes foi 85. O grupo comparativo de igrejas teve uma média de 69. Na primeira fase da pesquisa as igrejas vibrantes pontuaram 16% mais alto do que o grupo comparativo.

Os resultados da segunda fase foram semelhantes e ainda mais convincentes. As igrejas crescentes e vibrantes pontuaram 87, enquanto as igrejas do grupo comparativo uma média de 62 pontos. As igrejas vibrantes pontuaram 25% mais do que as igrejas do grupo comparativo.

Eis a linguagem que os pesquisadores usam diante desses resultados: "Há um grau significativo de relação entre a organização da Igreja Simples e o crescimento e a vitalidade de uma igreja local". A linguagem que os estatísticos usam é ainda menos agradável de ler: "Os resultados dos testes 't' e os valores 'p' correspondentes indicam que há uma relação estatística significativa entre a organização da Igreja Simples e o crescimento e a vitalidade de uma igreja local".

Embora a informação seja importante não queremos entediá-lo com essa linguagem. Não queremos tornar esses resultados complexos ou complicados. Isso seria dolorosamente irônico uma vez que este livro é sobre ser simples.

Então aqui vai uma linguagem simples: em geral as igrejas que são vibrantes e crescem são Simples. As igrejas vibrantes são muito mais Simples do que as do grupo comparativo.

A estratégia da Igreja Simples é eficaz.

Os líderes das igrejas vibrantes provaram que são especialistas em design e organização. Eles prepararam um processo ministerial objetivo e estratégico. Essas igrejas não só pontuaram mais na pesquisa geral, como também pontuaram mais em cada um dos quatro elementos da Igreja Simples.

Os quatro elementos são cruciais ao idealizar um processo ministerial simples. Todos os quatro elementos são necessários na idealização de uma Igreja Simples. O questionário também demonstrou que esses quatro elementos estão relacionados uns com os outros. Em outras palavras é difícil ter um sem o outro.

Então, aqui está a definição completa:

Uma Igreja Simples é organizada em torno de um processo objetivo e estratégico que conduz as pessoas através dos estágios do crescimento espiritual. Está claro para a liderança e para a igreja qual é o processo (clareza) e eles estão comprometidos em executá-lo. O processo flui com lógica (movimento) e é implantado em cada área da igreja (alinhamento). A igreja abandona tudo que não está no processo (foco).

Clareza, Movimento, Alinhamento e Foco - todos são necessários! A fluência é simples, algo assim:

Clareza → Movimento → Alinhamento → Foco

Ao considerar os seus processos ministeriais você precisa considerar os quatro elementos. Talvez o processo de sua igreja necessite um pequeno ajuste ou detalhe de decoração. Talvez a sua igreja não tenha um processo. Ou talvez a sua igreja precise de uma reconstrução total.

Independente da sua situação, ao você idealizar ou reorganizar o seu ministério, esses quatro elementos têm que estar no centro do seu pensamento. Considere-os como dicas essenciais para a idealização de sua igreja e ministério.

DICAS DE IDEALIZAÇÃO

Assistir a equipe de design do programa Reconstrução Total — edição casa em ação é extraordinário. Eles são especialistas em design e em construção. Lembre-se, você foi chamado a ser mais do que organizador de programas. Você foi chamado para ser um especialista em construção (2Crônicas 2.12).

A equipe de design faz mais do que ter ideias geniais. Eles também são capazes de executar. Eles idealizam e implantam. Eles são capazes de montar o quebra-cabeça e criar um resultado final fantástico.

O processo de design deles tem os mesmos quatro elementos que nós descobrimos em nossa pesquisa sobre a Igreja Simples: clareza, movimento, alinhamento e foco.

Eles começam com clareza. Eles primeiro idealizam o conceito geral para a casa e garantem que todos entenderam. Esse estágio envolve avaliar as condições atuais da casa e as necessidades da família. A equipe de designers senta-se em torno da mesa e começa uma discussão pesada sobre o plano básico e a planta da casa.

Eles olham para a planta atual; eles sonham e discutem passionalmente o que aquela casa pode ser. Às vezes eles decidem reformar, mas outras vezes a casa precisa ser derrubada.

Independente de como fazem, finalmente levantam da mesa com um plano claro e uma planta. Eles sabem para onde estão indo. Todos juntam as mãos e começam a trabalhar. Parece que você está assistindo a um time sair dos vestiários. E de uma maneira muito real, você está.

A equipe de design também organiza o projeto em estágios sequenciais; assim ele flui facilmente (movimento). O projeto tem que andar. Para eles, o projeto tem que andar e fluir facilmente por causa do tempo limitadíssimo. Não se pode perder tempo. O próximo grupo de voluntários ou o próximo fornecedor precisa estar pronto para começar. A eficiência é impressionante. E eficiência não acontece sem uma sequência ou movimento.

A equipe de design também domina o alinhamento. Eles, com muita sabedoria, organizam os recursos e os voluntários em torno do design do processo. Materiais e voluntários são ordenados estrategicamente. Os voluntários e os equipamentos são coordenados com base na sequência do projeto.

A equipe de design se mantém completamente focada na tarefa. Eles incentivam um ao outro, ficam lembrando um ao outro porque estão naquela casa em particular. Eles mantêm os seus olhos no objetivo, no resultado final. Gerenciam a sua própria paixão; monitoram seu próprio compromisso.

Clareza, movimento, alinhamento e foco são necessários à equipe de design. Sem eles a equipe não seria capaz de distribuir graça à família. Todos os quatro elementos permitem que eles idealizem e construam uma grande casa.

O nosso chamado é ainda maior.

Casas são temporais; vidas são eternas.

Nós não estamos idealizando prédios, mas ministérios pelos quais as pessoas serão impactadas pela graça de Deus. Enquanto Cristo edifica a sua igreja (Mateus 16.18), nos tornamos parceiros com ele. Podemos ter o prazer em participar com ele idealizando um ministério que transforme as pessoas.

De acordo com a nossa pesquisa esses quatro elementos são cruciais em um processo ministerial que contribui para uma igreja vibrante. Esses quatro elementos permitem que os líderes tenham uma Igreja Simples. Clareza, movimento, alinhamento e foco serão apresentados em detalhes nos próximos capítulos, mas a seguir há uma visão geral.

CLAREZA

Clareza é a habilidade do processo de ser comunicado e entendido pelas pessoas. Um processo claro tem habilidade. Ele tem a habilidade de ser facilmente comunicado e entendido. Clareza envolve certeza e elimina confusão. Para uma igreja ser simples o processo precisa ter um alto grau de clareza.

Clareza e simplicidade andam de mãos dadas. Elas são grandes amigas.

O processo que tem clareza é definido claramente. A liderança e as pessoas sabem exatamente como a igreja está estruturada para conduzir as pessoas na direção do crescimento espiritual. O como é claro. O processo (o como) é discutido, ensinado e ilustrado, e as pessoas entendem.

Algumas igrejas não têm clareza sobre o processo ministerial porque elas não têm um. Outras têm, mas é muito complexo, longo e muito confuso. O processo é ineficiente porque não pode ser compreendido. Sem entendimento o comprometimento desaparece.

O entendimento sempre precede o comprometimento.

Se as pessoas vão abraçar e participar de um processo ministerial elas precisam ser capazes de internalizá-lo. Para internalizar o processo eles primeiro precisam entendê-lo. Portanto, clareza é absolutamente essencial.

Antes do processo se tornar claro para as pessoas na igreja ele tem que estar claro para os líderes. E é neste ponto que normalmente as falhas acontecem. Como o pastor Rush no capítulo 1 e a Primeira Igreja no capítulo 2, os líderes da igreja geralmente se engasgam durante a explicação do processo ministerial.

Em vez de clareza muitas vezes há gagueira.

Se os líderes não forem claros as pessoas não vão captar o processo ministerial. Se os líderes têm dificuldade na discussão e no ensino do processo ministerial, falta clareza. E se falta clareza ao processo, ele não é simples.

No final a falta de clareza leva à confusão e à complexidade porque não há uma direção coerente. Quando não há direção, as pessoas assumem a direção ou inventam uma. A igreja então caminha sem rumo e fora do caminho. E não há um caminho para o qual retornar.

Igrejas Simples têm um caminho para retornar. Elas possuem um processo claramente definido. Elas têm convicção de como Deus as conduziu a fazer discípulos. O processo ministerial delas é uma reflexão dessa certeza.

Para ser simples uma igreja precisa ser clara. Os resultados da pesquisa confirmam a necessidade de clareza.

A seção sobre clareza no "Questionário para idealização do processo" tem uma abrangência de 24 pontos. A pontuação máxima é de 30 e o mínimo é 6. Quanto maior a pontuação mais claro é o processo.

Durante a primeira fase da pesquisa a média de pontuação das igrejas crescentes e vibrantes foi 20. As igrejas do grupo comparativo tiveram uma média de 15. Essas pontuações significam que na primeira fase as igrejas vibrantes pontuaram 20% mais do que as igrejas do grupo comparativo.

Os resultados da segunda pesquisa mostraram uma diferença ainda maior. As igrejas crescentes e vibrantes pontuaram uma média de 20 e as igrejas do grupo comparativo pontuaram 13. Na segunda fase as igrejas vibrantes pontuaram 29% mais alto do que as igrejas do grupo comparativo.

As Igrejas Simples têm um processo absolutamente claro e elas trabalham muito para que todos o entendam. Os líderes das Igrejas Simples conhecem o processo de suas igrejas e são capazes de explicar este processo para os outros com convicção. Eles sabem disso porque o processo lhes pertence.

MOVIMENTO

Movimento é a sequência de passos no processo que faz com que as pessoas se movam na direção de áreas de compromisso maiores. Movimento tem a ver com o fluir do processo, com a sua assimilação. É o movimento que conduz as pessoas ao próximo estágio.

O movimento é o elemento mais difícil para a Igreja Simples entender. Portanto, é necessária uma ilustração.

Numa corrida de revezamento a parte mais importante é a passagem do bastão. Quatro corredores formam o time. A velocidade de cada corredor é crucial, mas não é nem de perto tão crucial quanto a passagem do bastão. As corridas de revezamento são ganhas ou perdidas na passagem do bastão.

Às vezes as equipes com os melhores corredores perdem e as equipes com os melhores passadores vencem. Você já viu isso. Uma equipe está na liderança, e então, alguém derruba o bastão durante a passagem e o time perde.

A passagem do bastão é tão importante assim mesmo.

Movimento tem a ver com a passagem do bastão. Movimento é o que acontece entre os programas e atividades. Movimento é como alguém é passado de um nível de comprometimento para um nível de comprometimento maior. Como uma igreja conduz uma pessoa do culto para os grupos pequenos é movimento. Como uma igreja é organizada para conduzir uma pessoa de observadora a participante é movimento.

É triste, mas muitas igrejas são como equipes ruins de revezamento. Em vez de se preocuparem com a passagem elas estão preocupadas com os programas. Prestam pouca atenção a como as pessoas são conduzidas a níveis maiores de comprometimento. E ignoram o que acontece entre os programas.

As Igrejas Simples prestam atenção às passagens. Captaram a verdade de que a assimilação efetiva é mais importante que uma programação efetiva. Elas sabem que à medida que a fluência do processo cresce, assim também cresce o potencial das pessoas em acompanhá-lo. Os líderes das Igrejas Simples idealizam um processo ministerial no qual os programas e atividades são ferramentas ao longo do processo.

As igrejas vibrantes que estudamos têm um processo simples que produz movimento, um processo que facilita a passagem. Os programas e atividades nessas igrejas são ferramentas usadas para promover o movimento. Os líderes focam no que acontece entre os programas assim como eles focalizam os próprios programas.

Nossa pesquisa confirma que o movimento é um elemento essencial no projeto de uma Igreja Simples. De acordo com os dados as igrejas crescentes e vibrantes já reconheceram a importância do movimento.

A seção sobre movimento no "Questionário para idealização do processo" tem uma variação de 24 pontos. A pontuação máxima é de 30 pontos e a mínima de 6. Quanto maior a pontuação, maior o movimento dentro do processo.

Durante a fase um da pesquisa a média de pontuação das igrejas crescentes e vibrantes foi 22 pontos. As igrejas do grupo comparativo tiveram uma média de 17 pontos. Na fase um as igrejas vibrantes pontuaram 21% mais que as igrejas do grupo comparativo.

Os resultados da segunda fase da pesquisa mostraram uma diferença ainda maior. As igrejas crescentes e vibrantes pontuaram uma média de 22 pontos contra uma média de 16 pontos das igrejas do grupo comparativo. Na segunda fase as igrejas vibrantes pontuaram 25% mais do que as igrejas do grupo comparativo.

Times vencedores são especialistas na passagem, as Igrejas Simples também. Eles são especialistas em idealizar um processo que produza movimento.

Para implantar o elemento movimento os líderes precisam olhar com novos olhos a agenda semanal padrão, e nos programas e atividades regulares. Todos os programas precisam ser planejados numa sequência de acordo com a ordem do processo. É isso que gera movimento num processo ministerial.

ALINHAMENTO

Alinhamento é a organização de todos os ministérios e equipe em torno do mesmo processo simples. Alinhamento do processo significa que todos os departamentos ministeriais se submetem e se relacionam ao mesmo processo geral.

O alinhamento garante que a igreja inteira está caminhando na mesma direção e da mesma maneira.

Quando uma igreja está totalmente alinhada, todos os programas estão funcionando a partir de uma mesma planta ministerial. Os ministérios não só abraçam o processo simples, mas eles estão engajados nele. Cada departamento ministerial espelha o processo geral na sua área em particular.

Sem alinhamento uma igreja pode ser uma multidão de subministérios. Nesse caso cada ministério tem seus próprios líderes que estão empolgados somente com os seus ministérios específicos. Eles raramente se identificam com a igreja como um todo, mas estão profundamente comprometidos com a sua própria filosofia de ministério.

Numa igreja onde falta alinhamento todos estão competindo pelo mesmo espaço, os mesmos recursos, os mesmos voluntários e um espaço na agenda.

Uma igreja onde falta alinhamento não se sente como um corpo. Se sente mais como um prédio que abriga uma variedade enorme de ministérios.

Todas as igrejas naturalmente se desviam do alinhamento.

Na maioria das vezes esse assunto não é nem falado. As razões variam. Uma razão em que é doloroso falar sobre isso é porque as pessoas comprometidas já estão envolvidas há um longo tempo, e estão empolgadas com a sua maneira particular de lidar com o ministério. Infelizmente elas estão mais apaixonadas pelo seu ministério do que com a igreja como um todo. Abordar o desalinhamento também toma tempo e energia. Tem um custo abordar o desalinhamento.

Lamentavelmente custa muito mais não abordá-lo.

Quando o desalinhamento num carro não é corrigido os resultados são desastrosos. Os pneus podem estourar enquanto dirigimos, estragando inclusive as rodas. O mesmo pode acontecer com uma igreja. Quando não se aborda o desalinhamento há prejuízo.

Nossa pesquisa confirma que o alinhamento é um elemento essencial para ser uma Igreja Simples. Sem alinhamento a complexidade é uma certeza.

A seção sobre alinhamento no "Questionário para idealização do processo" tem uma variação de 24 pontos. A pontuação máxima é de 30 pontos e a mínima de 6. Quanto maior a pontuação, maior o alinhamento em torno do processo.

Durante a fase um da pesquisa, a média de pontuação das igrejas crescentes e vibrantes foi 22 pontos. As igrejas do grupo comparativo pontuaram uma média de 18 pontos. Na fase um as igrejas vibrantes pontuaram 17% mais que as igrejas do grupo comparativo.

Os resultados da segunda fase da pesquisa mostraram uma diferença ainda maior. As igrejas crescentes e vibrantes pontuaram uma média de 22 pontos contra uma média de 16 pontos das igrejas do grupo comparativo. Na segunda fase as igrejas vibrantes pontuaram 25% mais do que as igrejas do grupo comparativo.

Nossa pesquisa indica que as Igrejas Simples praticam o alinhamento. Elas intencionalmente lutam para fugirem do desalinhamento. E insistem para que cada membro da equipe e cada ministério abrace e execute o processo ministerial simples delas.

FOCO

Foco é o compromisso de abandonar tudo que esteja fora do processo ministerial simples. Foco, na maioria das vezes, significa dizer não. Foco requer dizer "sim" para o melhor e "não" para todo o resto.

Enquanto o movimento é o elemento da Igreja Simples mais difícil de entender, foco é o mais difícil de implantar. Tem que ter uma profunda convicção e coragem. Foco não torna o líder de igreja uma pessoa popular.

Igrejas Simples têm um processo claramente definido. O processo foi idealizado para conduzir as pessoas a um nível maior de comprometimento e é implantado em cada departamento da igreja; assim há alinhamento. Clareza, movimento e alinhamento são essenciais.

Mas esses três elementos são ineficazes sem foco.

Foco é o elemento que dá poder e energia à clareza, ao movimento e ao alinhamento.

Sem foco as igrejas se tornam congestionadas independente do processo. Sem foco o processo é irreconhecível porque muitos outros programas e eventos o encobrem. Sem foco, o processo é enterrado no meio de uma grande quantidade de eventos.

Igrejas Simples abandonam tudo que está fora do processo simples porque ameaça roubar atenção e energia daquilo que já foi determinado como necessário. Eventos, atividades e programas fora do processo levam as pessoas a se moverem em múltiplas direções. A falta de foco leva à dispersão.

Os líderes de Igrejas Simples são pessoas focadas. Eles não são pessoas más nem necessariamente gostam de dizer "não". São apenas comprometidas com o processo simples que Deus deu àquela igreja em particular.

Os líderes de Igrejas Simples fazem perguntas difíceis. Eles querem ter certeza que algo vai se encaixar perfeitamente no processo ministerial antes de ser implementado. Querem afunilar as novas ideias dentro do processo ministerial em vez de começar novos paradigmas.

Eles enxergam tudo através das lentes do processo simples. Reconhecem que usam viseiras; às vezes são acusados de terem mente fechada. Eles focam em ser simples.

De acordo com a nossa pesquisa o foco deles é justificado.

A seção sobre foco no "Questionário para idealização do processo" tem uma variação de vinte e quatro pontos. A pontuação máxima é de trinta pontos e a mínima de seis. Quanto maior a pontuação, mais focada é a igreja no processo.

Durante a fase um da pesquisa a média de pontuação das igrejas crescentes e vibrantes foi 22 pontos. As igrejas do grupo comparativo pontuaram uma média de 18 pontos. Na fase um as igrejas vibrantes pontuaram 17% mais que as igrejas do grupo comparativo.

Os resultados da segunda fase da pesquisa mostraram uma diferença ainda maior. As igrejas crescentes e vibrantes pontuaram uma média de 22 pontos contra uma média de 17 pontos das igrejas do grupo comparativo. Na segunda fase as igrejas vibrantes pontuaram 21% mais do que as igrejas do grupo comparativo.

As Igrejas Simples têm foco. As igrejas crescentes e vibrantes são muito mais focadas do que as igrejas do grupo comparativo. Apesar de foco ser necessário, ele não é fácil. Mesmo depois de anos do estabelecimento de um processo ministerial simples o elemento foco será testado e questionado. Os líderes de igreja precisam ter uma mente focada como a do apóstolo Paulo que disse: "uma coisa faço" (Filipenses 3.13).

EZEQUIAS E AS REFORMAS

Ezequias foi um revolucionário a favor do simples. Era extremamente focado. Ele era contra as leis espirituais confusas. É evidente que Deus gostava dessa característica dele porque em 2Reis 18.3 diz que Ezequias fez "o que o Senhor aprova".

Ele levou o povo de Deus de volta para o Senhor e os conduziu por uma reconstrução total. Ezequias se livrou de algumas coisas. Primeiro removeu os altares e quebrou as colunas sagradas (2Reis 18.4). Basicamente jogou fora os altares que haviam sido feitos para os deuses "faz-de-conta". Ele retirou a confusão sem Deus que estava disputando a atenção e a afeição do povo.

A maioria dos líderes de igreja está disposta a fazer isso. Com certeza esse movimento nos tempos de Ezequias foi entendido e recebido até pelos adoradores nominais de Deus. Eles esperavam que o líder insistisse para que o povo adorasse a Deus. Eliminar os ídolos pagãos é uma coisa, mas o que Ezequias fez depois era controvertido. Muitos líderes de igreja teriam dificuldade de aplicar este próximo passo. Com certeza as pessoas de sua época tiveram dificuldade com a próxima mudança.

Ezequias quebrou a serpente de bronze que Moisés fizera — intencionalmente. Ele simplesmente não derrubou e disse que foi um acidente. O rei Ezequias a quebrou em pedaços. Sim, aquela era uma serpente especial e sagrada. Era a serpente que havia sido esculpida e mantida por Moisés. A serpente que Deus havia mandado Moisés esculpir. A serpente que fora a fonte de salvação para as pessoas das mordidas das cobras (Números 21.6-8).

Ele se livrou dela porque era um empecilho. Era um empecilho porque as pessoas a adoravam. Ela tirava a atenção do verdadeiro salvador. O bronze era adorado. Uma serpente falsa era adorada. O que um dia foi uma coisa boa se tornara um ídolo. Ela se colocou como uma barreira para a adoração a Deus. Um instrumento de adoração se tornou um objeto de adoração.

Em muitas igrejas os instrumentos originais para mudança de vida criaram muitos obstáculos. Em vez de unir eles dividem o foco. Os programas se tornaram um fim em si mesmos.

A maioria das igrejas precisa de uma reconstrução total e de um moderno Ezequias. Para ele eliminar a cobra de bronze com certeza não era uma decisão muito popular, especialmente com a multidão religiosa agarrada profundamente à tradição. A maioria das reconstruções radicais envolvendo o povo de Deus são difíceis.

Ezequias fez o que provavelmente era considerado como algo à beira da insanidade. Foi uma postura radical e isso agradou a Deus. Na verdade, não houve rei como ele nem antes e nem depois do seu tempo (2Reis 18.5).

A igreja precisa de alguns Ezequias modernos.

O próximo Ezequias pode começar uma reconstrução total, por favor?

HANS HOFMANN E OS REFORMADORES

Hans Hofmann foi outro revolucionário pelo simples.

Nasceu na Baviera no final do século 19. Ele se tornou um artista e professor de outros grandes artistas. Aprendeu com alguns legendários artistas como Picasso e Braque. Começou e ensinou na Escola de Artes Hans Hofmann em Manhattan. Hofmann ensinou até mesmo o pai de Robert De Niro.

Hofmann uma vez disse que, "se você quer que o necessário sobressaia, tem que se livrar do desnecessário".

Há muitas coisas que são desnecessárias na maioria das igrejas. É tentador deixar as coisas como estão e evitar o trabalho de uma reconstrução total. No entanto, o desnecessário geralmente toma o lugar do necessário. O desnecessário divide as atenções, os recursos e o tempo. O desnecessário pode esconder o necessário.

Mas as igrejas precisam que o necessário sobressaia.

Para ser simples é preciso eliminar o desnecessário. A maioria das coisas que você vai eliminar é boa. Começou com um líder empolgado e atendeu a uma necessidade real.

A chave é escolher o melhor. Elimine o desnecessário e fique com o melhor. "Esta é a minha oração... para discernirem o que é melhor" (Filipenses 1.9-10).

Assim quantas igrejas se tornaram Igrejas Simples? Não muitas, a esta altura. Mas há um mover crescente nesta revolução da Igreja Simples. Junte-se a nós, no próximo capítulo, onde vamos visitar três dessas igrejas revolucionárias.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Qual é o processo ministerial de nossa igreja?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O nosso processo é claro? Ele tem clareza?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$O nosso processo efetivamente conduz as pessoas a um maior nível de comprometimento?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$O nosso processo é implementado em todas as áreas da nossa igreja? Estamos alinhados em torno do nosso processo?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Quão focada é nossa igreja?$p$, 'reflexao', null),
    (v_aula_id, 6, $p$O que Ezequias pensaria da nossa igreja?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 4 — Três histórias simples  (aula ordem = 5)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 5;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 4 — Três histórias simples$t$,
      5,
$conteudo$"... sobre esta pedra edificarei a minha igreja, e as portas do Hades não poderão vencê-la". Jesus (Mateus 16.18).

Clareza • Movimento • Alinhamento • Foco

Há uma conversa interessante registrada em Mateus 16. Se entrar na conversa você encontrará Jesus perguntando aos seus discípulos quem as pessoas dizem que ele é. É uma pergunta simples. Não é complicada. É direta ao ponto.

E esta é uma pergunta que não é feita com frequência. Não pergunta o que as pessoas estão dizendo sobre ele. Não pergunta se as pessoas estão dizendo que ele é um cara legal e um bom pregador. A sua pergunta é diferente. Ele pergunta, "Quem os outros dizem que o Filho do Homem é?" (v.13). Os discípulos dizem que algumas pessoas estão falando que ele é João Batista. Outros estão dizendo que Jesus é Elias.

Jesus então faz aos discípulos a mesma pergunta. Ele quer saber o que eles pensam. "Quem vocês dizem que eu sou?" (v.15). Pedro, é claro, fala em nome de todo grupo. "Tu és o Cristo, o Filho do Deus vivo" (v.16).

Jesus ama a resposta dele e diz que Pedro é um abençoado. As palavras que Pedro disse não vieram de um homem, mas de Deus. Então Jesus diz, "sobre esta pedra edificarei a minha igreja, e as portas do Hades não poderão vencê-la" (Mateus 16.18).

As portas do inferno não poderão vencê-la. O inferno não poderá impedir a igreja. Jesus diz que vai dar início a um movimento que será tão poderoso e intenso que não poderá ser interrompido. Esse movimento é a igreja. Não é uma instituição, um prédio, um programa, um credo, ou uma declaração doutrinária. Este movimento está vivo e crescendo. Este movimento são pessoas. Jesus começou a igreja e as portas do inferno não serão capazes de impedi-la.

A TEOLOGIA DOS PORTÕES

Para que seu sogro e sogra se sentissem de alguma maneira confortáveis com a filha morando em Miami, Eric comprou uma casa em um condomínio fechado. Afinal de contas, Miami não é conhecida como o lugar mais seguro para se morar. Os seriados Miami Vice e agora CSI Miami não ajudam a melhorar essa imagem. Eric estava todo empolgado para dizer aos seus sogros que estava fazendo tudo o que podia para proteger a filha deles. Ele mora num condomínio fechado ao sul de Miami.

Pelo menos era isso que a propaganda dizia quando ele comprou a casa.

Acontece que o portão de entrada era apenas um cano de PVC preso a um sistema mecânico, e só isso! Nos dois anos que o Eric mora na casa o portão funcionou por aproximadamente quarenta e uma horas.

A questão do portão é bem simples. As pessoas que não receberam o controle remoto pelo correio decidiram que iriam atravessar o portão. O pedaço de cano PVC pintado não tinha nenhum efeito sobre os carros. O portão quebrou. Depois de algumas semanas o condomínio pagou para uma empresa consertar o portão. Aí alguém atravessa o portão novamente. Então o condomínio decidiu parar de pagar o conserto.

Assim, o portão de cano PVC agora está no chão. Está bem abaixo da placa que direciona as pessoas para o condomínio fechado. O portão não conseguia impedir a entrada. Ele não conseguia enfrentar o poder dos carros. Era uma competição patética.

As portas do inferno são a mesma coisa. Elas não têm poder para conter o movimento do evangelho. Jesus começou o movimento e o inferno não pode contê-lo.

Há outra coisa sobre os portões. São sempre defensivos. Eles protegem, mas nunca atacam. O portão largado ao lado da placa no condomínio nunca o atacou, apesar de todas as coisas que Eric já disse sobre ele. O portão não tem força.

Os portões nunca estão na ofensiva, somente na defensiva. O inferno está sempre na defensiva. No entanto, o movimento da igreja nunca está na defensiva, somente na ofensiva! A bola está sempre com a igreja. Não há defensores no time.

Isso é uma boa notícia. A vitória está garantida.

A questão não é se vamos vencer ou não. A celebração da nossa vitória já está determinada. Cristo já prometeu. Nós venceremos no final. Na verdade, o inimigo nunca pega a bola. O reino das trevas está preso na defesa, e nós estamos perpetuamente no ataque.

Até o time mais incompetente poderia vencer se o adversário nunca jogasse no ataque. Pode até levar tempo, mas eventualmente eles seriam vencedores.

A questão é qual será o placar da nossa vitória? Qual será o tamanho do estrago que faremos nos portões do inferno? Vamos fazer um placar enorme? Vamos invadir os portões do inferno com o movimento do evangelho?

Neste capítulo você vai encontrar três histórias simples. São histórias de três Igrejas Simples que estão fazendo o placar aumentar. Essas igrejas estão fazendo um grande estrago no reino das trevas. Deus está usando essas igrejas para encurralar os inimigos.

Embora o nosso projeto de pesquisa tenha trabalhado com centenas de igrejas queremos contar para vocês algumas histórias de Igrejas Simples. Foram selecionadas igrejas de vários tamanhos e locais. Primeiro, você vai ouvir a história de uma igreja rural com trezentas pessoas. Depois vai ouvir a história de uma igreja numa das cidades americanas menos cristãs. E finalmente você vai encontrar uma das igrejas que mais crescem na história dos Estados Unidos.

Que as portas do inferno caiam ao chão, bem ao lado daquele cano de PVC.

HISTÓRIA 1: EMANUEL

Há várias igrejas Emanuel. Provavelmente há uma em sua comunidade. Alguns soletram com "e" e outros com "i". E alguns são muito orgulhosos da maneira como eles soletram. Esta é a história da Igreja Batista Emanuel em Glasgow, Kentucky. Glasgow é uma cidade com dezesseis mil habitantes, localizada no condado de Barren. O condado de Barren tem quarenta mil habitantes. Glasgow é a fivela do "Cinturão da Bíblia" (esta é uma expressão para definir uma região ultraconservadora, com muitas igrejas e muitos crentes, no centro-sul dos EUA). A cidade é seca. Há mais de cem igrejas listadas no site da cidade.

As pessoas em Glasgow gostam do ritmo da cidade e da hospitalidade sulina. Praticamente não há crime e as escolas são bem respeitadas. O tráfego é mínimo a não ser que você fique preso atrás de uma picape velha andando a 50 km por hora. Há bastante terra e a cidade é muito bonita. As pessoas confiam em seus vizinhos. A vida é boa.

Na maioria das cidades rurais dessa região (Cinturão da Bíblia) há uma igreja em cada esquina. Praticamente todo mundo se diz membro de alguma igreja, mesmo que não frequente há anos. Muitas dessas igrejas estão lutando com dificuldades. Raramente novas pessoas são levadas a Cristo. De tempos em tempos uma igreja enfrenta problemas, e então, a outra igreja a três quadras ganha alguns novos membros.

Essa cultura não é diferente em Glasgow. No entanto, Emanuel é diferente. Deus está usando Emanuel para derrubar as portas do inferno.

A Igreja Batista Emanuel é vibrante, viva e está crescendo. Nos últimos dois anos a igreja dobrou em número de participantes, de cento e cinquenta para trezentas pessoas. Pessoas novas aparecem regularmente. Muitas pessoas têm se convertido à fé cristã. A igreja batiza pessoas com regularidade, e elas estão crescendo e servindo.

Emanuel também é diferente porque Emanuel é simples. A complexidade, que é uma praga em muitas igrejas rurais, não existe. Ao contrário, Emanuel tem um processo simples que orienta o seu ministério.

CLAREZA NA EMANUEL

Tony Cecil é o pastor da Igreja Batista Emanuel. Ele tem trinta e três anos de idade e Emanuel é a primeira igreja na qual ele serve como pastor titular. Quando Tony chegou a Glasgow sabia que a igreja precisava de um processo simples de discipulado. Ele comentou:

Aos vinte e nove anos de idade, pela primeira vez como pastor titular, eu tenho dificuldades com as disfunções e o caos que caracterizavam as igrejas que eu encontrei. Pela graça de Deus, através de meus estudos pessoais e conversas com amigos, comecei a perceber a importância de abraçar e implementar um processo estratégico para fazer discípulos.

Tony reuniu um grupo de líderes piedosos em sua igreja. Eles procuraram definir que tipo de discípulos queriam fazer na Emanuel. Concluíram que crentes totalmente comprometidos teriam intimidade com Deus e com outros cristãos, pessoas que cresceriam na fé e que serviriam ao Reino de Deus.

Tony e o grupo decidiram descrever o seu foco de discipulado como um processo. Eles o chamaram: Conectando, Crescendo, Servindo. Primeiro, Emanuel procura conectar as pessoas a Deus e aos outros. Eles querem que as pessoas se tornem "crentes em conexão". A seguir eles desafiam esses "crentes em conexão" a se tornarem "crentes em crescimento", através do engajamento em oportunidades para um crescimento espiritual profundo. Finalmente, o processo termina com os "crentes em crescimento" se comprometendo a se tornarem "crentes em serviço".

MOVIMENTO NA EMANUEL

Para promover o movimento através do processo, Emanuel organizou a sua agenda semanal de atividades nos pontos-chave do processo. Eles usam os cultos de domingo pela manhã para desenvolver "crentes em conexão". O culto é preparado para levar as pessoas a um relacionamento com Deus e com outros cristãos.

Depois que alguém vem ao culto, a pessoa é encorajada a se juntar a um dos grupos bíblicos de comunhão. Emanuel dispõe de grupos bíblicos de comunhão aos domingos pela manhã para desenvolver "crentes em crescimento".

O processo não termina aí. Depois que uma pessoa participa de um grupo bíblico de comunhão, ela é desafiada a se juntar a um grupo pequeno. Esses grupos pequenos foram idealizados para tornar as pessoas em "crentes em serviço". Cada grupo bíblico de comunhão é formado por vários grupos pequenos. Esses grupos são equipes de serviço e eles se envolvem no ministério juntos, seja na comunidade ou na igreja.

Estrategicamente Emanuel conduz os adultos dos cultos aos grupos bíblicos de comunhão e depois para os grupos pequenos. Conduzindo as pessoas de uma atividade para a outra, as pessoas naturalmente progridem através do processo simples.

O movimento na Emanuel é intencional. Por exemplo, o conteúdo do estudo nos grupos bíblicos de comunhão coincide com a mensagem dos cultos. Tony escreve cada semana o que ele chama de "coordenadas" que complementam a sua mensagem. Os líderes dos grupos de comunhão usam essas coordenadas como currículo. Tony pode então convidar as pessoas que participam do culto a participarem de um grupo bíblico de comunhão "para terem mais informação e para se aprofundarem".

Intencionalmente as pessoas são conduzidas do nível "crentes em conexão" ao nível "crentes em crescimento". O caminho é claro entre o culto e o próximo passo. Esse caminho promove movimento. Sem um caminho as pessoas se perdem pelos atalhos.

Para conduzir as pessoas dos grupos bíblicos de comunhão para os grupos de serviço, Tony e os líderes dos grupos de comunhão decidiram conectar os pequenos grupos de serviço aos grupos de comunhão. Quando uma pessoa vai a um grupo de comunhão, imediatamente é dada a ela a oportunidade de participar de um grupo de serviço. Não há espaço entre os programas. O movimento acontece facilmente.

ALINHAMENTO NA EMANUEL

Como Emanuel não é uma igreja grande não há uma miríade de ministérios para se engajar. Os ministérios prioritários na Emanuel são os ministérios voltados para crianças e adolescentes. Ambos usam o mesmo processo simples: conectando, crescendo, servindo.

Os estudantes têm um programa semanal de conexão idealizado para conduzir os adolescentes a um relacionamento com Cristo. Eles usam os grupos pequenos para conduzir os adolescentes ao crescimento e aprofundamento, e têm grupos de ministérios para engajar os estudantes no serviço. As crianças têm uma atividade semanal de conexão e outra atividade para crescimento.

Todos usam a mesma terminologia: Conexão, Crescimento, Serviço. Simples! Está sempre dentro de todas as partes da igreja. As pessoas na congregação escutam isso o tempo todo.

FOCO NA EMANUEL

A Igreja Batista Emanuel tem um processo simples que está claramente definido, conduz as pessoas e está implementado em toda a igreja. Eles escolheram focar todas as suas energias e recursos nesse processo simples. Por causa desse foco eles têm sido capazes de colocar todos os seus recursos financeiros nas atividades dentro desse processo.

Alguns pensariam que este foco poderia inibir a vitalidade da igreja. Na região rural do "Cinturão da Bíblia" as igrejas geralmente são conhecidas pela quantidade de eventos especiais que fazem. Emanuel vai contra esta cultura. Ela faz parte da revolução do simples. Tony comentou:

A ironia é que na realidade nós crescemos numericamente e espiritualmente por promovermos menos atividades e eventos especiais, ao contrário, escolhendo focar a nossa atenção na condução das pessoas com vários níveis de comprometimento a um nível cada vez mais profundo.

BENEFÍCIOS EXTRAS NA EMANUEL

Descobrimos essa grande igreja na fase de pesquisa do projeto. Poucas igrejas experimentaram o crescimento que Emanuel viveu. Foi explosivo e não vegetativo. Essa igreja quebra as regras. Eles estão crescendo através do alcance de novas pessoas numa cidade que não está passando por um crescimento populacional e está cheia de outras igrejas. É realmente algo de Deus.

Idealizar um processo simples para a igreja tem feito uma grande diferença na Igreja Batista Emanuel. Pedimos ao Tony para listar alguns benefícios de ser uma Igreja Simples. A seguir está a resposta dele.

- O moral crescente. O moral melhorou muito pelo fato de simplesmente definirmos a Grande Comissão na forma de um processo simples de discipulado. Essa realidade parece ter origem no fato de as pessoas entenderem como nos propomos a fazer discípulos, em vez de dizer às pessoas que elas precisam fazer discípulos.

- Urgência. Há um constante senso de urgência em conduzir as pessoas até a maturidade espiritual, em vez de simplesmente vê-las convertidas.

- Crescimento Espiritual. Embora seja difícil de medir nós temos visto os crentes crescerem e se tornarem maduros a olho nu. O processo não só mostra onde as pessoas estão, mas também qual o próximo estágio para onde devem ir. Como resultado as pessoas se tornaram pró-ativas no seu próprio desenvolvimento espiritual. Compromisso pessoal com estudo bíblico e envolvimento com grupos pequenos cresce sistematicamente. Mais pessoas estão compartilhando a sua fé; mais pessoas estão convidando seus amigos para os cultos e para os grupos pequenos.

- Conversões. Temos experimentado um crescimento significativo com a conversão de adultos e batismos. Nosso processo ministerial tem levado os adultos a serem mais pró-ativos em convidar seus amigos às atividades apropriadas que estão voltadas a conectar as pessoas com Jesus e com outros cristãos. Esse processo também resultou na sensibilidade dos adultos em terem um comprometimento maior com Cristo aprendendo como compartilhar a sua fé com seus amigos e parentes. Antes de desenvolvermos nosso processo, nossa igreja havia batizado dois adultos nos primeiros dezoito meses do meu ministério. Desde que desenvolvemos nosso processo, estamos no alvo de batizar quarenta pessoas cada ano. Esse número ainda está aquém do que desejamos em termos de evangelização, mas para nós já foi um grande avanço.

- Mordomia. Nossa situação financeira melhorou drasticamente depois da eliminação das atividades e ministérios que não contribuíam para o processo geral. Também percebi que é mais fácil eliminar uma atividade depois que as pessoas se comprometeram com o processo congregacional.

- Unidade. À medida que experimentamos alguns sucessos de curto prazo a nossa unidade como um todo tem se fortificado. Estamos nos tornando uma família mais unida através da concordância em torno do processo e na consolidação dos nossos esforços em executá-lo.

HISTÓRIA 2: COMUNIDADE DE CRISTO

Até um ano atrás a Comunidade de Cristo em Miami era a Primeira Igreja Batista de Perrine. O nome do bairro mudou para Palmeto Bay e Deus levou a igreja a um novo nome. A Comunidade de Cristo é uma igreja multicultural composta por mais de setenta nacionalidades. Rick Blackwood é o pastor titular e Eric serve como pastor-executivo. Antes de ir para LifeWay Thom fez uma consultoria com a igreja. Ele acredita que Rick, entre os pastores de igrejas grandes, é um dos mais humildes com quem ele interagiu.

Miami pode ser no sul, mas definitivamente não tem nada a ver com o "Cinturão da Bíblia". É uma cidade cheia de pessoas do mundo todo e com uma desesperada necessidade da graça de Deus. Muitas igrejas têm dificuldades em Miami. Muitos pastores têm dificuldades em Miami. Não é um lugar fácil para se exercer o ministério. Na melhor das hipóteses, Deus e a igreja são um adendo para a maioria das pessoas.

A Comunidade de Cristo tem 89 anos de idade. É uma igreja com uma grande história e tradição. Nos últimos 45 anos apenas dois pastores titulares estiveram à frente da igreja. Geralmente nas igrejas com uma história rica as mudanças são muito difíceis. As pessoas não veem razão para mudar. As coisas estão bem assim como estão. Há muitas atividades e eventos e a maioria das pessoas está feliz. O status quo é confortável.

No entanto, na Comunidade de Cristo, Deus reuniu uma equipe de pastores e líderes que não estavam satisfeitos. Eles acreditavam que Deus queria fazer mais. Estavam convencidos que os portões do inferno precisavam ser derrubados.

Vários anos atrás os pastores da Comunidade de Cristo começaram a avaliar o ministério. Queriam definir que tipo de discípulos a igreja deles desejava fazer. Deus imprimiu em seus corações que eles deveriam conduzir as pessoas a focarem em quatro coisas: um relacionamento íntimo com Deus, comunhão com os outros, serviço e influenciando não cristãos. A visão para este tipo de discípulo conquistou a equipe.

Eles se comprometeram com esses quatro aspectos do discipulado. E empenharam-se em apressar o processo de se tornarem simples. O compromisso deles tem se mostrado compensador. A igreja continua crescendo e tem visto, especialmente adultos, se chegarem a Jesus. As pessoas estão crescendo na fé e se engajando nas oportunidades de serviço.

CLAREZA NA COMUNIDADE DE CRISTO

Ao mesmo tempo em que estes quatro aspectos do discipulado cativou a equipe, eles também sabiam que o discipulado era um processo. E trabalharam duro para formular uma declaração que englobasse tanto a natureza processual do discipulado como esses quatro aspectos. Como muitas igrejas eles tinham uma declaração de visão, propósito, estratégia e missão. Era muita coisa e muito confuso.

Então se comprometeram com uma única declaração que demonstrasse o processo simples deles: Conectar a Deus, aos outros, ao ministério e aos perdidos. O discipulado inclui ter um relacionamento íntimo com Deus (conectar com Deus); viver em comunidade com outros crentes (conectar com os outros); servindo no corpo de Cristo (conectar com ministério); e compartilhar o evangelho (conectar com os perdidos).

O propósito da Comunidade de Cristo é um processo. Primeiro a pessoa se conecta com Deus. Este é o aspecto mais básico e essencial do discipulado, mas ele não termina aí. Em seguida a pessoa se conecta com os outros. Depois de amar a Deus e aos outros o resultado natural é ministrar às pessoas. Finalmente, a pessoa está vivendo uma vida completamente submissa a Deus na qual a evangelização é uma consequência deste relacionamento dinâmico.

O processo passou a ser o centro das atenções nas reuniões de equipe e de liderança voluntária. Ele é pregado com clareza e convicção do púlpito. O boletim dominical e todos os documentos de comunicação explicam o processo. A equipe discute o processo e mede o quanto as pessoas estão progredindo através dele. É esperado que todos os membros da equipe, inclusive o pessoal administrativo, seja capaz de comunicar este processo aos outros.

MOVIMENTO NA COMUNIDADE DE CRISTO

Os líderes da Comunidade de Cristo sabiam que o processo seria apenas outra declaração a não ser que ele fosse refletido na programação semanal deles. O processo se tornaria apenas palavras se as atividades não se tornassem ferramentas para conduzir as pessoas pelo processo. O processo e a programação têm que ser amigos; eles precisam complementar um ao outro.

Então a equipe discutiu quais as melhores atividades para cada nível do processo, e se comprometeram a organizar essas atividades numa ordem sequencial de acordo com o processo. Em outras palavras, eles decidiram organizar a programação semanal de tal maneira que as pessoas pudessem facilmente ser conduzidas através do processo, simplesmente participando de um programa e depois do outro.

O primeiro passo no processo é Conectar com Deus. Nos finais de semana, através dos cultos, as pessoas podem começar ou aprofundar o relacionamento delas com Cristo. Através de um culto inclusivo e uma mensagem bíblica, as pessoas são entregues a um ambiente onde a preocupação principal é o crescimento e a intimidade no relacionamento com Deus. Muitas visitas comparecem aos cultos cada semana, portanto faz sentido que este seja o primeiro programa no processo.

O segundo passo no processo é Conectar com os outros. A equipe concluiu que os grupos pequenos são o melhor ambiente para se desenvolver relacionamentos e interdependência. As pessoas podem ir fielmente aos cultos dominicais, mas se não se conectarem a um grupo pequeno o crescimento espiritual delas para, e elas não serão realmente conhecidas. Os grupos pequenos acontecem no domingo pela manhã, as quartas à noite e nas casas durante a semana.

O terceiro passo no processo é Conectar com um ministério. A Comunidade de Cristo faz uso de equipes ministeriais para criar oportunidades de serviço às pessoas. As pessoas experimentam Deus trabalhando através delas enquanto elas ministram aos outros de forma tangível. As pessoas são desafiadas a se envolver em equipes que estejam engajadas em ministérios pelos quais estão empolgadas.

O passo final do processo é Conectar com os perdidos. Na Comunidade de Cristo este passo não é um programa, mas um estilo de vida relacional. As pessoas são desafiadas a convidar os parentes e amigos para vir à igreja. A igreja como família é desafiada não só a acompanhar o processo, mas também a conduzir outros através dele. Quando alguém é trazido a um culto dominical, para esta pessoa o processo começa.

Como o último passo não é um programa, as pessoas na comunidade de Cristo são desafiadas a fazer três coisas por semana. Vir ao culto, estar em um grupo pequeno e servir em algum ministério. Simples! Essas expectativas são ditas com clareza para as pessoas na igreja. Na classe de novos membros é dito às pessoas que não devem se tornar membros se elas não têm o desejo de se engajar neste processo.

Para facilitar o caminho para os grupos pequenos, eles são anunciados durante os cultos. A igreja também oferece estudos de seis semanas para os grupos pequenos baseados nas séries apresentadas nos cultos. As pessoas são encorajadas a se juntarem ou até mesmo a criarem um grupo pequeno para o estudo de uma série. Esse processo tem levado centenas de pessoas para os grupos pequenos.

Para facilitar o engajamento das pessoas no ministério elas são encorajadas a fazer um teste em algum ministério. O teste é uma oportunidade de servir num ministério como experiência durante o seu funcionamento. As pessoas podem experimentar sem nenhuma pressão para se juntar ao grupo. Depois da experiência elas conversam com o líder do ministério e têm a oportunidade de continuar ou de experimentar outra atividade.

ALINHAMENTO NA COMUNIDADE DE CRISTO

O alinhamento é evidente na Comunidade de Cristo. O departamento infantil, de adolescentes e de jovens adotam o mesmo processo. Você acertou: Conectar com Deus, com os outros, em um ministério, e com os perdidos. A equipe tem o mesmo objetivo e caminha na mesma direção. Toda a igreja está alinhada no mesmo foco.

Os departamentos infantil, adolescentes e jovens organizam suas próprias atividades para Conectar com Deus. Elas acontecem ao mesmo tempo em que os cultos. Cada grupo de idade tem um grupo pequeno nas quartas à noite para Conectar o seu grupo aos outros. Cada departamento também providencia oportunidades de ministério adequadas à sua idade.

FOCO NA COMUNIDADE DE CRISTO

Depois que a equipe se comprometeu de todo coração ao processo de Conectar as pessoas a Deus, aos outros, ao ministério e aos perdidos, decisões difíceis tinham que ser tomadas. Eliminar algumas atividades que não se encaixavam se tornou necessário para maximizar o impacto do processo.

Durante um período de dois anos o culto de domingo à noite foi eliminado. E ainda, alguns grupos pequenos, classes de Escola Bíblica Dominical e grupos de discipulado nas quartas à noite, foram englobados em uma única estratégia de grupos pequenos. Todos os grupos foram colocados debaixo da mesma liderança e filosofia. Essas duas mudanças facilitaram para que as pessoas pudessem acompanhar o processo. Elas agora eram desafiadas a participar de um culto e um grupo pequeno por semana.

As programações extras são o que os consultores de negócios chamam de adicionar trabalho sem valor. Elas não agregam valor ao processo. Na verdade, as programações extras competiam com o processo porque era mais difícil de as pessoas se envolverem em um grupo pequeno e um ministério. Elas têm pouco tempo disponível e os líderes decidiram diminuir a demanda de tempo para que pudessem se conectar às atividades essenciais ao processo.

Com o objetivo de dar um foco ainda maior, até mesmo algumas atividades bastante populares foram alteradas ou mesmo eliminadas na Comunidade de Cristo.

Uma das atividades mais populares era a "Recreação aberta da sexta à noite". Era uma noite com comida grátis, jogos e basquete. Todas as sextas ela atraía entre trezentos e quatrocentos estudantes. Embora fosse um sucesso, não estava claro como que esta atividade se encaixava no processo.

O evangelho não era pregado neste eventos e não era a porta de entrada para o ministério estudantil; portanto não podia ser classificado como uma atividade para "Conectar com Deus". Os pastores de juventude não conseguiam gerenciar este evento semanal e ainda preparar outra atividade empolgante no final de semana para "Conectar com Deus". A atenção deles estaria dividida, além dos estudantes convidarem os amigos para uma atividade que não estava no processo em vez de trazê-los para uma que estava.

As sextas-feiras foram canceladas. O programa foi restabelecido aos sábados à noite, depois do culto, como uma forma de engajar mais estudantes às atividades de "Conectar com Deus". Colocando o lanche e os jogos depois do culto aos sábados mais jovens têm participado desses cultos.

Outra atividade popular que foi alterada foram os cultos especiais de Natal. Como muitas igrejas a Comunidade de Cristo preparava cultos específicos de Natal todo ano. Muitas pessoas que raramente vinham à igreja compareciam aos cultos especiais de Natal, mas esses cultos eram completamente diferentes dos cultos de final de semana. As pessoas nunca experimentavam do que acontecia num culto regular de final de semana. Os cultos especiais de Natal não conseguiam engajá-las no processo simples.

Membros ativos da igreja participavam tanto dos cultos de Natal como dos cultos regulares nos finais de semana. A equipe tinha que preparar dois cultos diferentes na mesma semana o que diminuía a qualidade de ambos os cultos. Era também um mau uso do espaço porque as mesmas pessoas estavam participando de múltiplas atividades em vez de deixar o espaço livre para que as outras viessem.

Além disso, os membros da igreja em vez de convidarem as pessoas para os cultos de final de semana as convidavam para os cultos especiais de Natal. Esses convidados nunca participavam de um culto típico de final de semana e muito provavelmente não voltariam.

Para simplificar as coisas e levar o maior número de pessoas a conhecerem um típico culto de final de semana (uma atividade de Conectar com Deus), a equipe decidiu combinar os cultos especiais de Natal com os cultos de final de semana. Agora a Comunidade de Cristo tem vários cultos de Natal idênticos no final de semana. A eliminação do programa especial se mostrou eficiente imediatamente porque o número de pessoas que conheceram um culto de final de semana cresceu enormemente.

HISTÓRIA 3: COMUNIDADE NORTHPOINT

Enquanto a Igreja Batista Emanuel e a Comunidade de Cristo fizeram uma transição para o formato "Igreja Simples". A Comunidade Northpoint começou assim.

A Northpoint é o sumário do simples. Eles são pioneiros. A Comunidade Northpoint fica em Alpharetta, na Geórgia, logo ao norte de Atlanta. O pastor titular e fundador é Andy Stanley. Embora Andy tenha crescido no contexto de igrejas complexas ele escolheu começar Northpoint comprometido com o simples. Ele acredita que o ministério naturalmente caminha na direção da complexidade e ela simplesmente acontece. Infelizmente, de acordo com Stanley, "a complexidade dilui o seu potencial de impacto".

Para contra-atacar a complexidade a igreja tem se mantido comprometida com o simples. Este compromisso tem empurrado os portões do inferno. A igreja cresceu de um punhado de gente para mais de dezesseis mil em dez anos. Deus tem usado a igreja para levar muitas pessoas à fé e à maturidade espiritual. Deus também tem usado a igreja para desafiar e encorajar líderes de igreja pelo mundo afora.

CLAREZA NA NORTHPOINT

A Comunidade Northpoint tem um processo claro que é constantemente citado na vida da igreja. Eles o chamam de "Do hall de entrada à cozinha". Querem conduzir as pessoas para a cozinha onde elas participarão de grupos comunitários com os outros. Eles fazem isso porque estão convencidos de que é nesse ambiente que a mudança de vida acontece melhor. Assim, tudo o que fazem é idealizado para levar as pessoas para a cozinha.

A metáfora surgiu de uma visita que Andy Stanley e sua esposa fizeram a uma igreja no domingo pela manhã. Quando eles estavam saindo, a esposa dele comentou que ela se sentiu na igreja como se alguém a tivesse convidado para entrar em sua casa e então eles esqueceram da hora. Stanley se convenceu de que a igreja deveria ser organizada de forma que as pessoas nunca se sentissem sozinhas. Elas têm que ser conduzidas a algo.

A igreja é organizada de maneira a conduzir as pessoas a níveis maiores de comprometimento e relacionamento. O processo delas começa no hall de entrada. Assim como a entrada de uma casa é usada para dar as boas-vindas aos que chegam, a Northpoint se refere ao primeiro passo como o "hall de entrada".

A imagem de uma casa e uma família continua em todo processo. O próximo passo é a sala de estar. Depois que os visitantes são recebidos no hall de entrada eles são conduzidos à sala de estar onde os relacionamentos são construídos. Sem a sala de estar as pessoas continuariam no hall de entrada. Não haveria para onde ir. Sem o ambiente da sala de estar na Northpoint elas não poderiam progredir para o passo final.

O passo final neste processo é a cozinha. Na maioria das casas é na cozinha que acontecem as conversas mais íntimas. É onde a vida de todos se junta e acontece e onde as discussões familiares também acontecem. Na Northpoint a cozinha é o nível mais profundo de compromisso. É onde todos são transformados em comunidade com os outros. É onde as pessoas se responsabilizam umas pelas outras e encorajam umas às outras na direção da maturidade espiritual.

MOVIMENTO NA NORTHPOINT

O processo todo "do hall de entrada à cozinha" na Northpoint tem a ver com movimento. Eles resistem à palavra programa e em vez disso usam palavras como passos ou ambientes. Passos têm a ver com movimento. Eles querem conduzir as pessoas para a cozinha porque acreditam que é lá que acontece a mudança de vida. Eles apenas usam os passos para conduzirem as pessoas até lá.

A Northpoint organizou os seus passos/ambientes numa sequência ao longo do processo para facilitar o movimento. O ambiente do "hall de entrada" é o culto, e este é o claro ponto de entrada para a igreja. As pessoas são encorajadas a investir na vida dos não crentes e convidá-los para vir à igreja; portanto, o culto semanal deles é o programa onde se espera que os visitantes venham.

O ambiente da sala de estar é o que eles chamam de grupo de conexão (GroupLink). É onde as pessoas se conectam umas às outras pelos relacionamentos. Esses grupos não se encontram toda semana. Eles acontecem em momentos estratégicos ao longo do ano. O foco é fazer com que todos conheçam uns aos outros. A intenção é usar os grupos de conexão para conduzir as pessoas até a cozinha/grupos pequenos.

É no ambiente da cozinha que os indivíduos se encontram em grupos pequenos para comunhão e estudo da Bíblia. Andy argumenta que o processo deles é muito simples porque eles querem conduzir as pessoas através desses três ambientes. Então elas são desafiadas a conduzirem outras pelo mesmo processo.

Movimento é o forte da Northpoint.

Não há ambientes na Northpoint onde as pessoas ficam para sempre. Este é um grande contraste com a igrejas onde os membros ficam nos mesmos grupos por décadas. Na Northpoint os crentes são constantemente conduzidos a um novo passo. Mesmo quando alguém chega na cozinha o movimento não está completo. Os grupos pequenos têm que começar novos grupos.

Na Northpoint todos os passos têm que conduzir as pessoas a algum lugar. Não podem ser um fim em si mesmos. Eles precisam conduzir todos ao ambiente da cozinha. Se não, eles estragam o processo. Andy comentou, "todas as atividades têm que facilitar a movimentação através do processo simples. Tudo que facilita o movimento é 'sim'. Tudo que não facilita é 'não'".

ALINHAMENTO NA NORTHPOINT

Porque o processo "do hall de entrada à cozinha" é implementado em todos os níveis da igreja, a Northpoint desfruta do poder de um time alinhado. Todos os ministérios estão afinados e usam o mesmo discurso. E esse alinhamento alimenta a unidade. Os membros não estão disputando o mesmo espaço, recursos e líderes. Cada ministério complementa o outro.

O objetivo de cada departamento é conduzir as pessoas à cozinha. De acordo com o pastor de famílias, Reggie Joiner, este processo é tão simples que pode ser explicado em poucos minutos usando um guardanapo. Cada departamento entende o processo e está comprometido com ele. O processo é o mesmo para cada área.

O processo deles pode ser desenhado com três círculos. O primeiro círculo é o maior. É o hall de entrada de cada ministério. Cada ministério por idade na Northpoint tem o seu próprio hall de entrada. O segundo círculo é menor. Este círculo representa a sala de estar de cada ministério. Cada departamento na igreja também tem o terceiro círculo, o menor. Este círculo representa a cozinha. Em todos os níveis da igreja os departamentos de ministério estão procurando conduzir as pessoas de um círculo para o outro através do processo.

FOCO NA NORTHPOINT

Se você for à Northpoint você vai ficar impressionado como o ministério é desenvolvido com excelência. As coisas simplesmente são feitas de maneira certa. A cultura da excelência permeia a igreja inteira, desde as instalações até os recepcionistas das crianças e jovens. Os cultos são inspiradores e inclusivos.

A razão porque a Northpoint é capaz de fazer as coisas tão bem é porque elas escolheram fazer apenas algumas poucas coisas.

A igreja rejeitou a filosofia de ministério do menu que encoraja os líderes da igreja a oferecerem um enorme cardápio de programações. Não é de surpreender que o ministério seja tão mal feito em tantas igrejas. É impossível fazer as coisas com excelência quando as atenções e energias estão divididas. Reggie Joiner se refere a essas igrejas como aquelas que têm a incapacidade de focar.

Na Northpoint menos na realidade é mais. Eles fizeram muito menos que a maioria das igrejas, mas têm sido capazes de realizar muito mais.

Simplicidade não é apenas discurso na Northpoint. Eles se recusam a adicionar atividades que vão desviar gente do processo simples que Deus lhes deu. De novo, eles começaram simples; então as pessoas normalmente se chocam quando descobrem as atividades que a Northpoint não desenvolve. Reggie Joiner escreve:

A maioria da nossa equipe já esteve envolvida com igrejas que têm uma programação pesada e nós sabemos como rapidamente as coisas podem sair do controle. Então nos tornamos obstinados em nos manter simples. Na verdade você talvez se surpreenda com algumas coisas que nós não fazemos. Nós não temos uma escola cristã, não temos cultos no meio da semana, ministério de homens e mulheres, não temos coral infantil, Escola Bíblica Dominical para adultos, nem cerimônias de Páscoa ou Natal, ou ministérios de recreação.

Emanuel, Comunidade de Cristo, Comunidade Northpoint - três igrejas diferentes em diferentes comunidades. Os estilos de culto são diferentes. A composição da membresia é diferente. A forma de governo das igrejas é diferente.

No entanto, cada igreja é simples. Cada igreja é vibrante. Cada uma tem um processo simples que orienta os seus ministérios. E cada igreja está empurrando os portões do inferno.

Qual a aparência dos portões na sua comunidade? Estamos falando espiritualmente. A sua igreja está fazendo o movimento do evangelho avançar? Vocês estão colocando marcas no reino das trevas? Vocês estão ampliando o placar?

E AGORA!

Vocês foram apresentados à revolução do simples.

Descobriram como as pessoas estão reagindo ao simples porque a vida é muito complexa. Você acompanhou uma consultoria e viu igrejas simples e complexas. Aprendeu os quatro elementos principais de uma Igreja Simples através de um resumo das descobertas de nossa pesquisa e ainda se encontrou com três igrejas simples.

Agora está na hora de ser específico e prático.

Na parte dois você será conduzido através dos quatro elementos da Igreja Simples. Vai lidar e entender a clareza, o movimento, o alinhamento e o foco. Vai conhecer algumas descobertas significativas da pesquisa que não podem ser ignoradas. E vai receber algumas dicas práticas de como implementar cada um desses elementos críticos.

Você foi apresentado à revolução do simples.

Está na hora de se tornar uma Igreja Simples.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Por que é muito mais fácil começar uma Igreja Simples do que se tornar uma?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Qual é a relação entre foco e a excelência no ministério?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Qual é o fator comum existente nessas três igrejas?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Quais as diferenças que aparecem?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Dos quatro elementos da Igreja Simples - clareza, movimento, alinhamento e foco - qual deles será mais difícil de implementar na sua igreja? Por quê?$p$, 'reflexao', null),
    (v_aula_id, 6, $p$Como está o movimento do evangelho em sua comunidade?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 5 — Clareza: começando um planejamento ministerial  (aula ordem = 6)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 6;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 5 — Clareza: começando um planejamento ministerial$t$,
      6,
$conteudo$
“Se 0 que alguém construiu permanecer, esse receberá recompensa"
                       -   Apóstolo Paulo (1 Coríntios 3.14).

           Clareza ^ Movimento ^ Alinhamento                   Foco

   Parabéns, você é um construtor.
   Construa vidas. É isso que é o ministério. É o que você e a sua igreja foram chamados a fazer. O apóstolo Paulo dá instruções específicas
para os líderes de igreja:

           E ele designou alguns para apóstolos, outros para profetas,
           outros para evangelistas, e outros para pastores e mestres,
           com o fim de preparar os santos para a obra do ministério,
           para que o corpo de Cristo seja edificado (Efésios 4.11-12).

   A palavra grega que Paulo usa para “edificar” é oikodome. É um
termo usado na construção. Dá a ideia da construção de uma casa.
Construir vidas — este é o chamado.

   Essa imagem percorre todo o Novo Testamento. Os crentes são desafiados a continuar crescendo na fé:

          Portanto, assim como vocês receberam Cristo Jesus, o
          Senhor, continuem a viver nele, enraizados e edificados
          nele, firmados na fé, como foram ensinados, transbordando
          de gratidão (Colossenses 2.6-7).

   Perceba a linguagem. A palavra para edificar está no particípio presente. Isso indica uma ação contínua. A casa está sempre sendo reformada. A aplicação é simples —construir vidas é ativo e permanente. È
um processo.
   Tem mais! IPedro 2.5 e Efésios 2.22 comparam a expansão do Reino de Deus com a construção de uma casa. À medida que as pessoas
vêm a Cristo pela fé, a casa espiritual é expandida. Um novo cômodo
está sendo adicionado constantemente.
   Nos dois sentidos você é convidado a se juntar a Deus num grande
projeto de edificação. Você deve edificar a casa espiritual levando pessoas a um relacionamento com Deus. E deve edificar a vida das pessoas
ajudando-as a progredir na fé.
   Você é um construtor.
   De acordo com o apóstolo Paulo você deve assumir seriamente este
papel (1 Coríntios 3.14). Tem que ser cuidadoso em como você edifica.
O como é importante. É e sempre foi.
   Como construtor você precisa de plantas claras.
   As plantas não são mais na cor azul como eram antigamente, mas
elas continuam tão essenciais como jamais foram.
   As plantas são essenciais quando se está desenhando ou construindo.
Elas mostram não só o que vai ser construído, mas também como deverá
ser construído. Mostram em detalhes como tudo vai se encaixar.

    Construir sem plantas seria ridículo. É inconcebível. Você jamais
confiaria a construção de uma casa a um construtor sem plantas. Um
bom construtor não faz de qualquer jeito. Ele começa com um planejamento claro, com uma planta definida.
    Um construtor chega à mesa com mais do que apenas um folder de
propaganda.
    As propagandas são diferentes das plantas. As propagandas mostram
o produto pronto. Elas mostram como a casa vai ficar. Porém, você não
constrói uma casa com base na propaganda. A propaganda é bonita,
mas não é clara nem detalhada.
    As plantas são mais profundas. Você pode seguir uma planta e construir uma casa.
    Por que tentaríamos edificar vidas espirituais sem um planejamento
ministerial claro? Sem uma planta? Para edificar eficazmente a vida das
pessoas você precisa de um processo ministerial claro. Precisa de um
planejamento com clareza. De acordo com os nossos dados há uma
relação significativa entre a vitalidade de uma igreja e a clareza do processo. Clareza é a habilidade de comunicar o processo e este ser entendido
pelas pessoas.
    Você é um construtor e está na hora de desenhar o seu planejamento
ministerial. Está na hora de garantir que tenha um processo ministerial claro. Neste capítulo você vai encontrar cinco chaves ou dicas para
ter clareza. Todas as cinco são essenciais e foram validadas pela nossa
pesquisa.
    Se você quer que seu processo seja claro tem que defini-lo, ilustrálo, discuti-lo e medi-lo. Também precisa monitorar constantemente o
entendimento das pessoas em relação ao processo.

       1: Defina
   De acordo com a nossa pesquisa, definir o processo ministerial é
extremamente importante.
   Pedimos aos líderes das igrejas vibrantes e aos líderes do grupo comparativo para avaliar quão claro era o processo ministerial deles. Solicitamos
para eles avaliarem o nível de concordância com a seguinte afirmação:
“Temos claramente definido o processo para conduzir uma pessoa da
salvação à maturidade espiritual e ao ministério significativo”.

        40% T

        35%

        30% --

  u,    25% --

  I .0.,-
  O)

  -g     15%--

                               ÜJ
         1 0 % - .

          5%

          0%

                                  Processo claramente definido

   Figura 1 - Nível de concordância com um processo claramente definido
       D F - discorda fortemente; D - discorda; D M - discorda moderadamente;
       CM —concorda moderadamente; C —concorda; C F —concorda fortemente

   Das igrejas vibrantes, 53% dos seus líderes concordaram ou concordaram fortemente que eles têm um processo claramente definido.
Do grupo comparativo, 25% dos líderes concordaram ou concordaram fortemente.
   A Figura 1 ilustra isso. Observe como a maioria das igrejas do grupo
comparativo referida no gráfico pelas colunas da esquerda, em comparação com as igrejas vibrantes nas colunas da direita do mesmo gráfico.
As igrejas vibrantes têm duas vezes mais claramente definido o processo
do que as igrejas do grupo comparativo.
   Portanto, o ponto inicial é definir o processo.
   Sem definição as pessoas ficam inseguras de como a igreja está fazendo discípulos. Sem definição os crentes ficam sem ideia de como a igreja pretende conduzir as pessoas à maturidade espiritual. Sem definição
há espaço para a ambiguidade. A maioria das igrejas é ambígua sobre
o seu processo ministerial, ou porque elas não o tem, ou porque a sua
definição é muito vaga.
   E onde há ambiguidade, geralmente há confusão.
   Várias vezes em Miami a ambiguidade confundia as pessoas quando
apresentadas à esposa do Eric. Ela tem a pele bronzeada simplesmente
porque mora no sul da Flórida. Então, muitas vezes as pessoas perguntam para ela em espanhol: “Como te llama?”; que quer dizer, “Qual é
o seu nome?”
   Como ela sabe um pouco de espanhol, ela responde de acordo,
“Kaye” —este é o nome dela. Mas Kaye tem o som parecido com que\ e
que em espanhol significa “o que'.
   Então a pessoa faz novamente a pergunta em espanhol, mas desta
vez um pouco mais alto —“Como te llama?” E então ela ouve a mesma resposta. Normalmente depois de perguntar algumas vezes a pessoa
frustrada, desiste. Para a pessoa que fala espanhol a conversa soa mais
ou menos assim:

         “Qual é o seu nome?”
         “O quê?”
         “Qual é o seu nome?”
         “O   quer
         “Qual é o seu nome?”
         “O quê?”
   Você consegue perceber a situação. Este é um momento cheio de
ambiguidade. Definições múltiplas para o mesmo som das palavras,
leva à confusão e frustração.
   A mesma coisa é verdade como a definição do processo ministerial
de uma igreja. Se o processo não estiver claramente definido de maneira
que todos falem a mesma linguagem, há confusão e frustração. Se não
há uma definição clara do como, as pessoas idealizam várias interpretações para o direcionamento da igreja.

   Como é 0 seu "como”?
   Definir o processo é formular uma estratégia. E concordar com uma
“planta” . E esta planta não só descreve que tipo de discípulo será edificado, mas também descreve como.
   Os líderes de igreja precisam definir mais do que o propósito (o
què)\ eles precisam também definir o processo (o como). Thom já havia
descoberto isso anteriormente em sua pesquisa sobre igrejas eficazes na
evangelização, que as igrejas eficazes tem líderes para quem está claro o
propósito da igreja.' Esta nova pesquisa confirma a anterior e revela que
é importante ter o processo ministerial também claro.
   Michael Hammer é um consultor de negócios que se reúne com organizações para discutir seus processos. O custo para participar de uma
conferência de dois dias é mais de dois mil dólares por pessoa (aü). Ele
acredita que o processo é mais importante do que o propósito de uma

companhia porque é o processo que faz com que tudo funcione. É o
“comd\ Ele demonstra que as pessoas dentro da organização precisam conhecer o processo porque eles são parte integrante do cumprimento dele. ^
   A mesma coisa é verdade para uma igreja. As pessoas dentro de
uma igreja precisam conhecer o processo porque elas fazem parte do
como executá-lo.
   Na verdade, o processo é para eles. Ele foi idealizado para eles, para
todos. O resultado final é a transformação da vida deles. As pessoas são
mais propensas a acompanhar um processo se elas o conhecerem. Um
processo claramente definido encoraja as pessoas a caminhar por ele porque elas sabem o que esperar. As pessoas não podem abraçar o ambíguo.
   Como é o seu           Você tem um processo claramente definido?A
seguir há três conceitos com os quais você tem que lidar no trabalho de
definir o processo ministerial:
   D eterm ine que tipo de discípulo você quer p ro d u zir em sua igrya .
O que você quer que as pessoas sejam? Torne a lista a mais objetiva
possível. Por exemplo, a Igreja da Cruz (capítulo 2) decidiu que os
discípulos na igreja deles seriam pessoas entusiasmadas com Deus,
servas no Reino de Deus e conectadas por relacionamentos vibrantes
com as pessoas.
   Descreva o seu propósito como um processo. Depois que você
concluiu o que deseja que as pessoas em sua igreja ou ministério
sejam, descreva isso em termos de processo. Em outras palavras, descreva
o seu propósito numa ordem sequencial. A definição fica muito mais
fácil para os líderes da igreja se eles descreverem o propósito da igreja
deles como um processo.
   A Igreja da Cruz pegou o seu desejo para os discípulos e os colocou numa ordem sequencial: “ame a Deus, ame aos outros e sirva o
mundo”. A pessoa primeiro se compromete com Deus. A pessoa então

estabelece relacionamentos vibrantes com os outros, e finalmente expressa o seu amor a Deus e aos outros através do serviço ao mundo.
   Os líderes da Igreja da Cruz acreditam que o crescimento espiritual
é um processo, e eles descrevem o foco de sua igreja nesses termos. A
ordem é importante. Ela é uma boa “planta” para os líderes da Igreja
da Cruz.
   D ecid a como cada a tivid a d e sem an al é p a rte do processo.
Sejamos honestos; as atividades e ministérios são o que as pessoas
veem. Elas esquecem as declarações na parede, mas sabem quais as
atividades oferecidas. As suas atividades dizem o que é importante
para você; portanto, é preciso definir como cada atividade é usada
para produzir o tipo de discípulo Deus o chamou para fazer.
   As atividades precisam ser especificamente definidas para saber como
serão usadas para conduzir as pessoas através do processo de transformação espiritual. A Igreja da Cruz foca os seus cultos na ajuda às pessoas
a amarem a Deus. Eles usam os grupos pequenos para ajudar os crentes a
amarem aos outros e os desafiam a se engajarem em algum ministério de
forma que possam servir ao mundo.
   As suas atividades têm que estar submissas ao seu processo ministerial. Elas são ferramentas para facilitar o processo de crescimento espiritual. As atividades têm que trabalhar a favor do seu processo e não
ao contrário.
   Defina o seu processo e depois exemplifique.

   2: Exemplifique
   De acordo com a nossa pesquisa, exemplificar o processo é vital. Se
você quer que os membros de sua igreja vejam claramente seu processo
simples você tem que exemplificá-lo.

As “plantas” são visuais. Você pode se imaginar construindo uma
casa sem um desenho que pudesse olhar? Pode imaginar-se construindo um prédio sem a “planta” sobre a mesa quando as discussões
aparecem?
   Perguntamos aos líderes de igrejas vibrantes e líderes das igrejas do
grupo comparativo, se eles usavam uma ilustração ou uma metáfora
para ajudá-Jos a deixar o processo claro. Pedimos para avaliarem o nível
de concordância com a seguinte afirmação: “Nós temos uma ilustração
visual do nosso processo”.
   Nas igrejas vibrantes, 35% concordou fortemente com a declaração
comparado com 16% das igrejas do grupo comparativo. A porcentagem dos líderes das igrejas vibrantes que concordaram ou concordaram
fortemente que suas igrejas têm uma ilustração visual do processo deles
era mais de duas vezes maior do que os líderes das igrejas do grupo
comparativo (Figura 2).
   A maioria dos líderes das igrejas do grupo comparativo admite que
eles não ilustram o processo deles. Mais de 70% dos líderes das congregações do grupo comparativo discordaram em algum nível que as suas
igrejas ilustram o processo delas visualmente.
   Os dados demandam que os líderes escolham uma ilustração visual
para representar o seu processo simples. Por que isso importa tanto?
Qual é a grande sacada com um campo de beisebol, um diamante, uma
casa, ou qualquer outra metáfora?

   Seja visual
   O processo simples ressoará muito mais em cada pessoa se ele for
visual. As pessoas estão mais propensas a se lembrar dele. Consequentemente é mais fácil de elas experimentarem a realidade do processo se
puderem se lembrar dele.

     A lembrança faz o movimento crescer. Aumenta a possibilidade das
pessoas crescerem através dos estágios de comprometimento. As pessoas
não poderão vivenciar algo de que elas não podem se lembrar.

        40% T

        35%--

        30%--

        25%

  Q .   20% - -

 £      15% ..

        10%..

                                      Ilustração Visual

              Figura 2 - Nível de concordância em ter uma ilustração visual
        D F —discorda fortemente; D - discorda; D M - discorda moderadamente;
        CM —concorda moderadamente; C —concorda; CF —concorda fortemente

     O processo precisa ser a visão para o discipulado em uma igreja
local. O processo diz, em essência, “este é o tipo de pessoa que nós
acreditamos; Deus nos chamou para ser, e aqui está como Ele vai nos
transformar nesse tipo de pessoa”. É pessoal. É algo que a pessoa pode
internalizar como seu. O processo pode se tornar a visão pessoal de
cada um dentro da igreja.

    E uma visão é sempre visual.
   As pessoas têm condição de vivenciar uma visão se elas puderem
vê-la. Se houver uma ilustração visual do processo as pessoas saberão
onde estão no processo e aonde ainda têm que chegar. Se elas puderem
associar o processo a algo que esteja gravado em suas mentes, será mais
fácil assumirem isso para si mesmas.
   O processo precisa ficar gravado na mente das pessoas.
   Deus é o gravador por excelência. Muito antes dos pesquisadores
descobrirem que as pessoas lembram mais quando o estímulo visual
acompanha a audição, Deus já estava ensinando as pessoas de forma
visual. Ele criou e esculpiu as pessoas e sabe o que as empolgà. Ele sabe
o que as move. A Bíblia está cheia de profetas e mestres que usaram
ilustrações visuais para alcançar o coração das pessoas.
   A vida de Oseias foi uma mensagem visual chocante para o povo.
Deus mandou Oseias se casar com uma prostituta chamada Gomer
(Oseias 1.2). Provavelmente foi muito estranho levá-la para conhecer
a família.
   Mesmo assim Deus estava enfatizando um ponto.
   Gomer era a representação do adultério espiritual que o povo de
Deus estava cometendo. Eles haviam esquecido o seu primeiro amor.
Cada vez que olhavam para a vergonha de Oseias, eles viam a imagem
do próprio relacionamento deles com Deus. Quando Oseias a comprou de volta, de forma poderosa, ele mostrou visualmente a graça de
Deus de maneira poderosa.
   Jeremias parecia meio esquisito tropeçando pelo caminho carregando um jugo no pescoço (Jeremias 27.2-3). O jugo de animais por razões óbvias nunca estiveram na moda. No entanto, a imagem era clara.
Deus haveria de disciplinar o seu povo com um jugo em seu pescoço.
   O drama da Páscoa foi sanguinário e visual ao mesmo tempo. Ele
prenunciava o sacrifício do Cordeiro de Deus na Cruz. As instruções

implícitas de Deus sobre o Tabernáculo eram uma demonstração visual
do culto nos céus.
   E aí tem Jesus. Ele apontava para os campos e pássaros. Jesus pegou
uma criança no colo e usou uma figueira para enfatizar um ponto. Ele
era um mestre visual. Depois de afirmar ser o pão da vida, alimentou
cinco mil homens com pão (João 6). Depois de chamar a si mesmo
de Luz do Mundo, Jesus iluminou os olhos de um homem cego (João
9.1-7). Depois de afirmar que era a ressurreição e a vida, Jesus chamou
Lázaro para fora do túmulo (João 11).
   O discurso da vinha e dos galhos (João 15) provavelmente foi dito
em meio a videiras e seus galhos. A conversa sobre água no poço com a
mulher samaritana, definitivamente tinha a ver com água real (João 4).
   Se a sua igreja “não se interessa pelas coisas visuais”, então podemos
pressupor que vocês não praticam a Ceia do Senhor (comunhão) ou
o batismo. Ambas ordenanças dadas por Cristo à igreja são imagens
visuais de realidades teológicas.
   Uma ilustração visual aumenta a clareza; portanto, os líderes de
igreja deveriam usar uma. A ilustração visual pode ser um diagrama, ou
pode ser uma metáfora que dê as pessoas uma imagem mental.
   Escolha uma ilustração visual para o seu processo. Convoque algumas pessoas sábias e criativas e produza uma ilustração. Ou pegue emprestado uma de outra igreja. Independente de como você faça, tenha
certeza que a sua ilustração possua as seguintes características:
   A ilustração deve refletir o seu processo. A ilustração tem que
pegar. Se o seu processo tem três passos, então a sua ilustração deve
refletir isso. Se o processo tem quatro passos, sua ilustração deve refletir isso também. Tenha certeza de que a ilustração é uma expressão da
realidade do seu processo.

   A ilustração deve dem onstrar a progressão. Lembre que o processo simples tem a ver com a condução das pessoas na direção de um
compromisso maior. A genialidade da ilustração do campo de beisebol
iniciada por Rick Warren é que o seu desenbo ilustra o movimento de
uma base para a outra.
   A ilustração deve a ju d a r a sim plificar. Não escolha uma ilustração
que vai fazer com que seu processo pareça complicado. Aqui vai a regra;
se você tem que explicar muitos símbolos e mensagens escondidas na
sua ilustração, ela é muito complicada. O objetivo de sua ilustração
visual é ajudar as pessoas a perceberem a realidade.
   Defina, Ilustre, Avalie!

   3: Avalie
   Nossa pesquisa também revela que avaliar o seu processo é crítico.
Avaliação ajuda a trazer clareza.
   Os jogos da pré-temporada são enfadonhos de se assistir, mesmo
para os torcedores mais fanáticos. Se você está dando uma olhada neste
capítulo enquanto assiste a um jogo da pré-temporada, está na hora de
avaliar a sua vida. Talvez você devesse sair mais de casa. Tudo bem, vá
em frente; deixe o livro de lado e saia da caverna.
   É sério; Sportscenter, no canal a cabo E S P N , raramente m enciona
os jogos da pré-temporada. Os âncoras até fazem piada com o fato desses jogos não valerem nada. Os melhores jogadores não estão jogando
nos momentos cruciais do jogo. E basicamente um treino com árbitros
de verdade. O que parece é que na verdade ninguém se importa com
quem ganha ou perde.
   Ninguém liga porque os jogos não são avaliados.
   Eles não contam. E porque esses jogos não influenciam nos resultados da temporada, ninguém leva esses jogos a sério.

   Você já entendeu a mensagem. Para que as pessoas levem o seu processo a sério ele tem que ser avaliado. Para que as pessoas possam internalizar o “como" simples de sua igreja, você tem que avaliá-lo. O clichê
é verdadeiro; o que é avaliado é feito!
   Perguntamos aos líderes se eles tinham um sistema de avaliação para
saber se as pessoas estavam sendo conduzidas através do processo. Os
líderes das igrejas declararam o nível de concordância com a seguinte
declaração: “Nós temos um sistema para avaliar como as pessoas estão
progredindo através do processo”.

                                Processo de avaliação

           Figura 3 - Nível de concordância com o processo de avaliação
      D F - discorda fortemente; D - discorda; D M - discorda moderadamente;
      C M —concorda moderadamente; C —concorda; C F —concorda forremente

   Das igrejas vibrantes 27% concordaram ou concordaram fortemente, enquanto apenas 9% das igrejas do grupo comparativo. Os líderes das igrejas vibrantes concordaram ou concordaram fortemente três
vezes mais do que os líderes das igrejas do grupo comparativo, que
eles avaliam a eficácia do seu processo. A grande maioria das igrejas do
grupo comparativo não tem um sistema para avaliar se as pessoas estão
sendo conduzidas através do processo (Figura 3).
   Michael Hammer, um especialista em processo, insiste que um processo tem que ser avaliado. Se não houver avaliação as pessoas dentro
da organização não internalizarão a severidade e urgência do processo. ^
Em outras palavras, se você não avaliar o processo as pessoas vão pensar
que tanto faz, ou que não faz diferença. Será apenas mais uma declaração na parede ou no boletim.
   As igrejas que avaliam seus processos provam o seu valor. A avaliação prova que o processo não é só uma nova moda ou uma estratégia
obtida por download. A equipe, os voluntários e os membros percebem
essa importância.
   As avaliações também ajudam aos líderes saberem se as pessoas estão
progredindo ao longo do processo. Por exemplo, a Igreja da Cruz avalia
constantemente o número de pessoas que estão sendo conduzidas pelo
processo. A avaliação é mais ou menos assim:

               Amar a Deus      Amar aos outros       Servir ao mundo
                    (cultos)      (grupos pequenos)   (equipes de mini;

Crianças               120                 80                    40
Estudantes             140                75                     65
Adultos                650                400                   300
Total                  910                555                   405

   Uma ferramenta de avaliação como esta na Igreja da Cruz concentra
no conduzir das pessoas de um nível de comprometimento para o outro. Os furos são facilmente identificados e corrigidos. Se a frequência
da igreja cresce no estágio “amar a Deus”, eles esperam crescer proporcionalmente nos estágios amar aos outros e servir ao mundo.
   Você está pronto para avaliar? Para avaliar efetivamente o seu processo você precisa pensar diferentemente em dois aspectos críticos:
   A p ren d a a ver os seus membros horizontalm ente e não verticalmente. Avaliar o seu processo requer que você olhe para a sua frequência diferentemente da maioria das igrejas. Observe por exemplo a ferramenta de avaliação da Igreja da Cruz. A maioria das igrejas observaria o
número de pessoas em uma atividade específica, como o número total
de adultos nos grupos pequenos. Isso é olhar verticalmente. E observar
as atividades para ver se elas são um sucesso.
   Observar os seus membros horizontalmente é diferente. Alguém
que avalia os números horizontalmente observaria a Igreja da Cruz e
veria que uma porcentagem de adultos se movimentava do culto para
os grupos pequenos e daí para uma equipe de ministério. Um observador horizontal pensaria em maneiras de conduzir mais pessoas de um
estágio para o outro. Horizontalmente; pegou?
   A v a lie a frequ ên cia em cada nívelíestágio do seu processo. Para
avaliar o processo inteiro você precisa saber quantas pessoas estão envolvidas em cada estágio. A maioria das igrejas tende a conferir apenas
a frequência nos cultos e nos grupos pequenos. Isso faz sentido se estas
forem as únicas atividades no processo. Porém, não faz sentido se houver outras atividades.
   A Igreja da Cruz quer conduzir as pessoas do culto para os grupos pequenos e para as equipes de ministério. Para que avaliem
efetivamente eles têm que saber quantas pessoas há nas equipes de

ministério. Se eles não soubessem isso, seria impossível ter uma imagem clara da realidade.
   Para se ter uma avaliação acurada você tem que saber a frequência
em cada estágio. Isso dá a você conhecimento-chave para planejamento
e oração. Sem este conhecimento você está fadado a tomar decisões
baseado em informações incompletas.
   Defina. Exemplifique. Avalie. Discuta.

   k \ Discuta

   Imagine este cenário. Um pastor e a equipe de líderes investiram
meses para formular uma declaração de visão e propósito. Eles tiveram
reuniões até tarde da noite à base de pizza e confeitos de chocolates.
Eles debateram as palavras. Escolheram passagens-chave da Bíblia para
enfatizar a direção da igreja. Estão cheios de empolgação, e eles elaboram um plano para compartilhar tudo com as pessoas.
   Eles compartilham a visão com líderes-chave na igreja. Aí enviam
cartas a todos. Eles preparam um banner. Providenciam novo papel
timbrado com esta declaração abaixo do nome da igreja. Até mudaram
a nomenclatura de seus itens no orçamento. Colocaram a visão no boletim. E o pastor prega sobre isso por três semanas.
   Então todos dão um suspiro de alívio. A intensidade vai morrendo.
E é isso: “Boa série pastor, eu gostei.”
   E tudo volta ao normal.
   A declaração permanece, mas nada muda. Seria melhor ter ficado na
gaveta. É apenas uma verborreia nebulosa. Ninguém na verdade presta
atenção. Ninguém realmente entende.
   Este cenário é típico.
   Se a igreja vai ser simples, essas coisas não podem acontecer. O processo não pode ser apenas mais uma declaração pendurada na parede

ou guardada numa gaveta. Se a igreja vai ser simples o processo precisa
estar claro.
   Se o processo vai ficar claro para as pessoas, então ele tem que compor a própria essência da igreja. Tem que se tornar parte do caráter da
igreja. Tem que ser fundamental para a cultura da igreja. Tem que estar
no DNA da identidade da igreja.
   Para que o processo se torne parte da identidade da igreja ele precisa ser discutido. Frequentemente! Não só no seu início. A clareza não
acontece sem persistência.
   Não é suficiente mostrar a visão, o “como' e depois enterrá-lo entre
as outras coisas. Não é suficiente fazer uma série de pregações sobre o
processo de discipulado e depois arquivar as mensagens. Uma discussão
permanente é absolutamente necessária.

   0 papel da liderança
   Para que o processo simples faça parte da cultura da igreja, primeiro
ele precisa permear a cultura da liderança. As discussões precisam começar entre a liderança da igreja. O processo simples precisa se rornar
parte de seu vocabulário. A boca precisa falar dele com facilidade. O
processo precisa fazer parte das conversas de corredor, dos almoços com
líderes-chave e das reuniões.
   O processo precisa ser discutido entre os líderes com frequência. Se
o coração dos líderes não estiver totalmente voltado para ele, as pessoas
não vão pegar. Se a “planta” do ministério não estiver clara para os líderes, ela nem fará parte do pensamento das pessoas na igreja.
   Michael Hammer defende que os líderes de uma organização sejam
os iniciadores e os supervisores do processo organizacional. Ele acredita
que os líderes têm a perspectiva correta e a autoridade necessária para
supervisionar todo o processo e resolver os problemas ao longo da jornada."^ Ele acredita que esta apropriação começa com os líderes.

   Nós concordamos.
   A discussão entre os líderes leva a apropriação e ao entendimento.
Quando a equipe de liderança da igreja discute o processo, toda a equipe é capaz de tomar posse do processo e ser se sentir responsável por ele.
Eles também se tornam capazes de abordar os problemas no processo
que atrapalham o amadurecimento espiritual das pessoas da igreja.
   A cultura da igreja acompanha a cultura da liderança. A compreensão e apropriação da liderança transbordam sobre todos.
   De acordo com a nossa pesquisa a discussão permanente do processo ministerial faz uma grande diferença. As Igrejas Simples tendem a
fazer isso enquanto que as Igrejas Complexas ignoram este princípio.
   Pedimos aos líderes das igrejas vibrantes e aos líderes das igrejas do
grupo comparativo para avaliarem o seu compromisso com a discussão
do processo enquanto equipe de liderança. Perguntamos a ambos os
grupos qual era o nível de concordância deles com a seguinte afirmação: “nós frequentemente discutimos nosso processo enquanto equipe
de liderança”.
   Mais da metade das igrejas vibrantes concordaram fortemente ou
concordaram com esta afirmação comparada com um quarto das igrejas
do grupo comparativo. A porcentagem de líderes das igrejas vibrantes
que concordaram ou concordaram fortemente que eles frequentemente
discutem o processo deles foi mais do que o dobro dos líderes de igrejas
do grupo comparativo (Figura 4).

       40%

       35% - -

       25%
  (B

                                Discussão do Processo

       Figura 4 —Nível de concordância com a discussão constante do processo
       D F - discorda fortemente; D - discorda; D M - discorda moderadamente;
       C M - concorda moderadamente; C - concorda; CF - concorda fortemente

   A conversa permanente
   Nossa pesquisa indica que você deve discutir o seu processo simples com frequência. A discussão levará à compreensão e apropriação
por parte dos líderes. Consequentemente o processo será plantado com
profundidade na cultura da igreja.
   Talvez esteja na hora de você começar essa conversa permanente...
para que as coisas comecem a acontecer.
   Prepare-se. Este processo vai levar tempo. Não cometa o erro de
tentar recuperar o tempo perdido em poucas semanas. A discussão

tem que ser permanente. Leva tempo para se compreender e tomar
para si este desenvolvimento. A seguir há quatro maneiras de abordar e
“re-abordar” o processo simples nas discussões com a liderança;
   Veja tudo através das lentes do processo sim ples. Quando você
avaliar, avalie através das lentes do seu processo ministerial. Quando as
decisões forem tomadas, faça referência ao processo. Quando atividades
são avaliadas, olhe para elas através das lentes do seu processo ministerial. Traga sempre as conversas para a “planta” do ministério.
   Repasse o processo nas reuniões. O processo simples precisa ser
discutido nas reuniões. Às vezes será preciso incluí-lo na pauta. Outras
vezes ele deverá apenas estar misturado no meio da discussão. Usar a
linguagem do seu processo ministerial com frequência estabelecerá um
novo vocabulário em sua igreja.
   Teste os lideres no processo. Ninguém gosta de testes, mas nós os
fizemos por anos porque eles proveem uma forma objetiva de avaliação.
Eles na verdade funcionam. Por mais que as pessoas odeiem os testes,
elas odeiam mais ainda serem reprovadas. E sempre embaraçoso.
   Entregue para os líderes uma ilustração visual com espaços para preencher e faça os líderes preencherem as respostas. Depois acompanhe a
ilustração visual inteira com todo grupo. Não chame as pessoas à frente
para escrever as respostas. Isso não é aula de álgebra. Simplesmente discuta cada parte do processo com o grupo. Deixe aprofundar.
   Depois que um teste é aplicado em adultos, eles farão o seu melhor
para estarem bem preparados para o próximo. Faça isso brincando, não
de forma séria. Seja como for as pessoas vão captar a ideia.
   Algumas semanas depois, faça de novo.
   Alguns meses depois, faça novamente.
   D escubra novas m aneiras de com unicar o processo. Aqui vai um
aviso antecipado. O seu processo vai ficar velho. Ele vai perder o efeito da novidade. Um dia você vai ficar cansado das palavras que você

escolheu. Numa certa altura os líderes não aguentarão mais falar sobre
o processo. Se você é personalidade do tipo A que está sempre buscando
mudança, você talvez queira começar de novo.
   Ironicamente, quando chega este ponto é que as pessoas na igreja
estão começando a entender.
   Quando começa a parecer que o processo está ficando velho, descubra novas maneiras de comunicá-lo. Descubra novas maneiras de
apresentar o processo e envolva outros líderes nisso também. Novas
idéias mantêm as coisas frescas e permitirá focar na execução do processo.
   Defina. Ilustre. Avalie. Discuta. Todos esses fatores levam ao
entendimento.

   5: Aumente o entendimento
   As igrejas vibrantes estão confiantes que as pessoas entenderam o seu
processo ministerial simples. Elas têm essa confiança porque investiram
tempo definindo, ilustrando, avaliando e discutindo o processo.
   As igrejas do grupo comparativo não têm essa confiança. Internamente elas sabem que as pessoas na verdade não entenderam a “planta”
ministerial. Na maioria das vezes é porque não há essa “planta” ministerial. Outras vezes é porque a comunicação tem sido ruim.
   Pedimos para os líderes das igrejas vibrantes e para os líderes das
igrejas do grupo comparativo que dissessem o nível de concordância
deles com a seguinte afirmação; “os membros da nossa igreja têm uma
compreensão clara do nosso processo”. Das igrejas vibrantes, 60% concordou em algum nível com esta afirmação enquanto das igrejas do
grupo comparativo apenas 32%. E mais, quatro vezes mais líderes das
igrejas vibrantes concordaram ou concordaram fortemente do que os
líderes das igrejas do grupo comparativo que os membros de suas igrejas
entendem claramente o processo (Figura 5).
       CLAREZA; COMEÇANDO UM PLANEJAMENTO MINISTERIAL U3

      40% T

 “     15%

                              Entendimento das pessoas

         Figura 5 — Nível de concordância sobre o entendimento das pessoas
       D F - discorda fortemente; D - discorda; D M - discorda moderadamente;
       CM - concorda moderadamente; C - concorda; CF - concorda fortemente

     O entendimento não vem facilmente. Ele não acontece através de
um ato mágico de comunicação. Um entendimento crescente dá muito
trabalho e tem que ser monitorado constantemente.
     Os líderes de igrejas vibrantes assumiram este desafio. Intencionalmente e continuamente eles confirmam que os membros de suas igrejas
têm um entendimento claro do processo simples.
     E este entendimento dá frutos.
     Quando as pessoas entendem o processo, são capazes de abraçá-lo
pessoalmente. Elas caminham através do processo na direção da transformação espiritual. Então se juntam à igreja e a Deus enquanto as suas
vidas espirituais estão sendo edificadas.
   Quando as pessoas entendem o processo, elas também se tornam
capazes de conduzir outros através dele. As pessoas sempre serão os
melhores recursos de uma igreja. E quando alguém realmente entende
o processo, essa pessoa se torna um missionário, um advogado dele. A
pessoa se torna uma ilustração de sermão ambulante, uma propaganda
permanente da graça de Deus. O impacto então é exponencial.
   Então, como líder você tem que aumentar o grau de entendimento
do processo na sua igreja. Para que isso aconteça, você tem que fazer
três coisas. Apesar das três serem essenciais elas estão na ordem inversa
de importância;
   Fale do processo de form a corporativa. Líderes, vocês precisam
falar sobre o processo da igreja como um grupo. Quando você se cansa
de fazer isso as pessoas ficaram apenas nos primeiros estágios do entendimento. Simplesmente é assim que funciona. Você é apenas uma voz
na vida delas. Max Depree disse sabiamente: “liderar é como na terceira
série: significa repetir as coisas significativas”.^ O processo simples é
significativo, vale a pena repeti-lo várias vezes.
   Isso não significa que você precisa constantemente fazer mensagens
ou mesmo separar dias especiais para declarar o seu processo ministerial
na íntegra. Na verdade, permeando-o nas mensagens regulares e nas
comunicações, é mais eficiente porque é constante.
   Quando você comunica o processo, compartilhe histórias de como
ele está funcionando. Conte histórias de como Deus está mudando a
vida das pessoas. Fale sobre aquele casal que deixou de ser simplesmente
frequentador da igreja, para fazer parte da igreja e para o serviço aos
outros. Fale sobre aquele cara que finalmente experimentou um grupo pequeno e agora está liderando um. Compartilhe histórias reais, de

pessoas reais com nomes reais. Isso chama a atenção de pessoas e as leva
ao entendimento.
   Com partilhe o processo interpessoalm ente. Mais importante,
você precisa discutir o processo interpessoalmente com outros. O
processo não pode apenas ser ouvido como num monólogo. O diálogo dá às pessoas a chance de interagir. E esse diálogo tem a tendência
de aumentar.
   Pregadores —leiam a próxima sentença: não é suficiente falar apenas
do púlpito sobre a visão e o processo ministerial. O processo simples
tem que ser compartilhado nos jantares e nas reuniões. Quando as pessoas percebem que aquilo não é apenas “coisa de sermão”, tem mais
significado. Elas prestam mais atenção quando podem ver o seu coração
fora do palco.
   Viva o processo pessoalmente. Essa questão é emblemática; é com
certeza a coisa mais importante que você pode fazer para aumentar o
entendimento. A maneira mais importante que você tem para ajudar
as pessoas entenderem o processo é através do seu comportamento pessoal —vivendo e fazendo o que está pedindo para que as pessoas vivam
e façam.
   Se você está orientando as pessoas para que além do culto se envolvam com um grupo pequeno, você tem que estar em um grupo pequeno. Se está pedindo as pessoas para que progridam para uma posição
de serviço, você precisa servir de forma visível... fora do palco. Se está
desafiando as pessoas a se conectarem de forma relacionai com pessoas
que não conhecem a Deus, você precisa se encontrar com os seus vizinhos e com a pessoa que corta o seu cabelo.
   Há outra palavra para isso - integridade.
   Não seja um agente de viagem espiritual.

   Por favor, chega de agentes de viagem
   Há uma diferença crucial entre um agente de viagem e um guia
turístico. A diferença pode ser bem percebida numa aventura de
rafting. Há uma quantidade enorme de lugares para se escolher onde
fazer rafting pelas trilhas de água. Um agente de viagem vai lhe mostrar
todas as propagandas. Um agente de viagem vai sugerir alguns locais e
rios para você se divertir.
   Mas o papel do agente de viagem termina aí.
   O agente de viagem lhe dá boas informações, lhe entrega algumas
propagandas e sorri. Ele diz para você aproveitar a sua viagem. “Prazer
em conhecê-lo, aproveite a sua viagem”.
   Um guia turístico é diferente.
   Nas Smoky Mountains, ao longo do rio Ocoee há um grande guia
turístico chamado Tripp (viagem). O nome lhe cai bem, pois ele é literalmente uma viagem. Diferente do agente de viagem que lhe entregou
a propaganda, ele vai com você por toda a viagem. “Prazer em lhe conhecer, entre e vamos”.
   Tripp conhece o Ocoee. Ele conhece cada curva intimamente e fala
sobre elas, citando seus nomes com grande entusiasmo: “double suck,
moonshot, flipper”. Tripp se diverte com cada estágio da viagem. É
divertido ouvi-lo falar das histórias nas partes diferentes do rio. Você
gosta mais do rio e da paisagem por causa dele. É inspirado pela empolgação dele.
   O que torna Tripp um ótimo guia não são as informação que ele
tem. Até mesmo alguns agentes de viagem locais têm essas informações.
Tripp é demais porque adora a viagem e leva você com ele.
   Ele leva você pela viagem que já fez. Ele não orienta a distância;
está com você. Está com você no ônibus desde a base até o rio. Está
no barco com você. E se as coisas não acontecerem como planejado,
ele está no rio com você.

   Tripp já esteve nos lugares dos quais fala. Pode orientar porque está
acostumado com a viagem. Ele fala do lugar com uma autoridade pessoal e você ouve. Ele não é perfeito. O seu barco pode virar com você
dentro. Mas Tripp é confiável.
   As pessoas precisam de guias turísticos espirituais. Elas tiveram o
suficiente de agentes de viagem. Seja um guia turístico através do processo de transformação espiritual em sua igreja. Leve as pessoas nessa
viagem com você.
   Se você entrar no barco, o processo ministerial ganhará vida. A
“planta” ministerial então fará sentido. Ela vai ficar clara.
   A clareza é um primeiro passo enorme, mas é só o começo. Você
agora tem que continuar para o movimento, a remoção do congestionamento em sua igreja.
   Achamos que você vai se divertir no próximo estágio, mas cuidado.
Você pode estar mexendo com algumas “vacas sagradas”. Busque pela
sabedoria de Deus quanto ao ritmo da mudança.
   Vamos ver como se sai no próximo capítulo.
$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$De acordo com nossas atividades semanais, que tipo de discípulos estamos tentando fazer?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Há um processo definido em nossa igreja? Se há, qual é? Como cada uma de nossas atividades semanais é usada?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Qual é a ilustração ou metáfora que nós mais usamos para descrever o crescimento espiritual?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Como medimos o sucesso em nossa igreja? O que estamos buscando?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Numa escala de um a dez (dez sendo o ponto alto), qual é o grau de entendimento do processo em nossa igreja?$p$, 'reflexao', null),
    (v_aula_id, 6, $p$O que devemos fazer diante das coisas que aprendemos nesse capítulo?$p$, 'reflexao', null),
    (v_aula_id, 7, $p$Nós somos guias turísticos ou agentes de viagem?$p$, 'reflexao', null);
  end if;

-- ---------------------------------------------------------------
-- Capítulo 6 — Movimento: removendo o congestionamento  (aula ordem = 7)
-- ---------------------------------------------------------------
select id into v_aula_id from public.aulas
where curso_id = v_curso_id and ordem = 7;

if v_aula_id is null then
  insert into public.aulas (curso_id, titulo, ordem, conteudo)
  values (
    v_curso_id,
    $t$Capítulo 6 — Movimento: removendo o congestionamento$t$,
    7,
$conteudo$"E todos nós, que com a face descoberta contemplamos a glória do Senhor, segundo à sua imagem estamos sendo transformados com glória cada vez maior, a qual vem do Senhor, que é o Espírito"
- Apóstolo Paulo (2Coríntios 3.18)

Clareza # Movimento # Alinhamento # Foco

Congestionamento é frustrante.

Não é necessária uma pesquisa empírica para provar a observação casual que as pessoas detestam o horário de pico do trânsito. Você pode ver no rosto delas. Pode-se ver pela maneira como elas agarram a direção. Pode-se perceber isso pelos gestos que as pessoas fazem para os outros motoristas.

Congestionamento no horário de pico é doloroso. O tráfego não flui, para! As pessoas se movem a passo de lesma. As ruas não foram projetadas para lidar com tantas pessoas ao mesmo tempo. Não há para onde todos esses carros irem. Então, todo mundo senta e espera.

Congestão no peito e na cabeça também é uma perturbação. Pode-se ver isso no rosto sombrio das pessoas com dificuldades de respirar. Quando você tem uma congestão o seu dia parece mais longo do que o normal. A cabeça e o peito doem. Você não tem vontade de falar porque a sua voz fica esquisita ou engraçada.

A congestão na cabeça ou no peito impede os movimentos. O movimento do ar fica difícil por causa da congestão. A sua cabeça e o seu peito estão cheios de coisas que não deveriam estar lá. Muco, fleuma e porcaria bloqueiam o seu corpo. Essas coisas extras impedem que a sua respiração funcione normalmente.

O congestionamento fede.

Muitas igrejas estão congestionadas.

O movimento espiritual é reprimido. A edificação de vidas fica lenta. E essas igrejas congestionadas estão cheias com as mesmas pessoas. Não estamos nos referindo à falta de gente nova, embora isso diga muita coisa também. Estamos falando das pessoas continuarem as mesmas, sem mudança e sem movimento.

Estamos falando das pessoas não serem transformadas. Semana após semana, ano após ano, muitas simplesmente continuam as mesmas, iguais. O projeto de edificação da vida das pessoas é estagnado. Crentes estagnados e igrejas congestionadas andam de mãos dadas.

É triste, mas em muitas igrejas, as pessoas estão espiritualmente presas no mesmo lugar. E não há nenhum processo intencional para movê-las.

A Bíblia nos mostra um quadro diferente do crescimento espiritual. De acordo com as Escrituras a vida do crente deve ser transformada mais e mais. As pessoas não devem permanecer as mesmas. Tem que haver progressão, movimento.

Nossas igrejas deveriam estar cheias de pessoas que estão se tornando mais parecidas com Jesus. Tornando-se mais amorosas e alegres. Tornando-se! Sendo transformadas.

Face descoberta

Em 2Coríntios 3.18 diz: "E todos nós, que com a face descoberta contemplamos a glória do Senhor, segundo à sua imagem estamos sendo transformados com glória cada vez maior, a qual vem do Senhor, que é o Espírito".

Paulo está levando os seus leitores a lembrar de Moisés, que subiu ao monte chamado Sinai. Lá ele encontrou-se com Deus face a face. Foi o lugar onde Deus deu a Moisés os Dez Mandamentos. Cada vez que ele foi encontrar-se com Deus nesse monte ele voltava brilhando.

Ele teve um encontro com Deus no monte Sinai, e este encontro foi tão extraordinário que Moisés foi transformado. Sua aparência foi alterada. Ele brilhava. Parecia diferente. A primeira vez que ele desceu do monte as pessoas ficaram até com medo, de tão significativa que foi a mudança.

Moisés passou a usar um véu quando desceu do monte. Ele usou o véu para cobrir a glória que se esvaía (2Coríntios 3.13). Depois que Moisés saiu da presença de Deus, a glória se esvaiu. A cada passo para longe do monte, a glória diminuía.

Moisés tinha a face coberta. Nós temos a face descoberta.

Não temos que usar um véu porque a glória não está diminuindo. De fato o oposto é a verdade. A glória está sempre crescendo. E é assim porque nunca saímos da presença de Deus. Nunca descemos do monte.

O monte está em nós.

O seu Espírito mora em nós. Temos um relacionamento com Deus que nem mesmo Moisés teve. Estamos debaixo da Nova Aliança que traz a justiça e não debaixo da Antiga Aliança que traz a morte (2Coríntios 3.9). Moisés tinha que subir no monte para contemplar a glória de Deus. Nós não! Temos um nível maior de intimidade.

Da mesma maneira como Deus transformou Moisés ele nos transforma, quando nos colocamos na presença dele. A palavra para transforma está na voz passiva e no tempo presente. A voz passiva indica que não nos transformamos a nós mesmos. Deus é aquele que executa a transformação.

O tempo presente indica que essa transformação está acontecendo. Neste momento! Enquanto você lê isso. A transformação não é um evento do passado. Deus está envolvido nela agora, neste exato momento.

A palavra para transformação é metamorphosis (na língua grega). Esta palavra significa mudar a natureza essencial de alguma coisa. É uma mudança real, não é apenas uma mudança externa. O âmago de algo é mudado. Essa palavra é usada para descrever o processo que uma lagarta passa para se transformar numa borboleta. Aquele inseto nojento, gosmento, amedrontador, rastejador se torna uma linda borboleta. O processo é a metamorfose.

Deus deseja conduzir o seu povo através desse processo de transformação. Ele deseja transformar as pessoas em sua igreja à sua imagem. E ele quer fazer através de uma glória que não para de crescer. Ou seja, ele deseja que as pessoas a quem você serve sejam mais parecidas com ele amanhã do que elas são hoje.

Igrejas congestionadas e crentes estagnados são a antítese do plano de Deus.

Uma vez que é Deus quem transforma as pessoas em sua igreja, qual é a sua parte?

A sua parte

O que foi que Moisés fez para ser transformado? Qual foi a parte dele? Pense sobre isso. Deus produziu a transformação, mas Moisés teve um papel vital no processo. Qual foi a parte dele? Qual foi a sua parte?

Moisés subiu o monte. Ele se colocou no lugar certo para ser transformado por Deus. Descobriu o lugar onde Deus se mudaria para dentro da vida dele e se colocou nesse lugar.

Os líderes das igrejas precisam fazer o mesmo. A sua parte como líder da igreja é colocar as pessoas no caminho do poder transformador de Deus. A sua parte é projetar o processo que é parceiro com o processo de transformação revelado nas Escrituras.

Os líderes das Igrejas Simples simplesmente fizeram isso. Eles idealizaram um processo ministerial que coloca as pessoas no lugar para que Deus as transforme. Não é no processo ministerial que está o poder. Só Deus promove a transformação.

No entanto, Deus idealizou o crescimento espiritual para ser um processo. É para acontecer com uma glória crescente. E os líderes das Igrejas Simples escolheram se tornarem parceiros de Deus nesse processo.

Os líderes das Igrejas Simples projetaram os seus processos simples com este movimento em mente. O processo ministerial conduz as pessoas a um nível maior de comprometimento — com um nível cada vez maior de discipulado. O processo simples conduz as pessoas através do processo de transformação espiritual.

O congestionamento acabou.

O movimento acontece naturalmente. As pessoas não estão paradas no mesmo lugar. Há um plano para transformação. As pessoas são desafiadas a progredir através do processo simples. Espera-se mudança na vida delas.

De acordo com a nossa pesquisa, há uma relação significativa entre a vitalidade de uma igreja local e o movimento do processo ministerial da igreja. Movimento são os passos sequenciais que faz com que as pessoas caminhem para níveis maiores de comprometimento.

Você tem um processo simples que conduz as pessoas? Ou a sua igreja está cheia de congestionamentos?

Felizmente, para o bem da sua cabeça e peito, há remédios projetados para desobstruir as vias respiratórias. Há remédios prescritos para trazer de volta o movimento ao seu sistema respiratório. Da mesma maneira, neste capítulo você receberá cinco prescrições para desobstruir o seu processo, para remover o congestionamento.

Todas as cinco prescrições são essenciais e foram validadas pela nossa pesquisa.

Se deseja que o seu processo conduza as pessoas, a sua programação precisa ser estratégica e sequencial. Você precisa também conduzir as pessoas intencionalmente, claramente mostrar o próximo passo e prover uma classe para novos membros.

1. PROGRAMAÇÃO ESTRATÉGICA

De acordo com a nossa pesquisa uma programação estratégica é extremamente importante.

Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, se eles intencionalmente haviam planejado suas atividades de acordo com o processo ministerial deles. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Nós planejamos nossas programações de acordo com o nosso processo estratégico" (Figura 1).

Das igrejas vibrantes, 54% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 30% dos líderes das igrejas do grupo comparativo. As igrejas vibrantes são muito mais propensas a planejarem as suas atividades semanais de acordo com o seu processo simples.

Os líderes de Igrejas Simples são estratégicos em relação às suas programações. Eles abominam o conceito de realizarem atividades por causa da tradição ou pela necessidade de ter algo no calendário. Enxergam as atividades como ferramentas para colocar as pessoas no caminho para a transformação de Deus.

A Igreja Northpoint estrategicamente planejou os passos de acordo com o processo simples deles.

Eles iniciam com o seu processo e planejam os passos/atividades apropriados de acordo com esse processo. Cada atividade é projetada para conduzir as pessoas do hall de entrada para a cozinha. É possível aprender com a Northpoint e outras Igrejas Simples, várias coisas sobre como planejar estrategicamente as suas atividades. A seguir estão algumas lições que observamos.

Comece com o seu processo claramente definido. Planejar as suas programações de acordo com o seu processo é uma extensão do elemento clareza. É casar as suas atividades com o processo simples que Deus deu à sua igreja.

Porém, você tem que começar com o processo e não com as atividades. Se começar com as atividades, a tendência será construir o seu processo de acordo com elas. Se as atividades não se encaixam com o processo, você tem que eliminá-las. Encontrará mais sobre esse assunto no capítulo 8.

Escolha uma atividade para cada fase do processo. Para cada departamento da sua igreja deve haver uma atividade para cada fase do seu processo. A tentação é ligar todas as atividades existentes a um aspecto do seu processo. Embora as intenções sejam boas, você não vai simplificar o seu ministério. Múltiplas atividades para cada fase do processo divide as atenções e as energias.

Planeje cada atividade para um aspecto específico do processo. Depois que você escolheu uma atividade para cada fase do processo, tenha certeza que esta atividade efetivamente leva as pessoas a se engajarem com este aspecto do processo.

Cada atividade deve ser distinta das outras. A atividade preenche uma fase diferente do processo e precisa ter uma identidade peculiar. Não permita que outras prioridades congestionem o propósito da sua atividade. Proteja-a! Cada atividade é uma parte essencial do todo. Garanta que a atividade seja executada com excelência. Avalie-a sempre. Altere constantemente.

Organize as atividades numa ordem sequencial. Falando de movimento, chegamos a um lugar perfeito para nos movermos para a próxima prescrição: programação sequencial.

2. PROGRAMAÇÃO SEQUENCIAL

As atividades precisam ser organizadas em torno do seu processo ministerial, mas também precisam ser planejadas em ordem sequencial. De acordo com a nossa pesquisa a programação sequencial é vital.

Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, se as atividades deles eram programadas em sequência. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Nossas atividades são sequenciais com base em nosso processo" (Figura 2).

Das igrejas vibrantes, 37% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 15% dos líderes das igrejas do grupo comparativo. As igrejas vibrantes são duas vezes mais propensas a planejarem as suas atividades de forma sequencial.

De volta ao rafting

Vamos voltar ao rio Ocoee. Você sabe, aquele rio no qual Tripp é o nosso guia turístico.

A viagem de rafting no rio Ocoee segue um processo simples. Aqueles que planejaram a expedição organizaram a experiência de forma sequencial. Há sabedoria em planejar uma aventura de rafting em ordem sequencial.

Por exemplo, a aventura começa numa parte mais lenta do rio. Quem planejou não joga você direto em um nível avançado. Eles o colocam nas balsas numa parte do rio na qual você vai experimentando o aumento da correnteza à medida que vai adentrando o rio. Você começa com uma correnteza de nível um e vai aprofundando sua experiência com uma glória sempre crescente.

Até o fotógrafo é colocado em lugares estratégicos ao longo da jornada. As suas fotos são tiradas à medida que vai enfrentando as correntezas mais fortes ao longo do dia. Você pode levar fotos ampliadas para casa para mostrar aos seus amigos o quão corajoso você é.

Veja como funciona o processo sequencial da experiência do rafting.

Primeiro, você se conecta com o conceito de rafting. A experiência não começa com um pulo no rio. A viagem não começa pegando um nível quatro de correnteza. Ela começa com uma orientação, a escolha do material apropriado, e conhecendo o seu guia turístico. Você coloca todo o material no ônibus. Vê o rio e escuta histórias sobre ele. Agora já se comprometeu com a aventura. Você concordou em participar da jornada.

Segundo, você conhece as pessoas que irão em sua balsa. Precisa de cada pessoa. Não poderia remar no rio sozinho. O guia turístico enfatiza que a segurança está baseada no trabalho de equipe. E são as pessoas que tornam a aventura empolgante. Parte da experiência é ouvir os gritos das pessoas na sua balsa.

Terceiro, você se torna um contribuinte. No começo o guia turístico cuida da maior parte do trabalho. No entanto, à medida que a viagem progride, a correnteza fica mais forte. E ele precisa que todos na balsa remem. As suas duas remadas para frente ou três para trás fazem diferença.

Você volta para casa contando essa história. Liga para seus amigos e familiares do seu celular assim que chega numa área que pega o serviço. O que, dependendo da sua operadora de telefone, talvez não aconteça por um bom tempo. Independente disso, você tem fotos e lembranças, e deseja levar outros com você nesta aventura.

Se a viagem do rafting não fosse planejada com esta sequência seria uma experiência horrível. Imagine se você fosse jogado numa correnteza nível quatro sem conhecer as pessoas da sua balsa ou sem o seu remo. Imagine ser colocado no meio do rio sem conhecer o seu guia turístico ou sem saber como remar.

Sem a sequência adequada, a experiência não faria nenhum sentido para você. Seria um dia miserável. Você talvez até desistisse antes da aventura terminar. Não se empolgaria com rafting nem com as pessoas em sua balsa. Terminaria sem nenhum desejo de convidar outros para passarem pela mesma experiência que você passou.

Quem planejou a experiência colocou estrategicamente os eventos do dia em uma ordem sequencial lógica. Fazendo isso eles permitem que os navegadores aproveitem o dia com alegria. Os navegadores conseguem acompanhar a aventura com segurança porque foram preparados para cada novo desafio.

A sequência produz movimento.

Da mesma forma, uma programação sequencial produz movimento.

Os líderes das Igrejas Simples aprenderam a importância de uma programação sequencial. Organizando as atividades em sequência de acordo com o processo, essas atividades se tornam verdadeiras ferramentas que facilitam o processo de transformação. O congestionamento foi conquistado! As pessoas são conduzidas ao longo do processo simplesmente indo para o próximo nível de atividade.

Enquanto você organiza a sua programação de forma sequencial de acordo com o seu processo, aqui vão três orientações essenciais ao seu pensamento.

Organize a sequência das suas atividades para refletir o seu processo. Em outras palavras, a ordem das suas atividades deve refletir a ordem do seu processo. Por exemplo, a ordem do processo da Igreja da Cruz é amar a Deus, amar aos outros e servir ao mundo. A sequência das atividades deles reflete este processo.

A primeira atividade na sequência da Igreja da Cruz são os cultos de final de semana (amar a Deus). O próximo nível de atividades na Igreja da Cruz são os grupos pequenos (amar aos outros). E o estágio final de suas atividades são as estruturas de ministérios (servir ao mundo).

Na Igreja da Cruz seria confuso se a primeira atividade na sequência do processo fosse os grupos pequenos. Não se encaixaria com o processo declarado deles. A declaração de processo da igreja começa com "amar a Deus". A atividade que eles casaram com este aspecto do processo foram os cultos semanais. Portanto, a primeira atividade na sequência deles tem que ser os cultos de final de semana.

Essa questão não é um mero detalhe pequeno. A sequência é importante porque você quer conduzir as pessoas através do processo ministerial simples. Se organizar as suas atividades sequencialmente as pessoas acompanharão o seu processo simplesmente indo de uma atividade para a próxima. Enquanto as pessoas estão progredindo através das atividades, elas estarão simultaneamente sendo conduzidas ao longo do processo que Deus deu à sua igreja.

Determine um ponto de entrada claro no seu processo. O ponto de entrada é o primeiro estágio de programação no seu processo simples. Sem um ponto de entrada claro não há um começo para o processo. Quando falta um ponto de entrada claro para um processo, definitivamente ele não é simples.

O ponto de entrada é a atividade através da qual as pessoas muito provavelmente vão entrar em sua igreja. É a atividade semanal a qual os convidados provavelmente participarão. É a atividade para a qual você encoraja as pessoas a trazerem os seus amigos.

Depois que você determinou um ponto de entrada claro em seu processo, trate esta atividade dessa forma. Faça isso com excelência. Saiba que as pessoas novas terão uma impressão de Deus e de sua igreja baseado no que eles verem e ouvirem.

Identifique o próximo estágio da programação. Da mesma maneira como você determinou um ponto de entrada, identifique os próximos estágios de atividades em seu processo. Qual é a atividade que quer que as pessoas participem depois que elas passaram pelo ponto de entrada? Qual é a atividade que você quer que elas participem depois desta?

O compromisso deve crescer a cada estágio de atividades. Portanto, a frequência nos subsequentes estágios vai diminuir à medida que o compromisso aumenta. Isso não é algo ruim. É na verdade um fato esclarecedor em relação ao grau de comprometimento da sua igreja. Cada um está num estágio diferente de sua jornada. Cada pessoa é um trabalho em progresso.

Uma vez que você organizou as suas atividades sequenciais e estrategicamente de acordo com o seu processo, começa o verdadeiro desafio. Uma programação estratégica e sequencial é vital, mas tudo isso pode ser feito no papel. Isso não envolve pessoas reais. O desafio é conduzir as pessoas através do processo. O desafio é fazer isso acontecer. Esta é a essência do movimento intencional.

3. MOVIMENTO INTENCIONAL

Johnny Lechner finalmente está avançando. Na verdade, a Universidade de Wisconsin, em Whitewater, o está forçando a se formar. Ele já está lá há tempo demais. Ele tem o alvo de receber o seu diploma em maio. Você provavelmente conhece alguém que "esticou" um curso de quatro anos em cinco ou seis, mas ele foi muito além disso.

Lechner está na faculdade há doze anos.

É isso mesmo - doze anos. Ele já tem quase trinta anos. Esse tempo todo ele está cursando o bacharel. Permitiram a ele passar pelo "purgatório de matrícula" três vezes mais do que a média dos alunos.

Lechner continua se vestindo como um estudante de faculdade ou como um modelo dos posters da Abercrombie and Fitch (famosa marca de roupas nos EUA). Ele continua indo às festas da faculdade. Na verdade, um de seus maiores alvos no seu último ano era participar de duas viagens nas férias de primavera. Ele superou todas as expectativas. Ele até concorreu a um cargo no centro acadêmico usando como plataforma de campanha a sua experiência na faculdade.

Nos programas de entrevista, Lechner disse que gosta da faculdade. Só no caso de você ter dúvidas. Ele gosta do estilo de vida livre e a fuga das responsabilidades do mundo real. Gosta de dormir até tarde, tocar música, fazer apenas algumas disciplinas e então curtir os amigos, ficar no mesmo lugar é confortável para ele. A faculdade se tornou uma zona de conforto perpétua para Lechner.

Embora muitos pensem que a posição dele é ridícula, muitas igrejas não são estruturadas dessa forma? Nessas igrejas as pessoas permanecem espiritualmente no mesmo lugar por anos. E às vezes elas permanecem nos mesmos grupos por anos. Elas são mantidas no mesmo tipo de tanque espiritual. Raramente se mudam para um nível maior de comprometimento.

Estão numa zona de conforto perpétuo.

As Igrejas Simples lutam contra a síndrome de Lechner. Elas resistem ao congestionamento. Intencionalmente conduzem as pessoas de atividade em atividade através do seu processo ministerial.

De acordo com a nossa pesquisa, é vital conduzir intencionalmente as pessoas através do seu processo ministerial. Perguntamos tanto às igrejas vibrantes como às igrejas do grupo comparativo se elas usavam as suas atividades para fazer isso. Pedimos para eles declararem o nível de concordância deles com a seguinte afirmação: "Nós intencionalmente conduzimos as pessoas de uma atividade para a outra" (Figura 3).

Das igrejas vibrantes, 37% concordaram ou concordaram fortemente com a afirmação, contra 15% das igrejas do grupo comparativo. As igrejas vibrantes são duas vezes mais propensas a conduzirem as pessoas de uma atividade para a outra.

Lembre-se que os líderes das Igrejas Simples são designers. Eles idealizam oportunidades para que as pessoas sejam transformadas. Os líderes de Igrejas Complexas são programadores. Os programadores focam em uma atividade de cada vez. Os designers focam no movimento entre as atividades.

Sem movimento, as atividades se tornam um fim em si mesmas. Sem movimento você está apenas tocando atividades ministeriais. Para maximizar o movimento em sua igreja considere as sugestões a seguir.

Crie estágios de curto prazo

No desejo de conduzir as pessoas de uma atividade para a outra pense em termos de estágios de curto prazo. Como você pode ajudar as pessoas a dar passos na direção da próxima atividade no seu processo?

Os passos não podem ser novas atividades. Eles devem ser oportunidades de curto prazo que exponham as pessoas a um aspecto do processo que ainda não experimentaram. A Igreja de Saddleback foi uma pioneira em passos de curto prazo. O processo de Saddleback deseja conduzir as pessoas dos cultos para os grupos pequenos. Para ajudar as pessoas a tomarem esse passo, Saddleback ocasionalmente promove grupos de curto prazo associados aos cultos.

A Comunidade de Saddleback, liderada por Rick Warren, foi a primeira igreja a lançar uma campanha de crescimento espiritual de quarenta dias. Durante essas campanhas a Igreja de Saddleback alinha todo o ensino na igreja em torno do mesmo tema. Durante seis semanas os grupos de estudo usam um currículo que se relaciona com as mensagens que são pregadas nos cultos.

Todas as pessoas são desafiadas a se juntarem a um grupo pequeno por seis semanas. É um passo de curto prazo. As pessoas que ainda não se envolveram com um grupo pequeno são receptivas a essa ideia de um desafio de seis semanas. Elas sabem que o seu compromisso tem um tempo predeterminado; portanto, elas estão mais propensas a tentar.

Enquanto eles recebem o conteúdo da série eles também caminham mais no processo de transformação espiritual. Muitos desses grupos continuam a se reunir depois que a série termina.

Na Comunidade de Cristo em Miami (a igreja do Eric) o processo foi idealizado para conduzir as pessoas dos cultos para os grupos pequenos e daí para o ministério. Para ajudar a conduzir as pessoas dos grupos pequenos para esteio do ministério, todos os grupos foram desafiados recentemente a servir juntos fora do ambiente da igreja. Foi um desafio de curto prazo. Os grupos participaram de uma oportunidade de serviço por dois meses. Muitas pessoas foram expostas pela primeira vez ao estágio do serviço no processo.

Capitalize os relacionamentos

As pessoas não progridem através do processo simples porque elas ouvem do púlpito. Elas não progridem através do processo porque leem a declaração na parede. Por mais que essas coisas possam ajudar, as pessoas progridem porque alguém as conduz pelo processo.

Os relacionamentos ligam o processo.

Uma vez que os relacionamentos são tão vitais é preciso organizar conexões relacionais entre as atividades. Lembre-se que é a passagem que conta. Movimento é o que acontece entre as atividades. Movimento é como alguém passa de uma atividade para a outra.

Eis aqui um exemplo. Linda é uma mãe de 32 anos que está participando dos cultos. Seu marido vem com ela ocasionalmente. Ela é crente e recentemente sentiu o desejo de se aprofundar na fé. Apesar de participar com razoável regularidade ela não tem relacionamentos profundos na igreja. As pessoas que ela conhece bem estão envolvidas com a igreja.

Ela ouviu falar que há um grupo pequeno na igreja para jovens mães. Sua igreja deseja conduzir as pessoas dos cultos para os grupos pequenos. Eles estão organizando esses grupos com pessoas como Linda em mente.

Vejam duas abordagens para conduzi-la a um grupo pequeno.

Abordagem 1: A igreja imprime uma lista de grupos pequenos no boletim. Linda ouve o desafio do púlpito para ir a um desses grupos. Os horários estão listados junto com as salas ou as casas onde os grupos se reúnem. Ela não conhece ninguém nos grupos. Não tem nem certeza onde fica a rua. E ainda tem medo de que se não gostar ela vai se sentir mal ou culpada de não voltar.

Abordagem 2: A igreja imprime a mesma lista no boletim, mas ela faz mais. Eles têm uma mesa de inscrição para os grupos pequenos onde os líderes de grupo encontram as pessoas e respondem a perguntas. Linda pode ir até a mesa de inscrição e conhecer a líder do grupo de jovens mães. Enquanto ela está ali perto da mesa conhece outra mãe que também está perguntando sobre o grupo. O relacionamento alivia os seus medos.

A segunda abordagem tem uma pequena diferença que causa um grande impacto. A diferença é relacional. Relacionamentos e não informação é que ligam o processo. Capitalize no poder dos relacionamentos.

Considere o "E agora?"

Pouco importa o que a pessoa é, Deus deseja conduzir ele ou ela pela jornada espiritual. Cristo encontra as pessoas onde elas estão, mas ele vai puxá-las para continuar caminhando. O trabalho dele é a transformação. E ele nunca termina.

A sua programação deveria ser uma expressão de como você acredita que Deus trabalha na vida das pessoas. À medida que deseja conduzir as pessoas através do processo, sempre considere o "E agora?". Não permita que o programa de agora seja o fim. Procure levar as pessoas mais longe.

Praticamente, significa encorajar as pessoas em um determinado nível de envolvimento com as atividades a se moverem ao próximo nível. Veja a atividade atual como uma ponte para a próxima atividade no processo.

Durante a nossa consultoria na Igreja da Cruz, percebemos que o pastor se referiu ao seu grupo pequeno no sermão. A mensagem era clara: "este culto não é o fim. Há algo mais para você e para mim". Não era um ponto da sua mensagem. O comentário foi simplesmente entrelaçado no contexto do sermão, e de sua igreja. No final do culto os avisos feitos tinham a ver com os grupos pequenos. A Igreja da Cruz acertou em cheio no "E agora?".

Conecte as pessoas aos grupos

Os grupos são organizados de forma diferente e eles têm uma variedade de nomes: Escola Dominical, grupos pequenos, classes de comunhão bíblica, grupos comunitários, equipes de ministério, células, grupos nos lares e ligas de boliche. Ok; estamos brincando sobre as ligas de boliche, mas você pegou a ideia. Os grupos são apresentados de várias formas.

Embora o propósito e o estilo de cada grupo variem, eles conectam as pessoas pelos relacionamentos. No seu desejo de conduzir as pessoas, leve-as para algum tipo de grupo.

A pesquisa anterior de Thom sobre igrejas eficientes é convincente. O que ele disse vários anos atrás ainda se sustenta como verdade: "a imagem é clara: as pessoas se firmam numa igreja quando elas se envolvem com grupos pequenos".

Se as pessoas vêm apenas para o culto elas podem desistir sem que ninguém saiba. Quando as pessoas se envolvem com um grupo elas se tornam conhecidas. São capazes de viver a vida com outras pessoas. Elas desfrutam da aventura com as outras pessoas no rafting.

Quando as pessoas se engajam em um grupo elas grudam. Elas ficam. Permanecem; têm uma rede de apoio, uma comunidade de amigos que seguem a Cristo. Elas continuam na vida da igreja. E continuam sendo transformadas.

A programação estratégica, a programação sequencial e o movimento intencional são essenciais para acabar com o congestionamento no corpo de Cristo. Eles são abrangentes e estão diretamente relacionados à programação envolvida com o processo simples. As próximas duas prescrições são passos específicos que revelam o compromisso de uma igreja com o movimento.

4. PRÓXIMO PASSO CLARO

Histórias de órfãos em países como a Romênia e a Rússia ganharam o coração de muitos americanos. As crianças são colocadas em orfanatos com centenas de outras crianças. O número de funcionários em cada orfanato é extremamente pequeno. A proporção entre adultos e crianças é alarmante.

Tudo que um funcionário pode fazer é garantir que cada criança tenha as suas necessidades básicas supridas: comida, água e abrigo. Porém, as crianças não são tocadas. Elas não são abraçadas. Não se cultiva o afeto.

Há uma década os jornalistas entraram nesses orfanatos pela primeira vez. Eles ficaram chocados com o que não viram nem ouviram. Não havia riso, nem lágrimas. As crianças de três anos não falavam nem choravam.

Sem o toque os orfanatos ficaram sem riso e lágrimas. Sem o toque o crescimento das crianças foi impedido. Sem o cultivo da afetividade elas não amadurecem normalmente. A falta de atenção era prejudicial para as crianças.

Infelizmente muitas igrejas tratam os novos crentes como esses orfanatos tratam as crianças. Há pouca atenção e cuidado. Os novos crentes são deixados de lado. Tipicamente não há acompanhamento. A pessoa não está segura do que deve fazer agora.

A situação é trágica. Assim como as crianças precisam de cuidado e atenção durante os seus anos de formação, os novos crentes também. O próximo passo precisa estar claro para eles. Precisam ser conduzidos à vida da igreja. Precisam ser cuidados na direção do crescimento espiritual.

De acordo com a nossa pesquisa, apresentar claramente o próximo passo para os novos crentes é essencial. Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, sobre como eles tratavam os novos crentes.

Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Depois que alguém se torna um crente o próximo passo na direção espiritual está claro".

Das igrejas vibrantes, 48% concordaram ou concordaram fortemente com a afirmação, contra 22% das igrejas do grupo comparativo. As igrejas vibrantes são duas vezes mais propensas a deixarem claro o próximo passo para os novos crentes (Figura 4).

Faz sentido que as Igrejas Simples sejam mais cuidadosas no tratamento delas aos novos crentes do que as igrejas do grupo comparativo. Geralmente os novos crentes são os missionários mais ativos que uma igreja tem. Eles ainda conhecem pessoas perdidas. Têm um fogo dentro deles que a maioria dos crentes mais antigos perdeu. Os novos crentes ainda não aprenderam todas as regras religiosas. Eles falam com liberdade sobre a graça que descobriram.

O maior recurso que a sua igreja tem para influenciar a comunidade são os novos crentes. Quando as igrejas vibrantes cuidam dos novos crentes elas estão impulsionando o movimento do evangelho.

Embora cuidar dos novos crentes produza fruto, também é a coisa certa a fazer, independente de produzir resultados ou não. Esses novos crentes são pessoas reais. Eles não são apenas nomes numa lista. Têm vidas reais, trabalho e famílias. Acabaram de cruzar a linha da fé para um mundo novo. São tão novos para esse mundo como um bebê é para o seu novo ambiente. Precisam de alguém para caminhar com eles no mundo novo. Precisam que o próximo passo esteja claro.

Uma olhada no próximo passo

Muitas Igrejas Simples e vibrantes que pesquisamos usam algum tipo de grupo para novos crentes. Ou arrumam um grupo para os novos crentes, ou eles colocam essas pessoas em grupos já existentes. Independente da abordagem, colocar os novos crentes em um grupo é eficaz. Thom descobriu em um estudo anterior que "os novos crentes que imediatamente se tornam ativos em um grupo pequeno tem cinco vezes mais possibilidade de ainda estar na igreja cinco anos depois, do que aqueles que apenas participavam assiduamente dos cultos".

Outras Igrejas Simples que pesquisamos proveem os novos crentes com um mentor pessoal ou um líder de discipulado. As duas pessoas se encontram por várias semanas num ambiente informal para cobrir um determinado currículo. Ou o mentor simplesmente ajuda o novo crente a se inserir na vida da igreja.

Qualquer que seja a sua estratégia para os novos crentes, tenha uma estratégia! O discipulado dos novos crentes não acontece simplesmente. Tem que ser intencional. Tem que estar no coração e tem que ter um plano para que aconteça.

Igrejas Simples conduzem os novos crentes para a vida da igreja. Elas também são intencionais no tratamento dos novos crentes.

5. CLASSE DE NOVOS MEMBROS

Há orientação para praticamente tudo hoje em dia. Se você mudar para um bairro novo, que tem uma associação de moradores, você provavelmente será convidado para uma reunião com novos moradores. Se o seu filho está indo para a faculdade você vai inscrevê-lo numa orientação para novos alunos que não está incluída na mensalidade. Para novos motoristas há um curso.

Recentemente o Eric pensou em trocar os seus óculos de leitura por lentes de contato. Aí informaram que ele teria que participar de uma orientação em como "colocá-las" propriamente. Ele continua usando os óculos. Quem tem tempo para uma aula sobre lentes de contato? O médico dele não vai permitir que ele use as lentes. O seu compromisso é muito pequeno.

Há orientação para quase tudo hoje em dia. Exceto para se tornar membro de uma igreja.

Parece que o compromisso para se usar lentes de contato é maior do que o compromisso para se tornar membro de muitas igrejas. A maioria das igrejas requer apenas que o novo membro preencha um cartão ou uma espécie de cadastro. Tudo acontece muito rápido. As exceções são mínimas. Se inscrever para receber o cartão de crédito de uma loja demora mais.

As Igrejas Simples, porém, tendem a requerer uma classe de novos membros.

De acordo com a nossa pesquisa é crítica a necessidade de se usar algum tipo de capacitação para conduzir as novas pessoas na vida da igreja de forma eficaz. Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, sobre como tratavam os novos crentes. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Nós temos uma classe ou um grupo para conduzir as pessoas novas à vida da igreja" (Figura 5).

Das igrejas vibrantes, 70% concordaram ou concordaram fortemente com a afirmação, contra 38% das igrejas do grupo comparativo. As igrejas vibrantes são muito mais propensas do que as igrejas do grupo comparativo a proverem uma classe para novos membros.

Thom já comentou inúmeras vezes sobre a importância de uma classe de novos membros. Depois de estudar igrejas que alcançam os de fora ele afirmou: "a relação entre o entrosamento efetivo e a classe de novos membros é espantosa. As igrejas que exigem que os novos membros em potencial participem de uma classe de novos membros experimentam uma proporção muito maior de permanência dessas pessoas do que aquelas que não exigem".

O impacto é incrível. Então não nos surpreende que as igrejas vibrantes usem as classes de novos membros para conduzirem as pessoas à vida da igreja. Só confirma o que já está estabelecido.

No entanto, nos surpreende que tantas igrejas ainda não ofereçam nenhum tipo de capacitação para os novos membros. A evidência é convincente. Crie uma classe para novos membros.

É típico se falar nas classes de novos membros sobre as crenças, práticas e direções da igreja. As pessoas têm a chance de saber exatamente a que elas estão se tornando membros. Eles ouvem o coração da igreja. Grandes conversas acontecem e as pessoas saem com uma conexão profunda com a sua igreja.

E mais, nós observamos que os líderes das Igrejas Simples usam as classes de novos membros para ensiná-los sobre o processo deles e desafiá-los a um compromisso. Nós encorajamos você a incluir esses dois itens em sua classe de orientação para novos membros.

Ensine o processo simples. As pessoas entram na igreja com vários tipos de histórias e experiências. Algumas pessoas chegam com uma ideia preconcebida de como uma igreja deve funcionar. Alguns até chegam com firmes convicções de atividades que uma igreja deve proporcionar.

A classe de novos membros deve servir como um filtro para a filosofia de ministério de sua igreja. É uma grande oportunidade de ensinar o processo simples que Deus deu à sua igreja. As pessoas têm a oportunidade de saber logo no início como a sua igreja funciona.

Convide as pessoas a assumirem um compromisso com o processo. A classe de novos membros é a única oportunidade exclusiva que os líderes da igreja têm com os membros em potencial. Os líderes de Igrejas Simples maximizam este tempo com o convite para um comprometimento. Eles definem claramente como um membro pode progredir através do processo de transformação espiritual. Deixam claro que a expectativa é que eles caminhem através desse processo.

Esse encontro de capacitação com os novos membros é a oportunidade de convidar as pessoas para se juntarem a você nessa jornada. Use o tempo com sabedoria. Insista no compromisso. Desafie os membros em potencial a trazerem outros com eles ao longo do processo.

De volta a Jesus

Se alguém entende de discipulado é Jesus!

O seu método de discipulado era simples.

Jesus atraiu para si doze homens, capacitou-os e desencadeou o movimento do evangelho através deles. O fato é que você está lendo isso hoje porque aqueles homens levaram a sério o chamado deles. Jesus não tinha um plano B. Os discípulos eram o plano. Ele deixou a mensagem nas mãos deles.

A maioria das pessoas teria feito diferente. A maioria das pessoas teria escolhido outro método para garantir que as pessoas ouvissem sobre o seu sacrifício. Ele, sim, tinha todos os recursos disponíveis. Afinal, era Deus.

Ele poderia ter escolhido transmitir sua morte e ressurreição para o mundo inteiro. Poderia ter pregado bem alto lá dos céus. Poderia ter enviado os anjos a distribuir folhetos pelo cosmos.

Em vez disso, ele simplesmente se derramou nos seus discípulos.

Encontrar-se com Jesus e seus discípulos nos evangelhos nos dá uma ideia do que é um processo simples de discipulado. No Evangelho de Lucas três fases distintas aparecem: chamado, edificação e envio. Essas três fases são sequenciais e foram idealizadas para conduzir os discípulos a níveis maiores de compromisso.

O chamado (Lucas 5-6)

Em Lucas 5, Jesus chama os seus discípulos para si. Jesus providenciou oportunidades para eles o encontrarem e experimentarem. Ele interagiu com eles no domínio deles. Jesus foi pescar com Pedro, Tiago e João. Ele foi a uma festa na casa de Mateus. E convidou cada um a segui-lo.

Em Lucas 6 Jesus cimentou o chamado. Depois de passar a noite orando, ele escolheu doze indivíduos para serem seus apóstolos. Eles agora seriam reconhecidos como seus discípulos, como pertencentes a ele.

A edificação (Lucas 7-8)

Depois de chamar os seus discípulos para si, ele providenciou oportunidades planejadas para edificar a fé deles. Em Lucas 7, Jesus apresentou a eles um ensino essencial e crítico. Os discípulos aprenderam sobre terem uma visão eterna, alegria, amar aos inimigos, não julgar os outros e produzirem frutos espirituais.

Em Lucas 8, Jesus permitiu que eles o vissem na linha de frente do ministério. Eles o viram curar pessoas e ressuscitar mortos. Também o viram acalmar uma tempestade. Também aprenderam como tratar as pessoas observando a Jesus. Viram o seu amor e compaixão para com as pessoas a quem a sociedade desprezava. Jesus defendeu a adoração de uma mulher pecadora, mas arrependida; e se referiu a outra mulher como irmã.

O envio (Lucas 9)

Depois das fases de chamado e edificação, Jesus entregou o ministério para os seus discípulos. Ele providenciou oportunidades para eles crescerem através do serviço. Em Lucas 9, Jesus envia os seus discípulos para ministrarem juntos. Eles voltaram para avaliação. Talvez Jesus tenha sentado em volta de uma fogueira com os seus discípulos e ouviu atentamente as suas histórias. Foi um grande momento de ensino. Servir sempre é!

Depois, em Lucas 9, Jesus convida os seus discípulos a participarem da alimentação de cinco mil. Ele disse a eles, "Vocês deem algo para eles comerem". Eles passaram as cestas e participaram do milagre.

Enquanto ele os enviava ao ministério, continuava a providenciar instrução e encorajamento. Jesus os resgatou de uma oportunidade de ministério que não saiu como planejado. Os discípulos tentaram expulsar o demônio de um garoto e não conseguiram. Provavelmente foi muito embaraçoso. O pai veio a Jesus clamando por ajuda. Jesus interferiu e curou. Jesus intencionalmente os colocou numa posição para serem testados espiritualmente.

Jesus chamou, edificou e enviou seus discípulos. Ele estratégica e sequencialmente os colocou em posição de caminhar para estágios maiores de compromisso e crescimento.

O seu processo de discipulado era simples. Não era estagnado ou congestionado.

Tinha movimento.

Pegue as prescrições. Garanta que a sua igreja remova o congestionamento. Então a sua igreja estará em condições de ter todos na mesma direção. Chamamos isso de alinhamento, o assunto do próximo capítulo.$conteudo$
  )
  returning id into v_aula_id;
end if;

if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
  insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
  (v_aula_id, 1, $p$Qual tem sido a nossa visão sobre crescimento espiritual? Ela está de acordo com 2Coríntios 3.18?$p$, 'reflexao', null),
  (v_aula_id, 2, $p$A sua igreja está congestionada? Onde?$p$, 'reflexao', null),
  (v_aula_id, 3, $p$As suas atividades estão planejadas de acordo com o processo?$p$, 'reflexao', null),
  (v_aula_id, 4, $p$Qual é a sequência das suas atividades?$p$, 'reflexao', null),
  (v_aula_id, 5, $p$O próximo passo para os novos crentes está claro?$p$, 'reflexao', null),
  (v_aula_id, 6, $p$O que devemos fazer sobre a nossa classe de novos membros ou sobre a falta dela?$p$, 'reflexao', null);
end if;

  -- ---------------------------------------------------------------
  -- Capítulo 7 — Alinhamento: maximizando a energia de cada um  (aula ordem = 8)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 8;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 7 — Alinhamento: maximizando a energia de cada um$t$,
      8,
$conteudo$"Irmãos, em nome do nosso Senhor Jesus Cristo suplico a todos vocês que concordem uns com os outros no que falam, para que não haja divisões entre vocês; antes, que todos estejam unidos num só pensamento e num só parecer"
— Apóstolo Paulo (1 Coríntios 1.10)

Clareza → Movimento → Alinhamento → Foco

"Você acredita em milagres? Sim!"

Esta talvez seja a frase mais famosa em toda a história das transmissões esportivas. O locutor Al Michaels gritou quando o time norte-americano de hóquei no gelo protagonizou uma das maiores zebras de todos os tempos. A derrota épica do time soviético é tida como "o milagre no gelo".

O filme Milagre conta a história desse time americano de hóquei no gelo, que chocou o mundo nas Olimpíadas de 1980. Dois dias depois de derrotar os russos o time americano derrotou os finlandeses e ganhou a medalha de ouro.

Por que isso foi considerado um milagre?

O time soviético havia ganhado a medalha de ouro nos últimos vinte anos. Eles eram de longe o melhor time de hóquei no mundo. Eles haviam destruído recentemente o time dos melhores jogadores da Liga Nacional de Hóquei nos Estados Unidos. O time olímpico americano era formado só por amadores, na sua maioria estudantes de faculdade. A classificação inicial deles era décimo segundo. Ninguém, só eles acreditavam que poderiam vencer.

Herb Brooks recebeu a responsabilidade de ajuntar e treinar o grupo de amadores. Antes que o sonho de conquistarem a medalha de ouro pudesse se tornar realidade, ele teve que alinhar o time com a mesma perspectiva do hóquei. Ele tinha que maximizar a energia de cada um.

Era uma tarefa amedrontadora. Os jogadores vinham com histórias diferentes, de escolas diferentes e de todas as partes do país. Todos eles vieram com suas perspectivas e estilos de jogo.

A unidade não surgiu facilmente. Eles eram um grupo de indivíduos e não um time alinhado com o mesmo propósito. Cada jogador se identificava com o seu próprio time, e não com o time olímpico. No filme Milagre uma cena retrata Brooks durante um treino perguntando aos seus jogadores: "para quem vocês jogam?". E cada jogador responde o nome do seu time de origem na faculdade.

Brooks sabia que isso teria que mudar.

Depois de um jogo-exibição sem nenhum entusiasmo, o técnico decidiu que estava na hora de buscar o alinhamento. Depois de jogarem uma partida inteira, ele fez com que eles patinassem. Isso é o equivalente a um time de futebol ficar dando voltas na pista ou um time de basquete treinando corridas suicidas.

Foi um momento decisivo para o time.

Durante aquele exercício brutal um dos jogadores gritou, "eu jogo pelos Estados Unidos da América". Com aquela declaração Brooks dispensou os jogadores. Foi o ponto da virada. O grupo de indivíduos se tornou um. Eles não mais se viam jogando por escolas diferentes, mas jogando pelos Estados Unidos da América.

Eles se tornaram um time. Cada jogador se tornou parte de um grande todo. Cada atleta se comprometeu a se alinhar com a perspectiva de hóquei do time. A energia e a contribuição de cada indivíduo foram maximizadas. Foi maravilhoso e o impacto foi enorme.

O MILAGRE DA UNIDADE

Você acredita em milagres?

Através da morte sacrificial de Cristo, os crentes são um com Deus. Os teólogos chamam de expiação. Esse é o milagre da salvação. Um Deus santo e o homem pecador unificados.

Deus deseja também o milagre da unidade para a igreja — para a sua igreja. Algo muito mais valioso que uma medalha olímpica está em jogo. Vidas estão em jogo. Sem o milagre da unidade, igrejas se dividem e os ministérios sofrem. E o mundo assiste enquanto tudo isso acontece.

Nos momentos finais da vida de Jesus ele estava preocupado com a unidade. No jardim orou para que os discípulos fossem um. Disse ao Pai, "para que todos sejam um. Pai, como tu estás em mim e eu em ti. Que eles também esteja em nós, para que o mundo creia que tu me enviaste" (João 17.21).

Esta é uma declaração incrível.

Jesus orou para que os seus seguidores fossem um como ele e o Pai são. Deus o Pai, o filho, e o Espírito Santo são completamente um. Eles são inseparáveis. Jesus orou para que os crentes fossem íntimos, unidos e alinhados como eles. A unidade reflete a glória e o caráter de Deus porque Deus é um.

Jesus continuou, "Dei-lhes a glória que me deste, para que eles sejam um, assim como nós somos um: eu neles e tu em mim. Que eles sejam levados à plena unidade, para que o mundo saiba que tu me enviaste, e os amaste como igualmente me amaste" (João 17.22-23).

A unidade não só reflete a glória de Deus, como também capta a atenção do mundo. As pessoas são atraídas pela unidade. Antes Jesus já havia dito que "todos saberão que vocês são meus discípulos, se vocês se amarem uns aos outros" (João 13.35).

O apóstolo Paulo também encorajou as pessoas assim. Ele desafiou a igreja a "completarem a sua alegria, tendo o mesmo modo de pensar, o mesmo amor, um só espírito e uma só atitude" (Filipenses 2.2).

A unidade é poderosa. Ela é magnética. É algo maravilhoso. E o seu impacto é grande. Assim é a essência do alinhamento. Alinhamento é a organização de todos os ministérios e equipe em torno do mesmo processo.

BROOKS, O CONSTRUTOR

Herb Brooks construiu e montou um grande time. Ele fez isso organizando os jogadores, não só em torno da mesma visão de ganhar uma medalha de ouro, mas também em torno de uma mesma perspectiva do hóquei.

Você também é um construtor. Não é suficiente unir a igreja em torno do mesmo "o que" (propósito), mas ela precisa estar alinhada também ao mesmo "como" (processo).

Imagine que você está construindo uma casa. Se o grupo de empreiteiros e construtores concordarem apenas com "o que" está sendo construído, você teria um problema. Eles têm que concordar com a forma de trabalhar e ter um plano. De outra forma os empreiteiros e construtores iriam competir uns com os outros por tempo, dinheiro e preferência na agenda.

A equipe precisa também se alinhar em torno do "como".

Sem alinhamento a complexidade é certa. Sem alinhamento você não será simples. A igreja precisa estar unida em torno da mesma abordagem de ministério. A igreja precisa estar alinhada em torno do processo ministerial simples.

De acordo com a nossa pesquisa há uma relação significativa entre a vitalidade de uma igreja e o alinhamento. Neste capítulo você encontrará cinco elementos essenciais ao alinhamento. Todos os cinco foram tirados dos dados de nossa pesquisa.

Se você quer maximizar a energia de todos, você precisa selecionar em torno do processo, exigir prestação de contas, implementar o mesmo processo em todos os níveis, unir os líderes em torno do processo, e garantir que os novos ministérios encaixem no processo.

1: SELECIONAR EM TORNO DO PROCESSO

Herb Brooks escolheu com muito cuidado os jogadores para o time. Eles procurou jogadores que estivessem mais comprometidos com o nome na frente da camisa (EUA), do que com o nome nas costas. Depois que ele escolheu seus jogadores alguns ainda insistiam que os melhores jogadores estavam ausentes. Sua resposta, como aparece no filme Milagre, se tornou clássica: "eu não estou procurando os melhores jogadores, eu estou procurando os jogadores certos".

Brooks estava à procura de jogadores que se alinhassem à mesma perspectiva do hóquei. Escolher os jogadores certos é vital. Sem os líderes corretos uma igreja jamais será alinhada. As pessoas seguem a liderança; se a liderança não está caminhando na mesma direção, o povo se espalha. Os líderes são responsáveis por estabelecer e reforçar a cultura da igreja. Consequentemente, se os líderes não estiverem alinhados, a igreja não desfrutará de unidade.

Às vezes os melhores jogadores não são os jogadores corretos.

Lembre-se da Primeira Igreja. Eles selecionaram "o melhor" para cada papel de liderança, e descobriram que a equipe estava dividida. Teologicamente a equipe estava alinhada, mas filosoficamente ela estava dividida. Os membros da equipe usavam os mesmos jargões ministeriais, mas eles tinham abordagens ministeriais conflitantes.

De acordo com a nossa pesquisa, é vital que você selecione e contrate pessoas baseado no compromisso delas com o seu processo ministerial. É essencial que contrate e coloque os seus líderes em posições-chave que estejam profundamente comprometidos com o seu processo ministerial simples. Eles precisam estar comprometidos não só com o ministério, mas também com o "como" a sua igreja exerce o seu ministério.

Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, sobre o peso que o processo ministerial deles tem na seleção de liderança. Nós pedimos para eles declararem o nível de concordância deles com a seguinte afirmação: "Nós selecionamos e contratamos líderes que estejam comprometidos com o nosso processo".

A porcentagem dos líderes das igrejas vibrantes que selecionam baseado no compromisso com o processo ministerial foi muito maior do que entre os líderes das igrejas do grupo comparativo. Das igrejas vibrantes, 64% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 33% dos líderes das igrejas do grupo comparativo.

As igrejas que trazem pessoas para a equipe que estejam comprometidas com o processo simples deles estão desfrutando do poder do alinhamento. A energia de todos está caminhando na mesma direção.

UMA HISTÓRIA TRISTE/FELIZ

Eric e vários de seus amigos (JR, Jorge e Jeff) colocaram um anúncio falso no site churchstaffing.com, como uma brincadeira. Agora, churchstaffing.com é um site sério. Na verdade, este é o site mais procurado por igrejas que querem encontrar membros para suas equipes e para líderes que estão à procura de ministério. Eles prestam um grande serviço. Acontece que Eric e a sua turma estavam meio entediados um dia; de fato Eric estava tentando convencer as pessoas que aquilo era uma pesquisa.

Então cada um contribuiu com quarenta dólares e se passaram pelos líderes do "Super Evento Eclesiástico". Eles estavam à procura de um "Pastor de artes extremas de adoração". Nem a igreja nem o cargo existiam de verdade, mas eles acharam que seria engraçado ver se alguém atenderia. Abaixo a redação do anúncio:

Super Evento Eclesiástico está procurando um líder excepcional para ser o nosso "Pastor de artes extremas de adoração". Nós cremos que essa pessoa será singular e especial para um momento como este. A pessoa vai trabalhar direto com o pastor titular e vai supervisionar todas as áreas de adoração. Os candidatos têm que abraçar a visão do pastor titular de alinhar todas as pessoas de todas as denominações em torno da mesma visão. A pessoa tem que ter as seguintes características:
- habilidade de incluir a doutrina de cinco pontos do calvinismo em todos os ambientes de adoração;
- um líder pós-moderno, visionário e missional capaz de criar um movimento apostólico em uma igreja antiga, mas futurista;
- disposta a encontrar algumas músicas escritas na tradição teológica pré-milenista dispensacionalista;
- desejo de desenvolver um emergente coral de sinos;
- saber lidar com cobras, pode ser útil (só para os cultos dos crentes);
- concordar que o Senhor precisa ser adorado através de vestimentas magníficas e com versões apropriadas da Bíblia;
- demonstrar prova da segunda bênção. Falar em línguas com vários sotaques é um fator importante, pois somos uma igreja multicultural;
- Exegeticamente estabelecer um movimento de fluidez na Adoração Ministerial Extrema;
Nós reconhecemos que muitas dessas exigências são preferências pessoais e não mandamentos bíblicos. No entanto, cada candidato precisa estar alinhado com pelo menos ¾ de todas as exigências.
Por favor, envie seu currículo em documento Word ou PDF para Tiago no e-mail: supereventoeclesiastico@yahoo.com.

O e-mail era válido para que as respostas pudessem ser lidas. JR inclusive montou um site temporário para Super Evento Eclesiástico. O site dizia: "Super Evento Eclesiástico: em construção". No site havia a fotografia de um jovem de cabelos longos, usando um terno e segurando um cabide para casacos. Preso no cabide estava uma foto enorme de uma cobra. Não poderia ter sido mais ridículo.

O anúncio e o site na Web criaram um grande reboliço. Recebemos toneladas de e-mails aplaudindo o humor do anúncio. Vários blogs se referiram e lançaram discussões sobre o anúncio. O link do anúncio circulou todo o país. Nós sabemos dessa abrangência nacional porque o anúncio foi enviado para membros da equipe do Eric por pessoas que não sabiam a origem do anúncio.

Essa é a parte engraçada da história.

A parte triste é que muitas pessoas se candidataram de verdade. Essas pessoas enviaram currículos reais e cartas de recomendação. Pessoas inclusive enviaram perguntas solicitando uma descrição de função. Alguns inclusive enviaram DVDs com eles dirigindo louvor. Nós ficamos chocados.

É triste! Eis o porquê. Para se candidatar a esse cargo a pessoa teria que:
1. não ter nenhuma convicção teológica básica que oriente o seu ministério, ou
2. estar disposto a comprometer as suas convicções para conseguir um trabalho.

A pessoa descrita no anúncio não existe. As doutrinas teológicas expressas no anúncio são opostas entre si no seu nível mais básico. Não cremos que hajam calvinistas que lidam com cobras. Não acreditamos que haja um líder que se classifique como pós-moderno e tradicional (vestimentas magníficas e sinos). Um dispensacionalista pré-milenista que insiste numa versão específica da Bíblia dificilmente poderá desenvolver um ambiente emergente e criativo.

Eric e seus amigos propositalmente criaram o anúncio contendo posições teológicas opostas dentro do cristianismo. Se alguém declarar que crê no que o anúncio pede, essa pessoa seria um crente esquizofrênico. A pessoa não teria um sistema de fé coerente. Ou pior ainda, estaria disposta subscrever qualquer sistema para conseguir uma entrevista de trabalho.

Ainda assim, pessoas se candidataram (por sinal, Thom deseja expressar a sua covardia declarando que não teve nenhum envolvimento com essa brincadeira).

A piada demonstra quão séria é a questão de seleção e contratação de pessoas. Parece que algumas pessoas estão dispostas a crer em qualquer coisa para garantir uma entrevista de trabalho. Se uma pessoa está disposta a subscrever qualquer sistema de fé para ser considerado para um trabalho, ela também estará disposta a subscrever qualquer filosofia de ministério. Se uma pessoa está disposta a comprometer sua teologia pessoal, ela estará disposta a comprometer sua abordagem ministerial.

É trágico! As igrejas precisam de líderes que estejam profundamente comprometidos com um sistema teológico básico. É importante que haja alinhamento teológico entre os membros da equipe de uma igreja. Esse alinhamento não significa que a liderança tem todas as respostas ou concorda na interpretação de todos os textos ou pensamentos sobre Deus. No entanto, eles precisam estar em sintonia nos pontos-chave da teologia.

Assim como o alinhamento teológico é essencial, o alinhamento filosófico também o é. Os líderes-chave precisam estar alinhados com a mesma filosofia ministerial. Se não, a igreja vai caminhar em múltiplas direções diferentes, dirigida pelas várias filosofias de ministério.

O seu processo ministerial simples é parte da sua filosofia de ministério. É como o ministério é desenvolvido em sua igreja. Portanto, você deve recorrer ao seu processo ministerial simples para selecionar e contratar. Você deve trazê-lo à tona logo no início da entrevista. Use o processo para avaliar se o líder em potencial se encaixará na direção do ministério em questão. Você deve contratar pessoas que estejam profundamente comprometidas com o seu processo ministerial simples e não que simplesmente aceitem o processo.

Primeiro, selecione com base no processo. Segundo, tenha um sistema de prestação de contas.

2: SISTEMA DE PRESTAÇÃO DE CONTAS

Depois de selecionar a equipe e os voluntários, você precisa liderá-los. Um aspecto importante da liderança é a prestação de contas. Isso é especialmente crítico para o alinhamento. Sem prestação de contas as pessoas naturalmente se afastam do processo ministerial declarado.

Max Depree disse uma vez: "os movimentos sofrem quando os líderes não querem manter as pessoas debaixo de prestação de contas". A igreja precisa ser um movimento, um movimento que as portas do inferno não poderão impedir (Mateus 16.18). A igreja não pode simplesmente construir um credo e uma instituição. A igreja é viva. A igreja é um movimento de graça. E esse movimento sofre sem prestação de contas.

Os líderes de igreja precisam evitar os dois extremos de microgerenciamento e negligência. O microgerenciamento sufoca a criatividade e impede a liderança compartilhada. A negligência promove a complacência e leva a fragmentação da equipe.

No equilíbrio está a boa liderança. Os líderes devem explicar o processo simples e então permitir que os líderes de ministério implementem com liberdade e criatividade.

De acordo com a nossa pesquisa, ter um sistema de prestação de contas baseado no processo simples é importante. Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, para avaliarem o sistema de prestação de contas que eles tinham com respeito a implementação do processo. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Nossa equipe e líderes devem prestar contas de como o processo da igreja é implementado em suas áreas respectivas".

Das igrejas vibrantes, 55% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 31% dos líderes das igrejas do grupo comparativo. Em geral os líderes das igrejas vibrantes são muito mais propensos a manterem um sistema de prestação de contas em relação ao processo ministerial simples.

Embora ter um sistema de prestação de contas seja benéfico para a equipe e para a igreja como um todo, é intimidador para muitos líderes de igreja. Embora as pessoas desejem retorno e direção da parte de seus líderes, a maioria das igrejas relutam em oferecê-los. Muitos líderes de igreja admitem que esta é uma área com a qual eles têm dificuldades. A prestação de contas não tem que ser dolorosa para nenhum dos lados. Ela pode ser libertadora. Abre meios de comunicação para diálogos honestos e produz algumas boas conversas sobre os caminhos do ministério. Enquanto você considera a necessidade de ter um sistema de prestação de contas àqueles que você lidera (equipe e voluntários), a ferramenta abaixo pode se mostrar útil.

UMA FERRAMENTA PARA A PRESTAÇÃO DE CONTAS

Quando Eric se tornou um pastor-executivo, ele foi abençoado por ter homens piedosos em igrejas vibrantes como seus mentores. Esses homens haviam servido na mesma função que o Eric por muitos anos. Alguns deles eram primos de terceiro grau de Noé; bem, nem tanto, mas eles estão ficando velhos. Alguns estão esperando pela edição desse livro em letras grandes.

Um dos conceitos que Eric aprendeu com esses homens foi providenciar um sistema de prestação de contas para a liderança.

Eric implementou o Plano de Ação Ministerial (PAM) com a equipe da Igreja de Cristo. O impacto do PAM na cultura de liderança tem sido fenomenal. Os membros da equipe têm direções claras a cada ano e os alvos de cada pessoa estão atrelados ao processo ministerial simples. Para aqueles que têm uma formação em administração, esse PAM é semelhante ao Sistema de Gerenciamento por Objetivos.

Peter Drucker desenvolveu o conceito de Sistema Gerenciamento por Objetivos (SGO) nos anos de 1950. O seu objetivo é ser uma ferramenta que gerencia os resultados. Os líderes e seus liderados previamente concordam com alvos mensuráveis, e seus acordos se tornam então a base para avaliação. Cada pessoa determina os seus próprios alvos baseados nas diretrizes da organização.

No início de cada ano, Eric se reúne com cada membro da equipe para discutir os planos ministeriais deles. O membro da equipe vem para a reunião com o seu PAM totalmente preenchido. Cada PAM reflete como aquele ministério específico reflete a visão e o processo da igreja, como as atividades foram organizadas para conduzir as pessoas através do processo, a estrutura organizacional do ministério e a avaliação atual do ministério.

Com base nessas considerações cada membro da equipe determina de cinco a sete alvos mensuráveis para o novo ano naquele ministério. O membro da equipe também faz um esboço de como ele pretende cumprir esses objetivos.

O PAM faz com que os objetivos individuais de cada ministério estejam relacionados com o processo ministerial geral. Cada pessoa tem um foco claro. Durante o ano, a situação e o progresso desses objetivos é avaliado. Eles proveem um sistema de avaliação que não é estranho. Ele é natural porque as coisas já foram escritas anteriormente. Os membros da equipe gostam desse retorno porque eles querem saber em que pé as coisas estão.

O PAM também alinha toda a equipe. Cada membro da equipe apresenta os seus objetivos para toda a equipe. A equipe então ora pela pessoa e por seu ministério naquele ano. Cada um sabe o que o outro está fazendo. Todos podem ver como o processo geral de ministério está sendo buscado em cada ministério. Isso gera energia. Cada pessoa vê que ela faz parte do todo, e que todos estão caminhando juntos na mesma direção.

Selecione baseado no processo simples. Providencie um sistema de prestação de contas para implementar o processo e implemente o mesmo processo em todas as áreas.

3: IMPLEMENTE O MESMO PROCESSO EM TODAS AS ÁREAS

Houve um tempo que havia a GAP. Uma única GAP. Uma loja com roupas para homens e mulheres. Boas roupas a preços razoáveis. Então uma grande mudança começou a acontecer... BabyGAP, GAPKids, GAPMaternidade, e GAPBody.

A Gap está em todo lugar. As lojas deles estão se multiplicando. Os teóricos da conspiração fiquem a postos.

A Gap resolveu atender a grupos diferentes de pessoas em vários estágios diferentes da vida. Porém, eles o fizeram sob a mesma bandeira. A Gap alcança pessoas muito diferentes sob o mesmo nome e filosofia.

Tanto faz a loja da Gap que você entrar; você vai ver o mesmo logotipo. Vai perceber o mesmo design e layout das lojas. Você será tratado com o mesmo cuidado no atendimento. E poderá comprar qualquer artigo em um único cartão Gap. Portanto, tanto faz o tipo de loja que escolher para visitar, você sempre saberá que está em uma Gap.

A Gap aumentou o número de pessoas que ela influencia enquanto permanece simples. Eles colocaram todos os seus serviços debaixo da mesma identidade. Eles foram capazes de crescer enquanto lutam pela simplicidade. Eles continuam conhecidos e reconhecidos simplesmente como Gap.

Há poder no alinhamento. Há poder em implementar o mesmo processo em todos os lugares.

A igreja deseja influenciar múltiplos grupos de pessoas em estágios diferentes da vida. A igreja consiste de crianças, adolescentes, jovens adultos, adultos de meia-idade e idosos. Como será que o alinhamento se apresenta numa igreja local?

A igreja que está comprometida com o alinhamento implementa o mesmo processo em todos os lugares. O processo ministerial simples orienta cada departamento ministerial da igreja. Por exemplo, o ministério infantil, o de jovens e o de jovens adultos têm o mesmo processo que toda a igreja.

Cada departamento, como as diferentes versões da Gap, oferece um conteúdo e um design apropriado para a idade em questão. Cada departamento implementa uma versão relevante do processo para a sua faixa etária em particular. Embora o processo seja o mesmo, cada ministério o executa com criatividade e foco para a sua idade específica.

De acordo com a nossa pesquisa, o mesmo processo simples em toda a cultura da igreja é sábio. Integrar o mesmo processo em cada ministério da igreja causa um impacto profundo.

Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, se eles tinham o mesmo processo ministerial em cada área da igreja. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Embora os estilos e métodos variem nos diferentes departamentos ministeriais (crianças e jovens), o processo é o mesmo".

Das igrejas vibrantes, 54% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 30% dos líderes das igrejas do grupo comparativo. A porcentagem do número de igrejas vibrantes que têm o mesmo processo em todas as áreas é significativamente maior que a porcentagem das igrejas do grupo comparativo.

OS BENEFÍCIOS

A Igreja da Cruz, do capítulo 2, é um excelente exemplo. A declaração de visão da Igreja da Cruz é: "Amar a Deus, amar aos outros e servir ao mundo". Para promover alinhamento eles integraram totalmente o mesmo processo em todos os departamentos da igreja.

A orientação básica para o ministério infantil é levar as crianças a amarem a Deus, amarem aos outros e a servirem ao mundo. A orientação básica para os ministérios com juventude é levar os estudantes a amarem a Deus, amarem aos outros e a servirem ao mundo. A declaração de visão para o ministério com os solteiros é levar os jovens adultos a amarem a Deus, amarem aos outros e servirem ao mundo.

Há pelo menos três benefícios em implementar o mesmo processo em todas as áreas.

Primeiro, aumenta a compreensão. Um observador do ministério integrado da Igreja da Cruz talvez diga: "mas é a mesma coisa para cada área, parece muito redundante".

Alinhamento é redundante de maneira positiva.

Todos na Igreja da Cruz entendem a direção de cada departamento ministerial. É simples. É o mesmo processo em todas as áreas. Se você é um adulto que entende o processo no ministério de adultos, também entende o processo no ministério infantil.

A alternativa é a complexidade. Sejamos honestos: você acredita mesmo que as pessoas sabem as dez ou doze declarações de visão diferentes de uma Igreja Complexa? A nossa observação é que nem os líderes sabem. As pessoas simplesmente ignoram. É muito complexo.

Segundo, promove a unidade. Implantar o mesmo processo em todas as áreas impede a igreja de ter múltiplos direcionamentos. Um processo que é plenamente implantado atrai cada departamento para permanecer junto. A alternativa leva a grupos de "subigrejas" que não refletem a direção geral da igreja.

Terceiro, as famílias experimentam o mesmo processo. Os departamentos etários como infantil, jovens e adultos são responsáveis pelo desenvolvimento espiritual de cada grupo em particular. Os líderes desses departamentos são os responsáveis por organizar um processo que conduza esses indivíduos à maturidade espiritual. Quando cada departamento implementa o mesmo processo as famílias se beneficiam.

Cada membro da família experimenta o mesmo processo ministerial. Todos os componentes da família são desafiados a caminhar através do processo. À medida que as pessoas vão crescendo e mudam de departamento ministerial, elas estão acostumadas ao processo simples. Cria sinergia para a igreja e para a família.

Na Igreja da Cruz cada departamento usa grupos pequenos para conectar as pessoas relacionalmente, para conduzir as pessoas a amarem aos outros. Cada membro da família é encorajado a crescer no seu amor pelos outros participando de um grupo pequeno. Quando um pai decide ir a um grupo pequeno, vai haver um grupo disponível para o seu filho também. Quando qualquer membro da família vai a um grupo pequeno o resto da família será apresentado ao próximo passo no processo. Cada departamento ministerial está complementando o outro departamento.

Este é o poder do alinhamento.

Selecione e ofereça um sistema de prestação de contas com base no seu processo simples. Implemente esse processo em cada departamento ministerial. Una as pessoas em torno do processo.

UNA AS PESSOAS EM TORNO DO PROCESSO

Um dos brinquedos infantis mais divertidos é o Sr. Cabeça de Batata. O Sr. Cabeça de Batata tem furos por todo o seu corpo. A criança tem que colocar peças nos buracos do Sr. Cabeça de Batata. Os braços, os pés, nariz, olhos, orelhas e lábios têm um lugar específico no corpo. Quando é montado da maneira certa ele quase parece humano. Quase!

O Sr. Cabeça de Batata nem sempre parece humano. A maioria das crianças decide colocar as partes do corpo em lugares diferentes do corpo dele. Um braço vai onde deveria ir o nariz. Os olhos são colocados onde deveriam estar os pés. O nariz será colocado no lado da face do coitado Sr. Cabeça de Batata.

Infelizmente a maioria das igrejas se parecem com um Sr. Cabeça de Batata desarrumado. Tudo está mal misturado. As partes do corpo não estão alinhadas como deveriam. A confusão é abundante. Embora seja engraçado no brinquedo, não é nada engraçado nas igrejas.

As Escrituras se referem à igreja como o Sr. Cabeça de Batata. Bem, não exatamente, mas está perto.

As Escrituras se referem à igreja como o corpo de Cristo. Quando o corpo de Cristo está trabalhando bem é bonito de ver. Todas as partes estão no seu lugar certo. Elas estão funcionando corretamente. E elas têm consciência de que fazem parte do mesmo corpo (1 Coríntios 12.12).

Quando um corpo não está unido, não é bonito de se ver. Imagine se quando você tentasse andar uma perna fosse para a direita e a outra para a esquerda. Imagine a confusão se seu olho direito olhasse para cima e o seu olho esquerdo olhasse para baixo. Imagine o desconforto se o seu braço direito se recusasse a fazer parceria com o braço esquerdo. Imagine a perplexidade se os seus pés decidissem não trabalhar com o resto do seu corpo.

Quando um corpo de Cristo local não está unido na mesma direção, o corpo é ineficiente. Quando uma parte do corpo resolve não funcionar, vira uma bagunça. E quando um determinado órgão do corpo quer ser um corpo à parte há divisão. O mundo vê isso e fica confuso.

O processo ministerial simples provê o espaço para os líderes da igreja trabalharem. O processo pode ser usado para unir o corpo. Há uma direção clara e cada pessoa tem um lugar para se inserir.

De acordo com a nossa pesquisa, é benéfico usar o seu processo ministerial para dar foco aos seus líderes. Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, se eles usavam o seu processo ministerial para unir e dar foco aos seus líderes. Pedimos para eles declararem o nível de concordância deles com a seguinte afirmação: "Nosso processo é o fator unificador que mantém todos os nossos líderes focados".

Das igrejas vibrantes, 42% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 17% dos líderes das igrejas do grupo comparativo. Os líderes das igrejas vibrantes são quase três vezes mais propensos a usarem o processo ministerial para dar foco aos seus líderes do que os líderes das igrejas do grupo comparativo.

A REALIDADE

As igrejas estão cheias com uma variedade de gerações, nacionalidades, preferências e histórias. Felizmente a maioria das igrejas não tem uniformidade. A uniformidade é enfadonha, e uniformidade é diferente de unidade. Os times esportivos usam o mesmo uniforme, mas podem estar divididos.

A unidade é muito mais profunda do que a uniformidade.

Na verdade, é na diversidade que a unidade se expressa melhor. É aí que fica claro que Deus está unindo as pessoas. A unidade última só é achada em Cristo; porém, um processo ministerial simples é uma grande ferramenta para manter as pessoas no mesmo objetivo.

Na realidade, os seguidores de Cristo têm discutido e discordado por séculos. Diferenças de credos, tanto grandes como pequenas, já separaram os crentes. No entanto, as diferenças que levam às divisões mais frequentes nas igrejas não são teológicas ou bíblicas. As diferenças que fazem mal para a maioria das igrejas estão no campo da abordagem e da filosofia ministerial.

As pessoas muitas vezes concordam teologicamente, mas discordam sobre a filosofia de ministério. As pessoas com frequência balançam a cabeça em concordância sobre uma questão bíblica, mas são diametralmente opostas sobre uma abordagem específica de ministério.

Você já ouviu isso: "Por que estamos fazendo isso dessa maneira? Porque não estamos mais fazendo isso?" Essas não são questões teológicas; são debates sobre preferências, estilos e abordagens.

Usar o seu processo como um fator unificador produz um alinhamento filosófico. Ajuda os líderes a concordarem onde as desavenças mais proliferam. Ajuda as pessoas a terem o mesmo pensamento em relação à abordagem ministerial. Em outras palavras os líderes concordam em como o ministério é desenvolvido em sua igreja.

O design de uma Igreja Simples é a sua filosofia de ministério. Uma Igreja Simples é uma congregação organizada em torno de um processo objetivo e estratégico que conduz as pessoas através dos estágios do crescimento espiritual. Quando as pessoas se comprometem não apenas com as declarações doutrinárias de uma igreja, mas também com o seu processo simples e estratégico, a energia de todos é liberada.

Então, enquanto reconhecemos a realidade de que Cristo é o doador da unidade, sabemos que um processo ministerial simples pode ser usado para unir as pessoas. O processo de uma igreja deveria ser um ponto de concordância no qual as pessoas entendem o quadro geral e como o ministério acontece. Para manter os líderes focados no processo ministerial simples você precisa lembrá-los do processo e ressaltar a contribuição deles para ele.

Lembre as pessoas do processo. A afirmação — "as pessoas precisam ser lembradas mais do que instruídas" é verdadeira. As pessoas têm a tendência de esquecer a direção da igreja. É necessário lembrar as pessoas do processo dado por Deus e que a igreja abraçou.

Lembre as pessoas atrelando as decisões e orientações ministeriais ao processo simples. Na General Electric, Jack Welch tentou conectar todas as decisões com a direção da companhia. Fazendo isso ele enfatizou a direção da companhia. Em sua igreja todos os detalhes importantes como contratação, orçamento, mudança de instalações, e projetos de construção tem que estar conectados com o processo que Deus deu à sua igreja.

Destaque as contribuições ao processo. Mostre aos líderes como eles estão contribuindo para o cumprimento do processo. É preciso que o corpo esteja funcionando apropriadamente para que o processo ministerial simples seja executado. Mostre para as pessoas como o aparente pequeno ato de serviço delas é uma parte no quadro completo que Deus está pintando na sua igreja.

Ande pelos ministérios, e ande muito. O especialista em gerenciamento Edward Deming cunhou a frase — Gerenciamento pela caminhada (GPC). Isso é eficiente.

Desenvolva o ministério através da caminhada.

Caminhe pelos ministérios e lembre as pessoas que elas são parte de um todo. As pessoas da recepção se encaixam no processo. Sem as pessoas do ministério infantil os adultos não poderiam caminhar pelo processo do discipulado. As pessoas que cuidam das instalações e equipamentos preparam o ambiente para que o seu ministério possa acontecer. Diga a eles o que é e agradeça. Quando as pessoas entendem o papel vital que elas desenvolvem, estarão mais propensas a se unirem ao todo. Sem o comprometimento delas, o corpo de Cristo se pareceria com o Sr. Cabeça de Batata montado por uma criança de três anos.

Para maximizar a energia de todos você precisa selecionar de acordo com o processo simples, ter um sistema de prestação de contas para implantação do processo, implantar o mesmo processo em cada departamento ministerial, e unir as pessoas em torno do processo simples. Finalmente, você precisa garantir que os novos ministérios claramente se encaixam no processo geral.

5: ALINHAMENTO DE NOVOS MINISTÉRIOS

Se você algum dia desenhou um ambiente ou redecorou uma casa, você sabe que é muito mais fácil trabalhar com mobília nova. Você compra a mobília de acordo com o ambiente que tem em mente. Se a mobília não se encaixa no ambiente, você não compra. O desafio é saber aonde a sua mobília e os seus quadros vão se encaixar.

A mesma coisa é verdade com relação ao alinhamento.

O aspecto mais desafiante do alinhamento é colocar os ministérios e equipe existente para trabalhar na mesma direção, especialmente se eles estão trabalhando em direções opostas. É muito mais fácil alinhar novas pessoas e ministérios para a direção geral. Se eles não se encaixarem você simplesmente não permite que eles comecem.

De acordo com a nossa pesquisa, garantir que os novos ministérios se encaixem no processo simples antes de começarem é vital. Depois é tarde demais.

Pedimos, tanto para os líderes das igrejas vibrantes como para os líderes das igrejas do grupo comparativo, para declararem o nível de concordância deles com a seguinte afirmação: "Antes de iniciarmos um novo ministério nós temos certeza de que ele se encaixa em nosso processo".

Das igrejas vibrantes, 68% concordaram ou concordaram fortemente com a afirmação, contra 40% das igrejas do grupo comparativo. Os líderes das igrejas vibrantes são muito mais propensos a garantir que os novos ministérios sabem o seu lugar no processo antes de eles começarem.

CONFERINDO O AJUSTE

Antes de você comprar um par de sapatos você os experimenta na loja. Você anda com eles. Seria insensato comprá-los sem saber se eles servem. Os sapatos que não servem vão parar no fundo do armário. Eles criam mais congestionamento. Checar o ajuste é essencial.

Os líderes de Igrejas Simples checam o ajuste. Antes de um novo processo começar garantem um lugar viável para ele no procedimento ministerial simples. Eles especificamente esclarecem como o novo ministério vai conduzir as pessoas pelo processo. E eles também garantem que os líderes do ministério iniciante entendem como ele é parte do todo.

Estamos estabelecendo uma distinção entre uma atividade e um ministério. No próximo capítulo vamos encorajar a ter cautela na hora de acrescentar novas atividades ao processo ministerial. Na verdade você será encorajado a eliminar algumas atividades.

Ministérios são diferentes de atividades. Ministérios são departamentos inteiros (veja expansão de ministérios) ou grupos específicos (veja inclusão de ministérios) que ajudam a conduzir as pessoas através de um aspecto do processo.

Numa Igreja Simples novos ministérios podem ser divididos em duas grandes categorias: expansão de ministérios e inclusão de ministérios. Conferir o ajuste antes de começar é essencial para ambos.

Expansão de ministérios são ministérios que são voltados para um grupo específico de idade ou estágio de vida. O ministério da igreja está se expandindo para focar intencionalmente em um grupo específico de pessoas. O novo ministério será um novo departamento da igreja como o ministério do departamento juvenil ou de jovens casais. Em ambos os casos esses grupos eram formalmente parte de outro ministério. Agora eles terão a sua própria identidade.

Para expansão de ministérios comece o novo com o mesmo processo simples. Tenha certeza que as atividades do novo ministério estão organizadas para conduzir as pessoas pelo processo. A expansão de ministérios é uma grande oportunidade para destacar o processo simples. Você pode começá-los sem congestionamento. Pode usar os novos ministérios para demonstrar aos ministérios existentes os benefícios de uma abordagem direta.

Inclusão de ministérios significa novos ministérios que cumprem uma função específica no processo simples. Esses ministérios precisam ser criados para ajudar a conduzir as pessoas através do processo de transformação. Por exemplo, a equipe de batismo torna mais fácil para os crentes serem conduzidas ao batismo. O ministério de recepção ajuda a conduzir as pessoas a se integrarem na vida da igreja. Se não estiver claro como a inclusão de um ministério vai conduzir outros através do processo simples, não comece.

TEM MUITA COISA EM JOGO

Tem muita coisa em jogo para o time de hóquei Milagre. Eles estavam jogando por uma medalha de ouro e o orgulho de uma nação. A unidade era essencial. Para alcançarem todo o seu potencial e chegar ao seu objetivo, o alinhamento não era uma opção.

O alinhamento é essencial para a igreja também. E tem mais coisa ainda em jogo.

Um dia houve um grupo de pessoas que estava enfrentando um oponente maior e mais forte do que o time de hóquei russo. O grupo de pessoas eram os israelitas e a terra de Canaã estava em jogo. Veja o que aconteceu.

Os israelitas eram o povo que Deus escolheu amar. Eram escravos no Egito há quatrocentos anos. Sonhavam em serem soltos, em serem livres. Deus levantou um líder chamado Moisés para conduzir o seu povo para fora do Egito, para fora da escravidão. Deus disse a Moisés que ele tinha separado uma terra chamada Canaã, que seria deles. A agenda de Deus era levar o seu povo para Canaã, uma terra que ele descrevera como sendo cheia de leite e mel, uma terra abundante. Essa agenda era maior do que qualquer jogo. Era a vida deles e a vida de suas famílias por muitas gerações por vir.

Deus mandou dez pragas ao Egito para que o líder egípcio, o Faraó, finalmente mandasse Moisés sair. Mas, depois de deixá-los ir, os egípcios decidiram ir atrás dos israelitas. Os israelitas chegaram ao mar Vermelho e não tinham para onde ir. Deus dividiu o mar Vermelho, de maneira que puderam caminhar pelo meio dele. Eles olharam para trás para ver o mar fechando em cima dos egípcios que os estavam perseguindo. Eles viram Deus os resgatando.

Deus então os levou pelo caminho até Canaã. Ele foi à frente deles protegendo-os a cada passo do caminho. Eles perceberam a presença de Deus de forma visível, com uma nuvem de dia e uma coluna de fogo à noite. Viram Moisés descer de uma reunião com Deus, com o seu rosto brilhando. Tiveram fome e Deus providenciou maná e codornizes. Eles nunca haviam visto, experimentado ou ouvido sobre esse maná antes. Mas a cada dia Deus preparava uma comida para o povo.

Com tudo o que Deus havia feito e estava ativamente fazendo, você pensaria que o povo se uniria em torno da agenda de Deus. Pensaria que este povo se alinharia com o plano que Deus havia dado a eles.

Ao contrário, eles reclamaram. Resmungavam por tudo. Murmuravam sobre Moisés e sua esposa. Reclamavam da comida que estavam comendo. Não era nada bonito de se ver. A dissensão nunca é. Deus haveria de ficar furioso com eles, mas a cada vez, Moisés implorava com Deus para que os perdoasse. Moisés estava sempre pedindo a Deus para suportá-los. Deus fez coisas para conseguir a atenção do povo, mas eles recusaram a unir-se em torno do chamado divino.

Em Números 13, eles estão perto da Terra Prometida. É como a noite anterior ao grande jogo. Estão prestes a entrar em Canaã. Moisés escolheu doze pessoas, uma de cada tribo de Israel, para ir e espiar a terra de Canaã. Este é o primeiro comitê registrado nas Escrituras e os resultados não foram bons.

A missão não era para determinar se eles iam ou não entrar na terra. Deus já havia dito que esta era a terra. A missão era simplesmente para explorá-la. Espiaram a terra por quarenta dias. Infelizmente essa campanha de quarenta dias foi um fracasso.

Eles voltaram para dar um relatório sobre o que viram. E disseram: "a terra é cheia de leite e mel, mas...". "Mas nós também vimos os oponentes, o outro time. Eles são enormes. Somos como gafanhotos aos olhos deles".

Dois dos espias, Josué e Calebe, insistiam que a terra poderia ser tomada: "nós podemos conseguir". Mas os outros dez espalharam o que a Bíblia chama de um relatório do mal. O relatório não era mau porque era falso. Não é que estivessem espalhando mentiras. O relatório era maldoso pela forma como estavam espalhando a informação. Não era o que estavam dizendo, mas como eles estavam dizendo.

O relatório maldoso se espalhou pelo acampamento, como fogo em grama seca. Naquela noite o povo quis apedrejar Moisés e Arão. Eles gritaram e disseram: "Seria melhor nós simplesmente morrermos aqui no deserto do que ir e morrer pela espada na terra de Canaã". Aquela noite foi um momento decisivo para aquele time fragmentado. Moisés mais uma vez clama para Deus perdoar o povo. Esta foi a resposta de Deus:

"O Senhor respondeu: Eu o perdoei, conforme você pediu. No entanto, juro pela glória do Senhor que enche toda a terra, que nenhum dos que viram a minha glória e os sinais miraculosos que realizei no Egito e no deserto, me puseram à prova e me desobedeceram dez vezes — nenhum deles chegará a ver a terra que prometi com juramento aos seus antepassados. Ninguém que me tratou com desprezo a verá. Mas, como meu servo Calebe tem outro espírito e me segue com integridade, eu o farei entrar na terra que foi observar e seus descendentes a herdarão. Visto que os amalequitas e os cananeus habitam nos vales, amanhã deem meia-volta e partam em direção ao deserto pelo caminho que vai para o mar Vermelho. Disse mais o Senhor a Moisés e a Arão: até quando esta comunidade ímpia se queixará contra mim? Tenho ouvido as queixas desses israelitas murmuradores. Diga-lhes: Juro pelo meu nome, declara o Senhor, que farei a vocês tudo o que pediram: cairão neste deserto os cadáveres de todos vocês, de vinte anos para cima, que foram contados no recenseamento e que se queixaram contra mim. Nenhum de vocês entrará na terra que, com mão levantada, jurei dar-lhes para sua habitação, exceto Calebe, filho de Jefoné e Josué, filho de Num" (Números 14.20-30).

Deus disse: "vocês querem morrer no deserto em vez de entrarem na terra de Canaã. Ok, tudo bem. Desejo concedido. Cada um de vocês vai morrer aqui no deserto".

Que história trágica. Deus tinha este plano fenomenal para o seu povo. Eles deveriam entrar nessa terra especial. Mas perderam a oportunidade; perderam o melhor de Deus.

Recusaram a se unir em torno do plano que Deus lhes havia dado para o futuro. Eles se recusaram a crer e seguir. Ao contrário, se uniram em torno da crítica, do negativismo, e da dissensão. E Deus levou isso muito a sério.

Ele sempre levou a unidade muito a sério. E continua levando a sério.

Deus tem um plano para a comunidade de fé na qual você está envolvido. Tem muita coisa em jogo. Muito mais do que uma medalha de ouro ou uma vitória olímpica. Redenção, eternidade, transformação, todos esses são milagres.

Unidade é essencial.

A história é meio sombria, mas tem um ponto de luz — na verdade dois: Calebe e Josué. Eles tinham um espírito diferente e seguiam a Deus com todo o coração. Eles estavam dispostos a abraçar a agenda de Deus. Estavam dispostos a se unirem em torno do plano de Deus. Portanto, Deus prometeu que haveriam de herdar a terra de Canaã. E eles herdaram.

As pessoas precisam ser desafiadas a serem "Calebes e Josués", para abraçarem de todo coração o que Deus está fazendo em sua igreja. As pessoas precisam ser desafiadas a se unirem, a se alinharem ao processo simples que Deus deu à sua igreja.

Tem muita coisa em jogo.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Descreva a melhor experiência de equipe que você teve. O que a tornou tão especial?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Como você já viu a desunião fazer mal para a igreja?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Por que a unidade em torno da abordagem ministerial é importante?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Numa escala de um a dez, quão alinhada a sua liderança está em torno do processo ministerial simples?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Quão confortável nós estamos com a prestação de contas?$p$, 'reflexao', null),
    (v_aula_id, 6, $p$O que "o mesmo processo em todos os lugares" significa para as nossas atividades?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 8 — Foco: dizendo não para quase tudo  (aula ordem = 9)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 9;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 8 — Foco: dizendo não para quase tudo$t$,
      9,
$conteudo$"Arte é um processo de eliminação. O escultor produz uma linda estátua talhando fora as partes do bloco de mármore que não são necessárias." — Elbert Hubbard

Clareza → Movimento → Alinhamento → Foco

Como você pode perceber, nós dois gostamos de pesquisa. Amamos a verdade e a pesquisa procura descobrir a verdade. A pesquisa traz clareza ao pensamento e força recomendações baseadas em fatos objetivos em vez de observações casuais ou sabedoria popular.

Um projeto de pesquisa recente chamou a atenção de centenas de milhares de americanos, da indústria do cinema e da indústria dos restaurantes. Este projeto de pesquisa era de natureza qualitativa e montado num modelo profundo de pesquisa experimental. O documentário sobre a experiência está destinado a se tornar um clássico do cinema Cult.

Estamos falando do filme Super Size Me - A dieta do palhaço.

Talvez estivesse esperando algo um pouco mais sério. Você não vai encontrar Super Size Me nas livrarias de uma instituição acadêmica, ou nos anais dos jornais de pesquisa. No entanto, você pode pegar uma cópia desse filme em sua locadora ou comprá-lo pela internet. Embora o filme seja uma sátira, os resultados da pesquisa são convincentes, interessantes, e espantosos.

Super Size Me é um documentário independente e barato sobre o impacto de se comer fast-food consistentemente. Morgan Spurlock foi o pesquisador e o produtor do filme. Ele documentou a experiência de um mês inteiro comendo no McDonald's.

Por todo um mês Spurlock só comeu comida comprada nos arcos dourados. O filme conduz o expectador por uma aventura gastronômica de um mês.

Você percebe os resultados aparecendo enquanto assiste ao filme. Você está na jornada de uma vida movida a McDonald's. Trinta dias de comida processada. As devocionais não estão incluídas.

Spurlock tinha três regras em seu experimento. Primeiro, ele teria que aceitar as porções grandes se elas lhe fossem oferecidas. Elas geralmente eram oferecidas e por apenas quarenta centavos a mais, quem pode me condenar por esta indulgência? Segundo, ele só poderia comer o que estivesse disponível no cardápio do McDonald's. Nada mais poderia entrar no seu corpo, nem mesmo uma bala Tic-Tac. Terceiro, ele teria que comer todos os itens do cardápio pelo menos uma vez.

Este seria o mês dos sonhos para a maioria das crianças. Então, quais foram os resultados?

Spurlock começou a sua experiência com 85 kg, corpo atlético e saudável. Ele não permaneceu assim. Ele ganhou 12 kg em um mês e começou a sofrer de cansaço, dores de cabeça e indigestão. Basicamente o seu corpo se desestruturou durante a Mac dieta. O açúcar no sangue subiu como um foguete. O seu fígado ficou cheio de gordura. O seu colesterol ficou fora da escala e a sua pressão arterial inimaginável. Desde que viu o filme Eric nunca mais comeu fast-food. (comentário do Thom: ele insiste que pizza não é fast-food.) Os resultados da experiência de Spurlock são claros. Eles confirmam o que já sabíamos, mas ver os resultados extremos é alarmante.

A conclusão: A comida do tipo fast-food não é saudável.

Na verdade, muitos médicos acreditam que ela está matando os americanos. A reação apropriada: "diga não ao fast-food".

O cardápio nos restaurantes fast-food continuam aumentando. Cada vez são oferecidos mais tipos diferentes de comida. O tamanho também aumentou. Em muitos estabelecimentos o que no passado foi uma porção de batatas fritas tamanho normal, hoje é tamanho infantil.

Nós, os consumidores, é que somos os culpados. Gostamos de comida e gostamos dela rápido. Desenvolvemos o paladar para batatas fritas engorduradas e hambúrgueres fritos em série. Os estabelecimentos de fast-food estão apenas capitalizando em cima de nossas escolhas ruins. Nossos gostos e nossa vida corrida aumentaram os cardápios... e nossas barrigas.

E vamos ficando cada vez menos saudáveis.

SUPER-SIZE ME ESPIRITUAL

Há uma epidemia de uma espiritualidade fast-food entre os crentes atuais. Gostamos de cardápios espirituais grandes, com muitas opções. E queremos que estas opções sejam servidas rapidamente.

Muitas igrejas se tornaram como os estabelecimentos de fast-food. Uma nova ideia surge e o cardápio aumenta. Alguém deseja um evento especial servido de uma maneira específica e o cardápio aumenta. As pessoas acreditam que quanto mais puder ser colocado no cardápio melhor. Assim, o boletim, a semana, a agenda, as atividades e o processo aumentam. Congestionam!

E nós vamos ficando cada vez menos saudáveis.

Alguém poderia pensar que quanto mais atividades e mais eventos especiais sejam oferecidos, maior será o impacto. Nossa pesquisa confirmou que o oposto é verdadeiro. Infelizmente os menus grandes e expandidos não estão produzindo igrejas vibrantes.

A conclusão: A espiritualidade fast-food não é saudável. Na verdade, essa abordagem ministerial de menus grandes e rápidos está matando nossas igrejas.

A reação apropriada: mantenha o foco no seu processo simples. Diga não para todas as outras coisas.

Se você seguir as orientações dadas nesse livro vai começar a idealizar um processo simples para o seu ministério. Ele será claro e vai conduzir as pessoas à maturidade espiritual. Você vai também alinhar todo o seu pessoal e os seus ministérios em torno desse processo.

Então a parte difícil vai começar e não vai acabar nunca. Ela estará presente pelo resto da sua vida ministerial.

Foco!

Como já dissemos desde o início, dentre os elementos da Igreja Simples este é mais difícil de ser implantado e praticado. Isso significa dizer muitos nãos.

Dizer não é difícil. Nenhum líder de igreja quer ser visto como David Spade (ator norte-americano) nas propagandas do cartão de crédito Capitol One, onde Spade diz não para todas as perguntas, em qualquer ligação. Os líderes de igreja não querem ser vistos como aquele sujeito que diz não para tudo.

Os líderes de igreja têm sentimentos. Bem, a maioria deles tem. Sério, a maioria tem o coração de pastor, que tem um profundo cuidado com as pessoas a quem ele serve. Dizer não é difícil porque geralmente incomoda a pessoa que ouve. Embora seja difícil, a nossa pesquisa indica que é necessário.

Dizer não precisa ser feito sob sabedoria e no tempo de Deus. Você precisa se lembrar que está lidando com pessoas que têm sentimentos.

Manter o foco é essencial para ser simples e uma igreja não pode permanecer focada sem dizer não. Embora não seja fácil é a saúde da igreja que está em jogo. Precisamos boicotar a espiritualidade fast-food. Nós precisamos focar.

UMA COISA

Foco é uma verdade ensinada e afirmada através de toda Escritura. O foco dos indivíduos na Bíblia é humilhante, e o princípio da "uma coisa" emerge.

Davi orou no Salmo 27.4: "Uma coisa pedi ao Senhor; é o que eu procuro: que eu possa viver na casa do Senhor todos os dias da minha vida...". Uma coisa era o seu foco. O desejo de um relacionamento íntimo e apaixonado com Deus o consumia.

Paulo disse em Filipenses 3.13-14: "... mas uma coisa faço: esquecendo-me das coisas que ficaram para trás e avançando para as que estão adiante, prossigo para o alvo, a fim de ganhar o prêmio do chamado celestial de Deus em Cristo Jesus". Uma coisa era o seu foco. O alvo de se parecer com Cristo o compelia a continuar a sua jornada espiritual. Na verdade, para Paulo, tudo mais era lixo comparado com esta "uma coisa" (Filipenses 3.8).

Paulo instruiu a Timóteo para que se exercitasse para ser piedoso. Para fazer isso, Timóteo teria que evitar as conversas tolas e os princípios legalistas que o cercavam. Ele tinha que focar em "uma coisa" que era ser transformado por Deus (1Timóteo 4.7-8).

O escritor de Hebreus nos instrui a abandonar todo pecado e tudo mais que atrapalha e corrermos a prova que Cristo já determinou para nós (Hebreus 12.1). Os corredores não entrariam em uma competição usando casacos de pele ou pesos nos tornozelos. Os atletas competem com roupas simples e apropriadas. Tudo o mais é jogado fora.

O escritor de Hebreus faz um chamado para focar, para colocar os nossos olhos em Cristo (Hebreus 12.2). Uma coisa: o desafio é se livrar de tudo que atrapalhe a transformação espiritual.

Como líder da igreja você está em parceria com Deus para edificar a vida das pessoas. Se Deus lhe deu claramente um processo para fazer e amadurecer discípulos, você deve focar nessa única coisa em sua igreja. Então as pessoas poderão percorrer a prova sem pesos nos tornozelos.

O FOCO DE UM CONSTRUTOR

Lembre-se, você é um construtor.

Imagine-se sentado com sua família para idealizar uma casa. Você investe meses no processo de design. Há tantas decisões, tanta coisa para pensar. Você trabalha duro para satisfazer o desejo de todos na família.

As crianças querem os seus quartos de certa forma e o mais longe possível uns dos outros. O tamanho dos aposentos é levado em consideração, a movimentação dentro da casa, onde e como as visitas serão recebidas, a varanda, a banheira, o formato da cozinha, se vai ter uma copa ou não, e assim por diante. Depois de meses mexendo na planta você finalmente tem um projeto claro.

Então você planeja como o projeto vai funcionar como ele vai progredir. E trabalha com um empreiteiro geral que vai organizar a ordem em que os subempreiteiros virão para fazer a parte deles. Eles são organizados estrategicamente em ordem. O projeto começa com aqueles que vão escavar e colocar os alicerces. O projeto termina com os pintores e instaladores. Muita coisa acontece no meio disso. Não é uma tarefa fácil.

Depois você alinha todas as pessoas e recursos ao plano. Garante que todos conhecem o processo e sabem onde cada um se encaixa. Você se disciplina a trabalhar somente com os subempreiteiros que entendem e estão comprometidos com a sua planta.

O projeto começa.

Algumas semanas depois de começado, a sua filha decide que ela não gostou do local do seu quarto. Ficou muito perto da garagem e a porta da garagem vai acordá-la de manhã cedo quando você sair para trabalhar. Ela quer que o seu quarto fique nos fundos da casa.

Seu filho está pensando em tocar bateria. Ele não estava interessado em bateria quando os planos surgiram, mas agora está. Pelo menos ele acha que está. O quarto dele é muito pequeno para colocar uma bateria e a sua esposa já lhe informou que a bateria não vai ficar na sala de jeito nenhum.

O projeto está em perigo. Todo mundo concordou com ele, mas agora outras coisas estão tirando o foco. A bateria, a porta da garagem, a vida. Isso acontece.

Você tinha um projeto claro, um projeto montado para funcionar e todos estavam alinhados. Agora tudo isso poderia se perder. A clareza, o movimento e o alinhamento não significam nada se perdermos o foco.

O que fazer?

Você vai enfrentar o mesmo dilema como um construtor de vidas e um construtor do Reino. Depois de idealizar um processo simples para a igreja com clareza, movimento e alinhamento, você ainda não acabou. Sempre vai haver a tentação de abandonar a simplicidade, de perder o foco e se tornar congestionado.

O que você vai fazer?

De acordo com a nossa pesquisa, há uma relação significativa entre a vitalidade da igreja e o foco no processo. No nosso estudo, as igrejas que tinham apenas uma coisa em mente no que se refere ao processo ministerial estão muito mais propensas a serem igrejas crescentes e vibrantes.

Você é um construtor e o foco é mandatório. Embora a clareza, o movimento, o alinhamento sejam essenciais, eles não significam nada sem foco. Foco é o compromisso de abandonar tudo que não se encaixe no processo ministerial simples. Neste capítulo vamos indicar cinco coisas essenciais para focar. Todas as cinco são importantes e emergem dos dados de nossa pesquisa.

Você precisa eliminar atividades não essenciais, limitar a inclusão de novas atividades, reduzir os eventos especiais, e garantir que o processo é fácil de comunicar e simples de entender.

1: ELIMINAR

Eliminar é necessário, mas também é difícil.

É especialmente difícil para os pack rats. Pack rats são um tipo de roedor americano que coleciona e transporta porcaria. Pessoas que têm o hábito de colecionar e entesourar coisas sem valor e sem sentido (quinquilharias) são apelidadas de pack rats.

Se você já esteve na casa de alguém assim, você ficou chocado com as pilhas de revistas, jornais, pratos, entre outras coisas. Você teve até dificuldade de se locomover pela casa. Você se ofereceu para ajudar a arrumar a casa, mas a pessoa insistiu que tudo aquilo é necessário.

De acordo com a pesquisa, essas pessoas provavelmente sofreram algum tipo de lesão cerebral que afetou a parte do cérebro que as impede de controlar essa necessidade de guardar tudo. Um estudo na Universidade de Iowa, com 86 pessoas, descobriu que cada uma dessas pessoas havia sofrido algum tipo de lesão cerebral. Em outras palavras, é um desafio neurológico para essas pessoas.

Muitas igrejas são como pack rats.

Muitas igrejas estão cheias de entulho. Atividades meio perdidas são guardadas e empilhadas umas sobre as outras. É difícil para as pessoas se conduzirem pelo processo de transformação espiritual por causa da distração causada por este entulho.

Embora eliminação não seja neurologicamente desafiador para as igrejas, é desafiador interpessoalmente e historicamente. As pessoas e a história estão envolvidas. Pessoas lideram essas atividades e as atividades têm uma história. Líderes de igreja que quiserem eliminar atividades inevitavelmente vão ofender o passado ou alguma pessoa.

Embora eliminar atividades seja difícil, os dados indicam que os líderes de igrejas vibrantes têm a disciplina para fazê-lo. Em outras palavras eles estão dispostos a limpar o entulho. As igrejas que eliminaram atividades estavam muito mais propensas a ter excelência no elemento foco e a se colocar no grupo das igrejas vibrantes.

Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, sobre o compromisso deles com a eliminação. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Procuramos eliminar as atividades que não se encaixam em nosso processo, mesmo que sejam boas".

Das igrejas vibrantes, 46% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 22% dos líderes das igrejas do grupo comparativo. Os líderes das igrejas vibrantes que concordaram ou concordaram fortemente que eles procuravam eliminar as atividades que não estavam no processo foram duas vezes mais do que os líderes das igrejas do grupo comparativo.

SE TORNANDO "GOOGLE"

No capítulo 1, você percebeu que a simplicidade da Google está dominando o mercado. As pessoas são atraídas pela sua página livre de entulho. Enquanto YAHOO e MSN têm um espaço enorme com um menu cheio de opções, Google tem se mantido simples, e está dando certo.

Enquanto você lê isso, talvez imagine, por que as outras empresas de pesquisa não entram na justiça? Por que elas não aprendem com o sucesso da Google e escolhem cortar as formas de pesquisa de seus sites? Por que eles simplesmente não eliminam?

Eles não conseguem. Não conseguem deixar de ser pack rats.

Pelo menos é isso que a Google diz. Marissa Mayer supervisiona a página da Google. Ela é responsável por mantê-la simples. Ela diz que "depois que você montou uma página como a dos seus competidores, cortá-las como o Google é impossível. Você tem muitos acionistas que sentem que eles devem ser promovidos pela sua página".

Então, de acordo com Mayer, seria muito doloroso se tornar simples. As pessoas que pagaram para aparecer na página vão ficar chateadas. Se tornar Google seria interpessoal e historicamente desafiador. Se tornar Google causaria uma revolta, um motim. Ui!

Porque cremos que Deus é o provedor de todas as coisas, não cremos que seja impossível para uma igreja se tornar simples. Mas é difícil. Requer um foco absoluto no processo ministerial. O foco se traduz em abandonar as atividades que não se encaixam no processo.

Não é impossível porque os líderes de igreja foram chamados por Deus para serem bons mordomos, e Deus torna o impossível, possível. No fundo a eliminação é uma questão de ser um mordomo fiel.

MORDOMIA

Uma vez que eliminação é uma questão de mordomia, então é uma questão espiritual. A eliminação de atividades que não se encaixam no processo ministerial simples é escolher ser sábio com o tempo e os recursos que Deus deu. É importante para Deus, então deveria ser importante para nós.

Efésios 5.15-16 diz: "Tenham cuidado com a maneira como vocês vivem; que não seja como insensatos, mas como sábios, aproveitando ao máximo cada oportunidade, porque os dias são maus".

Neste versículo Paulo tinha duas palavras que ele poderia ter usado para "tempo": chronos e kairos. Chronos se refere ao tempo em geral. É o tempo do relógio e é a raiz da palavra cronologia. Kairos se refere a um tempo predeterminado, uma quantidade de tempo específico. Ele é medido, alocado e fixado.

Paulo usou kairos.

A escolha que ele fez é muito significativa. Em essência ele está dizendo que você tem um tempo específico aqui neste mundo. É isso aí! Já está determinado. O relógio está batendo. O seu tempo está correndo, inclusive agora.

Então aproveite da melhor forma possível. Não apenas gaste o seu tempo. Invista nele. Seja sábio com o tempo que Deus deu para você. Eliminando atividades de acordo com a direção de Deus, é escolher ser um mordomo sábio com o tempo e os recursos que ele lhe deu.

Seja sábio no uso do tempo. Manter atividades que não se encaixam no processo é um mau uso do tempo do seu povo. O tempo deles está sendo gasto participando de atividades que você identificou como estando fora do processo. Se a eliminação não acontecer, as pessoas vão gastar horas participando de atividades não essenciais ao processo ministerial de sua igreja.

Se essas atividades não essenciais permanecerem, o seu processo ministerial será diluído. Ele perde a sua força. Em vez de promover e discutir somente aquilo que é essencial ao seu processo, você se vê promovendo tudo. O resultado é que as pessoas ficam espalhadas entre uma miríade de atividades em vez de se comprometerem e focarem em apenas algumas.

O que é pior, as pessoas perdem o impacto das atividades essenciais para participarem das não essenciais. As pessoas na sua igreja têm apenas um determinado tempo disponível; elas não podem se dar ao luxo de participar de uma abundância de atividades semanais. Se elas são constantemente convidadas e desafiadas a participar dessas atividades não essenciais, elas perdem as essenciais que foram idealizadas especificamente para conduzir as pessoas através do processo de transformação.

Se recusar a eliminar é também uma má administração do tempo dos seus líderes. Em vez de serem capazes de focar em algumas coisas e fazê-las com excelência, eles lideram muitas atividades com mediocridade.

Nossa observação é que as Igrejas Simples demonstram um grau de excelência maior do que as Igrejas Complexas. Na maioria dos casos não é que falta compromisso com a excelência entre os líderes das Igrejas Complexas. Eles simplesmente não conseguem devido à grande quantidade de atividades que cuidam. O foco e a atenção deles estão muito espalhados. Estão divididos demais.

Seja sábio no cuidado com o dinheiro. Manter atividades que não estão dentro do processo também é um mau uso dos seus recursos. Dinheiro é gasto para sustentar atividades que não ajudam o processo. A maioria das pessoas não enxerga o quanto custa. O custo com pessoal e com o ministério propriamente dito é óbvio, mas os custos ocultos como material impresso e outras contas também existem.

E este dinheiro é importante. Não se esqueça: o dinheiro é dos dízimos e ofertas das pessoas. Em vez de investi-lo em atividades fora do processo, invista em atividades inseridas no processo ministerial. Essas atividades poderiam ser feitas com mais excelência, se você investisse nelas o dinheiro das atividades não essenciais. À medida que atividades são eliminadas, itens do seu orçamento também são, e essa eliminação significa mais recursos para as atividades essenciais.

UM ESTUDO DE CASO DA IGREJA DO ERIC

O ministério para as crianças bem novinhas tem um papel importantíssimo nos cultos de final de semana na Igreja de Cristo. Essas crianças são ensinadas e os pais ficam livres para participarem dos cultos sem distração. Para cumprir o seu papel aos finais de semana com excelência esse ministério com crianças bem novas teve que concentrar o foco. A eliminação era necessária.

Antigamente esse ministério oferecia uma atividade externa para as mães em duas manhãs por semana. Embora apreciassem bastante essa atividade, ela não era essencial ao processo ministerial. Esta atividade tomava um tempo enorme da equipe para que ela acontecesse. Em vez de recrutar e supervisionar os voluntários para as atividades de final de semana e do meio da semana, a equipe tinha que supervisionar essa atividade adicional.

A energia estava dividida e as atividades essenciais do processo estavam sofrendo. Várias vezes as famílias não ficavam para os cultos de final de semana porque não havia voluntários suficientes. Mesmo sem intenção a atividade semanal com as mães estava competindo com as atividades do final e do meio da semana.

Tinha que ser eliminado. Esta decisão era tanto histórica quanto interpessoalmente desafiadora.

As pessoas que ganhavam um dinheiro extra para olhar as crianças ficaram frustradas com a decisão, assim como as mães que gostavam da atividade. Não foi fácil. Algumas pessoas continuam não gostando do Eric. Quem pode condená-las?

Porém, a decisão tornou o ministério com as crianças bem pequenas mais eficiente. Estão melhores equipados e preparados para atender a mais crianças no final de semana porque a atenção deles está menos dividida. O tempo da equipe está mais focado; portanto o fator excelência cresceu. No final, os pais gostaram da melhora de qualidade no ministério aos finais de semana.

Talvez esteja na hora de dizer não para algumas atividades não essenciais. Elimine as atividades não essenciais e então limite o acréscimo de novas.

2: LIMITE O ACRÉSCIMO

Nossa pesquisa demonstra que para ser focado você precisa ter cuidado em não acrescentar atividades ao seu processo ministerial. Se você acrescentar vai tornar o processo mais longo e um número menor de pessoas será capaz de se conduzir nele. Essa será uma batalha permanente.

É assim na Google.

Muitas pessoas querem adicionar novos links à sua página. À medida que se desenvolve novos serviços para a Google, como os mapas, alertas, e trabalhos acadêmicos, há uma tremenda pressão para acrescentar links para esses serviços na página. Marissa Mayer, conhecida como a sumo sacerdotisa da simplicidade diz: "tenho que dizer não para muita gente". A pesquisa do Google diz que as pessoas só conseguem lembrar-se de sete a dez ofertas nos sites rivais, então eles oferecem seis links na página deles.

Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, sobre a relutância deles em acrescentar atividades ao processo ministerial. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Usamos as nossas atividades semanais já existentes para ênfases e iniciativas especiais em vez de adicionar novas atividades".

A porcentagem dos líderes de igrejas vibrantes (58%) que concordaram ou concordaram fortemente que a igreja deles usa as atividades já existentes para dar ênfases especiais em vez de acrescentar novas foi muito maior do que os das igrejas do grupo comparativo (22%). Em geral os líderes das igrejas vibrantes sempre hesitam na hora de acrescentar atividades. Ao contrário eles afunilam as necessidades e ênfases especiais através dos programas já existentes. Fazem isso porque veem tudo através do processo ministerial e não querem alterar isso.

Enquanto as igrejas do grupo comparativo estão centradas nas atividades, as igrejas vibrantes estão centradas no processo. As igrejas do grupo comparativo pensam sobre atividades, assim acrescentar uma nova atividade é básico. As igrejas vibrantes pensam sobre o processo, assim ser cético sobre uma atividade nova é básico. Acrescentar uma atividade colocaria em jogo o design do ministério deles.

A SOLUÇÃO

O que os líderes de igreja fazem quando Deus lhes coloca um peso sobre uma necessidade específica que precisa ser abordada? O que os líderes de igreja fazem quando Deus os leva a enfatizar algo para toda a igreja? Os líderes de Igrejas Simples tentam atender à nova necessidade através das atividades já existentes, enquanto os líderes de Igrejas Complexas acrescentam uma nova atividade. Os líderes de Igrejas Simples encaminham as necessidades especiais através das atividades que já estão no processo.

Por exemplo, se uma igreja decide enfatizar a mordomia, eles são confrontados com o dilema de quando oferecer os cursos sobre mordomia. Os líderes de Igrejas Complexas tendem a incluir um novo curso na agenda. Toda a igreja será desafiada a participar dessas aulas. Muitas dessas pessoas estão envolvidas em um grupo ou curso. Qual é a expectativa: que eles venham mais uma noite na semana para este novo curso, ou que deixem o grupo do qual eles já fazem parte? Embora a ênfase se inicie com intenções puras, resulta em confusão e peso para os membros da igreja.

Os líderes de Igrejas Simples abordam a ênfase em mordomia de forma diferente. Em vez de iniciarem uma atividade diferente, eles vão oferecer este curso através da estrutura dos grupos pequenos. É dada as pessoas a oportunidade de participar dos estudos sobre mordomia nos grupos já existentes, e as pessoas que não fazem parte de nenhum grupo são encorajadas a se juntarem a um deles. Não há nenhuma atividade nova, apenas um novo foco.

Através do encaminhamento da ênfase em mordomia nos pequenos grupos já existentes, as pessoas não só são expostas ao ensino sobre mordomia, mas elas também são conduzidas através do processo ministerial simples. As pessoas que ainda não se engajaram em um grupo são desafiadas a buscarem um dos novos grupos criados para estudar este tema. Como esses novos grupos são uma parte das atividades essenciais do processo, as pessoas são simultaneamente conduzidas através do processo.

A disciplina de usar as atividades já existentes permite aos líderes constantemente promoverem o processo e as atividades vinculadas a ele. Não se perde tempo divulgando atividades que estão fora do processo ministerial simples. Usar as atividades já existentes protege o processo de se tornar muito complexo. À medida que a complexidade do processo cresce, o número de pessoas capazes de progredir através do processo diminui.

Os líderes das Igrejas Simples perceberam que o "menos é mais".

MENOS É MAIS

Esta afirmação e conceito é um paradoxo, contra toda e qualquer intuição. Pense! Como menos pode ser mais? Mais deve ser mais porque mais significa "mais". A maioria dos líderes de igreja trabalha com o pressuposto de que mais é mais. Parece lógico pensar que mais atividades é igual a um impacto maior. Alguém poderia argumentar que a igreja que oferece mais atividades deveria ser mais eficaz.

Travis Bradshaw, da Universidade da Flórida, pensava assim. Ele pensava que mais seria mais. Aí ele desenvolveu um projeto de pesquisa sobre crescimento de igreja. Sua hipótese inicial era de que as igrejas que tinham mais atividades cresceriam mais que as igrejas que tinham menos. A sua pesquisa provou o contrário.

Na pesquisa de Bradshaw quanto mais atividades as igrejas tinham, menos elas cresciam. Ele classificou as igrejas em categorias baseadas no número de atividades que elas tinham. As igrejas que apresentaram a maior porcentagem de crescimento foram as igrejas que tinham menos atividades.

Menos realmente é mais!

Menos atividade significa maior foco nas atividades oferecidas. Menos atividades significa maior excelência. Menos atividades significa mais energia para cada uma. Menos atividades significa mais dinheiro disponível para cada uma. Uma menor atividade quer dizer mais pessoas participando das que são oferecidas. Menos atividades significa mais atenção das pessoas de sua igreja.

Menos atividades significa um impacto maior.

Embora estejamos sugerindo que você use as atividades já existentes, não estamos sugerindo que você nunca comece nada novo. O novo é ótimo. O novo cria nova energia. O novo chama atenção. O novo produz crescimento. O novo pode ser parte do menos. Há uma diferença-chave entre uma nova atividade e uma nova opção.

OPÇÕES, NÃO ATIVIDADES

Quando dizemos para limitar as inclusões, estamos nos referindo a novas atividades. Novas opções são necessárias, e novas opções não são novas atividades. Inclua novas opções e não novas atividades. Uma nova opção é uma expansão das suas atividades atuais e isso é uma grande diferença.

Você não pode perder essa distinção importante.

Acrescentar novos cultos ou novos locais de culto não é acrescentar nova atividade ao seu processo. Isso é uma expansão do seu processo. Isso é oferecer uma nova opção para as pessoas. Aumentar o número de grupos não é acrescentar uma nova atividade, é providenciar uma nova oportunidade para alguém se envolver com um grupo pequeno. Novos grupos pequenos ou classes de Escola Bíblica Dominical sob a mesma estrutura existente de grupos pequenos ou Escola Bíblica não é uma nova atividade; é uma nova opção. Você está convidando as pessoas para participarem de novas atividades ou está oferecendo novas opções? Oferecer novas oportunidades ajuda a envolver pessoas que não estão envolvidas. Também libera espaço, multiplica o ministério e provê energia. O novo tende a fazer isso.

Pense sobre isso na perspectiva das pessoas na sua igreja.

Se você disponibiliza outro horário de culto, espera que as pessoas que já estão envolvidas venham para outro culto? Se é isso, é uma nova atividade. Se não é isso, é uma nova opção. Se você abre novos grupos numa noite diferente, você espera que as pessoas que já estão envolvidas em um grupo participem desse novo grupo? Se sim, é uma nova atividade. Se não, então é uma nova opção.

Você deve estar preparado para dizer não ao acréscimo de atividades ao seu processo porque o seu foco ficará dividido. No entanto, você deveria ficar desejoso de acrescentar novas opções porque as novas opções ajudam a conduzir mais pessoas pelo processo ministerial simples.

Elimine, limite o acréscimo de atividades e reduza os eventos especiais.

3: REDUZA OS EVENTOS ESPECIAIS

Se existe um atleta conhecido pelo seu foco é Michael Jordan.

No último livro sobre Jordan, Driven from within, Fred Whitfield conta uma história fascinante sobre o foco de Jordan. Fred é um amigo de Jordan e uma noite Jordan e Fred iam sair. Michael Jordan perguntou a Fred se ele podia pegar uma jaqueta emprestada.

No armário de Fred havia dois tipos básicos de roupas: Nike e Puma. As roupas Nike eram por causa de seu relacionamento com Jordan, as roupas Puma por causa de seu relacionamento com Ralph Sampson. Os dois atletas tinham negócios bem lucrativos com as suas respectivas marcas: Jordan com a Nike e Sampson com a Puma.

Fred lembra que Jordan entrou na sala de visitas e jogou todas as roupas Puma no chão. Aí ele foi até a cozinha e pegou um facão de açougueiro e voltou para a sala. Então começou a destruir todas as roupas Puma com a faca. Ele literalmente as cortou em farrapos, pegou aqueles trapos e jogou tudo no lixo.

Jordan voltou e disse ao Fred: "não me deixe nunca vê-lo usando nada que não seja Nike. Você não pode andar na cerca".

Esse é um bom conselho.

Você não pode andar na cerca. Tem que estar focado. Depois que idealizou o seu processo ministerial simples, o foco de todas as suas atividades deveria ser na execução desse processo. Nossa pesquisa demonstra que você deve reduzir o número de eventos especiais que produz e promove como igreja.

Talvez esteja na hora de pegar a faca — falando figuradamente, é óbvio.

Perguntamos aos líderes, tanto das Igrejas vibrantes como das igrejas do grupo comparativo sobre o uso de eventos especiais e conferências. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Limitamos o número de conferências e eventos especiais que programamos como igreja".

Das igrejas vibrantes, 25% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 6% dos líderes das igrejas do grupo comparativo concordaram. A porcentagem dos líderes das igrejas vibrantes (57%) que concordaram ou concordaram fortemente que eles limitam o número de atividades foi muito maior do que os líderes das igrejas do grupo comparativo (38%).

Em geral as Igrejas Simples estão tão focadas no seu processo ministerial que existe pouco tempo para eventos extras. Eventos especiais acabam atrapalhando. Eles distraem.

Se os eventos especiais sempre são divulgados na igreja, as atividades essenciais que conduzem as pessoas pelo processo não são enfatizadas propriamente. E mais ainda, os eventos disputam o tempo das pessoas com as atividades essenciais.

Reduzir os eventos especiais é um desafio. Alguns eventos especiais podem ser benéficos para a igreja se forem usados estrategicamente. A seguir há três sugestões em relação a eventos especiais baseados na observação de Igrejas Simples.

CANALIZE OS EVENTOS NAS ATIVIDADES JÁ EXISTENTES

Muitas vezes um evento especial é planejado para atender a uma necessidade espiritual na vida das pessoas. E a solução apresentada para esta necessidade é um evento. Você já viu isso acontecer. Os eventos se tornaram uma forma dos líderes conduzirem rapidamente uma questão e com pouco comprometimento. Organizar um evento é bem mais fácil do que caminhar com as pessoas durante uma dificuldade.

Na maioria dos casos a necessidade pode ser suprida através das atividades já existentes em vez de um evento especial. E o ministério continua. É mais progressivo. Os eventos terminam quando se trancam as portas, e pronto!

Pense na consultoria com a Primeira Igreja e com a Igreja da Cruz (capítulo 2). As duas igrejas estavam preocupadas com os casamentos, e deveriam mesmo. As duas igrejas identificaram um currículo que elas acharam poderia impactar as famílias. Era o mesmo currículo.

A Primeira Igreja organizou uma conferência de dois dias na igreja. Eles investiram muito na promoção e tiveram um número pequeno de participantes. Ao mesmo tempo as atividades semanais deles não eram prioridade. Tudo girava em torno da conferência.

A Igreja da Cruz agiu diferente. Eles programaram vários grupos pequenos especiais de curto prazo dentro da estrutura de grupos já existente. O mesmo conteúdo foi oferecido em conjunto com o processo ministerial simples. As pessoas receberam o ensino e ao mesmo tempo foram conduzidas a uma atividade essencial dentro do processo.

Na Primeira Igreja, a conferência aconteceu e acabou. Na Igreja da Cruz os grupos pequenos tinham a opção de continuar. Os relacionamentos continuavam a ser desenvolvidos.

A mesma preocupação, o mesmo conteúdo. Uma abordagem diferente, um resultado diferente!

COMBINE O EVENTO COM UMA ATIVIDADE JÁ EXISTENTE

Em algumas situações combinar um evento especial com uma atividade já existente é mais eficiente. Atrelar um evento especial a uma atividade existente dá nova energia para a atividade. Em vez de promover e planejar o evento especial e a atividade existente separadamente, um complementa o outro. Eles são planejados e promovidos juntos.

Combinar um evento com uma atividade existente também foca a atenção na atividade essencial. Mais pessoas são convidadas e expostas à atividade essencial. Isso aumenta a possibilidade dessas pessoas voltarem. A seguir alguns exemplos de combinação que observamos.

O tradicional "almoço comunitário" é um exemplo clássico de atrelar um evento especial a uma atividade essencial. Em vez de fazer um evento especial para toda a igreja numa data específica como uma atividade isolada, o almoço comunitário é combinado com o culto. Tradicionalmente é um grande dia. As pessoas são convidadas a permanecerem na igreja depois do culto para o almoço, e durante este período relacionamentos são desenvolvidos.

Os Cultos de Natal estão sendo combinados com os cultos de final de semana para maximizar o potencial desse período de festas. Em vez de se ter um culto separado na véspera de Natal ou no dia de Natal, atrelando aos seus cultos regulares, as igrejas tem programado o mesmo Culto de Natal em vários dias diferentes. Fazendo assim, mais pessoas participam de um culto semelhante ao de final de semana. E mais, toda energia e propaganda foca nesse único culto que é apresentado várias vezes.

Os eventos para a juventude estão sendo combinados com as atividades para convidar novos jovens. Em vez de organizar um evento especial numa noite diferente, os ministérios de juventude combinam o evento com as atividades em que eles convidam novos jovens. A atenção e o trabalho estão focados na mesma atividade/evento e os novos jovens tendem a voltar porque experimentaram como é uma reunião semanal dos jovens.

As festas das crianças em muitas igrejas estão sendo combinadas com os cultos de sábado à noite. No final da festa as famílias são convidadas a ficar para o culto do sábado. A festa se torna claramente uma ponte para o culto, em vez de simplesmente um evento isolado num horário diferente.

USE O EVENTO ESPECIAL ESTRATEGICAMENTE

Se não der para incluir ou combinar um evento com as atividades já existentes, então ele precisa ser colocado estrategicamente dentro do processo simples. É necessário haver um "e agora?" no final de cada evento. O "e agora?" significa que as pessoas serão capazes de se envolver com alguma atividade essencial no final do evento. O evento deve ser usado para conduzir as pessoas para uma atividade essencial no processo.

Por exemplo, imagine que uma igreja promove uma conferência para pais. Eles decidem promover um "e agora?" no final da conferência. Eles se organizaram para oferecer novos grupos para pais que participaram. Antes de saírem do evento são encorajados a se inscrever num grupo. Ao mesmo tempo que você está eliminando, reduzindo e limitando atividades adicionais, precisa chamar atenção constantemente ao processo ministerial simples. Portanto, precisa ter certeza que o seu processo é facilmente comunicado e entendido.

4: FACILMENTE COMUNICADO

Colocar foco em uma igreja não é fácil. Uma tensão existe, uma tensão que precisa ser mantida em equilíbrio.

Por um lado, o processo simples será mais entendido à medida que você elimina, usa as atividades existentes e reduz os eventos especiais. À medida que promove essas coisas, as pessoas vão perceber que você está falando sério. Para algumas pessoas o processo não será entendido enquanto essas atitudes ousadas não forem tomadas. As atitudes ousadas vão chamar atenção, forçar a discussão e levar ao entendimento.

Por outro lado, o processo precisa ser entendido enquanto essas mudanças são feitas. Se os líderes-chave não entenderem o processo no meio das mudanças a divisão é certa. À medida que atividades são eliminadas e eventos especiais são reduzidos, você tem que levar as pessoas ao processo simples. Você tem que comunicar.

Num certo sentido o processo será melhor compreendido enquanto essas atitudes são implementadas. Em outro sentido o processo precisa ser entendido antes que essas atitudes sejam tomadas. Como líder da igreja você terá que lidar com essa tensão.

Já que este entendimento é tão crucial, você precisa estar bem confortável na articulação do seu processo. À medida que elimina e reduz os eventos especiais, você terá que constantemente comunicar o processo ministerial simples. Para manter a igreja focada você terá que sempre lembrar as pessoas.

De acordo com a nossa pesquisa, é vital que o seu processo seja facilmente comunicado.

Você tem que se sentir bem quando fala dele. Tem que ser capaz de pregar sobre ele com convicção. O processo tem que ser parte de quem você é. Se o processo ministerial não for simples de ser explicado, ele não será entendido.

Pedimos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, para avaliar quão facilmente explicavam o processo ministerial deles. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Nosso processo é fácil de comunicar".

Das igrejas vibrantes, 56% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 24% dos líderes das igrejas do grupo comparativo. Os líderes das igrejas vibrantes que concordaram ou concordaram fortemente que o processo deles é fácil de comunicar, foi duas vezes mais do que os líderes das igrejas do grupo comparativo.

Os líderes das Igrejas Simples são capazes de articular o seu processo enquanto os líderes das Igrejas Complexas têm dificuldade de fazê-lo. Se você quer que as pessoas entendam porque está tão empolgado com o seu processo ministerial, precisa ser capaz de comunicá-lo com facilidade. Se deseja que as pessoas concordem com o foco único de sua igreja, o seu processo precisa ser facilmente articulado.

5: SIMPLES DE ENTENDER

De acordo com os nossos dados o seu processo precisa ser simples de entender. O seu processo precisa não apenas ser simples do seu lado da equação da comunicação, mas também precisa ser simples para o ouvinte captar. As pessoas são incapazes de focar em algo que elas não entendem. Entendimento leva ao foco e ao compromisso.

As pessoas numa igreja são capazes de caminhar no processo da transformação espiritual quando elas verdadeiramente o entendem. Então como um líder de igreja você precisa garantir que o seu processo pode ficar na mente do seu povo. As pessoas precisam ser capazes de acenar com a cabeça quando elas ouvirem o processo.

É vital que o seu processo seja entendido porque você vai dizer não para todas as outras coisas. Um "não" é mais fácil de ser aceito quando a explicação é clara. Se as pessoas entendem o seu compromisso com o processo simples, elas estarão mais propensas a aceitar as decisões que seguem esse foco.

Perguntamos aos líderes, tanto das igrejas vibrantes como das igrejas do grupo comparativo, para avaliarem quão simples era para as pessoas entenderem o processo ministerial deles. Pedimos para declararem o nível de concordância deles com a seguinte afirmação: "Tornamos o nosso processo simples e fácil de entender".

Das igrejas vibrantes, 50% dos líderes concordaram ou concordaram fortemente com a afirmação, contra 24% dos líderes das igrejas do grupo comparativo. Os líderes das igrejas vibrantes que concordaram ou concordaram fortemente que tornaram o processo deles fácil de entender foram duas vezes maior do que os líderes das igrejas do grupo comparativo.

Os líderes de Igrejas Simples garantem que as pessoas na igreja podem entender o processo. Tornar o seu processo compreensível requer uma linguagem simples e breve.

Escolha uma linguagem simples. Qualquer palavra que tenha que ser analisada ou explicada não deve ser usada para descrever o seu processo. A descrição do seu processo precisa ser fácil de entender. Escolha cuidadosamente as palavras e frases.

Seja breve. A quantidade de informação que as pessoas estão expostas hoje é assustadora e está aumentando. Foi estimado que o mundo produziu cinco exabytes de informação em 2002 (o equivalente a 100 quatrilhões de palavras - NR). Essa é a mesma quantidade de informação produzida desde o começo dos tempos até o ano 2000.

É óbvio que a maior parte da informação apresentada às pessoas não fica. Estamos sobrecarregados de informação. Então, tenha certeza que a descrição do seu processo ministerial seja simples. Os folders e todo material escrito sobre o processo deve ser curto, pressupondo que você queira que as pessoas leiam. Se forem necessárias muitas folhas para explicar seu processo, volte para a mesa de planejamento.

Elimine, reduza, limite inclusões. Tudo vai levar a um foco maior. No meio desse caminho de focar, o seu processo precisa ser comunicado e entendido.

As Igrejas Simples são focadas. Elas dizem não a quase tudo.

Como as grandes organizações.

FOCO E GRANDEZA

Grandes organizações são focadas. Elas são boas em dizer não.

Apple, a idealizadora e produtora do iPod, iMac, iPhone e iPad, é excelente na simplicidade porque ela é superfocada. Steve Jobs, o líder da organização, diz que tem "tanto orgulho das coisas que eles não fizeram como tem das que eles fizeram".

Você pegou isso?

Ele está empolgado que a Apple disse não. Ela colheu grandes benefícios.

Procter & Gamble é a maior fabricante de produtos para o lar nos Estados Unidos. No final dos anos de 1990 a P&G se comprometeu com a simplicidade. Eles sentiram que tinham se tornado muito complexos. Decidiram eliminar e agilizar. Entre 1986 e 1988 apenas, eliminaram o número de produtos em 20%. Venderam algumas linhas de produtos a outras companhias e simplesmente enterraram outras.

Eles começaram a dizer muitos nãos. E alcançaram mais com menos. Todos sabiam que eliminando produtos reduziriam os custos, mas isso também reforçou as vendas. O preço das ações subiu cinco pontos. Reduzir a aglomeração produziu grandes resultados.

Quando Jack Welch se tornou o principal executivo da General Eletric ele fez uma declaração ousada. A GE seria a número um ou número dois em todos os mercados, ou eles eliminariam aquela parte do negócio. Eles focariam somente onde pudessem ser os melhores. Eles diriam não para todo o resto.

Assim como grandes organizações, Igrejas Simples são focadas. Elas dizem não.

Você está pronto a dizer não?

Está disposto a ficar focado no processo ministerial simples?$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Quais atividades não são essenciais em nosso processo ministerial?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$O que nos impede de eliminar?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Como podemos mudar a nossa abordagem dos eventos especiais?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Por que é difícil dizer não no ministério?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$A maioria do nosso povo vai entender nosso processo ministerial antes do foco acontecer, enquanto o foco está acontecendo, ou depois que o foco já se estabeleceu?$p$, 'reflexao', null),
    (v_aula_id, 6, $p$O que Deus está falando comigo como mordomo do tempo e do dinheiro das pessoas?$p$, 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 9 — Tornando-se simples  (aula ordem = 10)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 10;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      $t$Capítulo 9 — Tornando-se simples$t$,
      10,
$conteudo$
Just Do It (Simplesmentefaça)
                                 -   Nike

             Clareza ^ Movimento            Alinhamento   Foco

   Há uma cena no filme Super-Size Me que é perturbadora. Estamos
falando da cena em que Morgan Spurlock, o produtor, vomita no
chão. Ok, isso é desagradável, mas estamos nos referindo a uma cena
diferente.
   Nesta cena, Morgan Spurlock está tentando provar quão efetivamente o McDonald s impacta as futuras gerações. Então ele se encontra
com crianças em idade escolar e mostra para elas fotografias de pessoas
famosas. A maioria das crianças reconheceu a foto de George Washington. Todas reconheceram a foto de Ronald McDonald. Nenhuma delas
reconheceu uma foto comum de Jesus Cristo.
   Não! Nenhuma!
   Sim, nós sabemos que a foto provavelmente não é confiável, mas

você entendeu o ponto. A maioria das crianças na América está crescendo sem nenhum conhecimento de Jesus. Estamos vivendo numa
cultura pós-cristá. Para as futuras gerações Cristo não é mais o ponto
de partida. As crianças e adolescentes não se rebelam mais contra os
padrões. Hoje não há mais padrões.
   Há quase dez anos atrás Thom previu que isso iria acontecer. Em
seu livro, The Bridger Generation , ele apresentou uma pesquisa na qual
somente 4% das próximas gerações se tornariam cristãos. É triste mas
estamos vivendo a realidade aquela previsão.'
   O McDonalds está influenciando as futuras gerações, as igrejas não.
   Enquanto o impacto do McDonalds está se espalhando, o impacto
da igreja está encolhendo. Na verdade, a maioria das igrejas está espiritualmente estagnada e diminuindo numericamente. E esse declínio
acontece durante um aumento da população.
   A igreja, como um todo, está fazendo cada vez mais. Mas essa mesma igreja, como um todo, está fazendo cada vez menos diferença.
   A complexidade da igreja está saindo muito caro. Este custo vai
além do tempo e dinheiro. O Reino não está expandindo. Vidas não
estão sendo mudadas. A transformação não está acontecendo. As igrejas
não estão crescendo.
   A mudança para o simples tem que acontecer. É hora de agir, para
o bem do Reino, da igreja, e das pessoas a quem você serve. Em muitas
igrejas tem havido muita conversa. Novas declarações disfarçam o mesmo comportamento e os mesmos paradigmas. Novas estratégias escondem a complexidade. Na maioria das igrejas nada realmente muda.
   O Reino não é conversa. O Reino tem a ver com ação. Nike tem
uma grande teologia. É hora de simplesmente fazer. E hora de recusarse a ser um criador de atividades. É hora de idealizar e implementar um
processo simples que conduza as pessoas à transformação espiritual.

   É hora de mudar. A alternativa é continuar a liderar igrejas que estão
morrendo, cheias de pessoas espiritualmente anêmicas.
   Mude ou morra! Essas são as escolhas.

   Mude ou morra
   Um estudo médico recente revelou como a mudança é difícil para
as pessoas. Nos Estados Unidos cerca de 600 mil pessoas por ano fazem
ponte de safena. E dito para essas pessoas, depois da cirurgia, que elas
precisam mudar o seu estilo de vida. A ponte é uma solução temporária. Elas precisam mudar a sua alimentação. Precisam parar de fumar e
beber. Precisam se exercitar e reduzir o estresse.
   No fundo, o que o médico diz é: “mude ou morra”.
   Você pensaria que a experiência de chegar perto da morte captaria a
atenção dos pacientes. Pensaria que eles votariam pela mudança. Imaginaria que o argumento a favor da mudança é tão convincente que os
pacientes fariam as mudanças apropriadas em seu estilo de vida. Infelizmente este não é o caso.
   Noventa por cento dos pacientes cardíacos não mudam. Eles continuam os mesmos, vivendo da mesma forma. Um estudo após o outro
indica que dois anos após a cirurgia de coração os pacientes não mudaram seu comportamento. Em vez de fazerem as mudanças para vida,
eles escolhem a morte.^
   Mudar é realmente difícil. A maioria dos pacientes do coração escolhe não mudar. Eles agem como se preferissem morrer. Da mesma
forma a maioria das igrejas escolhe não mudar. Elas preferem morrer.
É trágico, mas para a maioria das igrejas a dor da mudança é maior do
que a dor da ineficiência.
   Embora a mudança para a abordagem “Igreja Simples” tenha que
acontecer, a transição não será fácil. Afinal, é uma mudança. Se tornar

uma igreja simples é difícil. Aliás, quanto mais tempo a sua igreja é
complexa, mais difícil será a transição.
   Atenção plantadores de igreja: essa informação é uma boa notícia
para você. Enquanto você não tem muito dinheiro, não possui propriedades, você será capaz de planejar do zero.
   Líderes de igrejas congestionadas não podem se dar a esse luxo. Deixar de ser um pack rat será extremamente desafiador. Descongestionar
será mais dolorido do que se desfazer de suas coisas. O especialista em
liderança. Tom Peters, uma vez comentou: “é mais fácil matar uma
organização do que mudá-la”. ^
   Por favor, não pegue o caminho mais simples. Não mate a sua igreja.
Você já viu isso acontecer. É horrível. Não trate o processo de mudança
para o simples como uma reestruturação corporativa ou desvalorizando
a iniciativa. A igreja é um corpo de crentes, cheia de pessoas reais.
   Há uma tensão aqui, não há?
   Por um lado você deve mudar para o simples o mais rápido possível. Tanta coisa depende disso. Quanto mais tempo se é complexo,
mais tempo o seu foco está dividido. Se permanecer complexo o seu
processo de transformação permanecerá obscuro. Quanto mais tempo
você é complexo, mais a sua igreja será congestionada. As pessoas
permanecem as mesmas, sem mudança. E isso lhe incomoda. Pelo
menos deveria.
   Por outro lado, precisa se tornar simples devagar. Você tem o coração de pastor e se importa com as pessoas da sua igreja. Tornar-se
simples será dolorido para algumas pessoas. Elas não podem imaginar
perder certas tradições e atividades.
   Assim, essa tensão existe. Você deseja que as coisas mudem para o
bem do Reino e das pessoas em sua comunidade que ainda não foram
transformadas. Ao mesmo tempo deseja levar as pessoas que já estão
com você. Como resolver essa tensão?

   Os teóricos da mudança discordam sobre como lidar com esta tensão. Alguns teóricos defendem que a mudança deve acontecer de uma
vez. Essas pessoas insistem que é menos doloroso cortar logo o braço
todo do que cortá-lo por partes. Aconselham a atrelar as mudanças a
uma visão abrangente e ir em frente. Acreditam que mudanças grandes e abrangentes produzem resultados rápidos que, no final, validam
a mudança.
   Outros teóricos balançam a cabeça discordando desse conselho.
Acreditam que a mudança tem que ser gradual, metódica e lenta. Esses
teóricos insistem que o objetivo da mudança é a transformação e não
a destruição. Acreditam que ao implementar as mudanças devagar há
oportunidade para as pessoas se adaptarem e crescerem. Defendem que
a mudança gradual é sábia porque cada mudança edifica uma cultura
onde mais mudanças podem acontecer.
   Qual deles está certo? As duas abordagens sobre mudança têm obtido sucesso. E ambas as abordagens já falharam. Você terá que viver com
a tensão. Uma mudança agora ou depois, rápida ou devagar, abrangente ou gradual.
   Boa notícia. Você tem o Espírito Santo. Ore pedindo discernimento. Permita a Deus lhe dar sabedoria e derramar a sua graça.
Entre no tempo de Deus. Caminhe na direção do simples de acordo
com a direção de Deus. Use a sabedoria e a compaixão enquanto você
se torna simples.
   O ponto-chave é o seguinte: se torne simples o mais rápido possível,
mas não mais rápido do que isso.

   De volta ao pastor Rush
   Faz três meses que o pastor Rush teve aquele momento, ao mesmo
tempo sagtado e amedrontador, em seu escritório. Foi um momento

paradoxal, doce e amargo. Doce porque ele sentiu uma nova direção e
amargo porque ele sabia que a mudança era iminente.
   Foi o momento em que ele olhou para a abundância de modelos
de igrejas em sua estante e percebeu que tudo estava misturado como
numa tigela espiritual de sobras. Ele percebeu que, no meio de tanta
atividade, não estava claro para sua igreja o ""comd\ Na igreja que o
pastor Rush serve não há um processo para conduzir as pessoas à maturidade espiritual.
   O seu momento foi rapidamente interrompido. O telefone tocou
e a reflexão foi suspensa. Mas o desconforto continuou. Nos últimos
meses, o pastor Rush avaliou seriamente a sua igreja como não fazia há
anos. Andou por toda parte. Ele olhou e fez perguntas.
   A medida que o pastor Rush andou, ele percebeu que as coisas eram
mal feitas. Embora houvesse muitas atividades, faltava excelência. Há
tanta coisa acontecendo, tanta coisa para gerenciar, tantas atividades para
organizar. A atenção, a energia, os recursos e as pessoas estão divididas.
   Geralmente a complexidade é sinônimo de mediocridade.
   Em sua devocional pessoal o pastor Rush tem lido a segunda metade do Antigo Testamento. Já faz anos que ele leu e estudou os profetas
menores, aqueles livros pequenos que vem antes de começar o Novo
Testamento. Deus usou o primeiro capítulo do livro de Malaquias para
confirmar que a mudança não era uma opção. O pastor Rush tem lutado com Malaquias 1. Cada vez que ele lê, vê a si mesmo e outras
pessoas de sua igreja. O seu coração está tomado por um sentimento
de condenação.

   Malaquias 1
   Em Malaquias 1 Deus confronta os líderes e os sacerdotes. Os sacerdotes estavam oferecendo as sobras como sacrifício a Deus. Ninguém
gosra de sobras. Deus também não.

“O fiJho honra seu pai, e o servo, o seu senhor. Se eu sou
pai, onde está a honra que me é devida? Se eu sou senhor,
onde está o temor que me devem?”, pergunta o Senhor dos
Exércitos a vocês, sacerdotes. “São vocês que desprezam o
meu nome!
“Mas vocês perguntam: ‘De que maneira temos desprezado
o teu nome?’
“Trazendo comida impura ao meu altar!
“E mesmo assim ainda perguntam: ‘De que maneira te
desonramos?’
“Ao dizerem que a mesa do Senhor é desprezível.
“Na hora de trazerem animais cegos para sacrificar, vocês
não veem mal algum. Na hora de trazerem animais aleijados
e doentes como oferta, também não veem mal algum.
Tentem oferecê-los de presente ao governador! Será que ele
se agradará de vocês? Será que os atenderá?”, pergunta o
Senhor dos Exércitos.
“E agora, sacerdotes, tentem apaziguar Deus para que tenha
compaixão de nós! Será que com esse tipo de oferta ele os
atenderá?” - pergunta o Senhor dos Exércitos.
“Ah, se um de vocês fechasse as portas do templo! Assim ao
menos não acenderiam o fogo do meu altar inutilmente.
Não tenho ptazer em vocês ”, diz o Senhor dos Exércitos,
“e não aceitarei as suas ofertas. Pois do oriente ao ocidente,
grande é o meu nome entre as nações. Em toda parte
incenso é queimado e ofertas puras são trazidas ao meu
nome, porque grande é o meu nome entre as nações”, diz o
Senhor dos Exércitos.
“Mas vocês o profanam ao dizerem que a mesa do Senhor
é imunda e que a sua comida é desprezível. E ainda dizem:
‘Que canseira!’ e riem dela com desprezo” , diz o Senhor
dos Exércitos.
“Quando vocês trazem animais roubados, aleijados e doentes e os oferecem em sacrifício, deveria eu aceitá-los de suas
mãos?”, pergunta o Senhor.

           “Maldito seja o enganador que, tendo no rebanho um macho
           sem defeito, promete oferecê-lo e depois sacrifica para mim
           um animal defeituoso”, diz o Senhor dos Exércitos; “pois eu
           sou um grande rei, e o meu nome é temido entre as nações.”
           (Malaquias 1.6-14).

   Os sacerdotes tinham instruções específicas sobre que tipo de sacrifícios eles deveriam oferecer a Deus. De acordo com Levítico 22, eles
deveríam trazer para o sacrifício apenas os animais puros e sem defeito.
Eles tinham que trazer o melhor para Deus.
   Mas os sacerdotes estavam dedicando a Deus, seu Mestre e Pai, os
piores animais como oferta. Isso é uma oferta inaceitável a Deus. Ele
então os lembra quem ele é. Sete vezes nesse texto. Deus se refere a si
mesmo como “SEN H O R DOS EXÉRCITOS”, o Senhor Todo-poderoso. Ele merece, deseja, e demanda o melhor.
   Aquelas pessoas se esqueceram disso. Elas na verdade tiveram a audácia de oferecer a Deus animais cegos e doentes. Deus diz aos sacerdotes para tentarem oferecer este tipo de sacrifício ao governador.
   Deus inclusive manda os sacerdotes fecharem o templo, baixarem
as portas e cancelarem os cultos, simplesmente parar tudo. Deus nunca
se impressionou com um culto sofrível. A mediocridade é abominável
para Deus.
   Ele diz para os sacerdotes que não vai aceitar nenhuma oferra da
mão deles. Essencialmente Deus está dizendo; “se eu não posso ter o
seu melhor, o melhor de você, por favor não me traga nada”. De acordo
com o sistema de Deus, alguma coisa não é melhor do que nada.
   As pessoas em Malaquias estavam ocupadas. Elas continuavam a
seguir todos os rituais do culto a Deus. Continuavam indo à igreja
toda semana sem empolgação ou intenção. Estavam apenas cumprindo os rituais.

   Lembre-se, estes eram os sacerdotes. Os sacerdotes não desafiaram
as pessoas a um padrão mais alto. Na mente deles tudo estaria bem
desde que os sacrifícios fossem oferecidos. Desde que cumprissem o “o
que\ Tudo estava certo.
   Deus estava preocupado com o ^'como". Para Deus é profundamente importante “como' os sacrifícios lhes são oferecidos. Para Deus é
profundamente importante “como” os sacerdotes o serviam. E aquilo
profanava o nome de Deus.
   A mediocridade incomoda a Deus porque viola a sua natureza e
comportamento. Deus é um Deus de excelência. O seu caráter é sem
falhas. A excelência flui da natureza de quem Deus é. Tudo que Deus
fez sempre foi com excelência. A criação, o pôr-do-sol, o oceano e a sua
ressurreição apontam para sua natureza de excelência.
   Os líderes ofereceram uma resposta inadequada à ação de Deus. Em
vez de refletirem o seu atributo de excelência para o mundo, apresentaram a mediocridade. Deus estava frustrado com os líderes porque são
eles que determinam o passo e o tom. O povo busca as dicas neles. Se
os sacerdotes ofereceram algo de segunda classe para Deus, o povo faria
o mesmo.
   Muitas questões vieram todas de uma vez à mente do pastor Rush.
As pessoas não estão sendo transformadas em sua igreja porque não há
um processo simples. Tudo é muito complexo, muito congestionado. E
esse congestionamento incentiva a mediocridade. É impossível se oferecer excelência quando o foco está tão dividido. Aparentemente as pessoas cumprem os rituais, mas enquanto isso, ninguém é transformado.
   Mais importante, o pastor Rush sente que Deus não está satisfeito.
Ele e sua equipe estão cuidando de atividades medíocres em vez de
fazerem discípulos. O pastor Rush decidiu que uma mudança tem que
acontecet. Ou ele vai morrer internamente. A dor da mediocridade e
ineficiência se tornou grande demais.

   Como líder sabe que a mudança tem que começar com ele.
   Talvez você esteja onde pastor Rush está. Não deseja passar o resto da
sua vida tocando atividades medíocres. Não quer simplesmente cumprir os rituais do ministério sem um claro processo de transformação.
Talvez o congestionamento e a complexidade se tornaram insuportáveis. O chamado de Deus para você não mudou. O chamado permanece, mas você sabe que há uma maneira melhor de desenvolver
o ministério.
   Você não está sozinho.
   Centenas de líderes de igreja compartilharam conosco essa mesma
frustração. Essa é a razão deste livro. Nós oramos para que ele tenha lhe
dado uma estrutura para um processo ministerial simples.
   Concluímos com quatro passos para se tornar uma Igreja Simples.
Esses passos resumem muito do livro e preparam a transição para você.
   Para alguns, esses passos levarão poucos meses. Para outros, alguns
anos. Lembre-se, quanto mais tempo a sua igreja tem sido complexa,
mas difícil será a transição.

   Passo 1: Idealize um processo simples (clareza)
   Você primeiro precisa idealizar o processo ministerial simples para
sua igreja —no papel. Esse projeto não é sobre a mudança de nenhuma
atividade ou estrutura. Não ainda. Durante este passo você vai simplesmente explorar como pode ser o processo de discipulado em sua igreja.
O processo precisa estar primeiro em sua cabeça e coração antes de se
tornar uma realidade.
   Use esse passo para criar um ambiente receptivo à mudança. Deixe
as pessoas saberem que não há um processo e que discípulos não estão
sendo formados intencionalmente. Compartilhe que o discipulado, se
acontece, simplesmente acontece por acidente. A conversa pode ser

desconfortável se você tem sido líder na igreja por um longo tempo.
Mas precisa causar algum desconforto para que as pessoas se tornem
abertas a mudanças.
   Não cometa o erro de começar com atividades empolgantes. Comece com uma folha de papel branca. Não tente encaixar o seu processo nas suas atividades. Permita que o processo simples que Deus
der a você seja o ponto de partida. Invista uma quantidade de tempo
significativo com as Escrituras e em oração. Leia sobre discipulado.
Permita que Deus sopre em você com que deve se parecer um discípulo em sua igreja. Envolva outros na discussão. Reúna-se com membros da equipe e líderes-chave que sejam maduros espiritualmente e
promova discussões abertas sobre que tipo de discípulos Deus está
chamando vocês a fazerem.
   Depois que gastou esse tempo com Deus e com os outros, reduza
a sua definição de discipulado em poucos pontos. Depois de investir
o tempo apropriado você deve ser capaz de preencher os espaços da
declaração a seguir: “Discípulos em nossa igreja são:

                                                    e.

   Você talvez tenha menos espaços brancos, ou talvez tenha mais. Porém, menos é melhor. Quantos mais brancos você tiver mais longo será
o seu processo.
   A esta altura não há nenhuma razão para ficar nervoso. Você ainda não implementou nenhuma mudança. Ainda não cortou nenhuma
atividade ou evento. Está simplesmente discutindo com que deve se parecer o discipulado.
   Agora é hora de discutir como isso acontece.
   Depois que você escolheu alguns aspectos-chave do discipulado,
organize-os em uma ordem sequencial. Discuta com os outros como as

pessoas devem progredir através dos aspectos de discipulado que vocês
listaram. Conversem sobre como a transformação espiritual acontece.
Compartilhe como o crescimento espiritual aconteceu em sua vida e na
vida de outros que conhece. O processo tem que ser pessoal.
   Organize os aspectos do discipulado numa ordem baseada na diferença dos níveis de comprometimento. Lembre-se, o processo tem que
ser claramente definido. E preciso haver um ponto de partida e um
próximo passo. O primeiro passo no processo deve ser o primeiro nível
de compromisso.
   Descreva a sua definição de discipulado em termos de processo. A
esta altura você deve ser capaz de preencher os espaços em branco da
declaração a seguir: As pessoas se tornam discípulos maduros em nossa
igreja através

   O número de termos e os próprios termos devem ser os mesmos
que foram colocados nos espaços em branco anteriores. Agora eles estão
numa ordem sequencial.
   Gaste tempo discutindo e pregando sobre o processo. Quanto mais
claro esse processo para transformação espiritual for para as pessoas da
sua igreja, mais fáceis serão os próximos passos da mudança.

   Passo 2: Organize as suas atividades-chave em torno do
processo (movimento)
   Depois que você idealizou um processo no papel é hora de implementar. Uma coisa é escrever um processo simples, outra coisa completamenre diferente é organizar as atividades de acordo com o processo.
Esse é o ponto onde a transição fica mais difícil. Na verdade, cada passo
daqui para frente vai ficando mais desafiador.

   Escolha uma atividade que abranja toda a igreja para cada fase do
processo. O propósito da atividade deve coincidir com aquela parte específica do processo. Você deverá ter algumas atividades que ficarão de
fora. Isso significa que elas não se encaixam no processo. A esta altura a
complexidade fica óbvia. Não sinta que tem de eliminar essas atividades
imediatamente. Dê tempo e caminhe pela transição conforme Deus o
leva. Eliminação é parte do último passo.
   A esta altura você ainda não se livrou de nada. Porém, talvez tenha que mudar o foco de algumas de suas atividades. Você vai querer
garantir que cada atividade no processo seja idealizada para atender
eficazmente a uma necessidade específica do discipulado. Aqui é que a
resistência à mudança acontece. Quando você mexe em uma atividade
está mexendo com a tradição.
   A primeira atividade é a porta de entrada no processo. As atividades seguintes devem requeter um grau de comprometimento
maior. Lembre-se, você quer conduzir as pessoas a um nível maior
de vitalidade espiritual. Quer ser capaz de conduzir as pessoas pelo
processo simples.
   Ao terminar esse passo você deve ser capaz de preencher os seguintes espaços;
   ______________ (atividade)        _______________(atividade)
   ______________ (atividade)        _______________(atividade)

   Passo 3: Reúna todos os ministérios em torno do processo
(alinhamento)
   Depois que seguiu os passos 1 e 2, você terá um processo simples
com atividades estrategicamente organizadas. Agora você precisa alinhar cada ministério em torno do mesmo processo. Se cada ministério
por idade específica usar as mesmas palavras para descrever o processo,
as pessoas na igreja vão entendê-lo mais rápido.

   Quanto maior o número de líderes você envolver na idealização do
processo, mais fácil será uni-los em torno dele. Se eles participam das
discussões você simplesmente estará pedindo para eles colocarem em
prática o que todos concordaram.
   Quando novos líderes forem escolhidos ou contratados tenha certeza de que eles acreditam de todo coração no processo simples de vocês.
Quando novos ministérios começarem, garanta que entendem como se
encaixam no processo geral.

   Passo 4: Comece a eliminar coisas que não estão no
processo (foco)
   Certo, aqui é onde a mudança é REALMENTE sentida. Por favor,
perceba que esta é a única vez no livro inteiro que nós usamos letras
maiusculas para enfatizar um ponto.
   A maioria das pessoas ficará grata que um processo de discipulado
é desenvolvido em sua igreja. A maioria das pessoas vai gostar que as
atividades tenham um propósito e que elas façam parte de um processo maior. E a maioria das pessoas também vai gostar da unidade
de todos os ministérios caminhando na mesma direção. As coisas na
sua igreja serão claras e mais focadas. Lembre que as pessoas apreciam
a simplicidade.
   No entanto, algumas pessoas vão ter dificuldade em abandonar outras
atividades para focar somente no processo ministerial que Deus deu à sua
igreja. Algumas atividades terão tradições profundas e uma história rica.
Você precisa usar a sabedoria nesse quarto passo.
   Se constantemente discutir o processo e as atividades usadas para conduzir as pessoas pelo processo, alguns vão começar a se perguntar como que
outras atividades se encaixam. Alguns vão até lhe fazer esta pergunta. É um
momento esquisito, mas é uma grande oportunidade para discutir.

   No tempo certo será importante eliminar atividades e eventos que
não se encaixam. Eles são uma distração em relação ao processo, e impedem sua igreja de desfrutar dos benefícios de uma Igreja Simples.
   Para se tornar uma Igreja Simples é preciso implementar um processo
que seja claro e conduza as pessoas. Precisa insistir que todos os ministérios se alinhem ao processo, e você precisa se recusar a permitir que ele se
torne congestionado. Tem que se manter focado.
   Embora se tornar simples seja difícil, é também recompensador. As
portas do inferno serão empurradas, amassadas e estragadas. As próximas gerações serão expostas ao evangelho e à bondade do nosso Deus.
E as pessoas da sua igreja serão colocadas no caminho do poder transformador de Deus.
   Simples. E tão convincente.
   A revolução da Igreja Simples já começou.
   Você está dentro?
$conteudo$
    )
    returning id into v_aula_id;
  end if;

  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, $p$Qual é a relação entre complexidade e mediocridade?$p$, 'reflexao', null),
    (v_aula_id, 2, $p$Quão complexos nós somos?$p$, 'reflexao', null),
    (v_aula_id, 3, $p$Quão receptivos a mudanças são os nossos líderes?$p$, 'reflexao', null),
    (v_aula_id, 4, $p$Quão receptiva a mudanças é a sua igreja como um todo?$p$, 'reflexao', null),
    (v_aula_id, 5, $p$Quanto tempo você acha que cada passo de transição vai demorar em sua igreja?$p$, 'reflexao', null);
  end if;

end;
$migration$;
