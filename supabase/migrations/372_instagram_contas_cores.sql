-- =============================================================
-- 372 · Cores de cada conta de Instagram nas artes (issue #264)
-- =============================================================
-- Três cores por conta, em hexadecimal ("#RRGGBB"): a de destaque, a do fundo
-- e a do texto. Na 2ª Região são as da logo (vermelho, azul-marinho, branco).
-- Vazias = a conta usa as cores de sempre, com o tema escolhido em cada post.
-- Só valem as três juntas: paleta pela metade é ignorada pelo app.

alter table public.instagram_contas
  add column if not exists cor_destaque text not null default '',
  add column if not exists cor_fundo    text not null default '',
  add column if not exists cor_texto    text not null default '';
