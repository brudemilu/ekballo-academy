-- =============================================================
-- Automação de campanhas com APROVAÇÃO MANUAL.
--
-- Regra de ouro (pedido do Bruno): o sistema detecta candidatos por
-- regra e cria campanhas SUGERIDAS — mas NUNCA envia sozinho. Só depois
-- que o admin aprova é que os destinatários entram na whatsapp_fila (1/min).
--
-- Gatilhos (a partir de 3 dias, verificação diária via pg_cron):
--   comece_curso   — matriculado há ≥N dias sem nenhum progresso no curso
--   continue_curso — começou mas parou há ≥N dias (não concluiu)
--   parabens       — concluiu o curso (felicitação)
--   sumida         — sem login há ≥N dias (sem curso específico)
--
-- Anti-spam: avisos_enviados registra quem já foi avisado (aprovado OU
-- descartado) por gatilho/curso; a detecção não repete antes de
-- repetir_apos_dias.
-- =============================================================

-- -------------------------------------------------------------
-- Config dos gatilhos (liga/desliga e janelas)
-- -------------------------------------------------------------
create table if not exists public.automacao_gatilhos (
  gatilho text primary key,
  ativo boolean not null default true,
  dias_gatilho int not null default 3,
  repetir_apos_dias int not null default 7,
  updated_at timestamptz not null default now()
);

insert into public.automacao_gatilhos (gatilho, ativo, dias_gatilho, repetir_apos_dias)
values
  ('comece_curso', true, 3, 7),
  ('continue_curso', true, 3, 7),
  ('parabens', true, 0, 30),
  ('sumida', true, 3, 7)
on conflict (gatilho) do nothing;

alter table public.automacao_gatilhos enable row level security;
drop policy if exists "automacao_gatilhos_admin" on public.automacao_gatilhos;
create policy "automacao_gatilhos_admin" on public.automacao_gatilhos for all
  to authenticated
  using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.is_admin=true))
  with check (exists (select 1 from public.profiles p where p.id=auth.uid() and p.is_admin=true));

-- -------------------------------------------------------------
-- Campanhas sugeridas + candidatos + registro de avisos
-- -------------------------------------------------------------
create table if not exists public.campanhas_sugeridas (
  id uuid primary key default gen_random_uuid(),
  gatilho text not null,
  curso_id uuid references public.cursos(id) on delete cascade,
  descricao text not null,
  template_id uuid references public.mensagem_templates(id) on delete set null,
  status text not null default 'pendente' check (status in ('pendente','aprovada','descartada')),
  total_candidatos int not null default 0,
  criado_em timestamptz not null default now(),
  processada_em timestamptz
);
create index if not exists campanhas_sugeridas_status_idx on public.campanhas_sugeridas (status, criado_em);

create table if not exists public.campanha_candidatos (
  id uuid primary key default gen_random_uuid(),
  campanha_id uuid not null references public.campanhas_sugeridas(id) on delete cascade,
  aluno_id uuid not null references public.profiles(id) on delete cascade,
  telefone text not null,
  nome text,
  motivo text,
  incluir boolean not null default true
);
create index if not exists campanha_candidatos_camp_idx on public.campanha_candidatos (campanha_id);

create table if not exists public.avisos_enviados (
  id uuid primary key default gen_random_uuid(),
  aluno_id uuid not null references public.profiles(id) on delete cascade,
  gatilho text not null,
  curso_id uuid references public.cursos(id) on delete cascade,
  resultado text not null default 'enfileirado', -- enfileirado | descartado
  enviado_em timestamptz not null default now()
);
create index if not exists avisos_enviados_lookup_idx on public.avisos_enviados (aluno_id, gatilho, enviado_em);

-- RLS: admin lê/gerencia; service_role e funções definer bypassam.
alter table public.campanhas_sugeridas enable row level security;
alter table public.campanha_candidatos enable row level security;
alter table public.avisos_enviados enable row level security;

drop policy if exists "campanhas_admin" on public.campanhas_sugeridas;
create policy "campanhas_admin" on public.campanhas_sugeridas for all to authenticated
  using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.is_admin=true))
  with check (exists (select 1 from public.profiles p where p.id=auth.uid() and p.is_admin=true));
drop policy if exists "campanha_cand_admin" on public.campanha_candidatos;
create policy "campanha_cand_admin" on public.campanha_candidatos for all to authenticated
  using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.is_admin=true))
  with check (exists (select 1 from public.profiles p where p.id=auth.uid() and p.is_admin=true));
drop policy if exists "avisos_admin" on public.avisos_enviados;
create policy "avisos_admin" on public.avisos_enviados for select to authenticated
  using (exists (select 1 from public.profiles p where p.id=auth.uid() and p.is_admin=true));

-- -------------------------------------------------------------
-- DETECÇÃO (roda no cron diário; NÃO envia nada)
-- -------------------------------------------------------------
create or replace function public.detectar_campanhas()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  g record;
  v_curso record;
  v_camp uuid;
  n int;
begin
  -- ---------- COMECE_CURSO (por curso) ----------
  select * into g from automacao_gatilhos where gatilho='comece_curso';
  if g.ativo then
    for v_curso in
      select c.id, c.titulo from cursos c
      where (select count(*) from aulas a where a.curso_id=c.id) > 0
    loop
      if not exists (select 1 from campanhas_sugeridas s
                     where s.gatilho='comece_curso' and s.curso_id=v_curso.id and s.status='pendente') then
        insert into campanhas_sugeridas (gatilho, curso_id, descricao, template_id, status)
        values ('comece_curso', v_curso.id, 'Não começaram: '||v_curso.titulo,
                (select id from mensagem_templates where titulo='Você ainda não começou' limit 1), 'pendente')
        returning id into v_camp;

        insert into campanha_candidatos (campanha_id, aluno_id, telefone, nome, motivo)
        select v_camp, pr.id, regexp_replace(pr.telefone,'\D','','g'), pr.nome,
               'Matriculado há '||(now()::date - m.matriculado_em::date)||' dias, ainda não começou'
        from matriculas m
        join profiles pr on pr.id=m.aluno_id and pr.is_admin=false
        where m.curso_id=v_curso.id
          and m.matriculado_em <= now() - (g.dias_gatilho||' days')::interval
          and m.concluido_em is null
          and pr.telefone is not null
          and length(regexp_replace(pr.telefone,'\D','','g')) >= 10
          and not exists (select 1 from progresso p join aulas a on a.id=p.aula_id
                          where a.curso_id=v_curso.id and p.aluno_id=m.aluno_id)
          and not exists (select 1 from avisos_enviados ae
                          where ae.aluno_id=m.aluno_id and ae.gatilho='comece_curso' and ae.curso_id=v_curso.id
                            and ae.enviado_em > now() - (g.repetir_apos_dias||' days')::interval);

        get diagnostics n = row_count;
        if n = 0 then delete from campanhas_sugeridas where id=v_camp;
        else update campanhas_sugeridas set total_candidatos=n where id=v_camp; end if;
      end if;
    end loop;
  end if;

  -- ---------- CONTINUE_CURSO (por curso) ----------
  select * into g from automacao_gatilhos where gatilho='continue_curso';
  if g.ativo then
    for v_curso in
      select c.id, c.titulo, (select count(*) from aulas a where a.curso_id=c.id) as total
      from cursos c where (select count(*) from aulas a where a.curso_id=c.id) > 0
    loop
      if not exists (select 1 from campanhas_sugeridas s
                     where s.gatilho='continue_curso' and s.curso_id=v_curso.id and s.status='pendente') then
        insert into campanhas_sugeridas (gatilho, curso_id, descricao, template_id, status)
        values ('continue_curso', v_curso.id, 'Pararam no meio: '||v_curso.titulo,
                (select id from mensagem_templates where titulo='Continue a leitura do livro' limit 1), 'pendente')
        returning id into v_camp;

        insert into campanha_candidatos (campanha_id, aluno_id, telefone, nome, motivo)
        select v_camp, pr.id, regexp_replace(pr.telefone,'\D','','g'), pr.nome,
               'Parado há '||(now()::date - (select max(p.concluido_em) from progresso p join aulas a on a.id=p.aula_id
                              where a.curso_id=v_curso.id and p.aluno_id=pr.id)::date)||' dias'
        from matriculas m
        join profiles pr on pr.id=m.aluno_id and pr.is_admin=false
        where m.curso_id=v_curso.id and m.concluido_em is null
          and pr.telefone is not null and length(regexp_replace(pr.telefone,'\D','','g')) >= 10
          and (select count(distinct p.aula_id) from progresso p join aulas a on a.id=p.aula_id
               where a.curso_id=v_curso.id and p.aluno_id=pr.id) between 1 and v_curso.total - 1
          and (select max(p.concluido_em) from progresso p join aulas a on a.id=p.aula_id
               where a.curso_id=v_curso.id and p.aluno_id=pr.id) <= now() - (g.dias_gatilho||' days')::interval
          and not exists (select 1 from avisos_enviados ae
                          where ae.aluno_id=pr.id and ae.gatilho='continue_curso' and ae.curso_id=v_curso.id
                            and ae.enviado_em > now() - (g.repetir_apos_dias||' days')::interval);

        get diagnostics n = row_count;
        if n = 0 then delete from campanhas_sugeridas where id=v_camp;
        else update campanhas_sugeridas set total_candidatos=n where id=v_camp; end if;
      end if;
    end loop;
  end if;

  -- ---------- PARABENS (por curso) ----------
  select * into g from automacao_gatilhos where gatilho='parabens';
  if g.ativo then
    for v_curso in
      select c.id, c.titulo, (select count(*) from aulas a where a.curso_id=c.id) as total
      from cursos c where (select count(*) from aulas a where a.curso_id=c.id) > 0
    loop
      if not exists (select 1 from campanhas_sugeridas s
                     where s.gatilho='parabens' and s.curso_id=v_curso.id and s.status='pendente') then
        insert into campanhas_sugeridas (gatilho, curso_id, descricao, template_id, status)
        values ('parabens', v_curso.id, 'Concluíram: '||v_curso.titulo,
                (select id from mensagem_templates where titulo='Parabéns por concluir' limit 1), 'pendente')
        returning id into v_camp;

        insert into campanha_candidatos (campanha_id, aluno_id, telefone, nome, motivo)
        select v_camp, pr.id, regexp_replace(pr.telefone,'\D','','g'), pr.nome, 'Concluiu o curso 🎉'
        from matriculas m
        join profiles pr on pr.id=m.aluno_id and pr.is_admin=false
        where m.curso_id=v_curso.id
          and pr.telefone is not null and length(regexp_replace(pr.telefone,'\D','','g')) >= 10
          and (select count(distinct p.aula_id) from progresso p join aulas a on a.id=p.aula_id
               where a.curso_id=v_curso.id and p.aluno_id=pr.id) >= v_curso.total
          and not exists (select 1 from avisos_enviados ae
                          where ae.aluno_id=pr.id and ae.gatilho='parabens' and ae.curso_id=v_curso.id
                            and ae.enviado_em > now() - (g.repetir_apos_dias||' days')::interval);

        get diagnostics n = row_count;
        if n = 0 then delete from campanhas_sugeridas where id=v_camp;
        else update campanhas_sugeridas set total_candidatos=n where id=v_camp; end if;
      end if;
    end loop;
  end if;

  -- ---------- SUMIDA (geral, sem curso) ----------
  select * into g from automacao_gatilhos where gatilho='sumida';
  if g.ativo then
    if not exists (select 1 from campanhas_sugeridas s
                   where s.gatilho='sumida' and s.curso_id is null and s.status='pendente') then
      insert into campanhas_sugeridas (gatilho, curso_id, descricao, template_id, status)
      values ('sumida', null, 'Sem acessar há '||g.dias_gatilho||'+ dias',
              (select id from mensagem_templates where titulo='Sentimos sua falta' limit 1), 'pendente')
      returning id into v_camp;

      insert into campanha_candidatos (campanha_id, aluno_id, telefone, nome, motivo)
      select v_camp, pr.id, regexp_replace(pr.telefone,'\D','','g'), pr.nome,
             'Último acesso há '||(now()::date - u.last_sign_in_at::date)||' dias'
      from profiles pr
      join auth.users u on u.id=pr.id
      where pr.is_admin=false
        and pr.telefone is not null and length(regexp_replace(pr.telefone,'\D','','g')) >= 10
        and u.last_sign_in_at is not null
        and u.last_sign_in_at <= now() - (g.dias_gatilho||' days')::interval
        and not exists (select 1 from avisos_enviados ae
                        where ae.aluno_id=pr.id and ae.gatilho='sumida'
                          and ae.enviado_em > now() - (g.repetir_apos_dias||' days')::interval);

      get diagnostics n = row_count;
      if n = 0 then delete from campanhas_sugeridas where id=v_camp;
      else update campanhas_sugeridas set total_candidatos=n where id=v_camp; end if;
    end if;
  end if;
end;
$$;

revoke execute on function public.detectar_campanhas() from public, anon, authenticated;

-- Cron diário (12:13 UTC ≈ 09:13 BRT). Idempotente.
do $$
begin
  if exists (select 1 from cron.job where jobname='detectar-campanhas') then
    perform cron.unschedule('detectar-campanhas');
  end if;
  perform cron.schedule('detectar-campanhas', '13 12 * * *',
    $cron$select public.detectar_campanhas()$cron$);
end;
$$;
