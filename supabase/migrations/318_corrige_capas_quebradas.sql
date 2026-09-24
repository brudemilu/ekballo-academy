-- 318_corrige_capas_quebradas.sql
-- Resolve #176 — 55 cursos publicados apareciam sem capa no /dashboard.
--
-- Três causas distintas, corrigidas aqui nas duas que são de dados (a terceira,
-- cinco arquivos ausentes da imagem Docker em produção, se resolve no rebuild):
--
--   1. imagem_url apontando pra /api/og/curso/<slug> com o slug FORA do mapa
--      CAPAS da rota — a rota devolve 404. Todos esses livros já tinham a capa
--      real em public/capas/<slug>.jpg; é pra lá que passam a apontar.
--   2. imagem_url gravado sem a barra inicial ("capas/x.jpg"). Sem a barra,
--      getMaterialUrl não reconhece como rota local e tenta resolver como
--      objeto do bucket privado materiais-cursos, onde o arquivo não está.
--   3. jornada-180 (plano de leitura) apontava pra "planos/jornada-180.png",
--      caminho que nunca existiu em public/. O slug está no mapa da rota OG.
--
-- Idempotente: cada UPDATE é condicionado ao valor antigo exato.

-- 1) Capa real do livro no lugar do 404 do gerador OG (38 cursos).
update cursos c
set imagem_url = '/capas/' || c.slug || '.jpg'
from (values
  ('a-historia-do-avivamento-azusa'),
  ('a-lideranca-pastoral'),
  ('a-obra-consumada-de-cristo'),
  ('a-transicao'),
  ('as-cronicas-de-narnia'),
  ('ate-que-nada-mais-importe'),
  ('ate-que-sejamos-um'),
  ('chega-de-regras'),
  ('como-orar-lewis'),
  ('cosmovisoes-em-conflito'),
  ('cristao-contagiante'),
  ('esperanca-em-tempos-de-medo'),
  ('idolos-do-coracao'),
  ('ken-ham-origem'),
  ('kriptonita'),
  ('lideranca-corajosa'),
  ('louco-amor'),
  ('maturidade-espiritual-do-lider'),
  ('ministerio-vocacao-ou-profissao'),
  ('nao-apagueis-o-espirito'),
  ('o-agir-invisivel-de-deus'),
  ('o-ego-e-seu-inimigo'),
  ('o-espirito-santo-consolador'),
  ('o-fator-melquesedeque'),
  ('o-lider-que-deus-usa'),
  ('o-pastor-descartavel'),
  ('o-pastor-e-o-aconselhamento'),
  ('o-pastor-segundo-deus'),
  ('os-clas-da-lua'),
  ('paixao-pelas-almas'),
  ('para-que-todos-sejam-um'),
  ('pastoreando-coracao-crianca'),
  ('plantar-igrejas'),
  ('pregacao-cristocentrica'),
  ('psicologia-pastoral'),
  ('qual-a-missao-da-igreja'),
  ('reflexoes-cristas-lewis'),
  ('surpreendido-por-deus')
) as v(slug)
where c.slug = v.slug
  and c.imagem_url = '/api/og/curso/' || c.slug;

-- 2) Barra inicial que faltava (11 cursos).
update cursos
set imagem_url = '/' || imagem_url
where imagem_url like 'capas/%';

-- 3) Plano de leitura: cai no gerador OG, que tem o slug cadastrado.
update cursos
set imagem_url = '/api/og/curso/jornada-180'
where slug = 'jornada-180'
  and imagem_url = 'planos/jornada-180.png';
