-- Índices de performance para as queries quentes do app.
-- O Postgres cria índice automático só para PK e UNIQUE — colunas de chave
-- estrangeira (aluno_id, curso_id, aula_id, atividade_id, …) ficam SEM índice
-- e viram varredura sequencial. Estas são as colunas que lib/db.ts mais filtra
-- (.eq/.in) e ordena (.order), mapeadas a partir das consultas reais.
--
-- Todos com IF NOT EXISTS — seguro reaplicar; pula o que já existir.
-- Tabelas pequenas: CREATE INDEX comum é rápido. Se quiser zero lock de
-- escrita numa tabela grande, rode a linha equivalente com
-- "CREATE INDEX CONCURRENTLY ..." fora de transação (uma de cada vez).

-- respostas: a tabela mais consultada (devolutivas, dashboard, correção).
--   eq(aluno_id)+order(created_at)  → minhas respostas, mais recentes
--   in(atividade_id) / eq(atividade_id)+eq(aluno_id) → juntar resposta×atividade
create index if not exists idx_respostas_aluno_created
  on public.respostas (aluno_id, created_at desc);
create index if not exists idx_respostas_atividade_aluno
  on public.respostas (atividade_id, aluno_id);

-- matriculas: home do aluno (listMatriculasByAluno) e lookups por curso.
create index if not exists idx_matriculas_aluno_curso
  on public.matriculas (aluno_id, curso_id);
create index if not exists idx_matriculas_curso
  on public.matriculas (curso_id);

-- aulas: lista de aulas de um curso, em ordem.
create index if not exists idx_aulas_curso_ordem
  on public.aulas (curso_id, ordem);

-- atividades: as atividades de uma aula, em ordem.
create index if not exists idx_atividades_aula_ordem
  on public.atividades (aula_id, ordem);

-- alternativas: as alternativas de uma atividade (múltipla escolha), em ordem.
create index if not exists idx_alternativas_atividade_ordem
  on public.alternativas (atividade_id, ordem);

-- progresso: o que o aluno já concluiu (eq(aluno_id) e eq(aluno_id)+eq(aula_id)).
create index if not exists idx_progresso_aluno_aula
  on public.progresso (aluno_id, aula_id);

-- destaques_aula: grifos do aluno numa aula (eq(aluno_id)+eq(aula_id)).
create index if not exists idx_destaques_aluno_aula
  on public.destaques_aula (aluno_id, aula_id);

-- mensagens_destinatarios: destinatários de uma campanha/mensagem.
create index if not exists idx_msg_dest_mensagem
  on public.mensagens_destinatarios (mensagem_id);

analyze public.respostas;
analyze public.matriculas;
analyze public.aulas;
analyze public.atividades;
analyze public.alternativas;
analyze public.progresso;
analyze public.destaques_aula;
analyze public.mensagens_destinatarios;
