-- =============================================================
-- DEVOCIONAL NO GRUPO · o disparo estava estourando o timeout do pg_net
--
-- Achado ao investigar por que o devocional parou (set/2026): em
-- net._http_response o disparo das 6h aparecia como
-- "Timeout of 5000 ms reached" — 5s é o default do pg_net, e a rota
-- demora mais que isso porque busca o devocional e fala com a Evolution
-- uma vez POR GRUPO (hoje dois: IMW Olaria e GCEU 22).
--
-- Não foi a causa da queda — essa foi o socket do WhatsApp morto —, mas
-- deixava o cron cego: a resposta nunca era gravada, então nem dava pra
-- saber pelo banco se o envio tinha dado certo. Com mais grupos, vira
-- risco de a chamada ser abortada no meio de um envio.
-- =============================================================

create or replace function public.disparar_devocional_grupo()
returns void
language plpgsql
security definer
set search_path to 'public'
as $fn$
declare v_secret text;
begin
  select decrypted_secret into v_secret
    from vault.decrypted_secrets where name = 'agenda_sync_secret';
  if v_secret is null then return; end if; -- ainda não configurado
  perform net.http_get(
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/devocional-grupo?secret=' || v_secret,
    timeout_milliseconds := 45000
  );
end;
$fn$;

revoke all on function public.disparar_devocional_grupo() from public, anon, authenticated;
