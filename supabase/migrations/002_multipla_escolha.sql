-- ============================================================
-- EKBALLO ACADEMY · Suporte a atividades de múltipla escolha
-- Complementa 001_initial_schema adicionando o que o código já espera.
-- ============================================================

-- atividades: tipo (reflexao | multipla_escolha) e razao (explicação pós-MC)
alter table atividades
  add column if not exists tipo text not null default 'reflexao'
    check (tipo in ('reflexao', 'multipla_escolha')),
  add column if not exists razao text;

-- alternativas: opções de uma atividade MC
create table if not exists alternativas (
  id uuid primary key default gen_random_uuid(),
  atividade_id uuid not null references atividades(id) on delete cascade,
  texto text not null,
  correta boolean not null default false,
  ordem int default 0,
  created_at timestamptz default now()
);

create index if not exists alternativas_atividade_idx on alternativas(atividade_id);

-- respostas: alternativa_id pra MC; texto vira opcional (MC não tem texto)
alter table respostas alter column texto drop not null;
alter table respostas
  add column if not exists alternativa_id uuid references alternativas(id) on delete set null;

-- RLS para alternativas: leitura segue regra de atividades; escrita só admin
alter table alternativas enable row level security;

drop policy if exists "alternativas_read" on alternativas;
create policy "alternativas_read" on alternativas
  for select using (
    exists (
      select 1
      from atividades at
      join aulas a on a.id = at.aula_id
      join cursos c on c.id = a.curso_id
      where at.id = alternativas.atividade_id
        and (c.publicado = true or public.is_admin(auth.uid()))
    )
  );

drop policy if exists "alternativas_admin_write" on alternativas;
create policy "alternativas_admin_write" on alternativas
  for all using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));
