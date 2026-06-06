-- =============================================================
-- Gatilho "atividades_pendentes" — lembra quem marcou a aula como CONCLUÍDA
-- mas não fez as atividades (reflexão/MC sem resposta). Vale para TODOS os
-- cursos. Mantém a regra de ouro: detecta e SUGERE; só envia após aprovação.
--
-- Cadência (Insistente): 1º lembrete 1 dia após; repete a cada 2 dias;
-- no máximo 5 lembretes por pessoa/curso (max_repeticoes).
--
-- O texto é VARIADO por pessoa via IA no momento de aprovar (ver
-- app/api/admin/campanhas/route.ts + lib/mensagens-ia.ts). O template abaixo
-- é só a "base/sentido" que a IA reescreve.
-- Idempotente.
-- =============================================================

-- Limite de repetições por gatilho (null = sem limite, comportamento antigo)
alter table public.automacao_gatilhos
  add column if not exists max_repeticoes int;

insert into public.automacao_gatilhos (gatilho, ativo, dias_gatilho, repetir_apos_dias, max_repeticoes)
values ('atividades_pendentes', true, 1, 2, 5)
on conflict (gatilho) do nothing;

-- Template-base (a IA varia o texto por pessoa; este é o "sentido")
insert into public.mensagem_templates (titulo, corpo, descricao)
select
  'Faça as atividades',
  'Oi {{nome}}! Que bom te ver avançando em {{curso}} 🙌 Passando só pra lembrar: as atividades de reflexão daquela aula ficaram pendentes. Elas ajudam a fixar e viver o que você leu — reserve uns minutinhos pra responder, tá? Qualquer dúvida, é só chamar. Deus abençoe! 🙏',
  'Base do lembrete de atividades pendentes — a IA reescreve com o mesmo sentido, texto único por pessoa.'
where not exists (
  select 1 from public.mensagem_templates where titulo = 'Faça as atividades'
);

-- -------------------------------------------------------------
-- DETECÇÃO (roda no cron diário; NÃO envia nada — só sugere)
-- -------------------------------------------------------------
create or replace function public.detectar_atividades_pendentes()
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  g automacao_gatilhos%rowtype;
  v_curso record;
  v_camp uuid;
  n int;
begin
  select * into g from automacao_gatilhos where gatilho = 'atividades_pendentes';
  if not found or not g.ativo then
    return;
  end if;

  for v_curso in
    select c.id, c.titulo from cursos c
    where (select count(*) from aulas a where a.curso_id = c.id) > 0
  loop
    -- não cria nova se já existe uma pendente para este curso
    if exists (select 1 from campanhas_sugeridas s
               where s.gatilho = 'atividades_pendentes'
                 and s.curso_id = v_curso.id and s.status = 'pendente') then
      continue;
    end if;

    insert into campanhas_sugeridas (gatilho, curso_id, descricao, template_id, status)
    values ('atividades_pendentes', v_curso.id,
            'Atividades pendentes: ' || v_curso.titulo,
            (select id from mensagem_templates where titulo = 'Faça as atividades' limit 1),
            'pendente')
    returning id into v_camp;

    insert into campanha_candidatos (campanha_id, aluno_id, telefone, nome, motivo)
    select v_camp, pr.id, regexp_replace(pr.telefone, '\D', '', 'g'), pr.nome,
           'Marcou aula como concluída sem fazer a reflexão'
    from profiles pr
    where pr.is_admin = false
      and pr.telefone is not null
      and length(regexp_replace(pr.telefone, '\D', '', 'g')) >= 10
      -- existe aula concluída (há >= dias_gatilho) com atividade sem resposta
      and exists (
        select 1
        from progresso p
        join aulas a on a.id = p.aula_id and a.curso_id = v_curso.id
        join atividades t on t.aula_id = a.id
        where p.aluno_id = pr.id
          and p.concluido_em <= now() - (g.dias_gatilho || ' days')::interval
          and not exists (
            select 1 from respostas r
            where r.aluno_id = pr.id and r.atividade_id = t.id
              and (coalesce(btrim(r.texto), '') <> '' or r.alternativa_id is not null)
          )
      )
      -- janela anti-repetição
      and not exists (
        select 1 from avisos_enviados ae
        where ae.aluno_id = pr.id and ae.gatilho = 'atividades_pendentes'
          and ae.curso_id = v_curso.id
          and ae.enviado_em > now() - (g.repetir_apos_dias || ' days')::interval
      )
      -- limite de repetições (só conta os que de fato foram enfileirados)
      and (
        select count(*) from avisos_enviados ae
        where ae.aluno_id = pr.id and ae.gatilho = 'atividades_pendentes'
          and ae.curso_id = v_curso.id and ae.resultado = 'enfileirado'
      ) < coalesce(g.max_repeticoes, 999999);

    get diagnostics n = row_count;
    if n = 0 then
      delete from campanhas_sugeridas where id = v_camp;
    else
      update campanhas_sugeridas set total_candidatos = n where id = v_camp;
    end if;
  end loop;
end;
$$;

revoke execute on function public.detectar_atividades_pendentes() from public, anon, authenticated;

-- Cron diário (12:18 UTC ≈ 09:18 BRT, logo após o detector geral). Idempotente.
do $$
begin
  if exists (select 1 from cron.job where jobname = 'detectar-atividades-pendentes') then
    perform cron.unschedule('detectar-atividades-pendentes');
  end if;
  perform cron.schedule('detectar-atividades-pendentes', '18 12 * * *',
    $cron$select public.detectar_atividades_pendentes()$cron$);
end;
$$;
