-- =============================================================
-- Curso: O Desafio de Todo Líder (Elias Dantas)
-- CAPÍTULO 7 — As prioridades de um líder (aula ordem = 7)
--
-- Localiza o curso já criado pela migration 058 (slug
-- 'o-desafio-de-todo-lider') e insere a aula no ordem do
-- capítulo, com as perguntas do Desafio Prático como reflexões.
--
-- Idempotente: pode ser reaplicada sem duplicar aula/atividades.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_aula_id uuid;
begin
  select id into v_curso_id from public.cursos
  where slug = 'o-desafio-de-todo-lider';

  if v_curso_id is null then
    raise exception 'Curso o-desafio-de-todo-lider não encontrado. Aplique a migration 058 primeiro.';
  end if;

  -- ---------------------------------------------------------------
  -- Capítulo 7 — As prioridades de um líder
  -- ---------------------------------------------------------------
  select id into v_aula_id from public.aulas
  where curso_id = v_curso_id and ordem = 7;

  if v_aula_id is null then
    insert into public.aulas (curso_id, titulo, ordem, conteudo)
    values (
      v_curso_id,
      'Capítulo 7 — As prioridades de um líder',
      7,
$conteudo$Como pudemos ver até aqui, para que o líder tenha uma carreira bem-sucedida e chegue à fase da celebração de sua jornada, deixando um bom legado, ele precisa zelar por sua própria vida espiritual.

A eficiência na liderança envolve a habilidade de priorizar as ações que realmente fazem a diferença na jornada do líder. Paulo entendia isso muito bem. Ele sabia que a formação espiritual da liderança cristã requer o estabelecimento de prioridades.

Em Atos 20.17-24, ele está retornando de sua terceira viagem missionária. No início daquela viagem, ele permaneceu por quase dois anos na cidade de Éfeso, onde estabeleceu uma igreja forte, com líderes fortes e bem treinados. Agora, ele estava retornando a Jerusalém, onde, por palavra profética, já sabia que lhe aguardavam cadeias e tribulações.

Ao aportar em Mileto, que distava cerca de sessenta quilômetros de Éfeso, Paulo manda uma mensagem aos presbíteros daquela igreja, convidando-os para virem até ele para uma conversa final. Ao se encontrarem, Paulo tenta comunicar-lhes as prioridades que havia estabelecido para sua vida, que o levaram a ser o homem de Deus que ele foi. Eu profundamente creio que aquelas mesmas prioridades podem também nos ajudar a sermos os homens e mulheres de Deus que ele quer que sejamos.

A PRIORIDADE COM DEUS: SERVIR COM HUMILDADE

Em Atos 20.19, Paulo diz que, desde o primeiro dia em que havia posto os seus pés naquela região, havia buscado servir a Deus com humildade. Aparentemente, ele estava seguro de que assim fizera, pois pede o testemunho dos próprios presbíteros daquele fato (v. 18).

Estas palavras de Paulo nos levam a perguntar: Como nos vemos diante de Deus: como pessoas que o servem ou que querem ser servidas por ele? Esta é, com certeza, uma pergunta fundamental que precisa ser respondida por cada um de nós.

Hoje se fala muito em servir outros seres humanos. Certamente, nós, cristãos, precisamos servir às necessidades do nosso próximo. Contudo, esta não é a nossa tarefa principal. A nossa tarefa central é a de servir a Deus.

Evidentemente que o nosso serviço a Deus se manifesta nas obras que praticamos para o bem dos outros. Nós servimos a Deus na esfera humana. O interesse aqui, no entanto, é com as nossas motivações. Paulo diz que, em tudo que fazemos, nossa motivação principal deve ser o serviço humilde a Deus.

Em 2 Timóteo 2.15, ele nos diz que devemos fazer o nosso melhor para nos apresentarmos diante de Deus aprovados. Quando concluirmos a nossa vida, somente Deus nos dirá se fomos aprovados ou reprovados. Vamos, então, zelosa e humildemente, buscar servi-lo.

Permita-me adicionar algo: a humildade é o ponto-chave de tudo. Em Mateus 6.1, Jesus nos alerta para não fazermos as nossas boas obras com o fim de sermos vistos por outros, como os fariseus eram mestres em fazer. De outra sorte, não teremos nenhum galardão diante do nosso Pai celeste.

O que o Senhor Jesus está nos dizendo é que, se fazemos o que fazemos com o fim de sermos reconhecidos por outros seres humanos, não devemos esperar nada mais de Deus, pois ele não é, verdadeiramente, o foco da glória e do louvor daquilo que estamos produzindo. Se o reconhecimento humano vier, isto é tudo que receberemos, pois é tudo o que buscamos.

Um conhecido meu que pastoreia uma igreja de oito mil congregantes foi entrevistado por um jornalista de uma revista cristã. O repórter lhe fez uma pergunta muito interessante: "Pastor, o senhor gostaria de ser o pastor do mundo inteiro?" Meu amigo respondeu que não. Surpreso, o repórter lhe perguntou por quê. O pastor concluiu dizendo: "Porque essa posição não está disponível. Ela já está preenchida por Jesus, o supremo pastor e bispo universal das nossas almas. Não quero competir, e sim cooperar com ele".

Jesus não divide a sua glória com ninguém. Precisamos fazer tudo o que vier às nossas mãos com o inegociável compromisso de fazê-lo para a glória de Deus.

Agora é hora de responder: o líder espiritual tem direitos? Obviamente que sim. Contudo, esses direitos devem ser equilibrados pela humildade, pois essa é a marca distintiva da liderança espiritual. Os líderes seculares não podem agir com humildade pois, se não estiverem sempre certos, estarão liquidados e podem perder sua posição. O líder secular e sua organização geralmente seguem a clássica visão piramidal, onde o líder está sempre posicionado acima de seus seguidores, sendo servido por eles.

A visão cristã de liderança, porém, é diametralmente oposta à visão clássica, pois se baseia em uma convicção alternativa, onde o líder serve liderando e lidera servindo. Na verdade, o líder espiritual nada mais faz do que imitar Jesus, "tal como o Filho do Homem, que não veio para ser servido, mas para servir e dar a sua vida em resgate por muitos" (Mt 20.28). Assim, o líder espiritual não é soberbo ou arrogante, pelo contrário, conhece a si mesmo e sabe que é o mais miserável de todos os pecadores, como dizia Paulo, líder espiritual que trazia no corpo as marcas do sofrimento por Jesus. Esse líder não se engana nem se mascara, porque olha a si mesmo no espelho e sabe que não é uma pessoa tão espiritual quanto aparenta ser. Ele tem consciência daquelas áreas de sua vida que precisam ser transformadas, pois nelas Jesus Cristo ainda não reina como o Senhor de fato. Quem deve considerá-lo como espiritual são as pessoas ao seu redor, e não ele mesmo.

Se o líder espiritual não entender a dimensão do que significa ser servo, ele viverá em constante tensão, voltado apenas para si mesmo, exigindo seus direitos e sua posição. O líder cristão deve liderar servindo, capacitando os outros para multiplicar o ministério. Ele olha para a história e descobre o poder e influência daqueles que decidiram ser servos.

Na verdade, a história da humanidade é pontuada por dois tipos de líderes: aqueles que deixaram um legado baseado na força e no poder e aqueles que deixaram um legado baseado na ética, bondade e amor. O primeiro grupo tem um grande impacto imediato, que se dilui com o passar dos anos e termina como um registro nos livros da história. O segundo grupo, que se baseia nos valores da ética, bondade e amor, tem um impacto progressivo, que continua presente, geração após geração, na vida do povo. Os poderosos constroem os seus impérios temporais. Os servos sustentam o mundo.

Portanto, para que o líder possa viver desta forma, é necessário que ele incorpore o conceito aprendido por meio do hábito e da disciplina, que é o conceito dos valores do servo.

É importante frisar que este é um conceito que deve ser aprendido, pois não nascemos com ele. Isso é motivo de esperança para todos nós, que não precisamos viver como escravos do determinismo, mas podemos acreditar na possibilidade da formação da imagem de Cristo em nós. Na verdade, isto se dá por meio de um processo, que é a obra do Espírito Santo de Deus por toda a nossa vida. Nunca estaremos prontos, morreremos aprendendo a caminhar com Cristo, a sermos homens e mulheres de integridade. Até o dia da nossa morte seremos testados. Talvez, o último teste pelo qual passaremos será o da aceitação do fato de que a vida da qual gostamos tanto está terminando.

A autoridade do líder espiritual está no fato de que ele conquista o direito de modelar seus seguidores, por ter primeiro modelado em si mesmo aquilo que deseja lhes ensinar. Se ele, por exemplo, deseja que as pessoas contribuam, deve modelá-las, dando ele mesmo a sua contribuição. Se o líder quer que o povo ame, ele deve ser um líder amoroso. Moldar significa ser um modelo, ensinar pelo exemplo, transmitir a seus seguidores, por atitudes e palavras, aquilo que o líder gostaria que eles fossem, conhecessem e fizessem. Aliás, no líder sempre deve haver humildade a ponto deste considerar a possibilidade da regeneração e do cultivo dos valores de servo. Afinal, ele deve se submeter a Deus, que opera, de uma maneira maravilhosa, a transformação de todo aquele que crê. Esta é a nossa esperança e o motivo de não nos acomodarmos.

A PRIORIDADE COM MEUS IRMÃOS

Paulo diz, no verso 20, que a sua prioridade era para com a sua irmandade cristã, sua preocupação era a de anunciar coisas proveitosas para a edificação deles.

Como cristãos, podemos falar sobre qualquer assunto que quisermos. Somos livres em Cristo. Contudo, sabemos que eles podem danificar ou destruir nossos relacionamentos. Há um assunto, no entanto, que sempre edifica. Refiro-me à Palavra de Deus.

Paulo diz, em 2 Timóteo 3.16, que toda Escritura é útil para nossa edificação. Isso indica que devemos basear nossas conversas sobre qualquer assunto nos limites permitidos pela Palavra.

Naturalmente que não estou dizendo que devemos cumprimentar os irmãos citando as Escrituras, e sim que precisamos conhecer a Palavra para que possamos decidir quando a nossa conversa já não está edificando o outro.

Há dois substantivos gregos usados para definir a palavra espada. Um deles indica uma espada grande e pesada que era usada pelos comandantes durante a batalha. Aquele tipo de espada era muito difícil de manejar, e o seu propósito principal era provocar o maior estrago possível no inimigo. A outra palavra (makhaira) refere-se a uma espada pequena ou média, leve e curva, usada pelos soldados e pela cavalaria. Os árabes a chamam de "adaga". Os soldados, ao usá-la, podem facilmente atingir com precisão o corpo da outra pessoa. Esta segunda palavra é a usada em Efésios 6.17 para referir-se à espada do Espírito, que é a Palavra de Deus.

Quando o líder conversa com os seus liderados, problemas difíceis podem ser compartilhados. O líder precisa prover respostas sábias baseadas na Palavra, a espada do Espírito. Líderes que terminam bem são homens e mulheres que a conhecem e a usam com reverência e eficiência, não somente para sua própria edificação, mas também para o crescimento na fé dos seus liderados.

A PRIORIDADE PARA COM OS AMIGOS NÃO CRISTÃOS

Após tratar das prioridades para com Deus e com os irmãos e irmãs em Cristo, Paulo trata, no verso 21, sobre a prioridade para com os amigos ainda não crentes. Ele diz que, para poder terminar bem a sua vida, ele sempre viu os seus amigos ainda não cristãos como alvos de sua evangelização pessoal.

Tanto para os gregos quanto para os judeus, Paulo dedicou-se a anunciar o evangelho completo: arrependimento de pecados e fé pessoal em Cristo Jesus.

O campo missionário do líder que termina bem a sua jornada sempre começa entre os seus amigos ainda não cristãos.

A PRIORIDADE PARA CONSIGO MESMO

Paulo conclui a sua conversa com os presbíteros de Éfeso dizendo que, se quisermos terminar bem, temos que nos sacrificar em nossa jornada. Ao falar com os líderes daquela igreja amada, ele diz, no versículo 24: "Porém em nada considero a minha vida preciosa para mim mesmo, contanto que complete a minha carreira e o ministério que recebi do Senhor Jesus para testemunhar o evangelho da graça de Deus". Seu alvo maior era o de completar o que Deus lhe havia dado para fazer, e foi isso o que ele fez (2Tm 4.7), morrendo com a convicção de que, apesar da luta contra o pecado, ele cumprira a sua jornada.

Em Colossenses 1.29, ele diz que, para que pudesse cumprir o seu chamado, chegou à exaustão. Ele teve que trabalhar duro para ser bem-sucedido na sua jornada. O preguiçoso nunca vai terminar bem, pois nada na vida se consegue sem sacrifício.$conteudo$
    )
    returning id into v_aula_id;
  end if;

  -- ---------------------------------------------------------------
  -- Desafio Prático — Alinhando Prioridades
  -- (perguntas do capítulo, tipo reflexão)
  -- ---------------------------------------------------------------
  if not exists (select 1 from public.atividades where aula_id = v_aula_id) then
    insert into public.atividades (aula_id, ordem, pergunta, tipo, razao) values
    (v_aula_id, 1,
     'Reavalie suas prioridades atuais. Elas refletem a visão que você quer alcançar? Se não, o que precisa mudar?',
     'reflexao', null),
    (v_aula_id, 2,
     'Identifique três áreas em que você pode melhorar a eficiência de suas ações diárias.',
     'reflexao', null),
    (v_aula_id, 3,
     'Estabeleça uma lista de prioridades claras para as próximas semanas e compartilhe com um colega de confiança para manter-se responsável.',
     'reflexao', null);
  end if;
end
$migration$;
