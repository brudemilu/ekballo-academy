-- =============================================================
-- EKBALLO ENGLISH · Módulo 10 · Falar com confiança
--
-- O salto entre responder e NARRAR. Ordenar uma história, contar
-- um dia inteiro, falar do passado e do futuro, responder rápido e
-- sustentar dois minutos sobre si. É onde a fala deixa de ser
-- frase solta e vira discurso.
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
    "numero": 1, "slug": "telling-a-story", "titulo": "Telling a story", "titulo_pt": "Contando uma história",
    "objetivo": "Ordenar os fatos para que o outro acompanhe você.",
    "versiculo_ref": "Psalm 107:2", "versiculo_en": "Let the redeemed of the Lord say so.",
    "versiculo_pt": "Digam-no os remidos do Senhor.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"first","pergunta_pt":"primeiro","dica":"fârst"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"then","pergunta_pt":"então, depois","dica":"dén"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"after that","pergunta_pt":"depois disso","dica":"áf-târ dét"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"finally","pergunta_pt":"finalmente","dica":"fái-nâ-li"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Let me tell you a story","pergunta_pt":"Deixa eu te contar uma história","dica":"lét mi tél iú â stó-ri"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual palavra encerra a narração?","alternativas":[
        {"texto":"first","correta":false},{"texto":"then","correta":false},
        {"texto":"finally","correta":true},{"texto":"after that","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Você vai contar algo. Como começa?","alternativas":[
        {"texto":"Let me tell you a story","correta":true},{"texto":"Tell me a story you","correta":false},
        {"texto":"I story tell you","correta":false},{"texto":"Story let me you","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Primeiro eu acordei, depois eu orei.","resposta":"First I woke up then I prayed"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Let me tell you a story","audio_texto":"Let me tell you a story."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Depois disso, eu fui para casa","resposta":"After that I went home"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Let me tell you a story.","pergunta_pt":"Deixa eu te contar uma história.","resposta":"Let me tell you a story"}
    ]
  },
  {
    "numero": 2, "slug": "describing-a-day", "titulo": "Describing a day", "titulo_pt": "Descrevendo um dia",
    "objetivo": "Contar um dia inteiro do começo ao fim, sem parar no meio.",
    "versiculo_ref": "Psalm 118:24", "versiculo_en": "This is the day the Lord has made; let us rejoice in it.",
    "versiculo_pt": "Este é o dia que o Senhor fez; regozijemo-nos nele.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"in the morning","pergunta_pt":"de manhã","dica":"in dâ mór-ning"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"in the afternoon","pergunta_pt":"à tarde","dica":"in dâ áf-târ-nun"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"at night","pergunta_pt":"à noite","dica":"ét náit","imagem":"/english/night-moon.png"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"before lunch","pergunta_pt":"antes do almoço","dica":"bi-fór lântch"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It was a good day","pergunta_pt":"Foi um bom dia","dica":"it uóz â gud dêi"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual expressão significa: à noite?","alternativas":[
        {"texto":"in the morning","correta":false},{"texto":"at night","correta":true},
        {"texto":"before lunch","correta":false},{"texto":"in the afternoon","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você resume um dia que foi bom?","alternativas":[
        {"texto":"It was a good day","correta":true},{"texto":"It is a good day was","correta":false},
        {"texto":"A good day it","correta":false},{"texto":"Was good it day","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"De manhã eu trabalho e à noite eu estudo.","resposta":"In the morning I work and at night I study"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"It was a good day","audio_texto":"It was a good day."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu leio a Bíblia antes do almoço","resposta":"I read the Bible before lunch"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"It was a good day.","pergunta_pt":"Foi um bom dia.","resposta":"It was a good day"}
    ]
  },
  {
    "numero": 3, "slug": "talking-about-the-past", "titulo": "Talking about the past", "titulo_pt": "Falando do passado",
    "objetivo": "Contar o que já aconteceu, com tempo e distância.",
    "versiculo_ref": "Psalm 77:11", "versiculo_en": "I will remember the works of the Lord.",
    "versiculo_pt": "Recordarei as obras do Senhor.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"last year","pergunta_pt":"ano passado","dica":"lést iír"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"two years ago","pergunta_pt":"dois anos atrás","dica":"tchu iírs â-gôu"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"When I was a child","pergunta_pt":"Quando eu era criança","dica":"uén ai uóz â tcháild"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I had","pergunta_pt":"Eu tinha","dica":"ai réd"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It changed my life","pergunta_pt":"Isso mudou a minha vida","dica":"it tchêindjd mai láif"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como se diz: dois anos atrás?","alternativas":[
        {"texto":"before two years","correta":false},{"texto":"two years ago","correta":true},
        {"texto":"two years back time","correta":false},{"texto":"ago two years is","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase fala da infância?","alternativas":[
        {"texto":"When I am a child","correta":false},{"texto":"When I was a child","correta":true},
        {"texto":"When I will be a child","correta":false},{"texto":"I child was when","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu conheci Jesus dois anos atrás.","resposta":"I met Jesus two years ago"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"It changed my life","audio_texto":"It changed my life."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Quando eu era criança, eu morava numa cidade pequena","resposta":"When I was a child I lived in a small city"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"It changed my life.","pergunta_pt":"Isso mudou a minha vida.","resposta":"It changed my life"}
    ]
  },
  {
    "numero": 4, "slug": "talking-about-the-future", "titulo": "Talking about the future", "titulo_pt": "Falando do futuro",
    "objetivo": "Falar de planos e do que você vai fazer.",
    "versiculo_ref": "Proverbs 16:9", "versiculo_en": "The Lord establishes his steps.",
    "versiculo_pt": "O Senhor lhe dirige os passos.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"tomorrow","pergunta_pt":"amanhã","dica":"tu-mó-rôu"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"next year","pergunta_pt":"ano que vem","dica":"nékst iír"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I will study","pergunta_pt":"Eu vou estudar","dica":"ail stâ-di"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am going to travel","pergunta_pt":"Eu vou viajar","dica":"aim gôu-ing tu trá-vâl"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"my plan","pergunta_pt":"meu plano","dica":"mai plén"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você diz que vai estudar amanhã?","alternativas":[
        {"texto":"I will study tomorrow","correta":true},{"texto":"I study will tomorrow","correta":false},
        {"texto":"I am will study tomorrow","correta":false},{"texto":"Tomorrow study I will be","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase fala de um plano já decidido?","alternativas":[
        {"texto":"I am going to travel","correta":true},{"texto":"I travel yesterday","correta":false},
        {"texto":"I was travelling","correta":false},{"texto":"I have travelled","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Ano que vem eu vou estudar mais.","resposta":"Next year I will study more"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I am going to travel next year","audio_texto":"I am going to travel next year."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Amanhã eu vou orar de manhã","resposta":"Tomorrow I will pray in the morning"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I will study tomorrow.","pergunta_pt":"Eu vou estudar amanhã.","resposta":"I will study tomorrow"}
    ]
  },
  {
    "numero": 5, "slug": "answering-fast", "titulo": "Answering fast", "titulo_pt": "Respondendo rápido",
    "objetivo": "Ter na ponta da língua as respostas que ninguém pode pensar antes.",
    "versiculo_ref": "Ecclesiastes 3:7", "versiculo_en": "A time to keep silence, and a time to speak.",
    "versiculo_pt": "Tempo de estar calado e tempo de falar.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Sure!","pergunta_pt":"Claro!","dica":"chúr"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Not really","pergunta_pt":"Na verdade, não","dica":"nót rí-â-li"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"That is right","pergunta_pt":"Isso mesmo","dica":"déts ráit"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Just a moment","pergunta_pt":"Só um instante","dica":"djâst â môu-mânt"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Can you repeat, please?","pergunta_pt":"Pode repetir, por favor?","dica":"quén iú ri-pít plíz"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você não entendeu o que falaram. O que você diz?","alternativas":[
        {"texto":"Sure!","correta":false},{"texto":"That is right","correta":false},
        {"texto":"Can you repeat, please?","correta":true},{"texto":"Not really","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Alguém acertou o que disse sobre você. Como confirma?","alternativas":[
        {"texto":"That is right","correta":true},{"texto":"Not really","correta":false},
        {"texto":"Just a moment","correta":false},{"texto":"I am lost","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Pode repetir, por favor?","resposta":"Can you repeat please"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Can you repeat please","audio_texto":"Can you repeat, please?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Só um instante, por favor","resposta":"Just a moment please"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Can you repeat, please?","pergunta_pt":"Pode repetir, por favor?","resposta":"Can you repeat please"}
    ]
  },
  {
    "numero": 6, "slug": "two-minutes-about-me", "titulo": "Two minutes about me", "titulo_pt": "Dois minutos sobre mim",
    "objetivo": "Sustentar dois minutos falando de você, sem travar.",
    "versiculo_ref": "Psalm 19:14", "versiculo_en": "Let the words of my mouth be acceptable in your sight.",
    "versiculo_pt": "Sejam agradáveis as palavras da minha boca diante de ti.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My name is Ana and I am from Brazil","pergunta_pt":"Meu nome é Ana e eu sou do Brasil","dica":"mai nêim iz"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I live with my family in a small city","pergunta_pt":"Eu moro com minha família numa cidade pequena","dica":"ai liv uid mai fé-mi-li"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I work in the morning and I study at night","pergunta_pt":"Eu trabalho de manhã e estudo à noite","dica":"ai uârk in dâ mór-ning"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I love my church and I serve there","pergunta_pt":"Eu amo minha igreja e sirvo lá","dica":"ai lâv mai tchârtch"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Next year I want to speak English well","pergunta_pt":"Ano que vem eu quero falar inglês bem","dica":"nékst iír ai uónt"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual frase fecha bem uma apresentação sobre você?","alternativas":[
        {"texto":"Next year I want to speak English well","correta":true},{"texto":"Where is the bus?","correta":false},
        {"texto":"How much is it?","correta":false},{"texto":"I am lost","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual é a ordem natural da apresentação?","alternativas":[
        {"texto":"Nome, origem, família, trabalho, sonho","correta":true},{"texto":"Sonho, preço, ônibus, nome","correta":false},
        {"texto":"Trabalho, tempo, remédio, nome","correta":false},{"texto":"Origem, socorro, hotel, nome","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu moro com a minha família numa cidade pequena.","resposta":"I live with my family in a small city"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I love my church and I serve there","audio_texto":"I love my church and I serve there."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu trabalho de manhã e estudo à noite","resposta":"I work in the morning and I study at night"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Next year I want to speak English well.","pergunta_pt":"Ano que vem eu quero falar inglês bem.","resposta":"Next year I want to speak English well"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 10;
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
  update english_modulos set publicado = true where numero = 10;
end
$seed$;
