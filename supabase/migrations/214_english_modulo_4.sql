-- =============================================================
-- EKBALLO ENGLISH · Módulo 4 · Sentimentos e ações
--
-- Mesma estrutura dos anteriores: 6 lições, cada uma com 5 cartões
-- de vocabulário (ensinam, não avaliam) e 6 avaliados — 2 escolha,
-- 1 tradução, 1 ditado, 1 montar frase, 1 fala.
--
-- É o módulo em que o aluno para de só nomear coisas e começa a
-- dizer o que sente e o que faz: emoção, capacidade (can), ação em
-- curso, verbos do dia a dia e o primeiro passado.
--
-- Áudio gerado depois por scripts/gerar-audios-english.mjs.
-- =============================================================

do $seed$
declare
  v_modulo_id uuid; v_licao_id uuid; lic jsonb; ex jsonb;
  licoes jsonb := $j$
[
  {
    "numero": 1, "slug": "how-i-feel", "titulo": "How I feel", "titulo_pt": "Como eu me sinto",
    "objetivo": "Dizer como você está se sentindo, além de bem ou mal.",
    "versiculo_ref": "Psalm 34:18", "versiculo_en": "The Lord is near to the brokenhearted.",
    "versiculo_pt": "Perto está o Senhor dos que têm o coração quebrantado.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"happy","pergunta_pt":"feliz","dica":"rép-i","imagem":"/english/happy-face.png"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"sad","pergunta_pt":"triste","dica":"séd"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"angry","pergunta_pt":"bravo","dica":"én-gri"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"afraid","pergunta_pt":"com medo","dica":"â-frêid"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I feel better today","pergunta_pt":"Eu me sinto melhor hoje","dica":"ai fíl bé-târ tu-dêi"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você recebeu uma notícia muito boa. Como se sente?","alternativas":[
        {"texto":"I am sad","correta":false},{"texto":"I am happy","correta":true},
        {"texto":"I am afraid","correta":false},{"texto":"I am angry","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual palavra significa: com medo?","alternativas":[
        {"texto":"angry","correta":false},{"texto":"sad","correta":false},
        {"texto":"afraid","correta":true},{"texto":"happy","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu estou triste hoje.","resposta":"I am sad today","aceitas":["im sad today"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I feel better today","audio_texto":"I feel better today."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Não tenha medo","resposta":"Do not be afraid"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I feel happy today.","pergunta_pt":"Eu me sinto feliz hoje.","resposta":"I feel happy today"}
    ]
  },
  {
    "numero": 2, "slug": "i-can", "titulo": "I can", "titulo_pt": "Eu consigo",
    "objetivo": "Dizer o que você sabe fazer e o que ainda não sabe.",
    "versiculo_ref": "Philippians 4:13", "versiculo_en": "I can do all things through Christ.",
    "versiculo_pt": "Posso todas as coisas em Cristo.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I can","pergunta_pt":"Eu consigo, eu sei","dica":"ai quén"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I cannot","pergunta_pt":"Eu não consigo","dica":"ai quén-ót"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I can sing","pergunta_pt":"Eu sei cantar","dica":"ai quén sing"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I can swim","pergunta_pt":"Eu sei nadar","dica":"ai quén suím"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Can you help me?","pergunta_pt":"Você pode me ajudar?","dica":"quén iú rélp mi"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você diz que NÃO sabe dirigir?","alternativas":[
        {"texto":"I can drive","correta":false},{"texto":"I not can drive","correta":false},
        {"texto":"I cannot drive","correta":true},{"texto":"I do not can drive","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Você precisa de ajuda. O que você pergunta?","alternativas":[
        {"texto":"Can you help me?","correta":true},{"texto":"You help me","correta":false},
        {"texto":"I can help you?","correta":false},{"texto":"Help you me?","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu sei cantar.","resposta":"I can sing"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I can speak English","audio_texto":"I can speak English."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a pergunta","pergunta_pt":"Você pode me ajudar?","resposta":"Can you help me"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I can speak English.","pergunta_pt":"Eu sei falar inglês.","resposta":"I can speak English"}
    ]
  },
  {
    "numero": 3, "slug": "what-i-am-doing", "titulo": "What I am doing", "titulo_pt": "O que eu estou fazendo",
    "objetivo": "Contar o que está acontecendo agora, neste momento.",
    "versiculo_ref": "Isaiah 43:19", "versiculo_en": "I am doing a new thing.",
    "versiculo_pt": "Eis que faço uma coisa nova.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am eating","pergunta_pt":"Eu estou comendo","dica":"aim í-ting"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am working","pergunta_pt":"Eu estou trabalhando","dica":"aim uâr-king"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am reading","pergunta_pt":"Eu estou lendo","dica":"aim rí-ding"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am studying English","pergunta_pt":"Eu estou estudando inglês","dica":"aim stâ-di-ing ín-glich"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"right now","pergunta_pt":"agora mesmo","dica":"ráit náu"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você está com o livro aberto neste momento. O que você diz?","alternativas":[
        {"texto":"I read","correta":false},{"texto":"I am reading","correta":true},
        {"texto":"I reading","correta":false},{"texto":"I am read","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase significa: Eu estou trabalhando agora?","alternativas":[
        {"texto":"I work now","correta":false},{"texto":"I am work now","correta":false},
        {"texto":"I am working right now","correta":true},{"texto":"I working now","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu estou comendo.","resposta":"I am eating","aceitas":["im eating"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I am studying English","audio_texto":"I am studying English."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu estou aprendendo agora mesmo","resposta":"I am learning right now"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I am studying English.","pergunta_pt":"Eu estou estudando inglês.","resposta":"I am studying English"}
    ]
  },
  {
    "numero": 4, "slug": "verbs-every-day", "titulo": "Verbs every day", "titulo_pt": "Verbos do dia a dia",
    "objetivo": "Usar os cinco verbos que aparecem em quase toda conversa.",
    "versiculo_ref": "Matthew 11:28", "versiculo_en": "Come to me, and I will give you rest.",
    "versiculo_pt": "Vinde a mim, e eu vos aliviarei.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to go","pergunta_pt":"ir","dica":"tu gôu"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to come","pergunta_pt":"vir","dica":"tu câm"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to see","pergunta_pt":"ver","dica":"tu sí"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to give","pergunta_pt":"dar","dica":"tu guiv"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"to help","pergunta_pt":"ajudar","dica":"tu rélp"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual verbo significa: ajudar?","alternativas":[
        {"texto":"to see","correta":false},{"texto":"to give","correta":false},
        {"texto":"to help","correta":true},{"texto":"to come","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Eu vou para a escola?","alternativas":[
        {"texto":"I go to school","correta":true},{"texto":"I come to school","correta":false},
        {"texto":"I see to school","correta":false},{"texto":"I to go school","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu ajudo a minha mãe.","resposta":"I help my mother"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I want to help you","audio_texto":"I want to help you."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Venha e veja","resposta":"Come and see"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I want to help you.","pergunta_pt":"Eu quero te ajudar.","resposta":"I want to help you"}
    ]
  },
  {
    "numero": 5, "slug": "yesterday", "titulo": "Yesterday", "titulo_pt": "Ontem",
    "objetivo": "Falar de algo que já passou, sem medo do passado.",
    "versiculo_ref": "Hebrews 13:8", "versiculo_en": "Jesus Christ is the same yesterday and today.",
    "versiculo_pt": "Jesus Cristo é o mesmo ontem e hoje.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"yesterday","pergunta_pt":"ontem","dica":"iés-târ-dêi"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I was happy","pergunta_pt":"Eu estava feliz","dica":"ai uóz rép-i"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I went","pergunta_pt":"Eu fui","dica":"ai uênt"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I saw","pergunta_pt":"Eu vi","dica":"ai só"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"last week","pergunta_pt":"semana passada","dica":"lést uík"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você diz que foi à igreja ontem?","alternativas":[
        {"texto":"I go to church yesterday","correta":false},{"texto":"I went to church yesterday","correta":true},
        {"texto":"I am going to church yesterday","correta":false},{"texto":"I was go to church","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual é o passado de: I see?","alternativas":[
        {"texto":"I seed","correta":false},{"texto":"I sawed","correta":false},
        {"texto":"I saw","correta":true},{"texto":"I seen","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu estava feliz ontem.","resposta":"I was happy yesterday"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I went to school yesterday","audio_texto":"I went to school yesterday."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu vi meu amigo semana passada","resposta":"I saw my friend last week"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I went to church yesterday.","pergunta_pt":"Eu fui à igreja ontem.","resposta":"I went to church yesterday"}
    ]
  },
  {
    "numero": 6, "slug": "feelings-and-faith", "titulo": "Feelings and faith", "titulo_pt": "Sentimento e fé",
    "objetivo": "Dizer em inglês o que a fé faz com o que você sente.",
    "versiculo_ref": "Psalm 56:3", "versiculo_en": "When I am afraid, I will trust in you.",
    "versiculo_pt": "Quando eu tiver medo, confiarei em ti.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I trust God","pergunta_pt":"Eu confio em Deus","dica":"ai trâst gód","imagem":"/english/praying-hands.png"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am thankful","pergunta_pt":"Eu sou grato","dica":"aim thénk-fâl"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"peace","pergunta_pt":"paz","dica":"pís"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"hope","pergunta_pt":"esperança","dica":"rôup"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God gives me peace","pergunta_pt":"Deus me dá paz","dica":"gód guivs mi pís"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual palavra significa: esperança?","alternativas":[
        {"texto":"peace","correta":false},{"texto":"hope","correta":true},
        {"texto":"faith","correta":false},{"texto":"love","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Você está com medo, mas confia. O que você diz?","alternativas":[
        {"texto":"I am afraid and I trust God","correta":true},{"texto":"I am afraid God","correta":false},
        {"texto":"I trust afraid","correta":false},{"texto":"God is afraid","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu sou grato.","resposta":"I am thankful","aceitas":["im thankful"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"God gives me peace","audio_texto":"God gives me peace."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu confio em Deus todo dia","resposta":"I trust God every day"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I trust God.","pergunta_pt":"Eu confio em Deus.","resposta":"I trust God"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 4;
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
  update english_modulos set publicado = true where numero = 4;
end
$seed$;
