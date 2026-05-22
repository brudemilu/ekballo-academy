-- =============================================================
-- Cria bucket privado `materiais-cursos` no Supabase Storage e
-- configura as policies de RLS:
--   - SELECT (download): qualquer usuário autenticado.
--   - INSERT/UPDATE/DELETE: apenas admins (profiles.is_admin = true).
--
-- O acesso na prática é mediado por signed URLs geradas server-side
-- em lib/db.ts → getMaterialUrl(). Cada signed URL vale 15 minutos
-- e exige que o usuário esteja autenticado no momento da geração
-- (a página /cursos/[slug]/aulas/[aulaId] já força matrícula).
-- =============================================================

-- 1) Criar o bucket (idempotente).
insert into storage.buckets (id, name, public)
values ('materiais-cursos', 'materiais-cursos', false)
on conflict (id) do nothing;

-- 2) Policies — drop e re-create para idempotência.
drop policy if exists "materiais_cursos_select_authenticated" on storage.objects;
drop policy if exists "materiais_cursos_insert_admin"        on storage.objects;
drop policy if exists "materiais_cursos_update_admin"        on storage.objects;
drop policy if exists "materiais_cursos_delete_admin"        on storage.objects;

-- Qualquer usuário autenticado pode ler (necessário para createSignedUrl
-- funcionar com a sessão do aluno).
create policy "materiais_cursos_select_authenticated"
  on storage.objects for select
  to authenticated
  using (bucket_id = 'materiais-cursos');

-- Só admins escrevem/sobrescrevem/apagam arquivos.
create policy "materiais_cursos_insert_admin"
  on storage.objects for insert
  to authenticated
  with check (
    bucket_id = 'materiais-cursos'
    and exists (
      select 1 from public.profiles p
      where p.id = auth.uid() and p.is_admin = true
    )
  );

create policy "materiais_cursos_update_admin"
  on storage.objects for update
  to authenticated
  using (
    bucket_id = 'materiais-cursos'
    and exists (
      select 1 from public.profiles p
      where p.id = auth.uid() and p.is_admin = true
    )
  );

create policy "materiais_cursos_delete_admin"
  on storage.objects for delete
  to authenticated
  using (
    bucket_id = 'materiais-cursos'
    and exists (
      select 1 from public.profiles p
      where p.id = auth.uid() and p.is_admin = true
    )
  );
