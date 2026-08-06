-- =============================================================
-- EKBALLO ENGLISH · Módulo 9 · Situações reais
--
-- Começa o nível intermediário. Deixa de ser sala de aula: loja,
-- rua, viagem, médico, trabalho e emergência. São as situações em
-- que o inglês precisa funcionar sob pressão, não com calma.
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
    "numero": 1, "slug": "at-the-store", "titulo": "At the store", "titulo_pt": "Na loja",
    "objetivo": "Comprar alguma coisa do começo ao fim, sem apontar.",
    "versiculo_ref": "Proverbs 11:1", "versiculo_en": "A just weight is his delight.",
    "versiculo_pt": "O peso justo é o seu prazer.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to buy","pergunta_pt":"comprar","dica":"tu bái"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the price","pergunta_pt":"o preço","dica":"dâ práis"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"expensive","pergunta_pt":"caro","dica":"iks-pén-siv"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"cheap","pergunta_pt":"barato","dica":"tchíp"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I will take this one","pergunta_pt":"Vou levar este","dica":"ail têik dis uan"},
      {"ordem":6,"tipo":"escolha","enunciado":"O preço está alto demais. Como você comenta?","alternativas":[
        {"texto":"It is cheap","correta":false},{"texto":"It is expensive","correta":true},
        {"texto":"It is small","correta":false},{"texto":"It is new","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Você decidiu comprar. O que você diz?","alternativas":[
        {"texto":"I will take this one","correta":true},{"texto":"I am take this","correta":false},
        {"texto":"This take I will","correta":false},{"texto":"I take will this","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Quanto custa esta camisa?","resposta":"How much is this shirt"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I will take this one","audio_texto":"I will take this one."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu quero comprar sapatos novos","resposta":"I want to buy new shoes"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"How much is this?","pergunta_pt":"Quanto custa isto?","resposta":"How much is this"}
    ]
  },
  {
    "numero": 2, "slug": "asking-directions", "titulo": "Asking directions", "titulo_pt": "Pedindo informação",
    "objetivo": "Perguntar e entender como chegar a algum lugar.",
    "versiculo_ref": "Psalm 32:8", "versiculo_en": "I will guide you in the way you should go.",
    "versiculo_pt": "Ensinar-te-ei o caminho que deves seguir.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Turn left","pergunta_pt":"Vire à esquerda","dica":"târn léft"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Turn right","pergunta_pt":"Vire à direita","dica":"târn ráit"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Go straight","pergunta_pt":"Siga reto","dica":"gôu strêit"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It is near here","pergunta_pt":"É perto daqui","dica":"its nír rír"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"How do I get there?","pergunta_pt":"Como eu chego lá?","dica":"ráu du ai guét dér"},
      {"ordem":6,"tipo":"escolha","enunciado":"A pessoa diz: Turn right. O que você faz?","alternativas":[
        {"texto":"Vira à esquerda","correta":false},{"texto":"Vira à direita","correta":true},
        {"texto":"Segue reto","correta":false},{"texto":"Volta","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você pergunta o caminho?","alternativas":[
        {"texto":"How do I get there?","correta":true},{"texto":"Where I go there?","correta":false},
        {"texto":"How is there?","correta":false},{"texto":"What is the way you?","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Siga reto e vire à esquerda.","resposta":"Go straight and turn left"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"It is near here","audio_texto":"It is near here."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a pergunta","pergunta_pt":"Onde fica o hospital?","resposta":"Where is the hospital"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"How do I get there?","pergunta_pt":"Como eu chego lá?","resposta":"How do I get there"}
    ]
  },
  {
    "numero": 3, "slug": "travelling", "titulo": "Travelling", "titulo_pt": "Viajando",
    "objetivo": "Se virar num aeroporto e num hotel.",
    "versiculo_ref": "Psalm 121:8", "versiculo_en": "The Lord will watch over your coming and going.",
    "versiculo_pt": "O Senhor guardará a tua saída e a tua entrada.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"a ticket","pergunta_pt":"uma passagem","dica":"â tí-kit"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the airport","pergunta_pt":"o aeroporto","dica":"dâ ér-pórt"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the hotel","pergunta_pt":"o hotel","dica":"dâ rôu-tél"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"my passport","pergunta_pt":"meu passaporte","dica":"mai pés-pórt"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I have a reservation","pergunta_pt":"Eu tenho uma reserva","dica":"ai rév â re-zâr-vêi-chân"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você chega ao hotel. O que você diz na recepção?","alternativas":[
        {"texto":"I have a reservation","correta":true},{"texto":"I am a reservation","correta":false},
        {"texto":"Reservation I have the","correta":false},{"texto":"I reserve am","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual documento você mostra para viajar ao exterior?","alternativas":[
        {"texto":"my ticket","correta":false},{"texto":"my hotel","correta":false},
        {"texto":"my passport","correta":true},{"texto":"my money","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Onde fica o aeroporto?","resposta":"Where is the airport"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I have a reservation","audio_texto":"I have a reservation."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu preciso de uma passagem para São Paulo","resposta":"I need a ticket to São Paulo"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Where is the airport?","pergunta_pt":"Onde fica o aeroporto?","resposta":"Where is the airport"}
    ]
  },
  {
    "numero": 4, "slug": "at-the-doctor", "titulo": "At the doctor", "titulo_pt": "No médico",
    "objetivo": "Dizer o que está sentindo quando não está bem.",
    "versiculo_ref": "Psalm 147:3", "versiculo_en": "He heals the brokenhearted.",
    "versiculo_pt": "Ele sara os quebrantados de coração.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I feel sick","pergunta_pt":"Estou me sentindo mal","dica":"ai fíl sik"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I have a headache","pergunta_pt":"Estou com dor de cabeça","dica":"ai rév â réd-êik"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the doctor","pergunta_pt":"o médico","dica":"dâ dók-târ"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the medicine","pergunta_pt":"o remédio","dica":"dâ mé-di-sin"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I need a doctor","pergunta_pt":"Eu preciso de um médico","dica":"ai níd â dók-târ"},
      {"ordem":6,"tipo":"escolha","enunciado":"Sua cabeça está doendo. O que você diz?","alternativas":[
        {"texto":"I am a headache","correta":false},{"texto":"I have a headache","correta":true},
        {"texto":"My head is a pain have","correta":false},{"texto":"I headache","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual palavra significa: remédio?","alternativas":[
        {"texto":"doctor","correta":false},{"texto":"medicine","correta":true},
        {"texto":"hospital","correta":false},{"texto":"sick","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu preciso de um médico.","resposta":"I need a doctor"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I do not feel well today","audio_texto":"I do not feel well today."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Estou me sentindo mal hoje","resposta":"I feel sick today"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I need a doctor.","pergunta_pt":"Eu preciso de um médico.","resposta":"I need a doctor"}
    ]
  },
  {
    "numero": 5, "slug": "at-work", "titulo": "At work", "titulo_pt": "No trabalho",
    "objetivo": "Falar do seu trabalho e combinar coisas simples com colegas.",
    "versiculo_ref": "Colossians 3:23", "versiculo_en": "Whatever you do, work at it with all your heart.",
    "versiculo_pt": "Tudo quanto fizerdes, fazei de coração.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"my job","pergunta_pt":"meu emprego","dica":"mai djób"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"a meeting","pergunta_pt":"uma reunião","dica":"â mí-ting"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am busy","pergunta_pt":"Estou ocupado","dica":"aim bí-zi"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What time is the meeting?","pergunta_pt":"Que horas é a reunião?","dica":"uót táim iz dâ mí-ting"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I work in the morning","pergunta_pt":"Eu trabalho de manhã","dica":"ai uârk in dâ mór-ning"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você não pode atender agora. O que você diz?","alternativas":[
        {"texto":"I am busy right now","correta":true},{"texto":"I am busy do not","correta":false},
        {"texto":"Busy I now","correta":false},{"texto":"I have busy","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual palavra significa: reunião?","alternativas":[
        {"texto":"job","correta":false},{"texto":"meeting","correta":true},
        {"texto":"morning","correta":false},{"texto":"money","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu trabalho de manhã.","resposta":"I work in the morning"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"What time is the meeting","audio_texto":"What time is the meeting?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu gosto do meu emprego","resposta":"I like my job"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I am busy right now.","pergunta_pt":"Estou ocupado agora.","resposta":"I am busy right now"}
    ]
  },
  {
    "numero": 6, "slug": "when-you-need-help", "titulo": "When you need help", "titulo_pt": "Quando você precisa de ajuda",
    "objetivo": "Pedir socorro em inglês — as frases que salvam o dia.",
    "versiculo_ref": "Psalm 46:1", "versiculo_en": "God is our refuge and strength, a very present help.",
    "versiculo_pt": "Deus é o nosso refúgio e fortaleza, socorro bem presente.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Help!","pergunta_pt":"Socorro!","dica":"rélp"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am lost","pergunta_pt":"Estou perdido","dica":"aim lóst"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Call the police","pergunta_pt":"Chame a polícia","dica":"kól dâ pâ-lís"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the hospital","pergunta_pt":"o hospital","dica":"dâ rós-pi-tâl"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I do not speak English well","pergunta_pt":"Eu não falo inglês bem","dica":"ai du nót spík ín-glich uél"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você não sabe onde está. O que você diz?","alternativas":[
        {"texto":"I am lost","correta":true},{"texto":"I am late","correta":false},
        {"texto":"I am busy","correta":false},{"texto":"I am sick","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Alguém fala rápido demais. O que você diz?","alternativas":[
        {"texto":"I am lost","correta":false},{"texto":"Call the police","correta":false},
        {"texto":"I do not speak English well","correta":true},{"texto":"I am busy","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu preciso de ajuda, por favor.","resposta":"I need help please"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Where is the hospital","audio_texto":"Where is the hospital?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Estou perdido, você pode me ajudar?","resposta":"I am lost can you help me"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I need help, please.","pergunta_pt":"Eu preciso de ajuda, por favor.","resposta":"I need help please"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 9;
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
  update english_modulos set publicado = true where numero = 9;
end
$seed$;
