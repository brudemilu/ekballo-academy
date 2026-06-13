-- =============================================================
-- Curso: Autoridade Espiritual (Watchman Nee)
-- CAPÍTULOS 14, 15 e 16
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
  -- Capítulo 14 — O caráter da autoridade delegada: Benevolência
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 14;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 14 — O caráter da autoridade delegada: Benevolência', 14,
$conteudo$A PRIMEIRA REAÇÃO DE MOISÉS PARA COM A REBELIÃO: PROSTROU-SE

Não houve nenhuma rebelião, da parte dos israelitas, mais séria do que a registrada em Números, capítulo 16. O líder da rebelião foi Coré, filho de Levi, com Datã e Abirão, filhos de Rúben, apoiados por duzentos e cinquenta líderes da congregação. Reuniram-se e, com palavras fortes, atacaram Moisés e Arão. A calúnia de Números 12 foi apenas da parte de Arão e Miriã, e ainda assim foi mais oculta. Mas aqui a rebelião foi coletiva e o ataque contra Moisés e Arão foi franco e direto.

A primeira reação de Moisés foi esta: "caiu sobre o seu rosto." Esta é a atitude exata que todo servo de Deus deveria ter. O povo estava nervoso e muitos falavam, mas só Moisés se prostrou ao chão. Sendo verdadeiramente dócil, não tinha nenhum sentimento pessoal. Nem se defendeu nem ficou irritado. Não foi necessário lutar. Moisés não se atreveu a dizer algo de si mesmo, porque sabia que o Senhor mostraria quem era dele. Seria melhor permitir que Deus fizesse a distinção. Moisés tinha fé e assim atreveu-se a confiar tudo a Deus.

EXORTAÇÃO E RESTAURAÇÃO

Moisés exortou a Coré com palavras para restaurá-lo. Ele sabia a seriedade do assunto e realmente estava preocupado com os rebeldes. Exortação não é uma expressão de senhorio; antes, exibe mansidão. Aquele que persuade diante de ataques é verdadeiramente uma pessoa mansa. Mas aquele que permite que as pessoas permaneçam no erro, sem nenhuma intenção de restaurá-las, mostra que tem um coração duro. Moisés estava pronto a exortá-los quando atacado e, então, deu aos seus caluniadores toda uma noite para que se arrependessem. Na atitude de Moisés vemos que aqueles que representam autoridade procuram a restauração, não a divisão, mesmo depois de serem rejeitados.

NENHUM ESPÍRITO DE JULGAMENTO

Enquanto Deus se preparava para julgar os rebeldes, Moisés declarou: "O Senhor me enviou a realizar todas estas obras, que não procedem de mim mesmo." Até onde iam seus próprios sentimentos, não tinha intenção de julgar ninguém que se rebelara contra ele. Provou ser o verdadeiro servo de Deus quando insistiu que aquelas pessoas não tinham pecado contra ele, mas contra Deus. Em Moisés encontramos uma autoridade delegada que nunca tinha sua própria opinião nem um espírito julgador. Autoridade é algo que Deus estabelece; todos aqueles que ofendem suas autoridades estabelecidas desprezam a Deus.

INTERCESSÃO E EXPIAÇÃO

Embora toda a congregação testemunhasse que a terra se abriu e engoliu as famílias rebeldes, seus corações permaneceram intocados. Por isso, após uma noite de reflexão, rebelaram-se outra vez no dia seguinte, declarando: "Vós matastes o povo do Senhor." Humanamente falando, Moisés deveria ficar zangado com o ataque. Por que não murmuraram contra Deus em lugar de se voltarem contra sua autoridade delegada? Mas a reação de Deus foi mais rápida do que a de Moisés e Arão. A glória do Senhor apareceu e Deus veio para julgar a congregação. Não obstante, Moisés e Arão caíram sobre seus rostos pela terceira vez. O senso espiritual de Moisés era tão aguçado que percebeu imediatamente que este problema poderia ser solucionado só pela oração. Rapidamente disse a Arão que pegasse o seu incensário, fosse à congregação e fizesse expiação por eles. Seu coração estava cheio de amor e compaixão, o anseio de alguém que verdadeiramente conhece a Deus. E enquanto Arão se colocou entre os mortos e os vivos, a praga foi interrompida.

A graça expiadora que vemos em Moisés foi admiravelmente semelhante à que vemos no seu Senhor. Preocupou-se com o povo de Deus e assumiu a responsabilidade pelos obedientes e rebeldes. Uma pessoa que só se preocupa consigo mesma, e que geralmente se queixa da responsabilidade que tem pelos outros, não serve para representar autoridade! Um servo fiel, embora pessoalmente rejeitado e desprezado, carrega o fardo de muitos. Os israelitas rebelaram-se contra Moisés, mas Moisés assumiu seus pecados; eles se lhe opuseram e rejeitaram, mas ainda assim intercedeu por eles. O desejo de Deus para nós é que tenhamos graça em nós. A graça para com os outros é o caráter de todo aquele que está em posição de autoridade.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Diante de uma rebelião direta, a primeira reação de Moisés foi "cair sobre o seu rosto" — não se defender nem se irritar. Quando alguém sob você (ou ao seu lado) o ataca, qual costuma ser a sua primeira reação? Como seria "cair sobre o rosto"?', 'reflexao', null),
    (v_aula_id, 2, 'Nee diz que "aqueles que representam autoridade procuram a restauração, não a divisão, mesmo depois de serem rejeitados". Há alguém que se rebelou contra você e a quem você desistiu de restaurar? O que faria um coração benevolente?', 'reflexao', null),
    (v_aula_id, 3, 'Moisés intercedeu e fez expiação pelo próprio povo que o rejeitou. "A graça para com os outros é o caráter de quem está em autoridade." Onde a sua liderança tem sido mais marcada por juízo do que por graça?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 15 — A base para a delegação de autoridade: Ressurreição
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 15;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 15 — A base para a delegação de autoridade: Ressurreição', 15,
$conteudo$"A vara do homem que eu escolher, essa florescerá; assim farei cessar de sobre mim as murmurações que os filhos de Israel proferem contra vós... No dia seguinte, eis que a vara de Arão, pela casa de Levi, brotara, e, tendo inchado os gomos, produzira flores, e dava amêndoas" (Nm 17.5,8).

O propósito do incidente em Números 17 é o de resolver a rebelião do povo de Israel. No capítulo precedente testemunhamos uma rebelião que sobrepujou todas as outras; no capítulo seguinte veremos como Deus acaba com tal rebelião, libertando o seu povo dela e de suas consequências, a morte. Deus provaria a Israel que a autoridade procede dele e que ele tem uma base e uma razão para estabelecê-la.

VIDA RESSURRETA É BASE DE AUTORIDADE

Deus ordenou aos doze líderes das tribos que pegassem doze varas, uma para cada chefe de família, e que as colocassem na tenda da congregação. A vara do homem que Deus escolhesse brotaria. Uma vara é um pedaço de madeira, um galho de árvore, cortado nas duas pontas. Não tem folhas nem raízes. Já foi vivo, mas agora está morto. Todas as doze varas foram desprovidas de folhas e raízes, todas mortas e secas. Mas Deus disse que, se uma brotasse, seria a vara daquele que ele escolhera. Isto dá a ideia de que a ressurreição é a base para a eleição como também para a autoridade. A autoridade depende não da pessoa, mas da ressurreição. Arão não era diferente dos outros, exceto que Deus o escolhera e lhe dera vida ressurreta.

O BROTAR DA VARA SECA MANTÉM OS HOMENS HUMILDES

É Deus que faz uma vara brotar. É ele que coloca o poder da vida numa vara morta e seca. A vara que brota torna humilde o dono da vara e aquieta as murmurações dos donos das outras varas. Se ela brota, dá flores e frutos no dia seguinte, devemos chorar diante de Deus, dizendo: "Isto é coisa tua; nada tem a ver comigo; é tua glória, não minha." Só os tolos podem ficar orgulhosos. Aqueles que são favorecidos se prostrarão diante de Deus, dizendo: "Tudo vem da misericórdia de Deus, não dos esforços humanos. O que há que não seja recebido?" Arão não servia no poder da vara, mas no poder que a vara tinha de brotar.

A PEDRA DE TOQUE DO MINISTÉRIO É A RESSURREIÇÃO

A vara indica a posição do homem, mas o brotar indica vida ressurreta. Só aqueles que passaram pela morte e pela ressurreição são reconhecidos por Deus como seus servos. Autoridade não vem pelo esforço. É estabelecida por Deus. Depende não de uma posição de liderança, mas da experiência da morte e ressurreição. Os homens são escolhidos para exercer autoridade espiritual não porque são diferentes dos demais, mas com base na graça, eleição e ressurreição. A dificuldade nos dias de hoje é que tão poucos caem sobre os seus rostos reconhecendo que não são diferentes dos outros.

OS TOLOS SÃO ORGULHOSOS

Quando o Senhor Jesus entrou em Jerusalém montado no jumentinho, as multidões gritaram: "Hosana ao Filho de Davi!" Imaginemos por um instante que o jumento, ouvindo as exclamações de hosana e vendo os galhos pelo caminho, se voltasse para o Senhor e dissesse: "É para mim ou para você?" Seria evidente que o jumentinho não estaria reconhecendo aquele que montava nele. Muitos dos servos de Deus são exatamente tão tolos. As exclamações de hosana não são para você; nem os galhos estendidos pelo chão. Quando Arão viu a vara que brotara, sua reação imediata deveria ser a de espanto: "Por que minha vara brotou? Não é igual às outras?" Nenhum de nós tem direito de ficar orgulhoso. Tudo é graça de Deus, tudo é concedido por Deus, nada vem de nós mesmos.

O QUE É A RESSURREIÇÃO

A ressurreição significa aquilo que não é natural, não vem do ego nem da capacidade da pessoa. É aquilo que eu não posso fazer, pois está além de minha capacidade. Eu posso pintar e esculpir flores sobre a vara, mas não posso fazê-la brotar. Sara deu à luz Isaque: foi obra de Deus. A ressurreição é aquilo que eu não posso, mas Deus pode; o que eu não sou, mas o que Deus é. Servindo ao Senhor, nós também precisamos rir e dizer: eu não posso, eu tenho certeza de que não sou capaz, mas isto é obra do Senhor. Se há alguma manifestação de autoridade, temos de confessar que é obra sua, não nossa.

A RESSURREIÇÃO É A REGRA PERMANENTE PARA O SERVIÇO

A vara de Arão tinha de permanecer na arca como lembrete eterno. Isto sugere que a ressurreição é a regra permanente para o serviço. Se um serviço não passar da morte para a ressurreição, não é aceito por Deus. Enquanto houver poder natural, o poder da ressurreição fica obscurecido. Não é na criação que o poder de Deus se manifesta de maneira mais poderosa; é na ressurreição. A autoridade vem de Deus, não de nós mesmos. Somos simplesmente mordomos de sua autoridade. Sempre que tentamos exercer autoridade como se fosse nossa, somos imediatamente despojados de qualquer autoridade. A vara seca só pode produzir morte. Onde houver ressurreição, há autoridade, porque a autoridade repousa na ressurreição e não é coisa natural. Ser autoridade delegada por Deus não é simplesmente manifestar um pouco de ressurreição, mas é ter a vara brotando, florindo e produzindo frutos, transformando-se assim em vida ressurreta amadurecida.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'As doze varas eram igualmente "mortas e secas" — só uma brotou, pela escolha de Deus. Você reconhece que qualquer fruto na sua vida é "obra dele, não sua"? Onde você ainda atribui a si mesmo o que é graça?', 'reflexao', null),
    (v_aula_id, 2, 'Nee compara o servo orgulhoso ao jumentinho que pensa que os hosanas são para ele. Em que área do seu serviço você corre o risco de receber para si a glória que é do Senhor?', 'reflexao', null),
    (v_aula_id, 3, 'A autoridade repousa na ressurreição — "aquilo que eu não posso, mas Deus pode". Que tarefa ou chamado diante de você é claramente maior do que a sua capacidade natural? Como isso pode se tornar terreno de ressurreição?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 16 — Abuso de autoridade e a disciplina governamental de Deus
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 16;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 16 — Abuso de autoridade e a disciplina governamental de Deus', 16,
$conteudo$"Mas o Senhor disse a Moisés e a Arão: Visto que não crestes em mim, para me santificardes diante dos filhos de Israel, por isso não fareis entrar este povo na terra que lhe dei" (Nm 20.12).

AUTORIDADE DELEGADA DEVE SANTIFICAR A DEUS

Depois de mais de trinta anos vagando pelo deserto, o povo de Israel tornou a esquecer as lições aprendidas na rebelião. Quando chegaram ao deserto de Zim e não acharam água, tornaram a discutir com Moisés e Arão. Deus, não obstante, não se zangou com eles. Simplesmente ordenou que se pegasse a vara e se falasse à rocha para que pudesse dar água. Moisés pegou a vara, um símbolo da autoridade de Deus, em suas mãos. Contudo, estava tão tomado de ira que chamou o povo de rebelde e, então, ignorando a ordem de Deus, bateu na rocha duas vezes com a vara. Errou, mas mesmo assim a água jorrou da rocha.

Por causa disto, Deus repreendeu o seu servo: "Não crestes em mim, para me santificardes diante dos filhos de Israel." Significava que Moisés não colocara Deus à parte de si mesmo. Representara mal a Deus, pois agira seguindo o seu próprio espírito. Deus não reprovou o povo, mas Moisés, sim. E assim deu ao povo de Israel uma impressão errada de Deus, como se Deus fosse violento, vingativo e desprovido de graça. Ser autoridade é representar Deus. Seja na ira ou na misericórdia, uma autoridade sempre tem de ser como Deus. Se, numa tal posição, fizermos alguma coisa errada, temos de reconhecer que é atitude nossa. Não devemos jamais colocar Deus em nossos próprios erros. Vamos tomar o cuidado de jamais responsabilizar Deus pelo fracasso humano. Se ficarmos zangados, vamos confessar que esta ira é nossa e não de Deus. É preciso haver separação. Se confessarmos logo, então Deus não precisará se defender e seremos libertados de cair sob sua mão governamental.

SER AUTORIDADE DELEGADA É UM ASSUNTO SÉRIO

Em consequência do incidente acima, Deus anunciou que tanto Moisés como Arão não teriam permissão de entrar em Canaã. Devemos temer e tremer quando dirigimos os negócios divinos. Tempos atrás, quando a ira de Moisés se inflamou e ele quebrou em pedaços as tábuas em que Deus escrevera a lei, Deus não o acusou, pois com seu zelo tocara o coração de Deus. Agora, depois de seguir o Senhor por muitos anos mais e ainda assim falhando em obedecer, Moisés deturpou a pessoa divina. Por isso, não teve permissão de entrar em Canaã. O povo de Israel rebelou-se contra Deus muitas vezes, mas ele teve paciência. Moisés e Arão, pelo contrário, cometeram um erro e não tiveram permissão de entrar em Canaã. Isto é prova da seriedade da autoridade delegada. Deus é mais severo com aqueles que o representam. "Mas àquele a quem muito foi dado, muito lhe será exigido; e àquele a quem muito se confia, muito mais lhe pedirão" (Lc 12.48). Nada é mais sério nem considerado com maior severidade do que a autoridade delegada que age erradamente.

AUTORIDADES DELEGADAS NÃO DEVEM ERRAR

Para que o nosso trabalho seja aprovado por Deus, não devemos servir com nossas próprias forças, mas com base na ressurreição. Nós mesmos não temos autoridade; estamos apenas representando autoridade. Assim, a carne não tem lugar. A igreja não só teme a ausência de autoridade, mas também teme a autoridade errada. Há duas dificuldades na igreja: a falta de submissão absoluta e a presença de autoridade errada. Temos de aprender a não falar inadvertidamente, a não dar opinião levianamente. Nosso espírito deve sempre se manter aberto para com o Senhor, esperando sua luz disponível. Por isto, temos de aprender, de um lado, como nos submeter e, de outro, como representar Deus. Isto significa que temos de conhecer a cruz e a ressurreição.

A AUTORIDADE VEM DO MINISTÉRIO; O MINISTÉRIO, DA RESSURREIÇÃO

A autoridade de uma pessoa se baseia em seu ministério, e o seu ministério, por sua vez, na ressurreição. Se não houver ressurreição, não pode haver ministério; e se não houver ministério, não há autoridade. Deus jamais estabeleceu como autoridade alguém que não tem ministério. Quem tem trabalho espiritual diante de Deus tem autoridade diante dos homens. A autoridade de uma pessoa diante dos homens é igual ao ministério dela diante de Deus. A medida do ministério determina a proporção da autoridade. Se a autoridade excede o ministério, torna-se posicional e, portanto, já não é mais espiritual.

Moisés e Arão preferiram deixar de entrar em Canaã para que Deus pudesse inocentar-se. A vindicação divina é muito mais importante do que o prestígio do homem. Embora tivessem algumas desculpas, não argumentaram nem intercederam por si mesmos. Esse silêncio é preciosíssimo. Aprendamos, portanto, a manter o testemunho do Senhor. Não ofereçamos conselhos levianamente, para não cairmos em juízo. Que o Senhor nos conceda a graça de sermos instruídos por Deus.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Moisés, em ira, "representou mal a Deus" diante do povo, dando a impressão de um Deus vingativo. Quando você age em nome de Deus (ensinando, corrigindo, liderando), o que as pessoas percebem do caráter dele através de você?', 'reflexao', null),
    (v_aula_id, 2, 'Nee ensina a "separar": quando erramos, confessar que a ira/erro é nosso, e não de Deus. Houve alguma vez em que você atribuiu a Deus uma reação que era apenas sua? Como confessá-la liberta você do juízo?', 'reflexao', null),
    (v_aula_id, 3, '"A quem muito se confia, muito mais lhe pedirão" — Deus é mais severo com quem o representa. Isso aumenta nele temor ou orgulho? Diante da responsabilidade que você carrega, o que significa "temer e tremer"?', 'reflexao', null);
  end if;
end
$migration$;
