-- =============================================================
-- EKBALLO ENGLISH · Revisão espaçada
--
-- A maior lacuna pedagógica do curso: lição concluída ficava
-- concluída para sempre e o aluno nunca reencontrava aquele
-- vocabulário. Sem reencontro, quase tudo evapora em duas semanas —
-- de nada adianta 797 exercícios se cada um é visto uma vez só.
--
-- Esta tabela é só o REGISTRO das revisões feitas. O que revisar é
-- decidido em lib/english.ts a partir do que já existe:
-- `english_progresso` diz quais lições o aluno concluiu, quando, e
-- com que desempenho. Não há tabela de "cartões" nem agendamento
-- por item — seria peso desnecessário para um curso desse tamanho.
--
-- A revisão CONTA como prática do dia: quem revisa mantém a
-- sequência. Se revisar não segurasse o streak, o aluno seria
-- empurrado a avançar sempre, que é exatamente o vício que a
-- revisão existe para corrigir.
-- =============================================================

create table if not exists english_revisoes (
  id uuid primary key default gen_random_uuid(),
  aluno_id uuid not null references profiles(id) on delete cascade,
  acertos int not null default 0,
  total int not null default 0,
  -- ids dos exercícios sorteados, para não repetir a mesma seleção
  -- no dia seguinte e para permitir auditoria do que foi revisado
  exercicios jsonb not null default '[]'::jsonb,
  feita_em timestamptz not null default now()
);

create index if not exists english_revisoes_aluno_idx
  on english_revisoes(aluno_id, feita_em desc);

alter table english_revisoes enable row level security;

drop policy if exists "english_revisoes_self" on english_revisoes;
create policy "english_revisoes_self" on english_revisoes for all
  to authenticated
  using (aluno_id = auth.uid()) with check (aluno_id = auth.uid());

drop policy if exists "english_revisoes_admin" on english_revisoes;
create policy "english_revisoes_admin" on english_revisoes for select
  to authenticated using (is_admin(auth.uid()));
