-- =============================================================
-- EKBALLO ACADEMY · Bíblia multi-versão
-- Prepara o leitor para várias traduções (ACF ativa, NAA/NVT/NVI
-- como "em breve" até licenciamento). Mantém ACF como versão
-- padrão para retro-compatibilidade.
-- =============================================================

-- 1. Tabela de versões disponíveis
create table if not exists biblia_versoes (
  sigla text primary key,
  nome text not null,
  descricao text,
  ativa boolean not null default false,   -- false = "em breve", sem texto no banco
  ordem smallint not null default 100,
  fonte text                              -- URL/origem do texto (auditoria)
);

insert into biblia_versoes (sigla, nome, descricao, ativa, ordem, fonte) values
  ('ACF', 'Almeida Corrigida Fiel',
   'Tradução literal baseada no Textus Receptus. Domínio público.',
   true,  1, 'github.com/thiagobodruk/biblia (ACF)'),
  ('NAA', 'Nova Almeida Atualizada',
   'Edição da Sociedade Bíblica do Brasil. Aguardando licenciamento.',
   false, 2, null),
  ('NVT', 'Nova Versão Transformadora',
   'Edição da Mundo Cristão. Aguardando licenciamento.',
   false, 3, null),
  ('NVI', 'Nova Versão Internacional',
   'Edição da Biblica/Vida. Aguardando licenciamento.',
   false, 4, null)
on conflict (sigla) do update set
  nome = excluded.nome,
  descricao = excluded.descricao,
  ordem = excluded.ordem;

-- 2. Coluna versao em biblia_versiculos
alter table biblia_versiculos
  add column if not exists versao text not null default 'ACF';

-- FK para integridade (todos os versículos têm que apontar pra uma versão real)
do $$
begin
  if not exists (
    select 1 from pg_constraint where conname = 'biblia_versiculos_versao_fk'
  ) then
    alter table biblia_versiculos
      add constraint biblia_versiculos_versao_fk
      foreign key (versao) references biblia_versoes(sigla) on delete restrict;
  end if;
end $$;

-- 3. Re-cria PK incluindo versao (cada versão tem seus 31k versículos)
do $$
begin
  if exists (
    select 1 from pg_constraint
    where conname = 'biblia_versiculos_pkey'
  ) then
    alter table biblia_versiculos drop constraint biblia_versiculos_pkey;
  end if;
end $$;

alter table biblia_versiculos
  add primary key (versao, livro_id, capitulo, versiculo);

-- Mantém o índice antigo de localização sem versao (continua útil pra
-- queries simples na versão padrão).
create index if not exists biblia_versiculos_versao_loc
  on biblia_versiculos(versao, livro_id, capitulo);

-- 4. RLS para a nova tabela
alter table biblia_versoes enable row level security;

drop policy if exists "biblia_versoes_read" on biblia_versoes;
create policy "biblia_versoes_read" on biblia_versoes for select
  to authenticated, anon
  using (true);

drop policy if exists "biblia_versoes_admin_write" on biblia_versoes;
create policy "biblia_versoes_admin_write" on biblia_versoes for all
  to authenticated
  using (is_admin(auth.uid()))
  with check (is_admin(auth.uid()));
