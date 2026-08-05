-- =============================================================
-- EKBALLO ENGLISH · Schema da vertente de inglês
--
-- Vertente PRÓPRIA, separada de cursos/aulas/atividades. Motivo: o
-- English não é leitura de livro com reflexão pastoral — é rotina
-- diária com exercício interativo, fala, streak e conquista. O
-- modelo de curso existente não comporta isso.
--
--   english_modulos    12 módulos (Primeiros passos → Projeto final)
--     └ english_licoes       lições dentro do módulo
--         └ english_exercicios   vocabulário, escolha, tradução,
--                                ouvir, montar, falar
--   english_progresso  aluno × lição concluída (com acertos)
--   english_streak     dias seguidos, recorde, total de lições
--   english_conquistas aluno × chave de conquista
-- =============================================================

-- ---------- MÓDULOS ----------
create table if not exists english_modulos (
  id uuid primary key default gen_random_uuid(),
  numero int not null unique,          -- 1..12
  slug text not null unique,
  titulo text not null,                -- "Primeiros passos"
  titulo_en text,                      -- "First steps"
  descricao text,
  nivel text not null default 'iniciante',  -- iniciante | basico | intermediario
  publicado boolean not null default false,
  created_at timestamptz not null default now()
);

-- ---------- LIÇÕES ----------
create table if not exists english_licoes (
  id uuid primary key default gen_random_uuid(),
  modulo_id uuid not null references english_modulos(id) on delete cascade,
  numero int not null,                 -- ordem dentro do módulo
  slug text not null unique,
  titulo text not null,                -- "Hello and goodbye"
  titulo_pt text,                      -- "Oi e tchau"
  objetivo text,                       -- o que o aluno consegue ao final
  -- Versículo curto da lição (fé integrada ao vocabulário do dia)
  versiculo_ref text,
  versiculo_en text,
  versiculo_pt text,
  publicado boolean not null default true,
  created_at timestamptz not null default now(),
  unique (modulo_id, numero)
);

-- ---------- EXERCÍCIOS ----------
-- tipo:
--   vocabulario  cartão de ensino (termo + tradução + ouvir); sem erro
--   escolha      múltipla escolha (alternativas jsonb)
--   traducao     digitar a tradução (resposta + aceitas)
--   ouvir        TTS fala audio_texto; aluno digita o que ouviu
--   montar       montar a frase com o banco de palavras (resposta)
--   falar        falar a frase; reconhecimento de voz compara com resposta
create table if not exists english_exercicios (
  id uuid primary key default gen_random_uuid(),
  licao_id uuid not null references english_licoes(id) on delete cascade,
  ordem int not null,
  tipo text not null check (tipo in ('vocabulario','escolha','traducao','ouvir','montar','falar')),
  enunciado text not null,             -- instrução, em português
  pergunta text,                       -- termo/frase apresentada ao aluno
  pergunta_pt text,                    -- tradução exibida (vocabulário) ou enunciado em pt
  resposta text,                       -- resposta canônica
  aceitas jsonb not null default '[]'::jsonb,        -- variantes aceitas ["hi","hello"]
  alternativas jsonb not null default '[]'::jsonb,   -- [{"texto":"...","correta":true}]
  dica text,                           -- pronúncia aproximada / observação
  audio_texto text,                    -- o que o TTS fala (default: pergunta ou resposta)
  unique (licao_id, ordem)
);

create index if not exists english_licoes_modulo_idx on english_licoes(modulo_id, numero);
create index if not exists english_exercicios_licao_idx on english_exercicios(licao_id, ordem);

-- ---------- PROGRESSO ----------
create table if not exists english_progresso (
  aluno_id uuid not null references profiles(id) on delete cascade,
  licao_id uuid not null references english_licoes(id) on delete cascade,
  acertos int not null default 0,
  total int not null default 0,
  vezes int not null default 1,        -- quantas vezes refez a lição
  concluido_em timestamptz not null default now(),
  primary key (aluno_id, licao_id)
);
create index if not exists english_progresso_aluno_idx on english_progresso(aluno_id);

-- ---------- STREAK ----------
create table if not exists english_streak (
  aluno_id uuid primary key references profiles(id) on delete cascade,
  dias_seguidos int not null default 0,
  recorde int not null default 0,
  ultimo_dia date,
  total_licoes int not null default 0, -- lições concluídas (contando refeitas)
  atualizado_em timestamptz not null default now()
);

-- ---------- CONQUISTAS ----------
create table if not exists english_conquistas (
  aluno_id uuid not null references profiles(id) on delete cascade,
  chave text not null,                 -- primeira-licao | streak-3 | modulo-1 ...
  conquistada_em timestamptz not null default now(),
  primary key (aluno_id, chave)
);

-- ---------- RLS ----------
alter table english_modulos enable row level security;
alter table english_licoes enable row level security;
alter table english_exercicios enable row level security;
alter table english_progresso enable row level security;
alter table english_streak enable row level security;
alter table english_conquistas enable row level security;

-- Conteúdo: qualquer um lê o que está publicado (a vitrine /english é pública);
-- admin lê tudo, inclusive rascunho, e é o único que escreve.
drop policy if exists "english_modulos_read" on english_modulos;
create policy "english_modulos_read" on english_modulos for select
  to authenticated, anon
  using (publicado = true or is_admin(auth.uid()));

drop policy if exists "english_modulos_admin" on english_modulos;
create policy "english_modulos_admin" on english_modulos for all
  to authenticated
  using (is_admin(auth.uid())) with check (is_admin(auth.uid()));

drop policy if exists "english_licoes_read" on english_licoes;
create policy "english_licoes_read" on english_licoes for select
  to authenticated, anon
  using (publicado = true or is_admin(auth.uid()));

drop policy if exists "english_licoes_admin" on english_licoes;
create policy "english_licoes_admin" on english_licoes for all
  to authenticated
  using (is_admin(auth.uid())) with check (is_admin(auth.uid()));

-- Exercícios: só aluno logado (não expõe gabarito pra anônimo).
drop policy if exists "english_exercicios_read" on english_exercicios;
create policy "english_exercicios_read" on english_exercicios for select
  to authenticated using (true);

drop policy if exists "english_exercicios_admin" on english_exercicios;
create policy "english_exercicios_admin" on english_exercicios for all
  to authenticated
  using (is_admin(auth.uid())) with check (is_admin(auth.uid()));

-- Progresso / streak / conquista: o aluno mexe no que é dele; admin vê tudo
-- (o painel pastoral acompanha o avanço da turma).
drop policy if exists "english_progresso_self" on english_progresso;
create policy "english_progresso_self" on english_progresso for all
  to authenticated
  using (aluno_id = auth.uid()) with check (aluno_id = auth.uid());

drop policy if exists "english_progresso_admin" on english_progresso;
create policy "english_progresso_admin" on english_progresso for select
  to authenticated using (is_admin(auth.uid()));

drop policy if exists "english_streak_self" on english_streak;
create policy "english_streak_self" on english_streak for all
  to authenticated
  using (aluno_id = auth.uid()) with check (aluno_id = auth.uid());

drop policy if exists "english_streak_admin" on english_streak;
create policy "english_streak_admin" on english_streak for select
  to authenticated using (is_admin(auth.uid()));

drop policy if exists "english_conquistas_self" on english_conquistas;
create policy "english_conquistas_self" on english_conquistas for all
  to authenticated
  using (aluno_id = auth.uid()) with check (aluno_id = auth.uid());

drop policy if exists "english_conquistas_admin" on english_conquistas;
create policy "english_conquistas_admin" on english_conquistas for select
  to authenticated using (is_admin(auth.uid()));
