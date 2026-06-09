-- 078 · Reels de Instagram
-- Reaproveita a tabela instagram_carrosseis pra também guardar Reels (vídeo).
-- tipo=carrossel (default, comportamento atual) | tipo=reel (vídeo).

alter table public.instagram_carrosseis
  add column if not exists tipo text not null default 'carrossel'
    check (tipo in ('carrossel', 'reel')),
  add column if not exists video_url text,
  add column if not exists thumbnail_url text;

create index if not exists idx_ig_carrosseis_tipo
  on public.instagram_carrosseis (tipo, status, criado_em desc);
