-- =============================================================
-- EKBALLO ACADEMY · Planos de Leitura Bíblica
-- Tabelas pra hospedar planos de leitura (ex: "Jornada 180º",
-- "Bíblia em 1 ano") com seus dias parseados em ranges
-- referenciando biblia_livros, e rastreio de progresso por aluno.
-- =============================================================

-- ---------- PLANOS ----------
create table if not exists planos_leitura (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  nome text not null,
  descricao text,
  imagem_url text,
  dias_total int not null,
  publicado boolean default true,
  ordem int default 100,
  created_at timestamptz default now()
);

-- ---------- DIAS ----------
-- passagens: jsonb com array de
--   { livro_id: int, livro_nome: text, cap_inicio: int, cap_fim: int, label: text }
create table if not exists plano_dias (
  plano_id uuid not null references planos_leitura(id) on delete cascade,
  dia int not null,                 -- 1..N
  data_sugerida text,                -- "01/01" pra exibir
  referencia_texto text not null,    -- "Gn 1–7" texto original
  passagens jsonb not null default '[]'::jsonb,
  primary key (plano_id, dia)
);
create index if not exists plano_dias_lookup on plano_dias(plano_id, dia);

-- ---------- PROGRESSO ----------
create table if not exists plano_progresso (
  aluno_id uuid not null references profiles(id) on delete cascade,
  plano_id uuid not null references planos_leitura(id) on delete cascade,
  dia int not null,
  concluido_em timestamptz not null default now(),
  primary key (aluno_id, plano_id, dia)
);
create index if not exists plano_progresso_lookup
  on plano_progresso(aluno_id, plano_id);

-- ---------- RLS ----------
alter table planos_leitura enable row level security;
alter table plano_dias enable row level security;
alter table plano_progresso enable row level security;

-- Planos e dias: leitura pública (autenticado + anon); escrita só admin.
drop policy if exists "planos_read" on planos_leitura;
create policy "planos_read" on planos_leitura for select
  to authenticated, anon using (true);

drop policy if exists "planos_admin_write" on planos_leitura;
create policy "planos_admin_write" on planos_leitura for all
  to authenticated
  using (is_admin(auth.uid()))
  with check (is_admin(auth.uid()));

drop policy if exists "plano_dias_read" on plano_dias;
create policy "plano_dias_read" on plano_dias for select
  to authenticated, anon using (true);

drop policy if exists "plano_dias_admin_write" on plano_dias;
create policy "plano_dias_admin_write" on plano_dias for all
  to authenticated
  using (is_admin(auth.uid()))
  with check (is_admin(auth.uid()));

-- Progresso: aluno gerencia o próprio; admin lê tudo.
drop policy if exists "plano_prog_self" on plano_progresso;
create policy "plano_prog_self" on plano_progresso for all
  to authenticated
  using (aluno_id = auth.uid())
  with check (aluno_id = auth.uid());

drop policy if exists "plano_prog_admin_read" on plano_progresso;
create policy "plano_prog_admin_read" on plano_progresso for select
  to authenticated
  using (is_admin(auth.uid()));

-- ---------- INSERE "Jornada 180º" como CURSO matriculável ----------
-- Aproveita o mesmo padrão da Bíblia: vira card no dashboard,
-- external_path leva pra /planos/jornada-180.
insert into public.cursos
  (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado, external_path)
values (
  'jornada-180',
  'Jornada 180º — Leitura da Bíblia em 6 meses',
  '167 dias de leitura bíblica contínua, do Gênesis ao Apocalipse. Marque cada dia ao terminar; o link te leva direto pra cada capítulo no leitor da Bíblia. Plano original IMW Olaria.',
  null,
  false,
  0,
  101,
  true,
  '/planos/jornada-180'
)
on conflict (slug) do update set
  titulo = excluded.titulo,
  descricao = excluded.descricao,
  external_path = excluded.external_path,
  publicado = excluded.publicado;

-- ---------- Atualiza handle_new_user pra incluir Jornada 180º ----------
-- Já matriculava na Bíblia; agora matricula também em Jornada 180º.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  v_curso record;
begin
  insert into public.profiles (id, email, nome, telefone)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'nome', split_part(new.email, '@', 1)),
    new.raw_user_meta_data->>'telefone'
  )
  on conflict (id) do nothing;

  -- Matricula automaticamente em todos os cursos "abertos por padrão"
  -- (Bíblia, Jornada 180º — qualquer curso com external_path setado).
  for v_curso in
    select id from public.cursos where external_path is not null
  loop
    insert into public.matriculas (aluno_id, curso_id)
    values (new.id, v_curso.id)
    on conflict (aluno_id, curso_id) do nothing;
  end loop;

  return new;
end;
$$;

-- Backfill: matricula todos os alunos existentes em todos os cursos abertos
insert into public.matriculas (aluno_id, curso_id)
select p.id, c.id
from public.profiles p
cross join public.cursos c
where c.external_path is not null
on conflict (aluno_id, curso_id) do nothing;
