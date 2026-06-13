-- =============================================================
-- Curso: Autoridade Espiritual (Watchman Nee)
-- CAPÍTULOS 9, 10 e 11 (fim da Primeira Parte)
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
  -- Capítulo 9 — As manifestações da rebeldia do homem
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 9;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 9 — As manifestações da rebeldia do homem', 9,
$conteudo$Em que setores particulares a rebeldia do homem se manifesta mais obviamente? Em palavras, razão e pensamentos. Se não tratarmos esses setores de maneira prática, a esperança de livramento da rebeldia é muito obscura.

1. PALAVRAS

"Raça de víboras, como podeis falar cousas boas, sendo maus? porque a boca fala do que está cheio o coração" (Mt 12.34).

AS PALAVRAS SÃO O ESCOADOURO DO CORAÇÃO

Um homem rebelde de coração acabará proferindo palavras rebeldes, pois do que está cheio o coração a boca fala. Para reconhecer a autoridade, é preciso que primeiro se entre em contato com a autoridade; caso contrário, jamais se obedecerá. O simples ouvir uma mensagem sobre obediência é totalmente ineficaz. É preciso que haja um encontro com Deus; então o fundamento da autoridade de Deus será estabelecido em sua vida. Depois disso, sempre que proferir uma palavra rebelde — não, antes mesmo que a profira — tomará consciência de sua transgressão e assim ficará internamente impedido. Se alguém pode livremente pronunciar palavras de rebeldia sem qualquer sentimento interno de restrição, certamente jamais teve contato com a autoridade. É muito mais fácil pronunciar palavras rebeldes do que efetuar atos de rebeldia.

A língua é difícil de ser domada. Muito rapidamente a rebeldia de um homem se expressa através de sua língua. Ele pode concordar com uma pessoa diante dela, mas injuriá-la pelas costas; pode manter silêncio diante de um homem, mas tem muito a dizer em altas vozes depois. A igreja tem de ser diferente; na igreja deveria haver obediência do coração. Se há ou não obediência do coração é fácil de perceber pelas palavras que saem da boca de uma pessoa. Deus quer obediência de coração.

EVA LEVIANAMENTE ACRESCENTOU ALGO À PALAVRA DE DEUS

Quando Eva foi tentada, ela acrescentou "nem tocareis nele" à palavra de Deus (Gn 3.3). Vamos tomar consciência da seriedade disto. Se alguém conhece a autoridade de Deus, jamais ousará acrescentar uma sílaba. A palavra de Deus era bastante clara. Deus jamais disse "nem tocareis"; isto foi acrescentado por Eva. Todos aqueles que levianamente mudam a palavra de Deus, acrescentando ou omitindo, dão evidência de que não conhecem a autoridade; portanto são rebeldes e ignorantes.

CÃO, MIRIÃ, ARÃO, CORÉ — A REBELDIA NA BOCA

Aquele que é insubordinado de coração sempre espera que a autoridade fracasse. Assim Cão teve a sua oportunidade de revelar a falta de seu pai. Hoje em dia, muitos irmãos, devido a uma falta de amor, sentem prazer em criticar pessoas e deleitam-se grandemente em revelar as faltas dos outros. Isso é uma manifestação de rebeldia.

Miriã simplesmente disse: "Porventura tem falado o Senhor somente por Moisés? não tem falado também por nós?" Ela não parece ter dito muita coisa, mas Deus percebeu que era injurioso. Por mais inconsequentes que as palavras sejam, se houver um espírito rebelde na pessoa, será imediatamente descoberto por Deus. A rebeldia geralmente se manifesta em palavras. Embora Miriã falasse contra Moisés, suas palavras foram reprimidas; por isso ela pôde ser restaurada. Mas Coré e seu grupo, como uma torrente incontrolável, desligou-se de toda restrição. Vemos aí dois diferentes graus de rebeldia: alguns caem em desgraça, mas são finalmente restaurados, enquanto outros são engolidos pelo Seol, pois não têm nenhuma repressão.

Quando Paulo foi julgado pelo concílio, falou como profeta ao sumo sacerdote, dizendo: "Deus há de ferir-te, parede branqueada" (At 23.3). Mas, tão logo foi informado que Ananias era o sumo sacerdote, voltou atrás, dizendo: "Não sabia, irmãos, que ele é sumo sacerdote; porque está escrito: Não falarás mal de uma autoridade do teu povo." Que cuidado teve com suas palavras e com que escrúpulo controlou sua boca!

Há duas coisas que levam os cristãos a perder o seu poder: o pecado e a injúria à autoridade. Perda de poder é maior quando a desobediência é expressa em palavras do que quando permanece escondida no coração. Falar inadvertidamente é o grande responsável pela quebra da união da igreja e pela perda de poder. Provavelmente a maioria das dificuldades na igreja de hoje se devem principalmente às palavras injuriosas. Se na igreja pudermos deixar de falar mal uns dos outros, eliminaremos a maior parte de nossas dificuldades. Que Deus envie um guarda para os nossos lábios, e não só para os lábios, mas também para o nosso coração, para que sejamos libertados dos pensamentos de rebeldia e das palavras injuriosas!

2. RAZÃO

A rebeldia do homem contra a autoridade se manifesta em palavras, razão e pensamento. Se não reconhece a autoridade, dirá palavras injuriosas; tais palavras geralmente brotam do seu raciocínio. Cão tinha suas razões para injuriar seu pai. Miriã falou contra Moisés com base no fato de seu irmão ter se casado com a mulher cusita. Coré e seu grupo tinham também suas razões. Datã e Abirão parece que tinham razões ainda mais fortes. As pessoas deste mundo vivem segundo a razão. Onde está, então, a diferença entre nós e o povo do mundo, se nós também vivemos nesse reino?

SEGUIR O SENHOR EXIGE LIBERTAÇÃO DA RAZÃO

É a pura verdade que precisamos arrancar os olhos de nossa razão para podermos seguir o Senhor. O que governa nossas vidas? É a razão, ou a autoridade? Quando uma pessoa é iluminada pelo Senhor, fica cega com a luz, e sua razão é colocada de lado. Paulo ficou cego sob a grande luz na estrada de Damasco; deixou de se guiar por sua própria razão. A razão é a primeira causa da rebeldia; portanto não pode haver nenhum controle sobre nossas palavras se primeiro não resolvermos totalmente o problema da razão. Há duas categorias de cristãos: aqueles que vivem no nível da razão e aqueles que vivem no nível da autoridade. Ou viveremos pela autoridade de Deus, ou pela razão humana — é absolutamente impossível viver através de ambas.

A vida terrena do Senhor Jesus foi totalmente acima da razão. Que razão poderia haver para a desgraça, os açoites e a crucificação que ele sofreu? Mas ele submeteu-se à autoridade de Deus; ele nem sequer argumentou ou perguntou; ele só obedeceu! Viver sob o domínio da razão é tão complicado! Pense nas aves do ar e nos lírios do campo. Com que simplicidade eles vivem! Quanto mais nos submetemos à autoridade, mais simples nossas vidas se tornam.

Em Romanos 9, Paulo prevê a objeção dos homens e responde: "Quem és tu, ó homem, para discutires com Deus?! Porventura pode o objeto perguntar a quem o fez: Por que me fizeste assim?" Ele não responde ao argumento deles; pelo contrário, faz-lhes uma pergunta: "Quem és tu?" Quando Deus exerce autoridade não precisa consultar ninguém nem procurar aprovação. É uma questão de autoridade, não uma questão de raciocínio.

A GLÓRIA DE DEUS LIBERTA DA RAZÃO

Argumentar com Deus implica que Deus necessita obter nosso consentimento para tudo o que faz. Isto é loucura consumada. Quando Deus age, não tem nenhuma obrigação de nos contar os motivos, porque os seus caminhos são mais altos que os nossos caminhos. Na argumentação não teremos adoração. Tão logo a obediência se ausenta, desaparece a adoração. Julgando Deus com a nossa razão, nós mesmos nos estabelecemos por deuses. Em Levítico 18—22, cada vez que Deus ordena certas coisas ao povo de Israel, introduz a frase: "Eu sou o Senhor vosso Deus." Significa: "Falei assim porque sou o Senhor vosso Deus. Eu não preciso apresentar minhas razões. Eu, o Senhor, sou a razão." Que o glorioso aparecimento do Senhor ponha um fim a toda a nossa argumentação!$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Nee diz que "é muito mais fácil pronunciar palavras rebeldes do que efetuar atos de rebeldia". Quando foi a última vez que você concordou com uma autoridade na frente dela e a criticou pelas costas? O que isso revela do seu coração?', 'reflexao', null),
    (v_aula_id, 2, 'Eva acrescentou "nem tocareis nele" à palavra de Deus. Você tende a acrescentar ou suavizar as ordens que recebe (de Deus ou de uma autoridade), ajustando-as à sua razão? Dê um exemplo.', 'reflexao', null),
    (v_aula_id, 3, 'O autor afirma que "a razão é a primeira causa da rebeldia". Há uma orientação clara que você não tem obedecido porque continua argumentando contra ela? O que seria, hoje, colocar a razão de lado e obedecer?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 10 — As manifestações da rebeldia do homem (continuação)
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 10;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 10 — As manifestações da rebeldia do homem (continuação)', 10,
$conteudo$3. PENSAMENTOS

"Porque as armas da nossa milícia não são carnais, e, sim, poderosas em Deus, para destruir fortalezas; anulando sofismas e toda altivez que se levante contra o conhecimento de Deus, levando cativo todo pensamento à obediência de Cristo; e estando prontos para punir toda desobediência, uma vez completa a vossa submissão" (2Co 10.4-6).

O ELO ENTRE A RAZÃO E O PENSAMENTO

O homem manifesta sua rebeldia não apenas em palavras e raciocínio, mas também em pensamentos. Palavras rebeldes brotam de um raciocínio rebelde, e o raciocínio, por sua vez, trama o pensamento. Portanto o pensamento é o fator central na rebeldia. O versículo 5 diz: "levando cativo todo pensamento à obediência de Cristo." Isto dá a entender que a rebeldia do homem jaz basicamente no seu pensamento.

O homem gosta de edificar raciocínios como fortalezas à volta do seu pensamento, mas tais raciocínios têm de ser destruídos e o pensamento tem de ser cativo. Do ponto de vista de Deus, as argumentações humanas são como um arranha-céu, obstruindo o seu conhecimento. Logo que o homem começa a raciocinar, seus pensamentos ficam sitiados e perde a liberdade de obedecer a Deus, uma vez que a obediência é uma questão de pensamento. Paulo não usou a razão para lutar contra a razão. A inclinação mental para argumentar tem de ser derrotada com armas espirituais, isto é, o poder de Deus. Gênesis 3 exemplifica 2 Coríntios 10. Satanás argumentou com Eva, e Eva, vendo que a árvore era boa para alimento, reagiu com argumentação. Quando a razão aparece, o pensamento do homem cai numa armadilha.

RECAPTURANDO A MENTE CATIVA

Se alguém deseja preservar sua liberdade, tem de dizer que todos os seus pensamentos são bons e corretos, cercando-os com muitas argumentações. Eis por que os homens falham em crer no Senhor: ficam frequentemente aprisionados na fortaleza de alguma argumentação. Um incrédulo pode dizer: "Vou esperar até ficar bem velho", ou "Muitos cristãos não se comportam bem, por isso não posso crer". Há também razões que os crentes apresentam para não amar o Senhor: os estudantes dirão que estão ocupados demais com seus estudos; os homens de negócios, com seus negócios. Se Deus não destruir essas fortalezas, os homens jamais ficarão livres. Só a autoridade de Deus pode levar cativo cada pensamento para obedecer a Cristo.

Podemos perceber se alguém já tomou conhecimento da autoridade observando se as suas palavras, argumentos e pensamentos já foram devidamente reestruturados. Tem de vir um dia quando a autoridade de Deus derruba todas as fortalezas da argumentação que Satanás levantou e recaptura todos os pensamentos do homem, para torná-lo um escravo espontâneo de Deus. Então já não pensa mais independentemente de Cristo; é totalmente obediente a ele. Isto é libertação total.

Aquele que ainda não tomou conhecimento da autoridade geralmente aspira a ser conselheiro de Deus. Agimos como se existissem duas pessoas no universo que são oniscientes: Deus e eu. Tal atitude indica claramente que meus pensamentos precisam ser recapturados. Se um irmão reconhece ou não a autoridade pode ser facilmente percebido observando-se o seguinte: se pronuncia palavras rebeldes, se argumenta diante de Deus e se oferece muitas opiniões. Um cativo não tem liberdade; quem prestaria atenção à opinião de um escravo? Consequentemente, nós, os que fomos capturados por Cristo, estamos prontos a aceitar os pensamentos de Deus e não a oferecer qualquer conselho que seja nosso.

ADVERTÊNCIAS AOS OPINIOSOS — PAULO

Em seu estado natural, Paulo era uma pessoa inteligente, capaz, sábia e racional. Sempre podia descobrir um meio de fazer as coisas, era confiante e servia a Deus com todo o seu entusiasmo. Mas, quando liderava um grupo de pessoas a caminho de Damasco para aprisionar os cristãos, foi derrubado ao solo por uma grande luz. Naquele momento, todas as suas intenções, modos e capacidade foram dissolvidos. Muitas pessoas, quando encontram dificuldades, mudam de direção, tentando primeiro este caminho e então aquele; mas, não importa o que façam, continuam agindo de acordo com suas próprias ideias. Não foi o que aconteceu com Paulo. Uma vez abatido, perdeu tudo. "Que devo fazer, Senhor?", perguntou. Encontramos aqui um cujos pensamentos foram cativados pelo Senhor e que obedeceu nas profundezas do seu coração. A principal evidência de que uma pessoa entrou em contato com Deus está no desaparecimento de suas opiniões e esperteza.

ADVERTÊNCIAS AOS OPINIOSOS — REI SAUL

O rei Saul foi rejeitado por Deus não porque roubasse, mas porque poupou o que havia de melhor entre os bois e ovelhas para sacrificá-los ao Senhor. Foi algo que brotou de sua própria opinião — seus próprios pensamentos sobre como agradar a Deus. Sua rejeição foi por causa dos seus pensamentos que não foram capturados por Deus. Ninguém poderá dizer que o rei Saul não foi zeloso em servir a Deus. Mas tomou sua própria decisão de acordo com seu próprio pensamento. A inferência é clara: todos os que servem a Deus devem categoricamente refrear suas decisões com base em seus próprios pensamentos; antes, devem executar a vontade de Deus, dizendo: "Senhor, o que queres que eu faça?" Obedecer é melhor do que sacrificar.

ADVERTÊNCIAS AOS OPINIOSOS — NADABE E ABIÚ

Nadabe e Abiú rebelaram-se quanto à oferta porque deixaram de se sujeitar à autoridade de seu pai. Tentaram executar seus próprios pensamentos. Embora não falassem nenhuma palavra nem apresentassem motivos, ainda assim queimaram incenso de acordo com suas próprias ideias e sentimentos. Acharam que um culto assim prestado era uma coisa boa. Mas não sabiam que seriam consumidos pelo fogo. Todos nós devemos aprender a aceitar a disciplina para que nossas bocas sejam instruídas a não falar levianamente, nossa mente a não argumentar, nossos corações a não oferecer conselho. O caminho da glória está exatamente à nossa frente. Deus há de manifestar sua autoridade sobre a terra.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Nee diz que "o pensamento é o fator central na rebeldia". Que "fortaleza de argumentação" (uma justificativa que você repete a si mesmo) tem mantido seu pensamento livre da obediência a Cristo?', 'reflexao', null),
    (v_aula_id, 2, 'Saul foi rejeitado porque seguiu sua própria opinião sobre "como agradar a Deus". Existe um serviço a Deus que você faz à sua maneira, sem nunca ter perguntado "Senhor, o que queres que eu faça?"', 'reflexao', null),
    (v_aula_id, 3, 'O autor descreve o crente que "aspira a ser conselheiro de Deus", cheio de opiniões. Onde você tem oferecido muitas opiniões e pouca obediência? Como seria, esta semana, "estar pronto a ouvir" em vez de aconselhar?', 'reflexao', null);
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 11 — A medida da obediência à autoridade
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas where curso_id = v_curso_id and ordem = 11;
  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (v_curso_id, 'Capítulo 11 — A medida da obediência à autoridade', 11,
$conteudo$"As parteiras, porém, temeram a Deus, e não fizeram como lhes ordenara o rei do Egito, antes deixaram viver os meninos" (Êx 1.17). "Se não, fica sabendo, ó rei, que não serviremos a teus deuses, nem adoraremos a imagem de ouro que levantaste" (Dn 3.18). "Então Pedro e os demais apóstolos afirmaram: Antes importa obedecer a Deus do que aos homens" (At 5.29).

A SUBMISSÃO É ABSOLUTA, MAS A OBEDIÊNCIA É RELATIVA

A submissão é uma questão de atitude, enquanto a obediência é uma questão de conduta. Pedro e João responderam ao concílio religioso dos judeus: "Julgai se é justo diante de Deus ouvir-vos antes a vós outros do que a Deus" (At 4.19). Seu espírito não foi rebelde, uma vez que ainda se submetiam àqueles que estavam em posição de autoridade. A obediência, entretanto, não pode ser absoluta. Algumas autoridades têm de ser obedecidas; enquanto outras não deveriam, especialmente em questões que atingem os fundamentos cristãos — tais como crer no Senhor, pregar o evangelho e assim por diante. Os filhos podem fazer sugestões a seus pais, mas não devem demonstrar uma atitude de insubmissão. A submissão tem de ser absoluta. Às vezes a obediência é submissão, enquanto que, noutras ocasiões, uma incapacidade de obedecer ainda pode ser submissão. Mesmo quando fazemos uma sugestão, deveríamos manter uma atitude de submissão.

Vamos resumir isto em três pontos:

1. A obediência está relacionada com a conduta: é relativa. A submissão relaciona-se com a atitude do coração: é absoluta.

2. Só Deus recebe obediência irrestrita, sem medida; qualquer pessoa abaixo de Deus só pode receber obediência restrita.

3. Se a autoridade delegada emitir uma ordem claramente em contradição com a ordem de Deus, deverá receber submissão, mas não obediência. Temos de nos submeter à pessoa que recebeu autoridade delegada de Deus, mas devemos desobedecer à ordem que ofende a Deus.

Quando a autoridade delegada (homens que representam a autoridade de Deus) e a autoridade direta (o próprio Deus) entram em conflito, a pessoa pode prestar submissão, mas não obediência, à autoridade delegada. Aquele que reconhece a autoridade será delicado e respeitoso. Será absoluto em sua submissão tanto no coração como na atitude e em palavras. Não haverá sinais de rispidez ou rebeldia. Quando os apóstolos foram proibidos pelo concílio de pregar o evangelho, mantiveram um espírito de submissão no tribunal; mesmo assim, continuaram obedecendo à ordem do Senhor. Não desobedeceram com discussões e gritaria; apenas calma e mansamente discordaram.

EXEMPLOS NA BÍBLIA

1. As parteiras e a mãe de Moisés desobedeceram ao decreto de Faraó, preservando a vida de Moisés. Mas foram consideradas mulheres de fé.

2. Os três amigos de Daniel recusaram-se a adorar a imagem de ouro erigida pelo rei Nabucodonosor. Desobedeceram à ordem do rei, mas submeteram-se ao fogo do rei.

3. Daniel, ignorando o decreto real, orou a Deus; não obstante, submeteu-se ao julgamento do rei, sendo lançado na cova dos leões.

4. José pegou o menino Jesus e fugiu para o Egito para evitar que a criança fosse morta pelo rei Herodes.

5. Pedro pregou o evangelho embora fosse contra a ordem do concílio governante, pois declarou que importava antes obedecer a Deus do que aos homens. Mas submeteu-se quando foi levado à prisão.

SINAIS INDISPENSÁVEIS QUE ACOMPANHAM O OBEDIENTE

Como podemos julgar se uma pessoa é obediente à autoridade? Pelos seguintes sinais:

1. Uma pessoa que reconhece a autoridade naturalmente vai procurar descobrir a autoridade aonde quer que vá. Só os cristãos podem obedecer, e eles também precisam aprender a obedecer, não externamente, mas de coração.

2. Uma pessoa que tomou conhecimento da autoridade de Deus é mansa e delicada. Foi amansada e não consegue ser dura. Tem receio de estar errada e por isso é delicada.

3. Uma pessoa que verdadeiramente reconhece a autoridade jamais deseja estar em posição de autoridade. Não tem prazer em dar conselhos, nem prazer em controlar os outros. Só aqueles que não reconhecem a autoridade desejam ser autoridade.

4. Uma pessoa que entrou em contato com a autoridade mantém sua boca fechada. Está sob controle. Não se atreve a falar levianamente porque há nela um senso de autoridade.

5. Uma pessoa que entrou em contato com a autoridade é sensível a todo ato de anarquia e rebelião à sua volta. Só aqueles que experimentaram a autoridade podem levar outros à obediência.

VIDA E AUTORIDADE

A igreja é mantida por duas coisas essenciais: vida e autoridade. A vida interior que recebemos é uma vida de submissão, que nos capacita a obedecer à autoridade. Dificuldades dentro da igreja raramente se encontram em questões de desobediência externa; na maioria das vezes relacionam-se com uma falta de submissão interna. Mas o princípio governante de nossa vida tem de ser a submissão, exatamente como o dos pássaros é voar e o dos peixes, nadar. Os santos podem ter opiniões diferentes e ainda assim não é preciso que haja insubordinação, pois mesmo com opiniões diferentes podemos, não obstante, nos submeter uns aos outros. A vida que recebemos não é só para resolver o pecado — o lado negativo — mas principalmente para obedecer — o lado vital e positivo. Quando o espírito da rebeldia nos abandonar, então o espírito da obediência será rapidamente restaurado à igreja.$conteudo$
    ) returning id into v_aula_id;
  end if;
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1, 'Nee distingue submissão (atitude do coração — absoluta) de obediência (conduta — relativa). Pense num conflito recente com uma autoridade: você manteve a submissão do coração mesmo quando não pôde obedecer à ordem? Ou perdeu as duas?', 'reflexao', null),
    (v_aula_id, 2, 'Os amigos de Daniel "desobedeceram à ordem do rei, mas submeteram-se ao fogo do rei". O que significa, na prática, discordar "calma e mansamente", sem rispidez nem rebeldia, quando você não pode obedecer?', 'reflexao', null),
    (v_aula_id, 3, 'Entre os sinais do obediente, Nee cita: ser manso, manter a boca sob controle e não desejar posição de autoridade. Qual desses sinais está mais ausente em você hoje, e por quê?', 'reflexao', null);
  end if;
end
$migration$;
