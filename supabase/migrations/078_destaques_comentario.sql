-- =============================================================
-- EKBALLO ACADEMY
-- Comentário do discípulo no grifo de uma aula (Temáticas)
-- O comentário é uma nota livre atrelada a um trecho grifado.
-- =============================================================

alter table public.destaques_aula
  add column if not exists comentario text;

comment on column public.destaques_aula.comentario is
  'Nota/comentário do discípulo sobre o trecho grifado (opcional).';
