-- =============================================================
-- EKBALLO ENGLISH · Módulo 7 · Fé e vida diária
--
-- O módulo em que o vocabulário da fé deixa de ser enfeite e vira
-- língua de uso: orar, agradecer, servir, ler a Palavra e falar de
-- Jesus para alguém. É o coração do projeto — inglês com propósito,
-- não inglês genérico.
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
    "numero": 1, "slug": "talking-to-god", "titulo": "Talking to God", "titulo_pt": "Falando com Deus",
    "objetivo": "Orar em inglês com palavras simples e suas.",
    "versiculo_ref": "Philippians 4:6", "versiculo_en": "In everything, by prayer, let your requests be made known to God.",
    "versiculo_pt": "Em tudo sejam os vossos pedidos conhecidos diante de Deus pela oração.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to pray","pergunta_pt":"orar","dica":"tu prêi","imagem":"/english/praying-hands.png"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Thank you, Lord","pergunta_pt":"Obrigado, Senhor","dica":"tênk iú lórd"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Help me, God","pergunta_pt":"Ajuda-me, Deus","dica":"rélp mi gód"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I praise you","pergunta_pt":"Eu te louvo","dica":"ai prêiz iú"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Amen","pergunta_pt":"Amém","dica":"êi-mén"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como se diz: orar?","alternativas":[
        {"texto":"to praise","correta":false},{"texto":"to pray","correta":true},
        {"texto":"to play","correta":false},{"texto":"to preach","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Você quer agradecer a Deus. O que você diz?","alternativas":[
        {"texto":"Help me, God","correta":false},{"texto":"Thank you, Lord","correta":true},
        {"texto":"Where are you, God","correta":false},{"texto":"I do not know","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu oro todo dia.","resposta":"I pray every day"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Let us pray together","audio_texto":"Let us pray together."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Obrigado, Senhor, por este dia","resposta":"Thank you Lord for this day"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Thank you, Lord.","pergunta_pt":"Obrigado, Senhor.","resposta":"Thank you Lord"}
    ]
  },
  {
    "numero": 2, "slug": "words-of-faith", "titulo": "Words of faith", "titulo_pt": "Palavras da fé",
    "objetivo": "Nomear em inglês as palavras centrais do evangelho.",
    "versiculo_ref": "1 Corinthians 13:13", "versiculo_en": "Faith, hope and love remain, and the greatest is love.",
    "versiculo_pt": "Permanecem a fé, a esperança e o amor; o maior deles é o amor.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"faith","pergunta_pt":"fé","dica":"fêith"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"hope","pergunta_pt":"esperança","dica":"rôup"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"love","pergunta_pt":"amor","dica":"lâv"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"grace","pergunta_pt":"graça","dica":"grêis"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God is love","pergunta_pt":"Deus é amor","dica":"gód iz lâv"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual palavra significa: graça?","alternativas":[
        {"texto":"faith","correta":false},{"texto":"hope","correta":false},
        {"texto":"grace","correta":true},{"texto":"love","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Deus é amor?","alternativas":[
        {"texto":"God is love","correta":true},{"texto":"God love is","correta":false},
        {"texto":"Love is God have","correta":false},{"texto":"God has love is","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu tenho fé.","resposta":"I have faith"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Faith hope and love","audio_texto":"Faith, hope and love."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"A graça de Deus é suficiente","resposta":"The grace of God is enough"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"God is love.","pergunta_pt":"Deus é amor.","resposta":"God is love"}
    ]
  },
  {
    "numero": 3, "slug": "my-church", "titulo": "My church", "titulo_pt": "Minha igreja",
    "objetivo": "Falar do seu lugar na igreja e do que você faz nela.",
    "versiculo_ref": "Hebrews 10:25", "versiculo_en": "Let us not give up meeting together.",
    "versiculo_pt": "Não deixemos de nos reunir.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to worship","pergunta_pt":"adorar","dica":"tu uâr-chip","imagem":"/english/church.png"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to sing","pergunta_pt":"cantar","dica":"tu sing"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to serve","pergunta_pt":"servir","dica":"tu sârv"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"my brothers and sisters","pergunta_pt":"meus irmãos e irmãs","dica":"mai brá-dârs end sís-târs"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I serve in my church","pergunta_pt":"Eu sirvo na minha igreja","dica":"ai sârv in mai tchârtch"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual verbo significa: servir?","alternativas":[
        {"texto":"to sing","correta":false},{"texto":"to serve","correta":true},
        {"texto":"to worship","correta":false},{"texto":"to see","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você chama os membros da sua igreja?","alternativas":[
        {"texto":"my teachers","correta":false},{"texto":"my students","correta":false},
        {"texto":"my brothers and sisters","correta":true},{"texto":"my friends only","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu sirvo na minha igreja.","resposta":"I serve in my church"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"We sing and worship together","audio_texto":"We sing and worship together."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu amo a minha igreja","resposta":"I love my church"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I serve in my church.","pergunta_pt":"Eu sirvo na minha igreja.","resposta":"I serve in my church"}
    ]
  },
  {
    "numero": 4, "slug": "gratitude", "titulo": "Gratitude", "titulo_pt": "Gratidão",
    "objetivo": "Agradecer por coisas concretas, não só de forma genérica.",
    "versiculo_ref": "1 Thessalonians 5:18", "versiculo_en": "Give thanks in all circumstances.",
    "versiculo_pt": "Em tudo dai graças.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am thankful for","pergunta_pt":"Eu sou grato por","dica":"aim thénk-fâl fór"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"a blessing","pergunta_pt":"uma bênção","dica":"â blé-sing"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"a gift","pergunta_pt":"um presente, um dom","dica":"â guift"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God is good to me","pergunta_pt":"Deus é bom comigo","dica":"gód iz gud tu mi"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"every good gift","pergunta_pt":"toda boa dádiva","dica":"év-ri gud guift"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você começa a dizer por que é grato?","alternativas":[
        {"texto":"I am thankful for","correta":true},{"texto":"I am thankful because you","correta":false},
        {"texto":"Thankful I am for","correta":false},{"texto":"I thank for am","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual palavra significa: bênção?","alternativas":[
        {"texto":"gift","correta":false},{"texto":"grace","correta":false},
        {"texto":"blessing","correta":true},{"texto":"faith","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu sou grato pela minha família.","resposta":"I am thankful for my family","aceitas":["im thankful for my family"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"God is good to me","audio_texto":"God is good to me."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu sou grato por este dia","resposta":"I am thankful for this day"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I am thankful for my family.","pergunta_pt":"Eu sou grato pela minha família.","resposta":"I am thankful for my family"}
    ]
  },
  {
    "numero": 5, "slug": "the-word", "titulo": "The Word", "titulo_pt": "A Palavra",
    "objetivo": "Falar da Bíblia: ler, aprender e obedecer.",
    "versiculo_ref": "Psalm 119:105", "versiculo_en": "Your word is a lamp to my feet.",
    "versiculo_pt": "Lâmpada para os meus pés é a tua palavra.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the Bible","pergunta_pt":"a Bíblia","dica":"dâ bái-bou","imagem":"/english/bible.png"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"a verse","pergunta_pt":"um versículo","dica":"â vârs"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to read","pergunta_pt":"ler","dica":"tu ríd"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to learn","pergunta_pt":"aprender","dica":"tu lârn"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I read the Bible every morning","pergunta_pt":"Eu leio a Bíblia toda manhã","dica":"ai ríd dâ bái-bou év-ri mór-ning"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual palavra significa: versículo?","alternativas":[
        {"texto":"word","correta":false},{"texto":"verse","correta":true},
        {"texto":"book","correta":false},{"texto":"page","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Eu leio a Bíblia?","alternativas":[
        {"texto":"I reading the Bible","correta":false},{"texto":"I am read the Bible","correta":false},
        {"texto":"I read the Bible","correta":true},{"texto":"I read Bible the","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu quero aprender a Palavra.","resposta":"I want to learn the Word"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I read the Bible every morning","audio_texto":"I read the Bible every morning."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"A tua palavra é verdade","resposta":"Your word is truth"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I read the Bible every morning.","pergunta_pt":"Eu leio a Bíblia toda manhã.","resposta":"I read the Bible every morning"}
    ]
  },
  {
    "numero": 6, "slug": "sharing-faith", "titulo": "Sharing faith", "titulo_pt": "Compartilhando a fé",
    "objetivo": "Falar de Jesus para alguém em inglês, com frases simples.",
    "versiculo_ref": "Mark 16:15", "versiculo_en": "Go into all the world and preach the good news.",
    "versiculo_pt": "Ide por todo o mundo e pregai o evangelho.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Jesus loves you","pergunta_pt":"Jesus ama você","dica":"djí-zâs lâvs iú"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God is faithful","pergunta_pt":"Deus é fiel","dica":"gód iz fêith-fâl"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to believe","pergunta_pt":"crer","dica":"tu bi-lív"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Can I pray for you?","pergunta_pt":"Posso orar por você?","dica":"quén ai prêi fór iú"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God changed my life","pergunta_pt":"Deus mudou a minha vida","dica":"gód tchêindjd mai láif"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você quer orar por alguém. O que você pergunta?","alternativas":[
        {"texto":"Can I pray for you?","correta":true},{"texto":"Do you pray me?","correta":false},
        {"texto":"I pray you?","correta":false},{"texto":"Pray can for you I?","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Deus é fiel?","alternativas":[
        {"texto":"God is faith","correta":false},{"texto":"God is faithful","correta":true},
        {"texto":"God has faithful","correta":false},{"texto":"Faithful God is the","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Jesus ama você.","resposta":"Jesus loves you"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"God changed my life","audio_texto":"God changed my life."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a pergunta","pergunta_pt":"Posso orar por você?","resposta":"Can I pray for you"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Jesus loves you.","pergunta_pt":"Jesus ama você.","resposta":"Jesus loves you"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 7;
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
  update english_modulos set publicado = true where numero = 7;
end
$seed$;
