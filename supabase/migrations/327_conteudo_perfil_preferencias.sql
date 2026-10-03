-- Copiloto de conteúdo (issue #189): a IA aprende com as recusas.
--
-- Quando o pastor cancela uma peça e diz por quê, o motivo vira uma
-- preferência guardada no próprio perfil — e passa a entrar em todo pedido de
-- conteúdo. Fica em jsonb na linha do perfil (são no máximo 20 frases curtas,
-- lidas e gravadas sempre juntas com o resto do perfil).

alter table public.conteudo_perfil
  add column if not exists preferencias jsonb not null default '[]'::jsonb;
