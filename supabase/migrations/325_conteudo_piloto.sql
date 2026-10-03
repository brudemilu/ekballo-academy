-- Copiloto de conteúdo (issue #189): piloto automático do Instagram.
--
-- conteudo_piloto            — UMA linha (id = 1): se está ligado, de onde
--                              tira o assunto, o que produz e quando.
-- conteudo_piloto_execucoes  — uma linha por semana preparada: a fonte usada
--                              e as peças (agendadas, vetadas, prontas).
--
-- O cron roda de hora em hora e a rota decide se é a hora do preparo. Assim o
-- pastor muda o dia e a hora na tela sem ninguém mexer no agendamento do banco.

create table if not exists public.conteudo_piloto (
  id                smallint primary key default 1 check (id = 1),
  ativo             boolean not null default false,
  fontes            jsonb   not null default '["pregacao","livro","devocional"]'::jsonb,
  curso_id          uuid references public.cursos (id) on delete set null,
  ultima_mesa_ordem integer,
  preparo           jsonb   not null default '{"dia":0,"hora":20}'::jsonb,
  carrossel         jsonb   not null default '{"dia":2,"hora":19}'::jsonb,
  reel              jsonb   not null default '{"dia":4,"hora":19}'::jsonb,
  pecas             jsonb   not null default '{"carrossel":true,"reel_ia":true,"roteiro":true}'::jsonb,
  telefone          text    not null default '',
  ultima_fonte      text,
  ultimo_corte_id   uuid,
  atualizado_em     timestamptz not null default now()
);

create table if not exists public.conteudo_piloto_execucoes (
  id            uuid primary key default gen_random_uuid(),
  status        text not null default 'preparando'
                  check (status in ('preparando', 'pronto', 'erro')),
  fonte         jsonb,
  pecas         jsonb not null default '[]'::jsonb,
  erro          text,
  aviso_enviado boolean not null default false,
  criado_em     timestamptz not null default now()
);

create index if not exists idx_conteudo_piloto_execucoes_criado
  on public.conteudo_piloto_execucoes (criado_em desc);

alter table public.conteudo_piloto enable row level security;
alter table public.conteudo_piloto_execucoes enable row level security;

drop policy if exists "admin full access conteudo piloto" on public.conteudo_piloto;
create policy "admin full access conteudo piloto"
  on public.conteudo_piloto
  for all
  to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

drop policy if exists "admin full access conteudo piloto execucoes" on public.conteudo_piloto_execucoes;
create policy "admin full access conteudo piloto execucoes"
  on public.conteudo_piloto_execucoes
  for all
  to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

-- Cron ----------------------------------------------------------
create or replace function public.disparar_piloto_conteudo()
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
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/piloto-conteudo?secret=' || v_secret,
    timeout_milliseconds := 20000
  );
end;
$fn$;

-- SECURITY DEFINER em schema público recebe EXECUTE de PUBLIC por padrão;
-- revogar evita que um cliente dispare o piloto pela Data API.
revoke all on function public.disparar_piloto_conteudo() from public, anon, authenticated;

select cron.unschedule('piloto-conteudo')
 where exists (select 1 from cron.job where jobname = 'piloto-conteudo');

-- No minuto 2 de cada hora: a rota confere se é o dia e a hora do preparo e
-- se a semana ainda não foi preparada. Fora disso, responde e não faz nada.
select cron.schedule(
  'piloto-conteudo',
  '2 * * * *',
  'select public.disparar_piloto_conteudo()'
);
