-- =============================================================
-- EKBALLO ACADEMY · Bíblia ACF (Almeida Corrigida Fiel)
-- Schema para hospedar a Bíblia inteira em domínio público (ACF),
-- usada como base do leitor /biblia, do gerador de imagens e dos
-- planos de leitura curados.
-- =============================================================

-- ---------- LIVROS ----------
create table if not exists biblia_livros (
  id smallint primary key,                     -- 1..66 (ordem canônica)
  nome text not null,                          -- "Gênesis"
  abrev text not null unique,                  -- "gn"
  testamento text not null check (testamento in ('AT', 'NT')),
  grupo text not null,                         -- "pentateuco","historicos","poeticos","profetas-maiores",
                                               -- "profetas-menores","evangelhos","historicos-nt",
                                               -- "cartas-paulinas","cartas-gerais","apocaliptico"
  ordem smallint not null,                     -- ordem dentro do grupo (1,2,...)
  capitulos_total smallint not null
);

-- ---------- VERSÍCULOS ----------
create table if not exists biblia_versiculos (
  livro_id smallint not null references biblia_livros(id) on delete cascade,
  capitulo smallint not null,
  versiculo smallint not null,
  texto text not null,
  primary key (livro_id, capitulo, versiculo)
);

create index if not exists biblia_versiculos_loc
  on biblia_versiculos(livro_id, capitulo);

-- ---------- RLS ----------
-- Bíblia é leitura pública pra qualquer autenticado (e mesmo pra anon,
-- já que o conteúdo é domínio público). Escrita é só admin.

alter table biblia_livros enable row level security;
alter table biblia_versiculos enable row level security;

drop policy if exists "biblia_livros_read" on biblia_livros;
create policy "biblia_livros_read" on biblia_livros for select
  to authenticated, anon
  using (true);

drop policy if exists "biblia_livros_admin_write" on biblia_livros;
create policy "biblia_livros_admin_write" on biblia_livros for all
  to authenticated
  using (is_admin(auth.uid()))
  with check (is_admin(auth.uid()));

drop policy if exists "biblia_versiculos_read" on biblia_versiculos;
create policy "biblia_versiculos_read" on biblia_versiculos for select
  to authenticated, anon
  using (true);

drop policy if exists "biblia_versiculos_admin_write" on biblia_versiculos;
create policy "biblia_versiculos_admin_write" on biblia_versiculos for all
  to authenticated
  using (is_admin(auth.uid()))
  with check (is_admin(auth.uid()));
