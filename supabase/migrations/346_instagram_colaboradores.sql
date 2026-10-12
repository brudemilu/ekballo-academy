-- =============================================================
-- 346 · Colaboradores dos posts do Instagram (issue #256)
-- =============================================================
-- Perfis convidados a aparecer junto no post (até 3, sem "@"). O convite é
-- enviado na publicação; o post só aparece no perfil do convidado depois que
-- ele aceita. Lista vazia = post sem colaboração, como sempre foi.

alter table public.instagram_carrosseis
  add column if not exists colaboradores text[] not null default '{}';

-- Aviso deixado pela publicação quando o post saiu, mas algo ficou de fora
-- (ex.: o Instagram recusou o convite de colaboração). Diferente de `erro`,
-- que é do post que NÃO saiu.
alter table public.instagram_carrosseis
  add column if not exists aviso text;
