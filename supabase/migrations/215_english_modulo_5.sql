-- =============================================================
-- EKBALLO ENGLISH · Módulo 5 · Perguntas e respostas
--
-- Nível básico começa aqui. Até agora o aluno falava de si quando
-- queria; deste módulo em diante ele precisa RESPONDER — que é o
-- que trava a maioria numa conversa real. Palavras interrogativas,
-- resposta curta, frequência e a primeira entrevista de verdade.
--
-- 6 lições · 5 cartões de vocabulário + 6 avaliados cada.
-- Áudio gerado depois por scripts/gerar-audios-english.mjs.
-- =============================================================

do $seed$
declare
  v_modulo_id uuid; v_licao_id uuid; lic jsonb; ex jsonb;
  licoes jsonb := $j$
[
  {
    "numero": 1, "slug": "yes-and-no", "titulo": "Yes and no", "titulo_pt": "Sim e não",
    "objetivo": "Responder sim ou não do jeito que soa natural em inglês.",
    "versiculo_ref": "Matthew 5:37", "versiculo_en": "Let your yes be yes, and your no be no.",
    "versiculo_pt": "Seja o vosso sim, sim, e o vosso não, não.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Yes, I do","pergunta_pt":"Sim (para perguntas com do)","dica":"iés ai du"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"No, I do not","pergunta_pt":"Não (para perguntas com do)","dica":"nôu ai du nót"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Yes, I am","pergunta_pt":"Sim (para perguntas com are)","dica":"iés ai ém"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Do you like coffee?","pergunta_pt":"Você gosta de café?","dica":"du iú láik kó-fi"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Are you a student?","pergunta_pt":"Você é aluno?","dica":"ar iú â stú-dânt"},
      {"ordem":6,"tipo":"escolha","enunciado":"Alguém pergunta: Do you like music? Como você responde que sim?","alternativas":[
        {"texto":"Yes, I am","correta":false},{"texto":"Yes, I do","correta":true},
        {"texto":"Yes, I like","correta":false},{"texto":"Yes, I have","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Alguém pergunta: Are you happy? Como você responde que sim?","alternativas":[
        {"texto":"Yes, I do","correta":false},{"texto":"Yes, I have","correta":false},
        {"texto":"Yes, I am","correta":true},{"texto":"Yes, I happy","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Você gosta de café?","resposta":"Do you like coffee"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Are you a student","audio_texto":"Are you a student?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a resposta","pergunta_pt":"Não, eu não gosto","resposta":"No I do not"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Yes, I do.","pergunta_pt":"Sim, eu gosto.","resposta":"Yes I do"}
    ]
  },
  {
    "numero": 2, "slug": "question-words", "titulo": "Question words", "titulo_pt": "Palavras de pergunta",
    "objetivo": "Dominar as cinco palavras que abrem quase toda pergunta.",
    "versiculo_ref": "Psalm 8:4", "versiculo_en": "What is man, that you are mindful of him?",
    "versiculo_pt": "Que é o homem, para que dele te lembres?",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"what","pergunta_pt":"o que, qual","dica":"uót"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"where","pergunta_pt":"onde","dica":"uér"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"when","pergunta_pt":"quando","dica":"uén"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"who","pergunta_pt":"quem","dica":"rú"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"why","pergunta_pt":"por que","dica":"uái"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você quer saber o LUGAR. Qual palavra usa?","alternativas":[
        {"texto":"when","correta":false},{"texto":"who","correta":false},
        {"texto":"where","correta":true},{"texto":"why","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Você quer saber o MOTIVO. Qual palavra usa?","alternativas":[
        {"texto":"why","correta":true},{"texto":"what","correta":false},
        {"texto":"when","correta":false},{"texto":"where","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Quando você trabalha?","resposta":"When do you work"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Who is your teacher","audio_texto":"Who is your teacher?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a pergunta","pergunta_pt":"Por que você está triste?","resposta":"Why are you sad"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Where do you live?","pergunta_pt":"Onde você mora?","resposta":"Where do you live"}
    ]
  },
  {
    "numero": 3, "slug": "asking-about-people", "titulo": "Asking about people", "titulo_pt": "Perguntando sobre as pessoas",
    "objetivo": "Perguntar quem é alguém e o que a pessoa faz.",
    "versiculo_ref": "Mark 8:29", "versiculo_en": "But who do you say that I am?",
    "versiculo_pt": "Mas vós, quem dizeis que eu sou?",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Who is he?","pergunta_pt":"Quem é ele?","dica":"rú iz rí"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"She is my sister","pergunta_pt":"Ela é minha irmã","dica":"chí iz mai sís-târ"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What do you do?","pergunta_pt":"O que você faz? (profissão)","dica":"uót du iú du"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"He is a teacher","pergunta_pt":"Ele é professor","dica":"rí iz â tí-tchâr"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"How many brothers do you have?","pergunta_pt":"Quantos irmãos você tem?","dica":"ráu mé-ni brá-dârs du iú rév"},
      {"ordem":6,"tipo":"escolha","enunciado":"Alguém pergunta: What do you do? O que ela quer saber?","alternativas":[
        {"texto":"O que você está fazendo agora","correta":false},{"texto":"No que você trabalha","correta":true},
        {"texto":"Onde você mora","correta":false},{"texto":"Como você está","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você diz que ela é sua irmã?","alternativas":[
        {"texto":"She my sister","correta":false},{"texto":"He is my sister","correta":false},
        {"texto":"She is my sister","correta":true},{"texto":"She is my brother","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Ele é professor.","resposta":"He is a teacher"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Who is that woman","audio_texto":"Who is that woman?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a pergunta","pergunta_pt":"Quantos irmãos você tem?","resposta":"How many brothers do you have"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"What do you do?","pergunta_pt":"No que você trabalha?","resposta":"What do you do"}
    ]
  },
  {
    "numero": 4, "slug": "how-often", "titulo": "How often", "titulo_pt": "Com que frequência",
    "objetivo": "Dizer quantas vezes você faz alguma coisa.",
    "versiculo_ref": "1 Thessalonians 5:17", "versiculo_en": "Pray without ceasing.",
    "versiculo_pt": "Orai sem cessar.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"always","pergunta_pt":"sempre","dica":"ól-uêis"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"sometimes","pergunta_pt":"às vezes","dica":"sâm-táims"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"never","pergunta_pt":"nunca","dica":"né-vâr"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"every week","pergunta_pt":"toda semana","dica":"év-ri uík"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"How often do you study?","pergunta_pt":"Com que frequência você estuda?","dica":"ráu ó-fân du iú stâ-di"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você vai à igreja todos os domingos, sem falta. Qual palavra usa?","alternativas":[
        {"texto":"never","correta":false},{"texto":"sometimes","correta":false},
        {"texto":"always","correta":true},{"texto":"yesterday","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase significa: Eu às vezes leio?","alternativas":[
        {"texto":"I never read","correta":false},{"texto":"I sometimes read","correta":true},
        {"texto":"I always read","correta":false},{"texto":"I read never","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu estudo toda semana.","resposta":"I study every week"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I always pray in the morning","audio_texto":"I always pray in the morning."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a pergunta","pergunta_pt":"Com que frequência você estuda?","resposta":"How often do you study"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I study every day.","pergunta_pt":"Eu estudo todo dia.","resposta":"I study every day"}
    ]
  },
  {
    "numero": 5, "slug": "answering-well", "titulo": "Answering well", "titulo_pt": "Respondendo bem",
    "objetivo": "Responder com naturalidade, sem repetir a pergunta inteira.",
    "versiculo_ref": "Proverbs 15:23", "versiculo_en": "A word spoken at the right time, how good it is!",
    "versiculo_pt": "Como é boa a palavra dita a seu tempo!",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I think so","pergunta_pt":"Acho que sim","dica":"ai thínk sôu"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I do not know","pergunta_pt":"Eu não sei","dica":"ai du nót nôu"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Of course","pergunta_pt":"Claro","dica":"âv córs"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Because","pergunta_pt":"Porque","dica":"bi-kóz"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Maybe","pergunta_pt":"Talvez","dica":"mêi-bi"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você não sabe a resposta. O que você diz?","alternativas":[
        {"texto":"Of course","correta":false},{"texto":"I do not know","correta":true},
        {"texto":"I think so","correta":false},{"texto":"Yes, I am","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual palavra introduz um motivo?","alternativas":[
        {"texto":"maybe","correta":false},{"texto":"of course","correta":false},
        {"texto":"because","correta":true},{"texto":"never","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu não sei.","resposta":"I do not know","aceitas":["i dont know"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I think so","audio_texto":"I think so."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Porque eu gosto de inglês","resposta":"Because I like English"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I do not know.","pergunta_pt":"Eu não sei.","resposta":"I do not know"}
    ]
  },
  {
    "numero": 6, "slug": "interview", "titulo": "The interview", "titulo_pt": "A entrevista",
    "objetivo": "Sustentar uma sequência de perguntas e respostas sem travar.",
    "versiculo_ref": "1 Peter 3:15", "versiculo_en": "Always be ready to give an answer.",
    "versiculo_pt": "Estai sempre preparados para responder.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What is your name?","pergunta_pt":"Qual é o seu nome?","dica":"uóts iór nêim"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Where are you from?","pergunta_pt":"De onde você é?","dica":"uér ar iú from"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What do you like to do?","pergunta_pt":"O que você gosta de fazer?","dica":"uót du iú láik tu du"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Why do you study English?","pergunta_pt":"Por que você estuda inglês?","dica":"uái du iú stâ-di ín-glich"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Nice talking to you","pergunta_pt":"Foi bom falar com você","dica":"náis tó-king tu iú"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual pergunta é sobre o seu gosto?","alternativas":[
        {"texto":"Where are you from?","correta":false},{"texto":"What is your name?","correta":false},
        {"texto":"What do you like to do?","correta":true},{"texto":"How old are you?","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se encerra bem uma conversa?","alternativas":[
        {"texto":"Nice talking to you","correta":true},{"texto":"What is your name?","correta":false},
        {"texto":"I do not know","correta":false},{"texto":"Because","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Por que você estuda inglês?","resposta":"Why do you study English"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"What do you like to do","audio_texto":"What do you like to do?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu estudo inglês porque eu gosto","resposta":"I study English because I like it"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Nice talking to you.","pergunta_pt":"Foi bom falar com você.","resposta":"Nice talking to you"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 5;
  for lic in select * from jsonb_array_elements(licoes) loop
    insert into english_licoes (modulo_id, numero, slug, titulo, titulo_pt, objetivo,
      versiculo_ref, versiculo_en, versiculo_pt, publicado)
    values (v_modulo_id, (lic->>'numero')::int, lic->>'slug', lic->>'titulo', lic->>'titulo_pt',
      lic->>'objetivo', lic->>'versiculo_ref', lic->>'versiculo_en', lic->>'versiculo_pt', true)
    on conflict (slug) do update set
      modulo_id = excluded.modulo_id, numero = excluded.numero, titulo = excluded.titulo,
      titulo_pt = excluded.titulo_pt, objetivo = excluded.objetivo,
      versiculo_ref = excluded.versiculo_ref, versiculo_en = excluded.versiculo_en,
      versiculo_pt = excluded.versiculo_pt, publicado = true
    returning id into v_licao_id;

    delete from english_exercicios where licao_id = v_licao_id;

    for ex in select * from jsonb_array_elements(lic->'exercicios') loop
      insert into english_exercicios (licao_id, ordem, tipo, enunciado, pergunta, pergunta_pt,
        resposta, aceitas, alternativas, dica, audio_texto, imagem_url)
      values (v_licao_id, (ex->>'ordem')::int, ex->>'tipo', ex->>'enunciado', ex->>'pergunta',
        ex->>'pergunta_pt', ex->>'resposta', coalesce(ex->'aceitas','[]'::jsonb),
        coalesce(ex->'alternativas','[]'::jsonb), ex->>'dica',
        coalesce(ex->>'audio_texto', ex->>'pergunta', ex->>'resposta'), ex->>'imagem');
    end loop;
  end loop;
  update english_modulos set publicado = true where numero = 5;
end
$seed$;
