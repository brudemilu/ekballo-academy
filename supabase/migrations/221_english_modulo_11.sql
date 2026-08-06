-- =============================================================
-- EKBALLO ENGLISH · Módulo 11 · Discussão e opinião
--
-- O módulo mais difícil de todos, e o mais formador: concordar,
-- discordar sem brigar, dar motivo, comparar e conversar sobre um
-- problema. Falar inglês é fácil comparado a DISCORDAR em inglês
-- sem soar grosseiro — é isso que se treina aqui.
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
    "numero": 1, "slug": "i-agree", "titulo": "I agree", "titulo_pt": "Eu concordo",
    "objetivo": "Concordar e discordar de forma clara e curta.",
    "versiculo_ref": "Amos 3:3", "versiculo_en": "Can two walk together, unless they are agreed?",
    "versiculo_pt": "Andarão dois juntos, se não estiverem de acordo?",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I agree","pergunta_pt":"Eu concordo","dica":"ai â-grí"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I disagree","pergunta_pt":"Eu discordo","dica":"ai dis-â-grí"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"That is true","pergunta_pt":"Isso é verdade","dica":"déts trú"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am not sure about that","pergunta_pt":"Não tenho certeza disso","dica":"aim nót chúr â-báut dét"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"You are right","pergunta_pt":"Você tem razão","dica":"iú ar ráit"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você pensa igual à pessoa. O que você diz?","alternativas":[
        {"texto":"I disagree","correta":false},{"texto":"I agree","correta":true},
        {"texto":"I am lost","correta":false},{"texto":"Not really","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual é a forma mais suave de discordar?","alternativas":[
        {"texto":"You are wrong","correta":false},{"texto":"No","correta":false},
        {"texto":"I am not sure about that","correta":true},{"texto":"That is stupid","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu concordo com você.","resposta":"I agree with you"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I am not sure about that","audio_texto":"I am not sure about that."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Você tem razão, isso é verdade","resposta":"You are right that is true"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I agree with you.","pergunta_pt":"Eu concordo com você.","resposta":"I agree with you"}
    ]
  },
  {
    "numero": 2, "slug": "giving-reasons", "titulo": "Giving reasons", "titulo_pt": "Dando motivos",
    "objetivo": "Explicar por que você pensa o que pensa.",
    "versiculo_ref": "1 Peter 3:15", "versiculo_en": "Be ready to give a reason for the hope that is in you.",
    "versiculo_pt": "Estai prontos para responder da esperança que há em vós.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"because","pergunta_pt":"porque","dica":"bi-kóz"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"that is why","pergunta_pt":"é por isso que","dica":"déts uái"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"for example","pergunta_pt":"por exemplo","dica":"fór ig-zém-pâl"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the reason is","pergunta_pt":"o motivo é","dica":"dâ rí-zân iz"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"That is why I study","pergunta_pt":"É por isso que eu estudo","dica":"déts uái ai stâ-di"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual expressão introduz um exemplo?","alternativas":[
        {"texto":"because","correta":false},{"texto":"that is why","correta":false},
        {"texto":"for example","correta":true},{"texto":"I agree","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase apresenta a consequência?","alternativas":[
        {"texto":"That is why I study English","correta":true},{"texto":"Because I study English","correta":false},
        {"texto":"For example I study English","correta":false},{"texto":"I am not sure I study","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu estudo porque eu quero servir.","resposta":"I study because I want to serve"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"That is why I study English","audio_texto":"That is why I study English."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"O motivo é simples","resposta":"The reason is simple"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"That is why I study English.","pergunta_pt":"É por isso que eu estudo inglês.","resposta":"That is why I study English"}
    ]
  },
  {
    "numero": 3, "slug": "comparing", "titulo": "Comparing", "titulo_pt": "Comparando",
    "objetivo": "Comparar duas coisas e dizer qual é a melhor.",
    "versiculo_ref": "Psalm 84:10", "versiculo_en": "One day in your courts is better than a thousand.",
    "versiculo_pt": "Vale mais um dia nos teus átrios do que mil.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"better than","pergunta_pt":"melhor que","dica":"bé-târ dén"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"worse than","pergunta_pt":"pior que","dica":"uârs dén"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the best","pergunta_pt":"o melhor","dica":"dâ bést"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"bigger than","pergunta_pt":"maior que","dica":"bí-guâr dén"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"the same","pergunta_pt":"o mesmo, igual","dica":"dâ sêim"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como se diz: São Paulo é maior que a minha cidade?","alternativas":[
        {"texto":"São Paulo is more big than my city","correta":false},{"texto":"São Paulo is bigger than my city","correta":true},
        {"texto":"São Paulo is the bigger my city","correta":false},{"texto":"São Paulo bigger is my city","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual expressão indica o topo, o melhor de todos?","alternativas":[
        {"texto":"better than","correta":false},{"texto":"the same","correta":false},
        {"texto":"the best","correta":true},{"texto":"worse than","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Hoje é melhor que ontem.","resposta":"Today is better than yesterday"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"This is the best day","audio_texto":"This is the best day."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Minha cidade é menor que São Paulo","resposta":"My city is smaller than São Paulo"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Today is better than yesterday.","pergunta_pt":"Hoje é melhor que ontem.","resposta":"Today is better than yesterday"}
    ]
  },
  {
    "numero": 4, "slug": "polite-disagreement", "titulo": "Polite disagreement", "titulo_pt": "Discordando com respeito",
    "objetivo": "Discordar sem ofender — a habilidade mais difícil da língua.",
    "versiculo_ref": "Proverbs 15:1", "versiculo_en": "A soft answer turns away wrath.",
    "versiculo_pt": "A resposta branda desvia o furor.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I see your point, but","pergunta_pt":"Eu entendo o seu ponto, mas","dica":"ai sí iór póint bât"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I understand, however","pergunta_pt":"Eu entendo, no entanto","dica":"ai ân-dâr-sténd ráu-é-vâr"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Maybe you are right","pergunta_pt":"Talvez você tenha razão","dica":"mêi-bi iú ar ráit"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Let us talk about it","pergunta_pt":"Vamos conversar sobre isso","dica":"lets tók â-báut it"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I respect your opinion","pergunta_pt":"Eu respeito a sua opinião","dica":"ai ris-pékt iór â-pí-niân"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual frase discorda com respeito?","alternativas":[
        {"texto":"You are wrong","correta":false},{"texto":"I see your point, but","correta":true},
        {"texto":"That is stupid","correta":false},{"texto":"No, never","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"A conversa esquentou. Como você abaixa o tom?","alternativas":[
        {"texto":"I respect your opinion","correta":true},{"texto":"I disagree completely","correta":false},
        {"texto":"You do not understand","correta":false},{"texto":"Not really, no","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu respeito a sua opinião.","resposta":"I respect your opinion"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"Maybe you are right","audio_texto":"Maybe you are right."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Vamos conversar sobre isso amanhã","resposta":"Let us talk about it tomorrow"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I respect your opinion.","pergunta_pt":"Eu respeito a sua opinião.","resposta":"I respect your opinion"}
    ]
  },
  {
    "numero": 5, "slug": "talking-about-problems", "titulo": "Talking about problems", "titulo_pt": "Falando de problemas",
    "objetivo": "Nomear um problema e propor uma saída.",
    "versiculo_ref": "John 16:33", "versiculo_en": "In this world you will have trouble, but take heart.",
    "versiculo_pt": "No mundo tereis aflições, mas tende bom ânimo.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"a problem","pergunta_pt":"um problema","dica":"â pró-blâm"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"a solution","pergunta_pt":"uma solução","dica":"â sâ-lú-chân"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It is difficult","pergunta_pt":"É difícil","dica":"its dí-fi-kâlt"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"We can solve it","pergunta_pt":"Nós podemos resolver","dica":"uí quén sólv it"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What should we do?","pergunta_pt":"O que devemos fazer?","dica":"uót chud uí du"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual palavra é o contrário de: problem?","alternativas":[
        {"texto":"difficult","correta":false},{"texto":"solution","correta":true},
        {"texto":"trouble","correta":false},{"texto":"reason","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você convida alguém a decidir junto?","alternativas":[
        {"texto":"What should we do?","correta":true},{"texto":"What I should do?","correta":false},
        {"texto":"We should what do?","correta":false},{"texto":"Do we what should?","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"É difícil, mas nós podemos resolver.","resposta":"It is difficult but we can solve it"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"What should we do","audio_texto":"What should we do?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Nós temos um problema e uma solução","resposta":"We have a problem and a solution"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"We can solve it together.","pergunta_pt":"Nós podemos resolver juntos.","resposta":"We can solve it together"}
    ]
  },
  {
    "numero": 6, "slug": "a-real-discussion", "titulo": "A real discussion", "titulo_pt": "Uma discussão de verdade",
    "objetivo": "Sustentar uma conversa em que vocês pensam diferente.",
    "versiculo_ref": "James 1:19", "versiculo_en": "Be quick to listen, slow to speak.",
    "versiculo_pt": "Todo o homem seja pronto para ouvir, tardio para falar.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"What do you think about it?","pergunta_pt":"O que você acha disso?","dica":"uót du iú thínk â-báut it"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"In my opinion, it is important","pergunta_pt":"Na minha opinião, é importante","dica":"in mai â-pí-niân"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I see it differently","pergunta_pt":"Eu vejo de outro jeito","dica":"ai sí it dí-fâ-rânt-li"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Let me explain","pergunta_pt":"Deixa eu explicar","dica":"lét mi iks-plêin"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Thank you for listening","pergunta_pt":"Obrigado por ouvir","dica":"tênk iú fór lí-sâ-ning"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você pensa diferente e quer dizer isso com calma.","alternativas":[
        {"texto":"I see it differently","correta":true},{"texto":"You never understand","correta":false},
        {"texto":"That is wrong always","correta":false},{"texto":"I do not talk you","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se encerra bem uma discussão difícil?","alternativas":[
        {"texto":"Thank you for listening","correta":true},{"texto":"I am right","correta":false},
        {"texto":"Goodbye forever","correta":false},{"texto":"Not really","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Deixa eu explicar a minha opinião.","resposta":"Let me explain my opinion"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"What do you think about it","audio_texto":"What do you think about it?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu vejo de outro jeito, mas eu respeito você","resposta":"I see it differently but I respect you"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Thank you for listening.","pergunta_pt":"Obrigado por ouvir.","resposta":"Thank you for listening"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 11;
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
  update english_modulos set publicado = true where numero = 11;
end
$seed$;
