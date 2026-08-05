-- =============================================================
-- EKBALLO ENGLISH · Imagem no exercício
--
-- Dois usos, um decorativo e um pedagógico:
--
-- 1. `imagem_url` no cartão de vocabulário — a palavra em inglês
--    passa a vir com a coisa, e o português vira apoio.
--
-- 2. tipo novo `imagem` ("escolha a imagem") — o aluno ouve/lê a
--    palavra em inglês e toca na figura certa entre quatro. Aqui
--    mora o ganho real: elimina o português como muleta, que é o
--    que faz alguém pensar em inglês em vez de traduzir de cabeça.
--    As alternativas viram [{texto, imagem, correta}] — `texto` só
--    serve pra devolutiva; na tela aparece só a figura, senão a
--    palavra escrita entregaria a resposta.
--
-- As ilustrações são arquivos estáticos em public/english/, não
-- Storage: são poucas, fixas, e assim entram na imagem Docker —
-- carregam offline e não dependem de signed URL nem de RLS.
-- =============================================================

alter table english_exercicios
  add column if not exists imagem_url text;

-- Solta o check antigo e recria incluindo 'imagem'.
alter table english_exercicios
  drop constraint if exists english_exercicios_tipo_check;

alter table english_exercicios
  add constraint english_exercicios_tipo_check
  check (tipo in ('vocabulario','escolha','traducao','ouvir','montar','falar','imagem'));
