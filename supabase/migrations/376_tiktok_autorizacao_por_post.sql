-- =============================================================
-- 376 · TikTok: autorização por vídeo para a publicação direta (issue #275)
-- =============================================================
-- A análise do TikTok só aprova a publicação direta se a pessoa autorizar
-- CADA vídeo numa tela com regras definidas (quem pode ver, interações,
-- conteúdo comercial, aceite de uso de música). As escolhas ficam no post e
-- são usadas quando ele sai no Instagram. Sem autorização, o Reel continua
-- indo para os rascunhos do TikTok.
alter table public.instagram_carrosseis
  add column if not exists tiktok jsonb;

comment on column public.instagram_carrosseis.tiktok is
  'Autorização de publicação direta no TikTok (privacidade, interações, conteúdo comercial, legenda, autorizadoEm). Nula = vai para os rascunhos.';
