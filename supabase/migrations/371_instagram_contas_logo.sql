-- =============================================================
-- 371 · Logo de cada conta de Instagram (issue #264)
-- =============================================================
-- A logo que entra em todas as artes da conta, direto sobre o fundo, e o
-- texto escrito embaixo dela (ex.: "2ª Região"). Vazio = conta sem logo, como
-- a principal. São dois endereços porque a logo tem duas versões, geradas no
-- envio: a original (artes de fundo claro) e a clara (fundo escuro ou foto).
-- Os arquivos ficam no bucket público `instagram`; aqui vão só os endereços.

alter table public.instagram_contas
  add column if not exists logo_url       text not null default '',
  add column if not exists logo_clara_url text not null default '',
  add column if not exists logo_legenda   text not null default '';
