-- =============================================================
-- EKBALLO ACADEMY · Progresso do Devocional Anual
-- Aluno marca cada dia (1..365) quando lê/conclui o devocional.
-- Mesmo padrão do plano_progresso (migration 024).
-- =============================================================

create table if not exists devocional_anual_progresso (
  aluno_id uuid not null references profiles(id) on delete cascade,
  dia_ano int not null,
  marcado_em timestamptz not null default now(),
  primary key (aluno_id, dia_ano),
  check (dia_ano between 1 and 365)
);

create index if not exists devocional_anual_progresso_aluno_idx
  on devocional_anual_progresso(aluno_id);

-- RLS: aluno gerencia o próprio progresso; admin lê tudo
alter table devocional_anual_progresso enable row level security;

drop policy if exists "devocional_progresso_self" on devocional_anual_progresso;
create policy "devocional_progresso_self" on devocional_anual_progresso for all
  to authenticated
  using (aluno_id = auth.uid())
  with check (aluno_id = auth.uid());

drop policy if exists "devocional_progresso_admin_read" on devocional_anual_progresso;
create policy "devocional_progresso_admin_read" on devocional_anual_progresso for select
  to authenticated
  using (is_admin(auth.uid()));
