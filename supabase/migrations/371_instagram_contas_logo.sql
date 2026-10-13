-- =============================================================
-- 371 · Logo de cada conta de Instagram (issue #264)
-- =============================================================
-- A logo que entra em todas as artes da conta, num selo, e o texto escrito
-- embaixo dela (ex.: "2ª Região"). Vazio = conta sem selo, como a principal.
-- A logo fica no bucket público `instagram`; aqui vai só o endereço.

alter table public.instagram_contas
  add column if not exists logo_url     text not null default '',
  add column if not exists logo_legenda text not null default '';
