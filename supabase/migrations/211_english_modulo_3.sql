-- =============================================================
-- EKBALLO ENGLISH · Módulo 3 · Vida cotidiana (Everyday life)
--
-- Mesma estrutura dos módulos 1 e 2: 6 lições, cada uma com 5
-- cartões de vocabulário (ensinam, não avaliam) e 6 exercícios
-- avaliados — 2 de escolha, 1 tradução, 1 ditado, 1 montar frase
-- e 1 fala.
--
-- Aqui o inglês sai da apresentação e vai para o uso: comida,
-- mesa, pedir algo, roupa, cor e rua. É o módulo em que o aluno
-- começa a resolver coisas em inglês, não só a se descrever.
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
    "slug": "food-and-drink",
    "titulo": "Food and drink",
    "titulo_pt": "Comida e bebida",
    "objetivo": "Nomear o que você come e bebe todos os dias.",
    "versiculo_ref": "Matthew 6:11",
    "versiculo_en": "Give us this day our daily bread.",
    "versiculo_pt": "O pão nosso de cada dia nos dá hoje.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"bread","pergunta_pt":"pão","dica":"bréd"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"water","pergunta_pt":"água","dica":"uó-târ"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"coffee","pergunta_pt":"café","dica":"kó-fi"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"rice","pergunta_pt":"arroz","dica":"ráis"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I drink water","pergunta_pt":"Eu bebo água","dica":"ai drink uó-târ"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual palavra significa: água?","alternativas":[
        {"texto":"bread","correta":false},
        {"texto":"water","correta":true},
        {"texto":"coffee","correta":false},
        {"texto":"rice","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"O que você bebe de manhã?","alternativas":[
        {"texto":"I eat coffee","correta":false},
        {"texto":"I drink rice","correta":false},
        {"texto":"I drink coffee","correta":true},
        {"texto":"I coffee drink","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu como pão.","resposta":"I eat bread"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I drink water every day","audio_texto":"I drink water every day."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Eu como arroz todo dia","resposta":"I eat rice every day"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I drink water.","pergunta_pt":"Eu bebo água.","resposta":"I drink water"}
    ]
  },
  {
    "numero": 2,
    "slug": "at-the-table",
    "titulo": "At the table",
    "titulo_pt": "À mesa",
    "objetivo": "Dizer que está com fome, com sede, e agradecer a comida.",
    "versiculo_ref": "Psalm 34:8",
    "versiculo_en": "Taste and see that the Lord is good.",
    "versiculo_pt": "Provai e vede que o Senhor é bom.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am hungry","pergunta_pt":"Estou com fome","dica":"aim rân-gri"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I am thirsty","pergunta_pt":"Estou com sede","dica":"aim thârs-ti"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"please","pergunta_pt":"por favor","dica":"plíz"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"It is delicious","pergunta_pt":"Está delicioso","dica":"it iz de-lí-châs"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Let us eat","pergunta_pt":"Vamos comer","dica":"lets ít"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você não come há horas. O que você diz?","alternativas":[
        {"texto":"I am thirsty","correta":false},
        {"texto":"I am tired","correta":false},
        {"texto":"I am hungry","correta":true},
        {"texto":"I am happy","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você pede algo com educação?","alternativas":[
        {"texto":"Water, please","correta":true},
        {"texto":"Water now","correta":false},
        {"texto":"Give water","correta":false},
        {"texto":"I water","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Estou com sede.","resposta":"I am thirsty","aceitas":["im thirsty"]},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"The food is delicious","audio_texto":"The food is delicious."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Obrigado pela comida","resposta":"Thank you for the food"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I am hungry.","pergunta_pt":"Estou com fome.","resposta":"I am hungry"}
    ]
  },
  {
    "numero": 3,
    "slug": "asking-for-things",
    "titulo": "Asking for things",
    "titulo_pt": "Pedindo alguma coisa",
    "objetivo": "Pedir o que você quer e perguntar quanto custa.",
    "versiculo_ref": "Matthew 7:7",
    "versiculo_en": "Ask, and it will be given to you.",
    "versiculo_pt": "Pedi, e dar-se-vos-á.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Can I have some water?","pergunta_pt":"Pode me dar um pouco de água?","dica":"quén ai rév sâm uó-târ"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"How much is it?","pergunta_pt":"Quanto custa?","dica":"ráu mâtch iz it"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I want","pergunta_pt":"Eu quero","dica":"ai uónt"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I need help","pergunta_pt":"Eu preciso de ajuda","dica":"ai níd rélp"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Here you are","pergunta_pt":"Aqui está","dica":"rír iú ar"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você quer saber o preço. O que você pergunta?","alternativas":[
        {"texto":"How are you?","correta":false},
        {"texto":"How old are you?","correta":false},
        {"texto":"How much is it?","correta":true},
        {"texto":"Where are you from?","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como você pede um café com educação?","alternativas":[
        {"texto":"I want coffee now","correta":false},
        {"texto":"Can I have a coffee, please?","correta":true},
        {"texto":"Coffee me","correta":false},
        {"texto":"You give coffee","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu preciso de ajuda.","resposta":"I need help"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"How much is it","audio_texto":"How much is it?"},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Pode me dar um pouco de água?","resposta":"Can I have some water"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"How much is it?","pergunta_pt":"Quanto custa?","resposta":"How much is it"}
    ]
  },
  {
    "numero": 4,
    "slug": "my-clothes",
    "titulo": "My clothes",
    "titulo_pt": "Minhas roupas",
    "objetivo": "Nomear as roupas e dizer o que você está vestindo.",
    "versiculo_ref": "Colossians 3:12",
    "versiculo_en": "Clothe yourselves with kindness.",
    "versiculo_pt": "Revesti-vos de benignidade.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"shirt","pergunta_pt":"camisa","dica":"chârt"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"shoes","pergunta_pt":"sapatos","dica":"chúz"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"dress","pergunta_pt":"vestido","dica":"drés"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"coat","pergunta_pt":"casaco","dica":"kôut"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"I wear a shirt","pergunta_pt":"Eu uso uma camisa","dica":"ai uér â chârt"},
      {"ordem":6,"tipo":"escolha","enunciado":"O que você calça nos pés?","alternativas":[
        {"texto":"a shirt","correta":false},
        {"texto":"shoes","correta":true},
        {"texto":"a coat","correta":false},
        {"texto":"a dress","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Está frio. O que você veste?","alternativas":[
        {"texto":"a coat","correta":true},
        {"texto":"shoes","correta":false},
        {"texto":"a table","correta":false},
        {"texto":"bread","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu uso sapatos.","resposta":"I wear shoes"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"I wear a coat today","audio_texto":"I wear a coat today."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Esta camisa é minha","resposta":"This shirt is mine"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"I wear a shirt.","pergunta_pt":"Eu uso uma camisa.","resposta":"I wear a shirt"}
    ]
  },
  {
    "numero": 5,
    "slug": "colors",
    "titulo": "Colors",
    "titulo_pt": "Cores",
    "objetivo": "Dizer a cor das coisas e descrever o que você vê.",
    "versiculo_ref": "Isaiah 1:18",
    "versiculo_en": "They shall be as white as snow.",
    "versiculo_pt": "Ficarão brancos como a neve.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"red","pergunta_pt":"vermelho","dica":"réd"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"blue","pergunta_pt":"azul","dica":"blú"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"green","pergunta_pt":"verde","dica":"grín"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"white","pergunta_pt":"branco","dica":"uáit"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"My shirt is blue","pergunta_pt":"Minha camisa é azul","dica":"mai chârt iz blú"},
      {"ordem":6,"tipo":"escolha","enunciado":"Qual é a cor da neve?","alternativas":[
        {"texto":"red","correta":false},
        {"texto":"green","correta":false},
        {"texto":"blue","correta":false},
        {"texto":"white","correta":true}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Como se diz: verde?","alternativas":[
        {"texto":"green","correta":true},
        {"texto":"blue","correta":false},
        {"texto":"red","correta":false},
        {"texto":"white","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Meus sapatos são vermelhos.","resposta":"My shoes are red"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"The house is white","audio_texto":"The house is white."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a frase","pergunta_pt":"Minha camisa é azul","resposta":"My shirt is blue"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"My shirt is blue.","pergunta_pt":"Minha camisa é azul.","resposta":"My shirt is blue"}
    ]
  },
  {
    "numero": 6,
    "slug": "out-and-about",
    "titulo": "Out and about",
    "titulo_pt": "Na rua",
    "objetivo": "Se virar fora de casa: loja, dinheiro, ônibus e rua.",
    "versiculo_ref": "Proverbs 3:6",
    "versiculo_en": "In all your ways acknowledge him.",
    "versiculo_pt": "Reconhece-o em todos os teus caminhos.",
    "exercicios": [
      {"ordem":1,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"store","pergunta_pt":"loja","dica":"stór"},
      {"ordem":2,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"money","pergunta_pt":"dinheiro","dica":"mâ-ni"},
      {"ordem":3,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"bus","pergunta_pt":"ônibus","dica":"bâs"},
      {"ordem":4,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"street","pergunta_pt":"rua","dica":"strít","imagem":"/english/city.png"},
      {"ordem":5,"tipo":"vocabulario","enunciado":"Ouça e repita","pergunta":"Where is the bus?","pergunta_pt":"Onde está o ônibus?","dica":"uér iz dâ bâs"},
      {"ordem":6,"tipo":"escolha","enunciado":"Você está perdido e procura o ônibus. O que você pergunta?","alternativas":[
        {"texto":"How much is the bus?","correta":false},
        {"texto":"Where is the bus?","correta":true},
        {"texto":"Who is the bus?","correta":false},
        {"texto":"The bus is where","correta":false}]},
      {"ordem":7,"tipo":"escolha","enunciado":"Onde você compra as coisas?","alternativas":[
        {"texto":"In the street","correta":false},
        {"texto":"In the bus","correta":false},
        {"texto":"In the store","correta":true},
        {"texto":"In the money","correta":false}]},
      {"ordem":8,"tipo":"traducao","enunciado":"Escreva em inglês","pergunta_pt":"Eu preciso de dinheiro.","resposta":"I need money"},
      {"ordem":9,"tipo":"ouvir","enunciado":"Ouça e escreva o que você ouviu","resposta":"The store is on this street","audio_texto":"The store is on this street."},
      {"ordem":10,"tipo":"montar","enunciado":"Monte a pergunta","pergunta_pt":"Onde está a loja?","resposta":"Where is the store"},
      {"ordem":11,"tipo":"falar","enunciado":"Fale em voz alta","pergunta":"Where is the bus?","pergunta_pt":"Onde está o ônibus?","resposta":"Where is the bus"}
    ]
  }
]
$j$::jsonb;
begin
  select id into v_modulo_id from english_modulos where numero = 3;

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

  update english_modulos set publicado = true where numero = 3;
end
$seed$;
