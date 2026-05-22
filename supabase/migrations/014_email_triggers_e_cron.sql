-- =============================================================
-- Triggers de email automático e cron de lembrete de inatividade.
--
-- Dependências:
--   - vault.decrypted_secrets contém um segredo chamado 'internal_secret'
--     (usado como header x-internal-secret pra autenticar chamadas à
--     Edge Function enviar-email).
--   - Edge Function `enviar-email` deployada em
--     https://<ref>.functions.supabase.co/enviar-email
--   - public.email_templates tem os 3 templates da migration 013.
-- =============================================================

-- 1) Extensões necessárias
create extension if not exists pg_net with schema extensions;
create extension if not exists pg_cron with schema extensions;

-- =============================================================
-- 2) Helper function: chama a Edge Function pra disparar um email
-- =============================================================

create or replace function public.enviar_email(
  p_chave text,
  p_destinatario text,
  p_variaveis jsonb default '{}'::jsonb
) returns void
language plpgsql
security definer
set search_path = public, extensions, pg_temp
as $$
declare
  v_secret text;
begin
  -- Lê o secret compartilhado do Vault
  select decrypted_secret into v_secret
  from vault.decrypted_secrets
  where name = 'internal_secret';

  if v_secret is null then
    raise warning 'enviar_email: internal_secret não encontrado no Vault — pulando envio';
    return;
  end if;

  -- Dispara request assíncrono (fire and forget) pra Edge Function
  perform net.http_post(
    url := 'https://yasfxwqomvhmxxqnunat.functions.supabase.co/enviar-email',
    headers := jsonb_build_object(
      'Content-Type', 'application/json',
      'x-internal-secret', v_secret
    ),
    body := jsonb_build_object(
      'chave', p_chave,
      'destinatario', p_destinatario,
      'variaveis', p_variaveis
    ),
    timeout_milliseconds := 5000
  );
end;
$$;

comment on function public.enviar_email is
  'Dispara um email usando o template `p_chave` via Edge Function enviar-email. Fire-and-forget (não bloqueia o trigger se a função falhar).';

-- =============================================================
-- 3) Trigger em auth.users → notifica admin
-- =============================================================

create or replace function public.tg_notificar_novo_cadastro()
returns trigger
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_nome text;
begin
  -- Tenta extrair nome do raw_user_meta_data; cai pro local-part do email se não tiver
  v_nome := coalesce(
    new.raw_user_meta_data ->> 'nome',
    new.raw_user_meta_data ->> 'full_name',
    split_part(new.email, '@', 1)
  );

  perform public.enviar_email(
    'novo-cadastro',
    'brunosantospmb@gmail.com',
    jsonb_build_object(
      'nome_aluno', v_nome,
      'email_aluno', new.email,
      'link_admin', 'https://ekballo-academy.vercel.app/admin/alunos'
    )
  );

  return new;
exception when others then
  -- Nunca deixa um erro de email quebrar o signup
  raise warning 'tg_notificar_novo_cadastro: erro ao enviar email — %', sqlerrm;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created_notificar_admin on auth.users;
create trigger on_auth_user_created_notificar_admin
  after insert on auth.users
  for each row execute function public.tg_notificar_novo_cadastro();

-- =============================================================
-- 4) Trigger em matriculas → email de boas-vindas pro aluno
-- =============================================================

create or replace function public.tg_boas_vindas_matricula()
returns trigger
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_email text;
  v_nome text;
  v_titulo text;
  v_slug text;
begin
  select email, nome into v_email, v_nome
  from public.profiles
  where id = new.aluno_id;

  if v_email is null then
    raise warning 'tg_boas_vindas_matricula: email do aluno % não encontrado', new.aluno_id;
    return new;
  end if;

  select titulo, slug into v_titulo, v_slug
  from public.cursos
  where id = new.curso_id;

  perform public.enviar_email(
    'boas-vindas-curso',
    v_email,
    jsonb_build_object(
      'nome_aluno', coalesce(v_nome, split_part(v_email, '@', 1)),
      'nome_curso', v_titulo,
      'slug_curso', v_slug,
      'link_curso', 'https://ekballo-academy.vercel.app/cursos/' || v_slug
    )
  );

  return new;
exception when others then
  raise warning 'tg_boas_vindas_matricula: erro ao enviar email — %', sqlerrm;
  return new;
end;
$$;

drop trigger if exists on_matricula_inserted_boas_vindas on public.matriculas;
create trigger on_matricula_inserted_boas_vindas
  after insert on public.matriculas
  for each row execute function public.tg_boas_vindas_matricula();

-- =============================================================
-- 5) Tabela de controle de lembretes enviados (evita duplicação)
-- =============================================================

create table if not exists public.lembretes_enviados (
  aluno_id uuid not null references public.profiles(id) on delete cascade,
  curso_id uuid not null references public.cursos(id) on delete cascade,
  enviado_em timestamptz not null default now(),
  primary key (aluno_id, curso_id)
);

alter table public.lembretes_enviados enable row level security;
-- Sem policies públicas: só service_role (que bypassa RLS) escreve via trigger/cron.

-- =============================================================
-- 6) Função do cron: envia lembrete pra alunos inativos há ≥7 dias
-- =============================================================

create or replace function public.cron_lembrete_inatividade()
returns void
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  r record;
  v_dias_inatividade int := 7;
begin
  for r in
    select
      m.aluno_id,
      m.curso_id,
      p.email,
      p.nome,
      c.titulo as curso_titulo,
      c.slug as curso_slug
    from public.matriculas m
    join public.profiles p on p.id = m.aluno_id
    join public.cursos c on c.id = m.curso_id
    where
      m.matriculado_em <= now() - (v_dias_inatividade::text || ' days')::interval
      and not exists (
        select 1 from public.lembretes_enviados le
        where le.aluno_id = m.aluno_id and le.curso_id = m.curso_id
      )
      and not exists (
        select 1
        from public.progresso pr
        join public.aulas a on a.id = pr.aula_id
        where pr.aluno_id = m.aluno_id and a.curso_id = m.curso_id
      )
  loop
    perform public.enviar_email(
      'lembrete-inatividade',
      r.email,
      jsonb_build_object(
        'nome_aluno', coalesce(r.nome, split_part(r.email, '@', 1)),
        'nome_curso', r.curso_titulo,
        'slug_curso', r.curso_slug,
        'link_curso', 'https://ekballo-academy.vercel.app/cursos/' || r.curso_slug,
        'dias_inatividade', v_dias_inatividade::text
      )
    );

    insert into public.lembretes_enviados (aluno_id, curso_id)
    values (r.aluno_id, r.curso_id)
    on conflict do nothing;
  end loop;
end;
$$;

-- =============================================================
-- 7) Agenda o cron: todos os dias às 10h UTC (07h Brasília)
-- =============================================================

-- Remove agendamento anterior se existir
do $$
declare
  v_jobid bigint;
begin
  select jobid into v_jobid from cron.job where jobname = 'lembrete-inatividade-diario';
  if v_jobid is not null then
    perform cron.unschedule(v_jobid);
  end if;
end $$;

select cron.schedule(
  'lembrete-inatividade-diario',
  '0 10 * * *',
  $cron$ select public.cron_lembrete_inatividade(); $cron$
);
