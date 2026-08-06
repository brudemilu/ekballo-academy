-- =============================================================
-- EKBALLO ENGLISH · Módulo 8 · Expressão pessoal
--
-- Aqui o aluno para de só informar e começa a se POSICIONAR:
-- preferir, achar, querer, descrever gente e coisa. É a diferença
-- entre saber inglês e ter voz em inglês.
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
    "numero": 1, "slug": "i-prefer", "titulo": "I prefer", "titulo_pt": "Eu prefiro",
    "objetivo": "Escolher entre duas coisas e dizer o seu favorito.",
    "versiculo_ref": "Joshua 24:15", "versiculo_en": "Choose this day whom you will serve.",
    "versiculo_pt": "Escolhei hoje a quem sirvais.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I prefer","pergunta_pt":"Eu prefiro","dica":"ai pri-fâr"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"my favorite","pergunta_pt":"meu favorito","dica":"mai fêi-vâ-rit"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"better","pergunta_pt":"melhor","dica":"bé-târ"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Which one do you like?","pergunta_pt":"De qual você gosta?","dica":"uítch uan du iú láik"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I prefer coffee","pergunta_pt":"Eu prefiro café","dica":"ai pri-fâr kó-fi"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você diz que gosta mais de café do que de chá?","alternativas":[
        {"texto":"I prefer coffee","correta":true},{"texto":"I prefer to coffee","correta":false},
        {"texto":"I am prefer coffee","correta":false},{"texto":"Coffee I prefer am","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual palavra significa: favorito?","alternativas":[
        {"texto":"better","correta":false},{"texto":"favorite","correta":true},
        {"texto":"prefer","correta":false},{"texto":"which","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Essa é a minha música favorita.","resposta":"This is my favorite song"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Which one do you like","audio_texto":"Which one do you like?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu prefiro ler à noite","resposta":"I prefer to read at night"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I prefer coffee.","pergunta_pt":"Eu prefiro café.","resposta":"I prefer coffee"}
    ]
  },
  {
    "numero": 2, "slug": "i-think", "titulo": "I think", "titulo_pt": "Eu acho",
    "objetivo": "Dar a sua opinião sem soar agressivo nem inseguro.",
    "versiculo_ref": "Philippians 4:8", "versiculo_en": "Think on whatever is true and noble.",
    "versiculo_pt": "Pensai em tudo o que é verdadeiro e honesto.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I think","pergunta_pt":"Eu acho, eu penso","dica":"ai thínk"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I believe","pergunta_pt":"Eu creio, eu acredito","dica":"ai bi-lív"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"In my opinion","pergunta_pt":"Na minha opinião","dica":"in mai â-pí-niân"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am not sure","pergunta_pt":"Eu não tenho certeza","dica":"aim nót chúr"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What do you think?","pergunta_pt":"O que você acha?","dica":"uót du iú thínk"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você quer dar sua opinião com cuidado. Como começa?","alternativas":[
        {"texto":"You are wrong","correta":false},{"texto":"In my opinion","correta":true},
        {"texto":"I know everything","correta":false},{"texto":"No","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Você não tem certeza. O que você diz?","alternativas":[
        {"texto":"I am sure","correta":false},{"texto":"Of course","correta":false},
        {"texto":"I am not sure","correta":true},{"texto":"I believe always","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu acho que é uma boa ideia.","resposta":"I think it is a good idea","aceitas":["i think its a good idea"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"What do you think","audio_texto":"What do you think?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Na minha opinião, isso é verdade","resposta":"In my opinion this is true"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"What do you think?","pergunta_pt":"O que você acha?","resposta":"What do you think"}
    ]
  },
  {
    "numero": 3, "slug": "i-want-to", "titulo": "I want to", "titulo_pt": "Eu quero",
    "objetivo": "Falar de vontade, desejo e esperança para o futuro.",
    "versiculo_ref": "Psalm 37:4", "versiculo_en": "He will give you the desires of your heart.",
    "versiculo_pt": "Ele te concederá os desejos do teu coração.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I want to learn","pergunta_pt":"Eu quero aprender","dica":"ai uónt tu lârn"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I would like to travel","pergunta_pt":"Eu gostaria de viajar","dica":"aid láik tu trá-vâl"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I hope to","pergunta_pt":"Eu espero","dica":"ai rôup tu"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"a dream","pergunta_pt":"um sonho","dica":"â drím"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"one day","pergunta_pt":"um dia","dica":"uan dêi"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual frase é mais educada para dizer o que você quer?","alternativas":[
        {"texto":"Give me water","correta":false},{"texto":"I would like some water","correta":true},
        {"texto":"Water I want now","correta":false},{"texto":"You give water","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Eu quero aprender inglês?","alternativas":[
        {"texto":"I want learn English","correta":false},{"texto":"I want to learn English","correta":true},
        {"texto":"I am want to learn English","correta":false},{"texto":"I to want learn English","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu quero aprender inglês.","resposta":"I want to learn English"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I hope to travel one day","audio_texto":"I hope to travel one day."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu gostaria de servir a Deus","resposta":"I would like to serve God"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I want to learn English.","pergunta_pt":"Eu quero aprender inglês.","resposta":"I want to learn English"}
    ]
  },
  {
    "numero": 4, "slug": "describing-people", "titulo": "Describing people", "titulo_pt": "Descrevendo pessoas",
    "objetivo": "Dizer como alguém é, além de bonito ou feio.",
    "versiculo_ref": "1 Samuel 16:7", "versiculo_en": "The Lord looks at the heart.",
    "versiculo_pt": "O Senhor olha para o coração.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"kind","pergunta_pt":"gentil, bondoso","dica":"káind"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"funny","pergunta_pt":"engraçado","dica":"fâ-ni"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"strong","pergunta_pt":"forte","dica":"stróng"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"patient","pergunta_pt":"paciente","dica":"pêi-chânt"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"She is very kind","pergunta_pt":"Ela é muito gentil","dica":"chí iz vé-ri káind"},
      {"ordem":6,"tipo":"escolha","enunciado":"Alguém sempre ajuda os outros. Como você descreve?","alternativas":[
        {"texto":"He is funny","correta":false},{"texto":"He is kind","correta":true},
        {"texto":"He is strong","correta":false},{"texto":"He is tired","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual palavra significa: paciente?","alternativas":[
        {"texto":"patient","correta":true},{"texto":"present","correta":false},
        {"texto":"perfect","correta":false},{"texto":"pastor","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Ela é muito gentil.","resposta":"She is very kind"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"My father is a patient man","audio_texto":"My father is a patient man."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Meu irmão é engraçado e gentil","resposta":"My brother is funny and kind"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"She is very kind.","pergunta_pt":"Ela é muito gentil.","resposta":"She is very kind"}
    ]
  },
  {
    "numero": 5, "slug": "describing-things", "titulo": "Describing things", "titulo_pt": "Descrevendo coisas",
    "objetivo": "Descrever objetos e lugares com adjetivos do dia a dia.",
    "versiculo_ref": "Genesis 1:31", "versiculo_en": "God saw all that he had made, and it was very good.",
    "versiculo_pt": "Viu Deus tudo quanto tinha feito, e era muito bom.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"big","pergunta_pt":"grande","dica":"big"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"small","pergunta_pt":"pequeno","dica":"smól"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"new","pergunta_pt":"novo","dica":"niú"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"old","pergunta_pt":"velho, antigo","dica":"ôuld"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My house is small","pergunta_pt":"Minha casa é pequena","dica":"mai ráus iz smól","imagem":"/english/house.png"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual é o oposto de: big?","alternativas":[
        {"texto":"new","correta":false},{"texto":"old","correta":false},
        {"texto":"small","correta":true},{"texto":"strong","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: uma cidade grande?","alternativas":[
        {"texto":"a city big","correta":false},{"texto":"a big city","correta":true},
        {"texto":"big a city","correta":false},{"texto":"the big of city","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Minha casa é pequena.","resposta":"My house is small"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"This is a beautiful city","audio_texto":"This is a beautiful city."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu tenho um livro novo","resposta":"I have a new book"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"My house is small.","pergunta_pt":"Minha casa é pequena.","resposta":"My house is small"}
    ]
  },
  {
    "numero": 6, "slug": "about-my-life", "titulo": "About my life", "titulo_pt": "Sobre a minha vida",
    "objetivo": "Juntar preferência, opinião e desejo numa fala só sobre você.",
    "versiculo_ref": "Jeremiah 29:11", "versiculo_en": "I know the plans I have for you.",
    "versiculo_pt": "Eu sei os planos que tenho para vós.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My favorite place is my church","pergunta_pt":"Meu lugar favorito é a minha igreja","dica":"mai fêi-vâ-rit plêis"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I think my family is a gift","pergunta_pt":"Eu acho que minha família é um presente","dica":"ai thínk mai fé-mi-li"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I want to serve God","pergunta_pt":"Eu quero servir a Deus","dica":"ai uónt tu sârv gód"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My friends are kind","pergunta_pt":"Meus amigos são gentis","dica":"mai frends ar káind"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"This is my life today","pergunta_pt":"Esta é a minha vida hoje","dica":"dis iz mai láif tu-dêi"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual frase fala de um desejo seu?","alternativas":[
        {"texto":"My friends are kind","correta":false},{"texto":"I want to serve God","correta":true},
        {"texto":"My house is small","correta":false},{"texto":"It is raining","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase dá uma opinião?","alternativas":[
        {"texto":"I think my family is a gift","correta":true},{"texto":"I live in a house","correta":false},
        {"texto":"I am from Brazil","correta":false},{"texto":"I go to school","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu quero servir a Deus.","resposta":"I want to serve God"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"My favorite place is my church","audio_texto":"My favorite place is my church."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu acho que minha família é um presente","resposta":"I think my family is a gift"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I want to serve God.","pergunta_pt":"Eu quero servir a Deus.","resposta":"I want to serve God"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 8;
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
  update english_modulos set publicado = true where numero = 8;
end
$seed$;
