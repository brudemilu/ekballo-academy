-- =============================================================
-- EKBALLO ENGLISH · Módulo 2 · Meu mundo (My world)
--
-- Segue exatamente a estrutura do Módulo 1: 6 lições, cada uma com
-- 5 cartões de vocabulário (que ensinam, não avaliam) e 6 exercícios
-- avaliados — 2 de escolha, 1 de tradução, 1 de ditado, 1 de montar
-- frase e 1 de fala.
--
-- O Módulo 2 sai da saudação e entra na vida do aluno: família,
-- casa, rotina, escola, gosto pessoal — e fecha com uma lição de
-- síntese, em que ele fala de si juntando o que aprendeu nos dois
-- módulos.
--
-- O áudio de cada frase é gerado depois, por
-- scripts/gerar-audios-english.mjs, que preenche audio_url.
--
-- Idempotente: reaplicar atualiza a lição e regrava os exercícios.
-- =============================================================

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
    "slug": "my-family",
    "titulo": "My family",
    "titulo_pt": "Minha família",
    "objetivo": "Apresentar a sua família e dizer quem é quem.",
    "versiculo_ref": "Joshua 24:15",
    "versiculo_en": "As for me and my house, we will serve the Lord.",
    "versiculo_pt": "Eu e a minha casa serviremos ao Senhor.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"mother","pergunta_pt":"mãe","dica":"má-dâr"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"father","pergunta_pt":"pai","dica":"fá-dâr"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"brother","pergunta_pt":"irmão","dica":"brá-dâr"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"sister","pergunta_pt":"irmã","dica":"sís-târ"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"This is my family","pergunta_pt":"Esta é a minha família","dica":"dis iz mai fé-mi-li"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como se diz: irmã?","alternativas":[
        {"texto":"brother","correta":false},
        {"texto":"mother","correta":false},
        {"texto":"sister","correta":true},
        {"texto":"father","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Você quer apresentar a sua mãe. O que você diz?","alternativas":[
        {"texto":"This is my mother.","correta":true},
        {"texto":"I am my mother.","correta":false},
        {"texto":"My mother name.","correta":false},
        {"texto":"She mother.","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Este é meu irmão.","resposta":"This is my brother"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"This is my sister","audio_texto":"This is my sister."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Esta é a minha família","resposta":"This is my family"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I love my family.","pergunta_pt":"Eu amo a minha família.","resposta":"I love my family"}
    ]
  },
  {
    "numero": 2,
    "slug": "my-house",
    "titulo": "My house",
    "titulo_pt": "Minha casa",
    "objetivo": "Falar da sua casa e dos cômodos onde você vive.",
    "versiculo_ref": "Psalm 127:1",
    "versiculo_en": "Unless the Lord builds the house, they labor in vain.",
    "versiculo_pt": "Se o Senhor não edificar a casa, em vão trabalham os que a edificam.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"house","pergunta_pt":"casa","dica":"ráus","imagem":"/english/house.png"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"kitchen","pergunta_pt":"cozinha","dica":"kí-tchân"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"bedroom","pergunta_pt":"quarto","dica":"béd-rum"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"table","pergunta_pt":"mesa","dica":"têi-bou"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I live in a house","pergunta_pt":"Eu moro numa casa","dica":"ai liv in â ráus"},
      {"ordem":6,"tipo":"escolha","enunciado":"Onde você cozinha?","alternativas":[
        {"texto":"In the bedroom","correta":false},
        {"texto":"In the kitchen","correta":true},
        {"texto":"In the table","correta":false},
        {"texto":"In the school","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual palavra significa: quarto?","alternativas":[
        {"texto":"kitchen","correta":false},
        {"texto":"house","correta":false},
        {"texto":"table","correta":false},
        {"texto":"bedroom","correta":true}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu moro numa casa.","resposta":"I live in a house"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"This is my house","audio_texto":"This is my house."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"A mesa está na cozinha","resposta":"The table is in the kitchen"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I live in a house.","pergunta_pt":"Eu moro numa casa.","resposta":"I live in a house"}
    ]
  },
  {
    "numero": 3,
    "slug": "my-day",
    "titulo": "My day",
    "titulo_pt": "Meu dia",
    "objetivo": "Contar como é o seu dia, do acordar ao dormir.",
    "versiculo_ref": "Lamentations 3:23",
    "versiculo_en": "His mercies are new every morning.",
    "versiculo_pt": "As suas misericórdias são novas a cada manhã.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I wake up","pergunta_pt":"Eu acordo","dica":"ai uêik âp"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I eat","pergunta_pt":"Eu como","dica":"ai ít"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I work","pergunta_pt":"Eu trabalho","dica":"ai uârk"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I sleep","pergunta_pt":"Eu durmo","dica":"ai slíp"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"every day","pergunta_pt":"todo dia","dica":"év-ri dêi"},
      {"ordem":6,"tipo":"escolha","enunciado":"O que você faz de manhã, ao levantar?","alternativas":[
        {"texto":"I sleep","correta":false},
        {"texto":"I wake up","correta":true},
        {"texto":"I work","correta":false},
        {"texto":"I live","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase significa: Eu como todo dia?","alternativas":[
        {"texto":"I sleep every day","correta":false},
        {"texto":"I work every day","correta":false},
        {"texto":"I eat every day","correta":true},
        {"texto":"I wake up every day","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu trabalho todo dia.","resposta":"I work every day"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I wake up every morning","audio_texto":"I wake up every morning."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu durmo toda noite","resposta":"I sleep every night"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I wake up every morning.","pergunta_pt":"Eu acordo toda manhã.","resposta":"I wake up every morning"}
    ]
  },
  {
    "numero": 4,
    "slug": "at-school",
    "titulo": "At school",
    "titulo_pt": "Na escola",
    "objetivo": "Falar da escola: quem ensina, quem aprende e o que se usa.",
    "versiculo_ref": "Proverbs 1:7",
    "versiculo_en": "The fear of the Lord is the beginning of knowledge.",
    "versiculo_pt": "O temor do Senhor é o princípio do conhecimento.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"school","pergunta_pt":"escola","dica":"skúl"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"teacher","pergunta_pt":"professor, professora","dica":"tí-tchâr"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"student","pergunta_pt":"aluno, aluna","dica":"stú-dânt"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"book","pergunta_pt":"livro","dica":"buk","imagem":"/english/bible.png"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am a student","pergunta_pt":"Eu sou aluno","dica":"aim â stú-dânt"},
      {"ordem":6,"tipo":"escolha","enunciado":"Quem ensina na escola?","alternativas":[
        {"texto":"The student","correta":false},
        {"texto":"The book","correta":false},
        {"texto":"The teacher","correta":true},
        {"texto":"The school","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: Eu sou aluno?","alternativas":[
        {"texto":"I am a student","correta":true},
        {"texto":"I am a teacher","correta":false},
        {"texto":"I have a student","correta":false},
        {"texto":"I student","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu tenho um livro.","resposta":"I have a book"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I go to school every day","audio_texto":"I go to school every day."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"O professor está na escola","resposta":"The teacher is at school"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I am a student.","pergunta_pt":"Eu sou aluno.","resposta":"I am a student"}
    ]
  },
  {
    "numero": 5,
    "slug": "what-i-like",
    "titulo": "What I like",
    "titulo_pt": "O que eu gosto",
    "objetivo": "Dizer o que você gosta e o que não gosta.",
    "versiculo_ref": "Psalm 37:4",
    "versiculo_en": "Delight yourself in the Lord.",
    "versiculo_pt": "Deleita-te também no Senhor.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I like","pergunta_pt":"Eu gosto","dica":"ai láik"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I do not like","pergunta_pt":"Eu não gosto","dica":"ai du nót láik"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"music","pergunta_pt":"música","dica":"miú-zik"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"food","pergunta_pt":"comida","dica":"fúd"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I like to read","pergunta_pt":"Eu gosto de ler","dica":"ai láik tu ríd"},
      {"ordem":6,"tipo":"escolha","enunciado":"Como você diz que NÃO gosta de algo?","alternativas":[
        {"texto":"I like not","correta":false},
        {"texto":"I do not like","correta":true},
        {"texto":"I no like","correta":false},
        {"texto":"Not I like","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase significa: Eu gosto de música?","alternativas":[
        {"texto":"I like food","correta":false},
        {"texto":"I like to read","correta":false},
        {"texto":"I like music","correta":true},
        {"texto":"I do not like music","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu gosto de música.","resposta":"I like music"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I like to read","audio_texto":"I like to read."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu gosto da minha escola","resposta":"I like my school"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I like music.","pergunta_pt":"Eu gosto de música.","resposta":"I like music"}
    ]
  },
  {
    "numero": 6,
    "slug": "about-me",
    "titulo": "About me",
    "titulo_pt": "Sobre mim",
    "objetivo": "Juntar tudo e falar de você por trinta segundos, sem travar.",
    "versiculo_ref": "Psalm 139:14",
    "versiculo_en": "I am fearfully and wonderfully made.",
    "versiculo_pt": "Eu sou formidavelmente e maravilhosamente feito.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My name is Ana","pergunta_pt":"Meu nome é Ana","dica":"mai nêim iz"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am from Brazil","pergunta_pt":"Eu sou do Brasil","dica":"aim from bra-zíl"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I live with my family","pergunta_pt":"Eu moro com a minha família","dica":"ai liv uid mai fé-mi-li"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I like music","pergunta_pt":"Eu gosto de música","dica":"ai láik miú-zik"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"God is good","pergunta_pt":"Deus é bom","dica":"gód iz gud"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você vai se apresentar. Por onde começa?","alternativas":[
        {"texto":"I like music.","correta":false},
        {"texto":"My name is Ana.","correta":true},
        {"texto":"Good night.","correta":false},
        {"texto":"See you later.","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Qual frase fala de onde você vem?","alternativas":[
        {"texto":"I live with my family","correta":false},
        {"texto":"I am a student","correta":false},
        {"texto":"I am from Brazil","correta":true},
        {"texto":"I like food","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu moro com a minha família.","resposta":"I live with my family"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I am happy today","audio_texto":"I am happy today."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu sou do Brasil e gosto de música","resposta":"I am from Brazil and I like music"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"My name is Ana and I am from Brazil.","pergunta_pt":"Meu nome é Ana e eu sou do Brasil.","resposta":"My name is Ana and I am from Brazil"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 2;

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

    delete from english_exercicios where licao_id = v_licao_id;

    for ex in select * from jsonb_array_elements(lic->'exercicios') loop
      insert into english_exercicios (
        licao_id, ordem, tipo, enunciado, pergunta, pergunta_pt,
        resposta, aceitas, alternativas, dica, audio_texto, imagem_url
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
        coalesce(ex->>'audio_texto', ex->>'pergunta', ex->>'resposta'),
        ex->>'imagem'
      );
    end loop;
  end loop;

  -- Módulo 2 ao ar. A partir daqui a trilha do aluno mostra 12 lições.
  update english_modulos set publicado = true where numero = 2;
end
$seed$;
