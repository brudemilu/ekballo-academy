-- =============================================================
-- EKBALLO ENGLISH · Módulo 12 · Projeto final
--
-- Não traz vocabulário novo de propósito: é a costura. O aluno
-- retoma tudo o que aprendeu e monta a sua própria apresentação —
-- quem ele é, de onde vem, no que crê, o que quer da vida e o que
-- Deus fez nele. Termina falando de si por vários minutos, em
-- inglês, sem travar. Esse era o objetivo desde a primeira lição.
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
    "numero": 1, "slug": "who-i-am", "titulo": "Who I am", "titulo_pt": "Quem eu sou",
    "objetivo": "Abrir a sua apresentação com firmeza.",
    "versiculo_ref": "Ephesians 2:10", "versiculo_en": "We are his workmanship, created in Christ Jesus.",
    "versiculo_pt": "Somos feitura sua, criados em Cristo Jesus.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Let me introduce myself","pergunta_pt":"Deixa eu me apresentar","dica":"lét mi in-trâ-diús mai-sélf"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am twenty years old","pergunta_pt":"Eu tenho vinte anos","dica":"aim tuén-ti iírs ôuld"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I was born in Brazil","pergunta_pt":"Eu nasci no Brasil","dica":"ai uóz bórn in bra-zíl"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am a child of God","pergunta_pt":"Eu sou filho de Deus","dica":"aim â tcháild âv gód"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"This is who I am","pergunta_pt":"Isto é quem eu sou","dica":"dis iz rú ai ém"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você abre uma apresentação formal?","alternativas":[
        {"texto":"Let me introduce myself","correta":true},{"texto":"Introduce me myself let","correta":false},
        {"texto":"I am introduce","correta":false},{"texto":"Myself let introduce","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Eu nasci no Brasil?","alternativas":[
        {"texto":"I am born in Brazil","correta":false},{"texto":"I was born in Brazil","correta":true},
        {"texto":"I born Brazil in","correta":false},{"texto":"I have born in Brazil","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu sou filho de Deus.","resposta":"I am a child of God","aceitas":["im a child of god"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Let me introduce myself","audio_texto":"Let me introduce myself."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu nasci no Brasil e moro aqui","resposta":"I was born in Brazil and I live here"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Let me introduce myself.","pergunta_pt":"Deixa eu me apresentar.","resposta":"Let me introduce myself"}
    ]
  },
  {
    "numero": 2, "slug": "my-family-and-my-home", "titulo": "My family and my home", "titulo_pt": "Minha família e minha casa",
    "objetivo": "Falar dos seus com naturalidade, não só listando nomes.",
    "versiculo_ref": "Psalm 68:6", "versiculo_en": "God sets the lonely in families.",
    "versiculo_pt": "Deus faz o solitário viver em família.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I have a big family","pergunta_pt":"Eu tenho uma família grande","dica":"ai rév â big fé-mi-li"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"We live together","pergunta_pt":"Nós moramos juntos","dica":"uí liv tu-gué-dâr","imagem":"/english/house.png"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My parents taught me","pergunta_pt":"Meus pais me ensinaram","dica":"mai pé-rânts tót mi"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"We pray together every night","pergunta_pt":"Nós oramos juntos toda noite","dica":"uí prêi tu-gué-dâr"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My home is a happy place","pergunta_pt":"Minha casa é um lugar feliz","dica":"mai rôum iz â rép-i plêis"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como se diz: Nós moramos juntos?","alternativas":[
        {"texto":"We live together","correta":true},{"texto":"We living together","correta":false},
        {"texto":"We are live together","correta":false},{"texto":"Together we living are","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase fala do que a família te formou?","alternativas":[
        {"texto":"My parents taught me","correta":true},{"texto":"I have a big family","correta":false},
        {"texto":"We live together","correta":false},{"texto":"My home is small","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Nós oramos juntos toda noite.","resposta":"We pray together every night"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"My home is a happy place","audio_texto":"My home is a happy place."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu tenho uma família grande e nós moramos juntos","resposta":"I have a big family and we live together"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"We pray together every night.","pergunta_pt":"Nós oramos juntos toda noite.","resposta":"We pray together every night"}
    ]
  },
  {
    "numero": 3, "slug": "my-faith", "titulo": "My faith", "titulo_pt": "Minha fé",
    "objetivo": "Dizer no que você crê, em inglês, sem decorar fórmula.",
    "versiculo_ref": "2 Timothy 1:12", "versiculo_en": "I know whom I have believed.",
    "versiculo_pt": "Sei em quem tenho crido.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I believe in Jesus","pergunta_pt":"Eu creio em Jesus","dica":"ai bi-lív in djí-zâs"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My faith is my foundation","pergunta_pt":"Minha fé é o meu fundamento","dica":"mai fêith iz mai faun-dêi-chân"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God is with me","pergunta_pt":"Deus está comigo","dica":"gód iz uid mi"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I read the Bible and I pray","pergunta_pt":"Eu leio a Bíblia e oro","dica":"ai ríd dâ bái-bou end ai prêi","imagem":"/english/bible.png"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My church is my family","pergunta_pt":"Minha igreja é minha família","dica":"mai tchârtch iz mai fé-mi-li","imagem":"/english/church.png"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como se diz: Eu creio em Jesus?","alternativas":[
        {"texto":"I believe Jesus in","correta":false},{"texto":"I am believe in Jesus","correta":false},
        {"texto":"I believe in Jesus","correta":true},{"texto":"Believe I in Jesus","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase fala da prática diária da fé?","alternativas":[
        {"texto":"I read the Bible and I pray","correta":true},{"texto":"God is with me","correta":false},
        {"texto":"I believe in Jesus","correta":false},{"texto":"My faith is my foundation","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Deus está comigo todo dia.","resposta":"God is with me every day"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"My church is my family","audio_texto":"My church is my family."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Minha fé é o meu fundamento","resposta":"My faith is my foundation"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I believe in Jesus.","pergunta_pt":"Eu creio em Jesus.","resposta":"I believe in Jesus"}
    ]
  },
  {
    "numero": 4, "slug": "my-purpose", "titulo": "My purpose", "titulo_pt": "Meu propósito",
    "objetivo": "Falar do que você quer fazer da vida e por quê.",
    "versiculo_ref": "Romans 8:28", "versiculo_en": "God works all things together for good.",
    "versiculo_pt": "Todas as coisas contribuem juntamente para o bem.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"my purpose","pergunta_pt":"meu propósito","dica":"mai pâr-pâs"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I want to serve people","pergunta_pt":"Eu quero servir as pessoas","dica":"ai uónt tu sârv pí-pâl"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God called me","pergunta_pt":"Deus me chamou","dica":"gód kóld mi"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"my dream is to teach","pergunta_pt":"meu sonho é ensinar","dica":"mai drím iz tu títch"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I want to make a difference","pergunta_pt":"Eu quero fazer diferença","dica":"ai uónt tu mêik â dí-fâ-râns"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual frase fala de chamado?","alternativas":[
        {"texto":"God called me","correta":true},{"texto":"I called God","correta":false},
        {"texto":"God is calling to me the","correta":false},{"texto":"Called me God have","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Eu quero fazer diferença?","alternativas":[
        {"texto":"I want make difference","correta":false},{"texto":"I want to make a difference","correta":true},
        {"texto":"I am want a difference","correta":false},{"texto":"Difference I want make to","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu quero servir as pessoas.","resposta":"I want to serve people"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I want to make a difference","audio_texto":"I want to make a difference."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Deus me chamou para servir","resposta":"God called me to serve"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I want to make a difference.","pergunta_pt":"Eu quero fazer diferença.","resposta":"I want to make a difference"}
    ]
  },
  {
    "numero": 5, "slug": "my-testimony", "titulo": "My testimony", "titulo_pt": "Meu testemunho",
    "objetivo": "Contar em inglês o antes, o encontro e o depois.",
    "versiculo_ref": "John 9:25", "versiculo_en": "One thing I know: I was blind, but now I see.",
    "versiculo_pt": "Uma coisa sei: eu era cego e agora vejo.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Before I met Jesus","pergunta_pt":"Antes de eu conhecer Jesus","dica":"bi-fór ai mét djí-zâs"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"my life was empty","pergunta_pt":"minha vida era vazia","dica":"mai láif uóz émp-ti"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Then everything changed","pergunta_pt":"Então tudo mudou","dica":"dén év-ri-thing tchêindjd"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Now I have hope","pergunta_pt":"Agora eu tenho esperança","dica":"náu ai rév rôup"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"This is my testimony","pergunta_pt":"Este é o meu testemunho","dica":"dis iz mai tés-ti-mou-ni"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual é a ordem de um testemunho?","alternativas":[
        {"texto":"Antes, o encontro, o depois","correta":true},{"texto":"Depois, antes, o preço","correta":false},
        {"texto":"O encontro, o ônibus, antes","correta":false},{"texto":"Depois, o hotel, antes","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase marca a virada?","alternativas":[
        {"texto":"Then everything changed","correta":true},{"texto":"My life was empty","correta":false},
        {"texto":"Before I met Jesus","correta":false},{"texto":"I have a big family","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Agora eu tenho esperança.","resposta":"Now I have hope"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"This is my testimony","audio_texto":"This is my testimony."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Antes de eu conhecer Jesus, minha vida era vazia","resposta":"Before I met Jesus my life was empty"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"This is my testimony.","pergunta_pt":"Este é o meu testemunho.","resposta":"This is my testimony"}
    ]
  },
  {
    "numero": 6, "slug": "my-final-presentation", "titulo": "My final presentation", "titulo_pt": "Minha apresentação final",
    "objetivo": "Falar de você por vários minutos, em inglês, sem travar. Era isto desde a primeira lição.",
    "versiculo_ref": "Colossians 3:17", "versiculo_en": "Whatever you do in word or deed, do all in the name of the Lord.",
    "versiculo_pt": "Tudo o que fizerdes por palavra ou por obra, fazei tudo em nome do Senhor.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Good morning, everyone","pergunta_pt":"Bom dia a todos","dica":"gud mór-ning év-ri-uan"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My name is Ana and I am from Brazil","pergunta_pt":"Meu nome é Ana e eu sou do Brasil","dica":"mai nêim iz"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I believe in Jesus and I serve in my church","pergunta_pt":"Eu creio em Jesus e sirvo na minha igreja","dica":"ai bi-lív in djí-zâs"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My purpose is to serve people","pergunta_pt":"Meu propósito é servir as pessoas","dica":"mai pâr-pâs iz tu sârv"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Thank you for listening to me","pergunta_pt":"Obrigado por me ouvir","dica":"tênk iú fór lí-sâ-ning tu mi"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você abre uma apresentação para um grupo?","alternativas":[
        {"texto":"Good morning, everyone","correta":true},{"texto":"Where is the bus?","correta":false},
        {"texto":"How much is it?","correta":false},{"texto":"I am lost","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você encerra?","alternativas":[
        {"texto":"Thank you for listening to me","correta":true},{"texto":"I do not know","correta":false},
        {"texto":"Can you repeat, please?","correta":false},{"texto":"Just a moment","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Meu propósito é servir as pessoas.","resposta":"My purpose is to serve people"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Thank you for listening to me","audio_texto":"Thank you for listening to me."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu creio em Jesus e sirvo na minha igreja","resposta":"I believe in Jesus and I serve in my church"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta a sua apresentação","pergunta":"Good morning, everyone. My name is Ana and I am from Brazil.","pergunta_pt":"Bom dia a todos. Meu nome é Ana e eu sou do Brasil.","resposta":"Good morning everyone my name is Ana and I am from Brazil"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 12;
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
  update english_modulos set publicado = true where numero = 12;
end
$seed$;
