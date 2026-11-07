-- =============================================================
-- 370 · Várias contas de Instagram no mesmo painel (issue #264)
-- =============================================================
-- Até aqui o painel conhecia UMA conta: token e ID no ambiente do servidor e
-- nenhuma tabela dizia de quem era cada registro. Esta migration:
--
--   1) cria o cadastro de contas (instagram_contas) e, à parte, o cofre dos
--      tokens (instagram_contas_credenciais), que só o cliente de serviço lê;
--   2) carimba cada registro do copiloto com a conta dona (conta_id);
--   3) troca a chave das três tabelas de linha única (perfil, piloto, respostas)
--      de "id = 1" para a conta.
--
-- Feita para conviver com a imagem ANTIGA enquanto a nova não sobe: conta_id
-- tem a conta principal como padrão (o código antigo insere sem informar) e a
-- coluna `id` das tabelas de linha única continua valendo 1 na linha da conta
-- principal (o código antigo lê e grava por `id = 1`). Uma migration futura
-- remove o `id` e o padrão, quando não houver mais imagem antiga no ar.

-- 1) Contas ----------------------------------------------------
create table if not exists public.instagram_contas (
  id            uuid primary key default gen_random_uuid(),
  nome          text not null check (char_length(btrim(nome)) between 1 and 80),
  -- Preenchidos pela conferência do token (o Instagram é quem diz).
  usuario       text not null default '',
  ig_user_id    text not null default '',
  -- O que assina as artes desta conta (ex.: "Ekballo Academy").
  assinatura    text not null default '',
  principal     boolean not null default false,
  criado_em     timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

-- Só uma conta principal; e o mesmo perfil não entra duas vezes.
create unique index if not exists idx_instagram_contas_principal
  on public.instagram_contas (principal) where principal;
create unique index if not exists idx_instagram_contas_ig_user
  on public.instagram_contas (ig_user_id) where ig_user_id <> '';

-- A conta que já existia. O id é fixo porque o código precisa apontar para
-- ela sem consultar o banco (lib/instagram-contas.ts, CONTA_PRINCIPAL_ID).
-- Sem token gravado, ela segue usando IG_USER_ID e META_ACCESS_TOKEN do
-- ambiente, como sempre.
insert into public.instagram_contas (id, nome, usuario, assinatura, principal)
values (
  '00000000-0000-4000-8000-000000000001',
  'Bruno Fernandes',
  'brunofesantos',
  'Ekballo Academy',
  true
)
on conflict (id) do nothing;

alter table public.instagram_contas enable row level security;

drop policy if exists "admin full access instagram contas" on public.instagram_contas;
create policy "admin full access instagram contas"
  on public.instagram_contas
  for all
  to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

-- O token dá poder de publicar no perfil: fica numa tabela sem nenhuma
-- política, que a Data API não entrega a ninguém logado. Só o servidor, com a
-- chave de serviço, lê e grava.
create table if not exists public.instagram_contas_credenciais (
  conta_id      uuid primary key references public.instagram_contas (id) on delete cascade,
  token         text not null,
  -- Quando o Instagram diz que o token vence (aviso na tela).
  expira_em     timestamptz,
  atualizado_em timestamptz not null default now()
);

alter table public.instagram_contas_credenciais enable row level security;
revoke all on public.instagram_contas_credenciais from anon, authenticated;

-- 2) De quem é cada registro -----------------------------------
do $$
declare
  t text;
begin
  foreach t in array array[
    'instagram_carrosseis',
    'conteudo_ideias',
    'conteudo_referencias',
    'conteudo_roteiros',
    'conteudo_cortes',
    'conteudo_piloto_execucoes',
    'conteudo_comentarios_regras',
    'conteudo_comentarios_respondidos',
    'conteudo_perfil',
    'conteudo_piloto',
    'conteudo_comentarios_config'
  ]
  loop
    execute format(
      'alter table public.%I add column if not exists conta_id uuid not null
         default ''00000000-0000-4000-8000-000000000001''
         references public.instagram_contas (id) on delete restrict',
      t
    );
  end loop;
end $$;

-- O cron procura os agendados vencidos; as telas listam por conta.
create index if not exists idx_ig_carrosseis_conta
  on public.instagram_carrosseis (conta_id, criado_em desc);
create index if not exists idx_conteudo_ideias_conta
  on public.conteudo_ideias (conta_id, criado_em desc);
create index if not exists idx_conteudo_referencias_conta
  on public.conteudo_referencias (conta_id);
create index if not exists idx_conteudo_roteiros_conta
  on public.conteudo_roteiros (conta_id, criado_em desc);
create index if not exists idx_conteudo_cortes_conta
  on public.conteudo_cortes (conta_id, criado_em desc);
create index if not exists idx_conteudo_piloto_execucoes_conta
  on public.conteudo_piloto_execucoes (conta_id, criado_em desc);
create index if not exists idx_conteudo_comentarios_regras_conta
  on public.conteudo_comentarios_regras (conta_id);
create index if not exists idx_conteudo_comentarios_respondidos_conta
  on public.conteudo_comentarios_respondidos (conta_id, criado_em desc);

-- 3) Tabelas de linha única: uma linha POR CONTA ----------------
-- A chave passa a ser a conta. O `id` fica (valendo 1 só na linha da conta
-- principal) para a imagem antiga continuar lendo e gravando.
do $$
declare
  t text;
begin
  foreach t in array array[
    'conteudo_perfil',
    'conteudo_piloto',
    'conteudo_comentarios_config'
  ]
  loop
    -- Já migrada (chave na conta)? Não repete.
    if exists (
      select 1
        from pg_constraint c
        join pg_attribute a
          on a.attrelid = c.conrelid and a.attnum = any (c.conkey)
       where c.conrelid = format('public.%I', t)::regclass
         and c.contype = 'p'
         and a.attname = 'conta_id'
    ) then
      continue;
    end if;
    execute format('alter table public.%I drop constraint if exists %I', t, t || '_pkey');
    execute format('alter table public.%I drop constraint if exists %I', t, t || '_id_check');
    execute format('alter table public.%I alter column id drop not null', t);
    execute format('alter table public.%I alter column id drop default', t);
    execute format('alter table public.%I add primary key (conta_id)', t);
  end loop;
end $$;

-- O disparador das respostas só chamava o app com "a" configuração ligada;
-- agora basta UMA conta estar com o recurso ligado.
create or replace function public.disparar_comentarios_instagram()
returns void
language plpgsql
security definer
set search_path to 'public'
as $fn$
declare v_secret text;
begin
  if not exists (select 1 from public.conteudo_comentarios_config where ativo) then
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

revoke all on function public.disparar_comentarios_instagram() from public, anon, authenticated;
