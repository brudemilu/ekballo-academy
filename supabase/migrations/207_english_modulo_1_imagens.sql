-- =============================================================
-- EKBALLO ENGLISH · Imagens no Módulo 1
--
-- 1. Liga a ilustração ao cartão de vocabulário, onde a figura
--    ajuda de fato (substantivo concreto e hora do dia). Frase
--    abstrata — "Nice to meet you", "How are you?" — fica sem
--    imagem de propósito: figura ruim atrapalha mais que ausência.
--
-- 2. Cria um exercício "escolha a imagem" nas lições 1, 5 e 6 —
--    as que têm quatro figuras bem distintas entre si. O aluno lê
--    e ouve a palavra em inglês e toca na figura, sem passar pelo
--    português.
--
-- Arquivos em public/english/ (entram na imagem Docker).
-- Idempotente: o insert é apagado e regravado por (lição, ordem).
-- =============================================================

do $img$
declare
  v_licao_id uuid;
  item jsonb;

  -- ilustração por (slug da lição, ordem do exercício)
  vocab jsonb := $v$
  [
    {"licao":"hello-and-goodbye","ordem":4,"img":"/english/night-moon.png"},
    {"licao":"hello-and-goodbye","ordem":5,"img":"/english/waving-hand.png"},
    {"licao":"how-are-you","ordem":3,"img":"/english/happy-face.png"},
    {"licao":"where-are-you-from","ordem":3,"img":"/english/house.png"},
    {"licao":"where-are-you-from","ordem":4,"img":"/english/city.png"},
    {"licao":"where-are-you-from","ordem":5,"img":"/english/globe.png"},
    {"licao":"god-bless-you","ordem":3,"img":"/english/praying-hands.png"},
    {"licao":"god-bless-you","ordem":4,"img":"/english/bible.png"},
    {"licao":"god-bless-you","ordem":5,"img":"/english/church.png"}
  ]
  $v$::jsonb;

  -- exercícios novos de "escolha a imagem"
  novos jsonb := $n$
  [
    {
      "licao":"hello-and-goodbye","ordem":13,
      "enunciado":"Toque na figura certa","pergunta":"Goodbye","audio_texto":"Goodbye",
      "alternativas":[
        {"texto":"Goodbye","imagem":"/english/waving-hand.png","correta":true},
        {"texto":"Church","imagem":"/english/church.png","correta":false},
        {"texto":"Night","imagem":"/english/night-moon.png","correta":false},
        {"texto":"House","imagem":"/english/house.png","correta":false}
      ]
    },
    {
      "licao":"where-are-you-from","ordem":12,
      "enunciado":"Toque na figura certa","pergunta":"City","audio_texto":"City",
      "alternativas":[
        {"texto":"House","imagem":"/english/house.png","correta":false},
        {"texto":"City","imagem":"/english/city.png","correta":true},
        {"texto":"World","imagem":"/english/globe.png","correta":false},
        {"texto":"Church","imagem":"/english/church.png","correta":false}
      ]
    },
    {
      "licao":"god-bless-you","ordem":13,
      "enunciado":"Toque na figura certa","pergunta":"The Bible","audio_texto":"The Bible",
      "alternativas":[
        {"texto":"Church","imagem":"/english/church.png","correta":false},
        {"texto":"Praying","imagem":"/english/praying-hands.png","correta":false},
        {"texto":"The Bible","imagem":"/english/bible.png","correta":true},
        {"texto":"World","imagem":"/english/globe.png","correta":false}
      ]
    }
  ]
  $n$::jsonb;
begin
  -- ---------- ilustração no vocabulário ----------
  for item in select * from jsonb_array_elements(vocab) loop
    update english_exercicios e
       set imagem_url = item->>'img'
      from english_licoes l
     where l.id = e.licao_id
       and l.slug = item->>'licao'
       and e.ordem = (item->>'ordem')::int
       and e.tipo = 'vocabulario';
  end loop;

  -- ---------- exercícios de escolha por imagem ----------
  for item in select * from jsonb_array_elements(novos) loop
    select id into v_licao_id from english_licoes where slug = item->>'licao';
    if v_licao_id is null then continue; end if;

    delete from english_exercicios
     where licao_id = v_licao_id and ordem = (item->>'ordem')::int;

    insert into english_exercicios (
      licao_id, ordem, tipo, enunciado, pergunta, resposta,
      alternativas, audio_texto
    ) values (
      v_licao_id,
      (item->>'ordem')::int,
      'imagem',
      item->>'enunciado',
      item->>'pergunta',
      item->>'pergunta',
      item->'alternativas',
      item->>'audio_texto'
    );
  end loop;
end
$img$;
