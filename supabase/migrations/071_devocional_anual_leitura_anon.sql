-- 071_devocional_anual_leitura_anon.sql
--
-- Corrige o compartilhamento de imagem do devocional.
--
-- A rota /api/og/devocional gera uma imagem PÚBLICA — ela é aberta fora do app
-- (Instagram, status do WhatsApp, visualizador de fotos), sem sessão de login.
-- Nesses casos o papel do Postgres é `anon`. A policy original de leitura era só
-- `to authenticated`, então a RLS bloqueava a leitura, `getDevocionalAnualByDia`
-- retornava null e a rota respondia 404 em TODOS os modelos (pergaminho, bloco,
-- reflexão e cinematográfico).
--
-- A bíblia (migration 018) já libera leitura `to authenticated, anon` do
-- conteúdo — por isso a imagem dela sempre funcionou. Aqui espelhamos esse mesmo
-- padrão: leitura anônima apenas do devocional PUBLICADO. Escrita continua
-- restrita a admin (policy devocional_anual_admin_all, inalterada).

drop policy if exists "devocional_anual_read_publicado" on devocional_anual;
create policy "devocional_anual_read_publicado" on devocional_anual for select
  to authenticated, anon
  using (publicado = true);
