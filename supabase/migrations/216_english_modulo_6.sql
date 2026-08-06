-- =============================================================
-- EKBALLO ENGLISH · Módulo 6 · Conversas básicas
--
-- Até aqui o aluno respondia. Agora ele CONVERSA: encontro,
-- assunto solto sobre o tempo, telefone, igreja, pedir desculpa e
-- um diálogo inteiro. É o módulo que transforma frase treinada em
-- interação com outra pessoa.
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
    "numero": 1, "slug": "meeting-someone", "titulo": "Meeting someone", "titulo_pt": "Encontrando alguém",
    "objetivo": "Conduzir um primeiro encontro do início ao fim.",
    "versiculo_ref": "Romans 12:10", "versiculo_en": "Be devoted to one another in love.",
    "versiculo_pt": "Amai-vos cordialmente uns aos outros.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Hi, I am Bruno","pergunta_pt":"Oi, eu sou o Bruno","dica":"rái aim brú-nou"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Nice to meet you too","pergunta_pt":"Prazer em conhecer você também","dica":"náis tu mít iú tú"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"This is my friend Ana","pergunta_pt":"Esta é minha amiga Ana","dica":"dis iz mai frend"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"How have you been?","pergunta_pt":"Como você tem passado?","dica":"ráu rév iú bin"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"See you soon","pergunta_pt":"Até breve","dica":"sí iú sún"},
      {"ordem":6,"tipo":"escolha","enunciado":"Alguém diz: Nice to meet you. O que você responde?","alternativas":[
        {"texto":"Nice to meet you too","correta":true},{"texto":"I am fine","correta":false},
        {"texto":"Good night","correta":false},{"texto":"Yes, I do","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você apresenta a sua amiga?","alternativas":[
        {"texto":"She my friend Ana","correta":false},{"texto":"This is my friend Ana","correta":true},
        {"texto":"I am my friend Ana","correta":false},{"texto":"My friend Ana is this","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Oi, eu sou a Ana.","resposta":"Hi I am Ana","aceitas":["hi im ana"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"How have you been","audio_texto":"How have you been?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Esta é minha amiga Ana","resposta":"This is my friend Ana"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Nice to meet you too.","pergunta_pt":"Prazer em conhecer você também.","resposta":"Nice to meet you too"}
    ]
  },
  {
    "numero": 2, "slug": "small-talk", "titulo": "Small talk", "titulo_pt": "Assunto solto",
    "objetivo": "Puxar assunto sobre o tempo, que é como toda conversa começa.",
    "versiculo_ref": "Matthew 5:45", "versiculo_en": "He sends rain on the just and on the unjust.",
    "versiculo_pt": "Faz chover sobre justos e injustos.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It is hot today","pergunta_pt":"Está quente hoje","dica":"its rót tu-dêi"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It is cold","pergunta_pt":"Está frio","dica":"its kôuld"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It is raining","pergunta_pt":"Está chovendo","dica":"its rêi-ning"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It is a beautiful day","pergunta_pt":"Está um dia lindo","dica":"its â biú-ti-fâl dêi"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"How is the weather?","pergunta_pt":"Como está o tempo?","dica":"ráu iz dâ ué-dâr"},
      {"ordem":6,"tipo":"escolha","enunciado":"Está com trinta e cinco graus. O que você diz?","alternativas":[
        {"texto":"It is cold","correta":false},{"texto":"It is hot today","correta":true},
        {"texto":"It is raining","correta":false},{"texto":"It is night","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você pergunta sobre o tempo?","alternativas":[
        {"texto":"How are you?","correta":false},{"texto":"What is the weather?","correta":false},
        {"texto":"How is the weather?","correta":true},{"texto":"Where is the weather?","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Está chovendo hoje.","resposta":"It is raining today","aceitas":["its raining today"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"It is a beautiful day","audio_texto":"It is a beautiful day."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Está frio hoje de manhã","resposta":"It is cold this morning"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"It is a beautiful day.","pergunta_pt":"Está um dia lindo.","resposta":"It is a beautiful day"}
    ]
  },
  {
    "numero": 3, "slug": "on-the-phone", "titulo": "On the phone", "titulo_pt": "Ao telefone",
    "objetivo": "Atender e fazer uma ligação simples em inglês.",
    "versiculo_ref": "Jeremiah 33:3", "versiculo_en": "Call to me, and I will answer you.",
    "versiculo_pt": "Clama a mim, e responder-te-ei.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Hello, this is Ana","pergunta_pt":"Alô, aqui é a Ana","dica":"ré-lôu dis iz"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Can I speak to Bruno?","pergunta_pt":"Posso falar com o Bruno?","dica":"quén ai spík tu"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"One moment, please","pergunta_pt":"Um momento, por favor","dica":"uan môu-mânt plíz"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I will call you later","pergunta_pt":"Eu te ligo mais tarde","dica":"ail kól iú lêi-târ"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Sorry, wrong number","pergunta_pt":"Desculpe, número errado","dica":"só-ri róng nâm-bâr"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você liga e quer falar com o Bruno. O que você diz?","alternativas":[
        {"texto":"I want Bruno","correta":false},{"texto":"Can I speak to Bruno?","correta":true},
        {"texto":"Where is Bruno?","correta":false},{"texto":"Bruno, please you","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Você precisa que a pessoa espere. O que você diz?","alternativas":[
        {"texto":"One moment, please","correta":true},{"texto":"Wrong number","correta":false},
        {"texto":"See you soon","correta":false},{"texto":"I do not know","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu te ligo mais tarde.","resposta":"I will call you later"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Can I speak to Bruno","audio_texto":"Can I speak to Bruno?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Alô, aqui é a Ana","resposta":"Hello this is Ana"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Can I speak to Bruno?","pergunta_pt":"Posso falar com o Bruno?","resposta":"Can I speak to Bruno"}
    ]
  },
  {
    "numero": 4, "slug": "at-church", "titulo": "At church", "titulo_pt": "Na igreja",
    "objetivo": "Receber alguém na igreja e falar do culto em inglês.",
    "versiculo_ref": "Psalm 122:1", "versiculo_en": "I was glad when they said, let us go to the house of the Lord.",
    "versiculo_pt": "Alegrei-me quando me disseram: vamos à casa do Senhor.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Welcome!","pergunta_pt":"Bem-vindo!","dica":"uél-câm","imagem":"/english/church.png"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the service","pergunta_pt":"o culto","dica":"dâ sâr-vis"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the pastor","pergunta_pt":"o pastor","dica":"dâ pés-târ"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Let us worship","pergunta_pt":"Vamos adorar","dica":"lets uâr-chip"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What time is the service?","pergunta_pt":"Que horas é o culto?","dica":"uót táim iz dâ sâr-vis"},
      {"ordem":6,"tipo":"escolha","enunciado":"Alguém novo chega na igreja. O que você diz?","alternativas":[
        {"texto":"Goodbye!","correta":false},{"texto":"Welcome!","correta":true},
        {"texto":"Wrong number","correta":false},{"texto":"I do not know","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: o culto?","alternativas":[
        {"texto":"the pastor","correta":false},{"texto":"the church","correta":false},
        {"texto":"the service","correta":true},{"texto":"the worship","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu vou à igreja todo domingo.","resposta":"I go to church every Sunday"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"What time is the service","audio_texto":"What time is the service?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Bem-vindo à nossa igreja","resposta":"Welcome to our church"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Welcome to our church!","pergunta_pt":"Bem-vindo à nossa igreja!","resposta":"Welcome to our church"}
    ]
  },
  {
    "numero": 5, "slug": "saying-sorry", "titulo": "Saying sorry", "titulo_pt": "Pedindo desculpa",
    "objetivo": "Pedir licença, pedir desculpa e desfazer o mal-entendido.",
    "versiculo_ref": "Colossians 3:13", "versiculo_en": "Forgive as the Lord forgave you.",
    "versiculo_pt": "Perdoai como o Senhor vos perdoou.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Excuse me","pergunta_pt":"Com licença","dica":"iks-kiúz mi"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am sorry","pergunta_pt":"Me desculpe","dica":"aim só-ri"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"No problem","pergunta_pt":"Sem problema","dica":"nôu pró-blâm"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It is okay","pergunta_pt":"Está tudo bem","dica":"its ôu-kêi"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I forgive you","pergunta_pt":"Eu te perdoo","dica":"ai fâr-guiv iú"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você precisa passar por alguém no corredor. O que você diz?","alternativas":[
        {"texto":"I am sorry","correta":false},{"texto":"Excuse me","correta":true},
        {"texto":"No problem","correta":false},{"texto":"Welcome","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Alguém pede desculpa. O que você responde?","alternativas":[
        {"texto":"Excuse me","correta":false},{"texto":"Wrong number","correta":false},
        {"texto":"It is okay","correta":true},{"texto":"How are you?","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Me desculpe, foi culpa minha.","resposta":"I am sorry it was my fault","aceitas":["im sorry it was my fault"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I forgive you","audio_texto":"I forgive you."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Sem problema, está tudo bem","resposta":"No problem it is okay"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I am sorry.","pergunta_pt":"Me desculpe.","resposta":"I am sorry"}
    ]
  },
  {
    "numero": 6, "slug": "a-short-conversation", "titulo": "A short conversation", "titulo_pt": "Uma conversa curta",
    "objetivo": "Sustentar um diálogo inteiro, do oi ao tchau.",
    "versiculo_ref": "Colossians 4:6", "versiculo_en": "Let your speech always be with grace.",
    "versiculo_pt": "A vossa palavra seja sempre agradável.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Hi! How are you?","pergunta_pt":"Oi! Como você está?","dica":"rái ráu ar iú"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am fine. And you?","pergunta_pt":"Estou bem. E você?","dica":"aim fáin end iú"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What are you doing today?","pergunta_pt":"O que você vai fazer hoje?","dica":"uót ar iú dú-ing tu-dêi"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am going to church","pergunta_pt":"Eu vou à igreja","dica":"aim gôu-ing tu tchârtch"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Have a good day!","pergunta_pt":"Tenha um bom dia!","dica":"rév â gud dêi"},
      {"ordem":6,"tipo":"escolha","enunciado":"Alguém diz: I am fine. And you? O que você responde?","alternativas":[
        {"texto":"I am fine too, thank you","correta":true},{"texto":"Yes, I do","correta":false},
        {"texto":"Excuse me","correta":false},{"texto":"Wrong number","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você se despede desejando algo bom?","alternativas":[
        {"texto":"How are you?","correta":false},{"texto":"Have a good day!","correta":true},
        {"texto":"I am sorry","correta":false},{"texto":"One moment, please","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"O que você vai fazer hoje?","resposta":"What are you doing today"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Have a good day","audio_texto":"Have a good day!"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Estou bem, obrigado. E você?","resposta":"I am fine thank you and you"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Have a good day!","pergunta_pt":"Tenha um bom dia!","resposta":"Have a good day"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 6;
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
  update english_modulos set publicado = true where numero = 6;
end
$seed$;
