-- Índices PREVENTIVOS (para quando as tabelas crescerem).
--
-- Nota honesta: hoje as tabelas são pequenas (respostas ~19 linhas, matriculas
-- ~105) — nesse tamanho o Postgres faz seq scan e índice não muda nada. E o
-- banco JÁ tem índice nas FKs principais (respostas_aluno_idx, aulas_curso_idx,
-- atividades_aula_idx, destaques_aula_aluno_aula_idx, etc.). Então o gargalo de
-- performance do app nunca foi o banco — era a rede (auth.getUser por request),
-- já resolvido no app.
--
-- Estes dois são os únicos que NÃO existem e que passam a valer quando o volume
-- subir. IF NOT EXISTS — seguro reaplicar.

-- Ver alunos de UMA temática: filtra matriculas por curso_id sozinho. O único
-- índice que cobre curso_id hoje é (aluno_id, curso_id) — não serve p/ filtrar
-- só por curso (aluno_id é o prefixo). Este resolve.
create index if not exists idx_matriculas_curso
  on public.matriculas (curso_id);

-- "Últimas respostas de um aluno", ordenadas por data. respostas_aluno_idx só
-- tem (aluno_id); incluir created_at deixa a ordenação sair do índice.
create index if not exists idx_respostas_aluno_created
  on public.respostas (aluno_id, created_at desc);

analyze public.matriculas;
analyze public.respostas;
