-- =============================================================
-- EKBALLO ENGLISH · Seed dos 12 módulos + conteúdo do Módulo 1
--
-- Os 12 módulos entram como esqueleto (títulos e descrições da
-- vitrine /english). Só o Módulo 1 vai publicado, com as 6 lições
-- e ~68 exercícios completos. Os outros 11 ficam despublicados
-- até receberem conteúdo.
--
-- Idempotente: reaplicar atualiza título/descrição e regrava os
-- exercícios da lição (delete + insert).
-- =============================================================

-- ---------- 12 MÓDULOS ----------
insert into english_modulos (numero, slug, titulo, titulo_en, descricao, nivel, publicado) values
  (1,  'primeiros-passos',    'Primeiros passos',      'First steps',
       'Cumprimentos, nome, idade, frases simples e a primeira confiança para falar.', 'iniciante', true),
  (2,  'meu-mundo',           'Meu mundo',             'My world',
       'Família, casa, rotina, escola, hobbies e a primeira conversa sobre si.', 'iniciante', false),
  (3,  'vida-cotidiana',      'Vida cotidiana',        'Everyday life',
       'Comida, bebidas, roupas, pedir algo e usar o inglês no dia a dia.', 'iniciante', false),
  (4,  'sentimentos-e-acoes', 'Sentimentos e ações',   'Feelings and actions',
       'Expressar emoções, narrar ações e falar com mais naturalidade.', 'iniciante', false),
  (5,  'perguntas-e-respostas','Perguntas e respostas','Questions and answers',
       'Responder perguntas simples e formar frases curtas com segurança.', 'basico', false),
  (6,  'conversas-basicas',   'Conversas básicas',     'Basic conversations',
       'Diálogos curtos, role-play e a primeira interação com outra pessoa.', 'basico', false),
  (7,  'fe-e-vida-diaria',    'Fé e vida diária',      'Faith and daily life',
       'Frases de fé, gratidão, esperança, oração e propósito em inglês.', 'basico', false),
  (8,  'expressao-pessoal',   'Expressão pessoal',     'Personal expression',
       'Dizer o que gosta, o que sente, o que prefere e o que pensa.', 'basico', false),
  (9,  'situacoes-reais',     'Situações reais',       'Real situations',
       'Escola, igreja, loja, viagem e comunicação prática para o mundo real.', 'intermediario', false),
  (10, 'falar-com-confianca', 'Falar com confiança',   'Speaking with confidence',
       'Descrever, contar histórias curtas, responder rápido e falar com segurança.', 'intermediario', false),
  (11, 'discussao-e-opiniao', 'Discussão e opinião',   'Discussion and opinion',
       'Concordar, discordar, explicar ideias e desenvolver uma voz mais firme.', 'intermediario', false),
  (12, 'projeto-final',       'Projeto final',         'Final project',
       'Apresentar a si mesmo, falar sobre fé, propósito e mostrar todo o progresso.', 'intermediario', false)
on conflict (numero) do update set
  slug = excluded.slug,
  titulo = excluded.titulo,
  titulo_en = excluded.titulo_en,
  descricao = excluded.descricao,
  nivel = excluded.nivel;

-- ---------- MÓDULO 1 · LIÇÕES E EXERCÍCIOS ----------
do $seed$
declare
  v_modulo_id uuid;
  v_licao_id uuid;
  lic jsonb;
  ex jsonb;
  licoes jsonb := $j$
[
  {
    "numero": 1,
    "slug": "hello-and-goodbye",
    "titulo": "Hello and goodbye",
    "titulo_pt": "Oi e tchau",
    "objetivo": "Cumprimentar e se despedir em inglês em qualquer hora do dia, sem travar.",
    "versiculo_ref": "Psalm 118:24",
    "versiculo_en": "This is the day the Lord has made.",
    "versiculo_pt": "Este é o dia que o Senhor fez.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Hello","pergunta_pt":"Olá","dica":"rê-lôu"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Good morning","pergunta_pt":"Bom dia (até o meio-dia)","dica":"gud mór-nin"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Good afternoon","pergunta_pt":"Boa tarde","dica":"gud áf-ter-nun"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Good evening","pergunta_pt":"Boa noite (ao chegar)","dica":"gud ív-nin"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Goodbye","pergunta_pt":"Tchau, adeus","dica":"gud-bái"},
      {"ordem":6,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"See you later","pergunta_pt":"Até mais tarde","dica":"sí iú lêi-ter"},
      {"ordem":7,"tipo":"escolha","enunciado":"São 8 da manhã e você encontra alguém. O que você diz?","alternativas":[
        {"texto":"Good night","correta":false},
        {"texto":"Good morning","correta":true},
        {"texto":"Goodbye","correta":false},
        {"texto":"See you later","correta":false}]},
      {"ordem":8,"tipo":"escolha","enunciado":"Você está indo embora da casa de um amigo. O que você diz?","alternativas":[
        {"texto":"Good morning","correta":false},
        {"texto":"Hello","correta":false},
        {"texto":"See you later","correta":true},
        {"texto":"Good afternoon","correta":false}]},
      {"ordem":9,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Boa tarde","resposta":"Good afternoon"},
      {"ordem":10,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Good evening","audio_texto":"Good evening"},
      {"ordem":11,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Até mais tarde","resposta":"See you later"},
      {"ordem":12,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Good morning!","pergunta_pt":"Bom dia!","resposta":"Good morning"}
    ]
  },
  {
    "numero": 2,
    "slug": "whats-your-name",
    "titulo": "What is your name?",
    "titulo_pt": "Qual é o seu nome?",
    "objetivo": "Perguntar e dizer o nome, e responder a uma apresentação com naturalidade.",
    "versiculo_ref": "Isaiah 43:1",
    "versiculo_en": "I have called you by your name; you are mine.",
    "versiculo_pt": "Chamei-te pelo teu nome; tu és meu.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What is your name?","pergunta_pt":"Qual é o seu nome?","dica":"uóts iór nêim"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My name is Ana","pergunta_pt":"Meu nome é Ana","dica":"mai nêim iz"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am Bruno","pergunta_pt":"Eu sou o Bruno","dica":"aim brú-nou"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Nice to meet you","pergunta_pt":"Prazer em conhecer você","dica":"náis tu mít iú"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"This is my friend","pergunta_pt":"Este é meu amigo","dica":"dis iz mai frend"},
      {"ordem":6,"tipo":"escolha","enunciado":"Alguém pergunta: What is your name? Como você responde?","alternativas":[
        {"texto":"I am fine.","correta":false},
        {"texto":"Good morning.","correta":false},
        {"texto":"My name is Ana.","correta":true},
        {"texto":"See you later.","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Prazer em conhecer você?","alternativas":[
        {"texto":"Nice to meet you","correta":true},
        {"texto":"See you later","correta":false},
        {"texto":"How are you","correta":false},
        {"texto":"Thank you","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Meu nome é Ana.","resposta":"My name is Ana","aceitas":["i am ana","im ana"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"What is your name","aceitas":["whats your name"],"audio_texto":"What is your name?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Prazer em conhecer você","resposta":"Nice to meet you"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Nice to meet you!","pergunta_pt":"Prazer em conhecer você!","resposta":"Nice to meet you"}
    ]
  },
  {
    "numero": 3,
    "slug": "how-are-you",
    "titulo": "How are you?",
    "titulo_pt": "Como você está?",
    "objetivo": "Perguntar como alguém está e dizer como você está se sentindo hoje.",
    "versiculo_ref": "Philippians 4:4",
    "versiculo_en": "Rejoice in the Lord always.",
    "versiculo_pt": "Alegrai-vos sempre no Senhor.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"How are you?","pergunta_pt":"Como você está?","dica":"ráu ar iú"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am fine, thank you","pergunta_pt":"Estou bem, obrigado","dica":"aim fáin, tênk iú"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am happy","pergunta_pt":"Estou feliz","dica":"aim rép-i"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am tired","pergunta_pt":"Estou cansado","dica":"aim tái-erd"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"And you?","pergunta_pt":"E você?","dica":"ênd iú"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você responde a: How are you?","alternativas":[
        {"texto":"My name is Ana.","correta":false},
        {"texto":"I am fine, thank you.","correta":true},
        {"texto":"Good night.","correta":false},
        {"texto":"You are welcome.","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase significa: Estou cansado?","alternativas":[
        {"texto":"I am happy","correta":false},
        {"texto":"I am fine","correta":false},
        {"texto":"I am sorry","correta":false},
        {"texto":"I am tired","correta":true}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Estou feliz.","resposta":"I am happy","aceitas":["im happy"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"How are you today","audio_texto":"How are you today?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Estou bem, obrigado","resposta":"I am fine thank you"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"How are you?","pergunta_pt":"Como você está?","resposta":"How are you"}
    ]
  },
  {
    "numero": 4,
    "slug": "numbers-and-age",
    "titulo": "Numbers and age",
    "titulo_pt": "Números e idade",
    "objetivo": "Contar de 1 a 20 e dizer quantos anos você tem.",
    "versiculo_ref": "Psalm 90:12",
    "versiculo_en": "Teach us to number our days.",
    "versiculo_pt": "Ensina-nos a contar os nossos dias.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"one, two, three","pergunta_pt":"um, dois, três","dica":"uan, tchú, thrí"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"four, five, six","pergunta_pt":"quatro, cinco, seis","dica":"fór, fáiv, siks"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"seven, eight, nine, ten","pergunta_pt":"sete, oito, nove, dez","dica":"sé-ven, êit, náin, ten"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"How old are you?","pergunta_pt":"Quantos anos você tem?","dica":"ráu ôuld ar iú"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am twelve years old","pergunta_pt":"Eu tenho doze anos","dica":"aim tuélv íers ôuld"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual é o número 8 em inglês?","alternativas":[
        {"texto":"eighteen","correta":false},
        {"texto":"eighty","correta":false},
        {"texto":"eight","correta":true},
        {"texto":"nine","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Alguém pergunta: How old are you? O que ela quer saber?","alternativas":[
        {"texto":"Seu nome","correta":false},
        {"texto":"Sua idade","correta":true},
        {"texto":"De onde você é","correta":false},
        {"texto":"Como você está","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu tenho dez anos.","resposta":"I am ten years old","aceitas":["im ten years old"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I am fifteen years old","aceitas":["im fifteen years old"],"audio_texto":"I am fifteen years old."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a pergunta","pergunta_pt":"Quantos anos você tem?","resposta":"How old are you"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I am ten years old.","pergunta_pt":"Eu tenho dez anos.","resposta":"I am ten years old"}
    ]
  },
  {
    "numero": 5,
    "slug": "where-are-you-from",
    "titulo": "Where are you from?",
    "titulo_pt": "De onde você é?",
    "objetivo": "Dizer de onde você é, onde mora, e perguntar o mesmo a alguém.",
    "versiculo_ref": "Acts 17:26",
    "versiculo_en": "From one man he made every nation.",
    "versiculo_pt": "De um só fez toda a geração dos homens.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Where are you from?","pergunta_pt":"De onde você é?","dica":"uér ar iú from"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am from Brazil","pergunta_pt":"Eu sou do Brasil","dica":"aim from bra-zíl"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I live in São Paulo","pergunta_pt":"Eu moro em São Paulo","dica":"ai liv in"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"city","pergunta_pt":"cidade","dica":"cí-ti"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"country","pergunta_pt":"país","dica":"kân-tri"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você diz: Eu sou do Brasil?","alternativas":[
        {"texto":"I am Brazil","correta":false},
        {"texto":"I live Brazil","correta":false},
        {"texto":"I am from Brazil","correta":true},
        {"texto":"I am in Brazil","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"A pergunta Where are you from? é sobre o quê?","alternativas":[
        {"texto":"O lugar de onde você vem","correta":true},
        {"texto":"Sua idade","correta":false},
        {"texto":"Seu nome","correta":false},
        {"texto":"Como você está","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu moro em São Paulo.","resposta":"I live in São Paulo","aceitas":["i live in sao paulo"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Where are you from","audio_texto":"Where are you from?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu sou do Brasil","resposta":"I am from Brazil"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I am from Brazil.","pergunta_pt":"Eu sou do Brasil.","resposta":"I am from Brazil"}
    ]
  },
  {
    "numero": 6,
    "slug": "god-bless-you",
    "titulo": "God bless you",
    "titulo_pt": "Deus te abençoe",
    "objetivo": "Usar frases simples de fé, gratidão e bênção em inglês no dia a dia.",
    "versiculo_ref": "Numbers 6:24",
    "versiculo_en": "The Lord bless you and keep you.",
    "versiculo_pt": "O Senhor te abençoe e te guarde.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Thank you","pergunta_pt":"Obrigado, obrigada","dica":"tênk iú"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God bless you","pergunta_pt":"Deus te abençoe","dica":"gód bles iú"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Let us pray","pergunta_pt":"Vamos orar","dica":"lets prêi"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the Bible","pergunta_pt":"a Bíblia","dica":"dâ bái-bou"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"church","pergunta_pt":"igreja","dica":"tchârtch"},
      {"ordem":6,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God is good","pergunta_pt":"Deus é bom","dica":"gód iz gud"},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Deus te abençoe?","alternativas":[
        {"texto":"God is good","correta":false},
        {"texto":"Thank you","correta":false},
        {"texto":"God bless you","correta":true},
        {"texto":"Good night","correta":false}]},
      {"ordem":8,"tipo":"escolha","enunciado":"Alguém te ajuda. O que você diz?","alternativas":[
        {"texto":"Thank you!","correta":true},
        {"texto":"Let us pray.","correta":false},
        {"texto":"Where are you from?","correta":false},
        {"texto":"Good evening.","correta":false}]},
      {"ordem":9,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Deus é bom.","resposta":"God is good"},
      {"ordem":10,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"God bless you","audio_texto":"God bless you."},
      {"ordem":11,"tipo":"montar","enunciado":"Monte a bênção","pergunta_pt":"O Senhor te abençoe e te guarde","resposta":"The Lord bless you and keep you"},
      {"ordem":12,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"God bless you!","pergunta_pt":"Deus te abençoe!","resposta":"God bless you"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 1;

  for lic in select * from jsonb_array_elements(licoes) loop
    insert into english_licoes (
      modulo_id, numero, slug, titulo, titulo_pt, objetivo,
      versiculo_ref, versiculo_en, versiculo_pt, publicado
    ) values (
      v_modulo_id,
      (lic->>'numero')::int,
      lic->>'slug',
      lic->>'titulo',
      lic->>'titulo_pt',
      lic->>'objetivo',
      lic->>'versiculo_ref',
      lic->>'versiculo_en',
      lic->>'versiculo_pt',
      true
    )
    on conflict (slug) do update set
      modulo_id = excluded.modulo_id,
      numero = excluded.numero,
      titulo = excluded.titulo,
      titulo_pt = excluded.titulo_pt,
      objetivo = excluded.objetivo,
      versiculo_ref = excluded.versiculo_ref,
      versiculo_en = excluded.versiculo_en,
      versiculo_pt = excluded.versiculo_pt,
      publicado = true
    returning id into v_licao_id;

    -- regrava os exercícios do zero (mantém a migration idempotente)
    delete from english_exercicios where licao_id = v_licao_id;

    for ex in select * from jsonb_array_elements(lic->'exercicios') loop
      insert into english_exercicios (
        licao_id, ordem, tipo, enunciado, pergunta, pergunta_pt,
        resposta, aceitas, alternativas, dica, audio_texto
      ) values (
        v_licao_id,
        (ex->>'ordem')::int,
        ex->>'tipo',
        ex->>'enunciado',
        ex->>'pergunta',
        ex->>'pergunta_pt',
        ex->>'resposta',
        coalesce(ex->'aceitas', '[]'::jsonb),
        coalesce(ex->'alternativas', '[]'::jsonb),
        ex->>'dica',
        coalesce(ex->>'audio_texto', ex->>'pergunta', ex->>'resposta')
      );
    end loop;
  end loop;
end
$seed$;
