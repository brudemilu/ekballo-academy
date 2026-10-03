-- Copiloto de conteúdo (issue #189), fatia 1: calendário semanal.
--
-- 1) conteudo_ideias — a etapa ANTES do rascunho. Uma ideia ainda não tem
--    slides nem vídeo; tem um título, uma nota e (opcionalmente) o dia em que
--    se pretende postar. Fica numa tabela própria em vez de virar mais um
--    status de instagram_carrosseis porque ainda não sabe o que vai ser:
--    carrossel, reel ou roteiro falado. Quando vira post, carrossel_id liga
--    as duas pontas.
--
-- 2) Religa a publicação dos posts agendados. O disparador
--    (/api/cron/instagram-agendados) era chamado pelo Vercel Cron; desde a
--    migração para o Contabo nenhum job o chamava (conferido em 02/out/2026:
--    11 jobs no cron.job, nenhum deste). Um post "Agendado" nunca saía.

-- 1) Ideias ----------------------------------------------------
create table if not exists public.conteudo_ideias (
  id             uuid primary key default gen_random_uuid(),
  titulo         text not null check (char_length(btrim(titulo)) between 1 and 200),
  nota           text not null default '',
  formato        text not null default 'carrossel'
                   check (formato in ('carrossel', 'reel', 'story', 'roteiro')),
  data_planejada date,
  carrossel_id   uuid references public.instagram_carrosseis (id) on delete set null,
  criado_em      timestamptz not null default now(),
  atualizado_em  timestamptz not null default now()
);

create index if not exists idx_conteudo_ideias_data
  on public.conteudo_ideias (data_planejada);

create index if not exists idx_conteudo_ideias_carrossel
  on public.conteudo_ideias (carrossel_id);

alter table public.conteudo_ideias enable row level security;

drop policy if exists "admin full access conteudo ideias" on public.conteudo_ideias;
create policy "admin full access conteudo ideias"
  on public.conteudo_ideias
  for all
  to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

-- 2) Cron dos agendados ----------------------------------------
create or replace function public.disparar_instagram_agendados()
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
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/instagram-agendados?secret=' || v_secret,
    timeout_milliseconds := 55000
  );
end;
$fn$;

-- SECURITY DEFINER em schema público recebe EXECUTE de PUBLIC por padrão;
-- revogar evita que um cliente dispare a publicação pela Data API.
revoke all on function public.disparar_instagram_agendados() from public, anon, authenticated;

select cron.unschedule('instagram-agendados')
 where exists (select 1 from cron.job where jobname = 'instagram-agendados');

-- De 5 em 5 minutos: o calendário agenda por horário cheio/meia hora, e a
-- rota publica no máximo alguns posts por chamada. Sem nada vencido, a
-- chamada é uma consulta vazia.
select cron.schedule(
  'instagram-agendados',
  '*/5 * * * *',
  'select public.disparar_instagram_agendados()'
);
