-- =============================================================
-- EKBALLO ENGLISH · Imagem deixa de decorar e passa a ser a resposta
--
-- A primeira leva espalhou 9 ilustrações por 797 exercícios: pouco
-- demais para criar padrão, o bastante para criar inconsistência —
-- alguns cartões com figura, a esmagadora maioria sem. E uma delas
-- tentava desenhar GESTO (mão acenando = tchau), que ícone parado
-- não expressa. Bruno reprovou, com razão.
--
-- Conceito novo, em três regras:
--
--   1. A imagem sai do cartão de vocabulário. Lá quem manda é o
--      espécime tipográfico; figura mediana só competia com ele.
--      Ela fica só em "toque na figura certa", onde faz um trabalho
--      que texto nenhum faz: tirar o português do caminho.
--
--   2. Só substantivo CONCRETO. Gesto, sentimento e frase abstrata
--      estão fora por definição — era a fronteira que faltava.
--
--   3. Pictograma, não ilustração: traço geométrico, uma cor,
--      desenhado à mão (scripts/gerar-pictogramas.mjs) como parte do
--      sistema visual. Some a loteria do gerador de imagem, em que
--      uma em cada quatro voltava como cartão cheio de texto.
--
-- Os arquivos são SVG em public/english/icones (64 KB o conjunto
-- inteiro, contra 1 MB das 9 imagens antigas).
-- =============================================================

-- ---------- some com as referências às imagens antigas ----------
update english_exercicios
   set imagem_url = null
 where imagem_url like '/english/%.png';

do $img$
declare
  v_licao_id uuid;
  item jsonb;
  novos jsonb := $n$
  [
    {
      "licao":"hello-and-goodbye","ordem":13,"pergunta":"Good night",
      "alternativas":[
        {"texto":"Good night","imagem":"/english/icones/moon.svg","correta":true},
        {"texto":"Good morning","imagem":"/english/icones/sun.svg","correta":false},
        {"texto":"House","imagem":"/english/icones/house.svg","correta":false},
        {"texto":"Church","imagem":"/english/icones/church.svg","correta":false}]
    },
    {
      "licao":"where-are-you-from","ordem":12,"pergunta":"City",
      "alternativas":[
        {"texto":"House","imagem":"/english/icones/house.svg","correta":false},
        {"texto":"City","imagem":"/english/icones/city.svg","correta":true},
        {"texto":"World","imagem":"/english/icones/globe.svg","correta":false},
        {"texto":"Church","imagem":"/english/icones/church.svg","correta":false}]
    },
    {
      "licao":"god-bless-you","ordem":13,"pergunta":"The Bible",
      "alternativas":[
        {"texto":"Church","imagem":"/english/icones/church.svg","correta":false},
        {"texto":"The Bible","imagem":"/english/icones/book.svg","correta":true},
        {"texto":"World","imagem":"/english/icones/globe.svg","correta":false},
        {"texto":"House","imagem":"/english/icones/house.svg","correta":false}]
    },
    {
      "licao":"my-house","ordem":12,"pergunta":"House",
      "alternativas":[
        {"texto":"Store","imagem":"/english/icones/store.svg","correta":false},
        {"texto":"Church","imagem":"/english/icones/church.svg","correta":false},
        {"texto":"House","imagem":"/english/icones/house.svg","correta":true},
        {"texto":"Table","imagem":"/english/icones/table.svg","correta":false}]
    },
    {
      "licao":"food-and-drink","ordem":12,"pergunta":"Bread",
      "alternativas":[
        {"texto":"Water","imagem":"/english/icones/water.svg","correta":false},
        {"texto":"Bread","imagem":"/english/icones/bread.svg","correta":true},
        {"texto":"Coffee","imagem":"/english/icones/coffee.svg","correta":false},
        {"texto":"Rice","imagem":"/english/icones/rice.svg","correta":false}]
    },
    {
      "licao":"at-the-table","ordem":12,"pergunta":"Coffee",
      "alternativas":[
        {"texto":"Coffee","imagem":"/english/icones/coffee.svg","correta":true},
        {"texto":"Water","imagem":"/english/icones/water.svg","correta":false},
        {"texto":"Rice","imagem":"/english/icones/rice.svg","correta":false},
        {"texto":"Bread","imagem":"/english/icones/bread.svg","correta":false}]
    },
    {
      "licao":"my-clothes","ordem":12,"pergunta":"Shirt",
      "alternativas":[
        {"texto":"Book","imagem":"/english/icones/book.svg","correta":false},
        {"texto":"Table","imagem":"/english/icones/table.svg","correta":false},
        {"texto":"Shirt","imagem":"/english/icones/shirt.svg","correta":true},
        {"texto":"Bus","imagem":"/english/icones/bus.svg","correta":false}]
    },
    {
      "licao":"out-and-about","ordem":12,"pergunta":"The bus",
      "alternativas":[
        {"texto":"Store","imagem":"/english/icones/store.svg","correta":false},
        {"texto":"Money","imagem":"/english/icones/money.svg","correta":false},
        {"texto":"The bus","imagem":"/english/icones/bus.svg","correta":true},
        {"texto":"City","imagem":"/english/icones/city.svg","correta":false}]
    },
    {
      "licao":"at-the-store","ordem":12,"pergunta":"Money",
      "alternativas":[
        {"texto":"Money","imagem":"/english/icones/money.svg","correta":true},
        {"texto":"Store","imagem":"/english/icones/store.svg","correta":false},
        {"texto":"Book","imagem":"/english/icones/book.svg","correta":false},
        {"texto":"Bus","imagem":"/english/icones/bus.svg","correta":false}]
    },
    {
      "licao":"the-word","ordem":12,"pergunta":"The Bible",
      "alternativas":[
        {"texto":"House","imagem":"/english/icones/house.svg","correta":false},
        {"texto":"World","imagem":"/english/icones/globe.svg","correta":false},
        {"texto":"Church","imagem":"/english/icones/church.svg","correta":false},
        {"texto":"The Bible","imagem":"/english/icones/book.svg","correta":true}]
    }
  ]
  $n$::jsonb;
begin
  for item in select * from jsonb_array_elements(novos) loop
    select id into v_licao_id from english_licoes where slug = item->>'licao';
    if v_licao_id is null then continue; end if;

    delete from english_exercicios
     where licao_id = v_licao_id and ordem = (item->>'ordem')::int;

    insert into english_exercicios (
      licao_id, ordem, tipo, enunciado, pergunta, resposta, alternativas, audio_texto
    ) values (
      v_licao_id,
      (item->>'ordem')::int,
      'imagem',
      'Toque na figura certa',
      item->>'pergunta',
      item->>'pergunta',
      item->'alternativas',
      item->>'pergunta'
    );
  end loop;
end
$img$;
