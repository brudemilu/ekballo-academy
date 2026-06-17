-- =============================================================
-- Seções da vitrine: agrupa os cursos por categoria.
--
-- Adiciona a coluna `cursos.categoria` (text, simples) e classifica
-- os cursos existentes em 6 seções:
--   lideranca · pastoral · discipulado · ensino · espiritual · infantil
--
-- A ordem e os rótulos das seções vivem em lib/categorias.ts (fonte
-- única do front). Cursos sem categoria caem numa seção "Outros" no fim.
--
-- Cursos novos devem setar `categoria` no próprio seed (não há form de
-- criação no app; cursos nascem por migration).
--
-- Idempotente e reversível: `drop column cursos.categoria;` desfaz tudo.
-- =============================================================

alter table public.cursos
  add column if not exists categoria text;

comment on column public.cursos.categoria is
  'Seção da vitrine (lideranca|pastoral|discipulado|ensino|espiritual|infantil). '
  'Rótulos e ordem em lib/categorias.ts. NULL/desconhecido cai em "Outros".';

-- Liderança
update public.cursos set categoria = 'lideranca' where slug in (
  'seja-um-lider-de-verdade',
  'o-desafio-de-todo-lider',
  'autoridade-espiritual',
  'lideranca-com-propositos',
  'igreja-simples',
  'trelica-videira',
  'igreja-com-propositos'
);

-- Pastoral & Cuidado
update public.cursos set categoria = 'pastoral' where slug in (
  'o-cuidado-do-corpo',
  'cultura-da-honra'
);

-- Discipulado
update public.cursos set categoria = 'discipulado' where slug in (
  'discipulado-bonhoeffer',
  'discipulado-contemplacao',
  'ego-transformado-keller',
  'olhe-para-jesus'
);

-- Ensino & Doutrina
update public.cursos set categoria = 'ensino' where slug in (
  'biblia',
  'cristao-sociedade-nao-crista',
  'adoracao-biblica',
  'pregacao-keller'
);

-- Espiritual (devocional + vida cristã)
update public.cursos set categoria = 'espiritual' where slug in (
  'blueprint-parach',
  'jesuscopy',
  'carta-aos-pecadores',
  'contentamento',
  'campo-batalha-mente',
  'oracao-keller',
  'devocional-anual',
  'herois-da-fe'
);

-- Infantil
update public.cursos set categoria = 'infantil' where slug in (
  'corajosas',
  'proverbios-para-criancas'
);

-- -------------------------------------------------------------
-- Admin edita a categoria pelo painel (/admin/cursos). `cursos` só
-- tinha policy de SELECT, então um update via browser (RLS, anon key)
-- era barrado. Libera UPDATE só pra admin (is_admin(auth.uid())).
-- -------------------------------------------------------------
drop policy if exists "cursos_update_admin" on public.cursos;
create policy "cursos_update_admin" on public.cursos
  for update
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));
