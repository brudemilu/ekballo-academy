-- Copiloto de conteúdo (issue #189): resposta automática a comentários.
--
-- Quem comenta uma palavra combinada ("MESA") num post recebe uma resposta
-- pública e/ou uma mensagem direta com o link — sem o pastor precisar ver.
--
-- conteudo_comentarios_config       — UMA linha (id = 1): ligado ou não.
--                                     Nasce DESLIGADO.
-- conteudo_comentarios_regras       — palavra → o que responder.
-- conteudo_comentarios_respondidos  — um registro por comentário tratado. A
--                                     chave é o id do comentário no Instagram:
--                                     é ela que impede responder duas vezes.

create table if not exists public.conteudo_comentarios_config (
  id            smallint primary key default 1 check (id = 1),
  ativo         boolean not null default false,
  atualizado_em timestamptz not null default now()
);

create table if not exists public.conteudo_comentarios_regras (
  id                uuid primary key default gen_random_uuid(),
  palavra           text not null,
  resposta_publica  text not null default '',
  mensagem_privada  text not null default '',
  ativo             boolean not null default true,
  criado_em         timestamptz not null default now()
);

create table if not exists public.conteudo_comentarios_respondidos (
  comentario_id text primary key,
  regra_id      uuid references public.conteudo_comentarios_regras (id) on delete set null,
  media_id      text not null default '',
  usuario       text not null default '',
  texto         text not null default '',
  palavra       text not null default '',
  publico_ok    boolean,
  privado_ok    boolean,
  erro          text,
  criado_em     timestamptz not null default now()
);

create index if not exists idx_conteudo_comentarios_respondidos_criado
  on public.conteudo_comentarios_respondidos (criado_em desc);

alter table public.conteudo_comentarios_config enable row level security;
alter table public.conteudo_comentarios_regras enable row level security;
alter table public.conteudo_comentarios_respondidos enable row level security;

drop policy if exists "admin full access comentarios config" on public.conteudo_comentarios_config;
create policy "admin full access comentarios config"
  on public.conteudo_comentarios_config
  for all to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

drop policy if exists "admin full access comentarios regras" on public.conteudo_comentarios_regras;
create policy "admin full access comentarios regras"
  on public.conteudo_comentarios_regras
  for all to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

drop policy if exists "admin full access comentarios respondidos" on public.conteudo_comentarios_respondidos;
create policy "admin full access comentarios respondidos"
  on public.conteudo_comentarios_respondidos
  for all to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

-- Cron ----------------------------------------------------------
create or replace function public.disparar_comentarios_instagram()
returns void
language plpgsql
security definer
set search_path to 'public'
as $fn$
declare v_secret text;
begin
  -- Desligado (o padrão): nem chama o app.
  if not exists (select 1 from public.conteudo_comentarios_config where id = 1 and ativo) then
    return;
  end if;
  select decrypted_secret into v_secret
    from vault.decrypted_secrets where name = 'agenda_sync_secret';
  if v_secret is null then return; end if; -- ainda não configurado
  perform net.http_get(
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/comentarios-instagram?secret=' || v_secret,
    timeout_milliseconds := 50000
  );
end;
$fn$;

-- SECURITY DEFINER em schema público recebe EXECUTE de PUBLIC por padrão;
-- revogar evita que um cliente dispare a rotina pela Data API.
revoke all on function public.disparar_comentarios_instagram() from public, anon, authenticated;

select cron.unschedule('comentarios-instagram')
 where exists (select 1 from cron.job where jobname = 'comentarios-instagram');

-- De 5 em 5 minutos, deslocado dos agendados (que rodam no minuto cheio).
select cron.schedule(
  'comentarios-instagram',
  '3-58/5 * * * *',
  'select public.disparar_comentarios_instagram()'
);
