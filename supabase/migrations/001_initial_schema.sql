-- ============================================================
-- EKBALLO ACADEMY · Schema inicial do banco de dados
-- Execute este arquivo no SQL Editor do Supabase (uma vez só).
-- ============================================================

-- ---------- PROFILES ----------
-- Estende auth.users com dados do aluno
create table if not exists profiles (
  id uuid primary key references auth.users on delete cascade,
  nome text,
  email text not null,
  is_admin boolean default false,
  turma text,
  created_at timestamptz default now()
);

-- Trigger: cria profile automático ao cadastrar
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, email, nome)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'nome', split_part(new.email, '@', 1))
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- ---------- CURSOS ----------
create table if not exists cursos (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  titulo text not null,
  descricao text,
  imagem_url text,
  is_pago boolean default false,
  preco_centavos int default 0,
  ordem int default 0,
  publicado boolean default true,
  created_at timestamptz default now()
);

-- ---------- AULAS ----------
create table if not exists aulas (
  id uuid primary key default gen_random_uuid(),
  curso_id uuid not null references cursos(id) on delete cascade,
  titulo text not null,
  conteudo text,
  video_url text,
  ordem int default 0,
  created_at timestamptz default now()
);

create index if not exists aulas_curso_idx on aulas(curso_id);

-- ---------- ATIVIDADES ----------
create table if not exists atividades (
  id uuid primary key default gen_random_uuid(),
  aula_id uuid not null references aulas(id) on delete cascade,
  pergunta text not null,
  ordem int default 0,
  created_at timestamptz default now()
);

create index if not exists atividades_aula_idx on atividades(aula_id);

-- ---------- RESPOSTAS ----------
create table if not exists respostas (
  id uuid primary key default gen_random_uuid(),
  atividade_id uuid not null references atividades(id) on delete cascade,
  aluno_id uuid not null references profiles(id) on delete cascade,
  texto text not null,
  comentario_lider text,
  comentario_lider_em timestamptz,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  unique(atividade_id, aluno_id)
);

create index if not exists respostas_aluno_idx on respostas(aluno_id);
create index if not exists respostas_atividade_idx on respostas(atividade_id);

-- ---------- MATRICULAS ----------
create table if not exists matriculas (
  id uuid primary key default gen_random_uuid(),
  aluno_id uuid not null references profiles(id) on delete cascade,
  curso_id uuid not null references cursos(id) on delete cascade,
  matriculado_em timestamptz default now(),
  concluido_em timestamptz,
  unique(aluno_id, curso_id)
);

create index if not exists matriculas_aluno_idx on matriculas(aluno_id);

-- ---------- PROGRESSO (aulas concluídas) ----------
create table if not exists progresso (
  id uuid primary key default gen_random_uuid(),
  aluno_id uuid not null references profiles(id) on delete cascade,
  aula_id uuid not null references aulas(id) on delete cascade,
  concluido_em timestamptz default now(),
  unique(aluno_id, aula_id)
);

create index if not exists progresso_aluno_idx on progresso(aluno_id);

-- ============================================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================================

alter table profiles enable row level security;
alter table cursos enable row level security;
alter table aulas enable row level security;
alter table atividades enable row level security;
alter table respostas enable row level security;
alter table matriculas enable row level security;
alter table progresso enable row level security;

-- Helper: é admin?
create or replace function public.is_admin(uid uuid)
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select coalesce((select is_admin from profiles where id = uid), false);
$$;

-- ----- profiles -----
drop policy if exists "profiles_self_read" on profiles;
create policy "profiles_self_read" on profiles
  for select using (auth.uid() = id or public.is_admin(auth.uid()));

drop policy if exists "profiles_self_update" on profiles;
create policy "profiles_self_update" on profiles
  for update using (auth.uid() = id);

drop policy if exists "profiles_admin_update" on profiles;
create policy "profiles_admin_update" on profiles
  for update using (public.is_admin(auth.uid()));

drop policy if exists "profiles_self_insert" on profiles;
create policy "profiles_self_insert" on profiles
  for insert with check (auth.uid() = id);

-- ----- cursos -----
drop policy if exists "cursos_read_published" on cursos;
create policy "cursos_read_published" on cursos
  for select using (publicado = true or public.is_admin(auth.uid()));

drop policy if exists "cursos_admin_write" on cursos;
create policy "cursos_admin_write" on cursos
  for all using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

-- ----- aulas -----
drop policy if exists "aulas_read_for_published" on aulas;
create policy "aulas_read_for_published" on aulas
  for select using (
    exists (select 1 from cursos c where c.id = aulas.curso_id and (c.publicado = true or public.is_admin(auth.uid())))
  );

drop policy if exists "aulas_admin_write" on aulas;
create policy "aulas_admin_write" on aulas
  for all using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

-- ----- atividades -----
drop policy if exists "atividades_read" on atividades;
create policy "atividades_read" on atividades
  for select using (
    exists (
      select 1 from aulas a
      join cursos c on c.id = a.curso_id
      where a.id = atividades.aula_id
        and (c.publicado = true or public.is_admin(auth.uid()))
    )
  );

drop policy if exists "atividades_admin_write" on atividades;
create policy "atividades_admin_write" on atividades
  for all using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));

-- ----- respostas -----
drop policy if exists "respostas_aluno_read_own" on respostas;
create policy "respostas_aluno_read_own" on respostas
  for select using (auth.uid() = aluno_id or public.is_admin(auth.uid()));

drop policy if exists "respostas_aluno_insert_own" on respostas;
create policy "respostas_aluno_insert_own" on respostas
  for insert with check (auth.uid() = aluno_id);

drop policy if exists "respostas_aluno_update_own" on respostas;
create policy "respostas_aluno_update_own" on respostas
  for update using (auth.uid() = aluno_id) with check (auth.uid() = aluno_id);

-- Admin pode atualizar (para enviar comentário do líder)
drop policy if exists "respostas_admin_update" on respostas;
create policy "respostas_admin_update" on respostas
  for update using (public.is_admin(auth.uid()));

-- ----- matriculas -----
drop policy if exists "matriculas_aluno_read_own" on matriculas;
create policy "matriculas_aluno_read_own" on matriculas
  for select using (auth.uid() = aluno_id or public.is_admin(auth.uid()));

drop policy if exists "matriculas_aluno_insert_own" on matriculas;
create policy "matriculas_aluno_insert_own" on matriculas
  for insert with check (auth.uid() = aluno_id);

drop policy if exists "matriculas_aluno_update_own" on matriculas;
create policy "matriculas_aluno_update_own" on matriculas
  for update using (auth.uid() = aluno_id);

-- ----- progresso -----
drop policy if exists "progresso_aluno_read_own" on progresso;
create policy "progresso_aluno_read_own" on progresso
  for select using (auth.uid() = aluno_id or public.is_admin(auth.uid()));

drop policy if exists "progresso_aluno_write_own" on progresso;
create policy "progresso_aluno_write_own" on progresso
  for all using (auth.uid() = aluno_id) with check (auth.uid() = aluno_id);

-- ============================================================
-- DADOS DE EXEMPLO (descontinuado)
-- O curso âncora "Mesa Aberta" originalmente seedado aqui foi removido em
-- 005_remove_mesa_aberta.sql. O bloco abaixo está comentado para que um
-- setup novo não recrie o curso. O conteúdo permanece no histórico para
-- fins de auditoria — o curso atual de partida é "Ego Transformado"
-- (ver 004_curso_ego_transformado.sql).
-- ============================================================

-- insert into cursos (slug, titulo, descricao, is_pago, ordem, publicado) values
-- ('mesa-aberta', 'Mesa Aberta', 'O curso âncora da Ekballo Academy. Sete aulas curtas para entender o coração do discipulado relacional, da formação à mesa, do envio à multiplicação. Para todo discípulo que está começando a caminhada.', false, 1, true)
-- on conflict (slug) do nothing;
--
-- with c as (select id from cursos where slug = 'mesa-aberta')
-- insert into aulas (curso_id, titulo, ordem, conteudo) values
-- ((select id from c), 'A mesa antes da palavra', 1, 'Antes do sermão, do estudo, da pregação — a mesa. Jesus discipulou andando, comendo, conversando. A mesa é o método anterior à fala. Quando a comunhão é real, a Palavra encontra solo preparado.'),
-- ((select id from c), 'Discípulo, não aluno', 2, 'Aluno aprende conteúdo. Discípulo aprende vida. A diferença entre os dois define se a transformação é cosmética ou raiz. Aqui você não estuda sobre Jesus — você aprende a andar com Ele.'),
-- ((select id from c), 'Famílias como solo', 3, 'A primeira eclésia é a casa. Se o discipulado não chega na cozinha, na conversa de casal, na oração antes de dormir, ele não chegou em lugar nenhum. Famílias fortes são solo. Sem solo bom, a semente morre.'),
-- ((select id from c), 'O Espírito como Mestre', 4, 'Não somos formados por cursos. Somos formados pelo Espírito. Cursos são instrumentos — Ele é o Mestre. Esta é uma plataforma honesta sobre seus limites: ela ajuda, mas não substitui a presença Dele.'),
-- ((select id from c), 'Maturidade como envio', 5, 'A maturidade cristã não é um destino, é um envio. O sinal de que alguém amadureceu é que ele começa a derramar. Quem foi formado, forma. Quem foi servido, serve. Quem foi enviado, envia.'),
-- ((select id from c), 'Comunidade que se compromete', 6, 'Não é grupo que se reúne — é família que se compromete. A diferença está no nível de exposição, vulnerabilidade e responsabilidade mútua. Comunidade rasa ensina pouco. Comunidade comprometida transforma.'),
-- ((select id from c), 'A mesa continua', 7, 'Este curso termina, mas a mesa não. Você foi convidado a continuar — em outra trilha, em outro encontro, em outra família. O Espírito te chamou para mais. Aceite o próximo passo.')
-- on conflict do nothing;
--
-- with a as (select id from aulas where titulo = 'A mesa antes da palavra' limit 1)
-- insert into atividades (aula_id, pergunta, ordem) values
-- ((select id from a), 'Em qual mesa você foi mais transformado(a) na vida? Descreva a cena: quem estava, o que se conversava, o que aconteceu em você.', 1),
-- ((select id from a), 'Hoje, onde está a mesa que te forma? Se não há uma, o que está te impedindo de criá-la?', 2)
-- on conflict do nothing;
--
-- with a as (select id from aulas where titulo = 'Famílias como solo' limit 1)
-- insert into atividades (aula_id, pergunta, ordem) values
-- ((select id from a), 'Como o discipulado tem chegado (ou não chegado) na sua casa? O que da sua família precisa ser orado, conversado, restaurado?', 1)
-- on conflict do nothing;
--
-- with a as (select id from aulas where titulo = 'Maturidade como envio' limit 1)
-- insert into atividades (aula_id, pergunta, ordem) values
-- ((select id from a), 'Quem você está discipulando hoje? Se ninguém, por quê? E quem o Espírito está colocando no seu coração para começar?', 1),
-- ((select id from a), 'Maturidade como envio: que passo concreto de envio você se sente desafiado(a) a dar nas próximas quatro semanas?', 2)
-- on conflict do nothing;
--
-- with a as (select id from aulas where titulo = 'A mesa continua' limit 1)
-- insert into atividades (aula_id, pergunta, ordem) values
-- ((select id from a), 'Qual o próximo passo da sua caminhada? Escreva uma palavra-síntese que você quer levar deste curso para o resto do ano.', 1)
-- on conflict do nothing;

-- ============================================================
-- DICA: para se tornar admin, depois de criar sua conta no app, rode:
--   update profiles set is_admin = true where email = 'seu@email.com';
-- ============================================================
