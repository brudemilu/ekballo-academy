-- =============================================================
-- EKBALLO ACADEMY · Auto-concluir curso (livro lido)
-- Quando o discípulo conclui TODAS as mesas (aulas) de um curso,
-- o banco marca matriculas.concluido_em automaticamente — assim
-- o card do dashboard mostra "✓ Concluído" sem ação manual.
-- Reverte (concluido_em = null) se ele desmarcar uma mesa.
--
-- Disparado por mudanças em `progresso` (insert/delete), que é
-- onde MarcarConcluida grava a conclusão de cada mesa.
-- =============================================================

-- Recalcula a conclusão de UM curso para UM aluno e ajusta a matrícula.
create or replace function public.recalcular_conclusao_curso(
  p_aluno_id uuid,
  p_curso_id uuid
)
returns void
language plpgsql
security definer set search_path = public
as $$
declare
  v_total_aulas int;
  v_concluidas int;
begin
  -- Total de mesas do curso
  select count(*) into v_total_aulas
  from public.aulas
  where curso_id = p_curso_id;

  -- Mesas que este aluno já concluiu nesse curso
  select count(*) into v_concluidas
  from public.progresso pr
  join public.aulas a on a.id = pr.aula_id
  where pr.aluno_id = p_aluno_id
    and a.curso_id = p_curso_id;

  if v_total_aulas > 0 and v_concluidas >= v_total_aulas then
    -- Livro inteiro lido → marca concluído (sem mexer se já estava)
    update public.matriculas
    set concluido_em = coalesce(concluido_em, now())
    where aluno_id = p_aluno_id
      and curso_id = p_curso_id;
  else
    -- Faltou alguma mesa → garante que não fica marcado como concluído
    update public.matriculas
    set concluido_em = null
    where aluno_id = p_aluno_id
      and curso_id = p_curso_id
      and concluido_em is not null;
  end if;
end;
$$;

-- Trigger: ao inserir/deletar uma linha de progresso, recalcula o curso.
create or replace function public.trg_progresso_conclusao()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  v_curso_id uuid;
  v_aluno_id uuid;
  v_aula_id uuid;
begin
  if (tg_op = 'DELETE') then
    v_aula_id := old.aula_id;
    v_aluno_id := old.aluno_id;
  else
    v_aula_id := new.aula_id;
    v_aluno_id := new.aluno_id;
  end if;

  select curso_id into v_curso_id from public.aulas where id = v_aula_id;
  if v_curso_id is not null then
    perform public.recalcular_conclusao_curso(v_aluno_id, v_curso_id);
  end if;

  if (tg_op = 'DELETE') then
    return old;
  end if;
  return new;
end;
$$;

drop trigger if exists progresso_conclusao_curso on public.progresso;
create trigger progresso_conclusao_curso
  after insert or delete on public.progresso
  for each row execute function public.trg_progresso_conclusao();

-- =============================================================
-- BACKFILL: marca como concluídos os cursos que já estão 100%
-- lidos mas ainda não tinham concluido_em preenchido.
-- =============================================================
update public.matriculas m
set concluido_em = now()
where m.concluido_em is null
  and exists (select 1 from public.aulas a where a.curso_id = m.curso_id)
  and not exists (
    -- não existe nenhuma mesa do curso que o aluno ainda NÃO concluiu
    select 1
    from public.aulas a
    where a.curso_id = m.curso_id
      and not exists (
        select 1 from public.progresso pr
        where pr.aluno_id = m.aluno_id
          and pr.aula_id = a.id
      )
  );
