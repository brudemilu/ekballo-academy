-- =============================================================
-- Matrícula passa a ser admin-only.
-- - Remove as policies que permitiam o aluno se auto-matricular ou
--   atualizar a própria matrícula (eram parte do fluxo antigo de
--   auto-enroll, que foi retirado da UI).
-- - Adiciona policies de INSERT/UPDATE/DELETE para administradores.
-- - O SELECT já permite admin ler tudo (policy "matriculas_aluno_read_own"
--   inclui or public.is_admin(auth.uid())).
-- =============================================================

drop policy if exists "matriculas_aluno_insert_own" on public.matriculas;
drop policy if exists "matriculas_aluno_update_own" on public.matriculas;

drop policy if exists "matriculas_admin_insert" on public.matriculas;
create policy "matriculas_admin_insert" on public.matriculas
  for insert with check (public.is_admin(auth.uid()));

drop policy if exists "matriculas_admin_update" on public.matriculas;
create policy "matriculas_admin_update" on public.matriculas
  for update using (public.is_admin(auth.uid()));

drop policy if exists "matriculas_admin_delete" on public.matriculas;
create policy "matriculas_admin_delete" on public.matriculas
  for delete using (public.is_admin(auth.uid()));
