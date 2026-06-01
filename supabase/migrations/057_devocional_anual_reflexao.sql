-- =============================================================
-- EKBALLO ACADEMY · Reflexão pessoal do Devocional Anual
-- Aluno escreve, opcionalmente, "o que mais falou contigo" em
-- cada dia (1..365). Tabela separada do progresso porque ali a
-- existência da linha já significa "concluído" (migration 029) —
-- a reflexão pode existir mesmo sem o dia estar marcado.
-- =============================================================

create table if not exists devocional_anual_reflexao (
  aluno_id uuid not null references profiles(id) on delete cascade,
  dia_ano int not null,
  texto text not null,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  primary key (aluno_id, dia_ano),
  check (dia_ano between 1 and 365)
);

create index if not exists devocional_anual_reflexao_aluno_idx
  on devocional_anual_reflexao(aluno_id);

-- RLS: aluno gerencia a própria reflexão; admin lê tudo (devolutiva pastoral)
alter table devocional_anual_reflexao enable row level security;

drop policy if exists "devocional_reflexao_self" on devocional_anual_reflexao;
create policy "devocional_reflexao_self" on devocional_anual_reflexao for all
  to authenticated
  using (aluno_id = auth.uid())
  with check (aluno_id = auth.uid());

drop policy if exists "devocional_reflexao_admin_read" on devocional_anual_reflexao;
create policy "devocional_reflexao_admin_read" on devocional_anual_reflexao for select
  to authenticated
  using (is_admin(auth.uid()));
