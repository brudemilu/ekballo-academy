-- =============================================================
-- EKBALLO ACADEMY · Matrícula automática na Bíblia
-- Atualiza o trigger handle_new_user para também matricular o
-- aluno recém-cadastrado no curso "Bíblia" (acesso à Escritura
-- liberado por padrão). Também faz backfill: matricula todos os
-- alunos existentes que ainda não estão no curso.
-- =============================================================

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  v_biblia_id uuid;
begin
  -- Cria o profile do aluno (campos vindos do signup metadata)
  insert into public.profiles (id, email, nome, telefone)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'nome', split_part(new.email, '@', 1)),
    new.raw_user_meta_data->>'telefone'
  )
  on conflict (id) do nothing;

  -- Matricula automaticamente no curso "Bíblia", se existir
  select id into v_biblia_id from public.cursos where slug = 'biblia' limit 1;
  if v_biblia_id is not null then
    insert into public.matriculas (aluno_id, curso_id)
    values (new.id, v_biblia_id)
    on conflict (aluno_id, curso_id) do nothing;
  end if;

  return new;
end;
$$;

-- Backfill: matricula todos os alunos existentes na Bíblia
insert into public.matriculas (aluno_id, curso_id)
select p.id, c.id
from public.profiles p
cross join public.cursos c
where c.slug = 'biblia'
on conflict (aluno_id, curso_id) do nothing;
