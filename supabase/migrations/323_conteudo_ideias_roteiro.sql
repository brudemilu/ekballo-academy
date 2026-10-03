-- Copiloto de conteúdo (issue #189), fatia 5: pacote da semana.
--
-- A ideia do calendário passa a poder apontar para um roteiro guardado, do
-- mesmo jeito que já aponta para um post (carrossel_id). É o que deixa o
-- roteiro de Reel ter dia marcado no calendário e abrir com um clique.

alter table public.conteudo_ideias
  add column if not exists roteiro_id uuid references public.conteudo_roteiros (id) on delete set null;

create index if not exists idx_conteudo_ideias_roteiro
  on public.conteudo_ideias (roteiro_id);
