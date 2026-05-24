-- =============================================================
-- EKBALLO ACADEMY · Versões da Bíblia via API externa (bolls.life)
-- Adiciona coluna fonte_api_sigla em biblia_versoes apontando pra
-- sigla equivalente no provider externo. Ativa NAA/NVT/NVI/ARA/ARC
-- via API (texto não armazenado localmente, cache lazy).
--
-- AVISO: bolls.life redistribui texto sem licença explícita das
-- editoras. Decisão de risco assumida pelo dono do projeto.
-- =============================================================

alter table public.biblia_versoes
  add column if not exists fonte_api_sigla text;

comment on column public.biblia_versoes.fonte_api_sigla is
  'Quando preenchida, indica que o texto vem da API externa (bolls.life). Valor é a sigla usada no provider.';

-- Atualiza/ativa NAA, NVT, NVI, ARA, ARC apontando pra sigla bolls
update public.biblia_versoes set ativa = true, fonte_api_sigla = 'NAA',
  descricao = 'Edição da Sociedade Bíblica do Brasil. Texto via API externa.'
  where sigla = 'NAA';

update public.biblia_versoes set ativa = true, fonte_api_sigla = 'NVT',
  descricao = 'Edição da Mundo Cristão. Texto via API externa.'
  where sigla = 'NVT';

update public.biblia_versoes set ativa = true, fonte_api_sigla = 'NVIPT',
  descricao = 'Edição da Biblica. Texto via API externa.'
  where sigla = 'NVI';

-- Adiciona ARA e ARC (não existiam antes)
insert into public.biblia_versoes (sigla, nome, descricao, ativa, ordem, fonte_api_sigla) values
  ('ARA', 'Almeida Revista e Atualizada',
   'Edição da Sociedade Bíblica do Brasil. Texto via API externa.',
   true, 5, 'ARA'),
  ('ARC', 'Almeida Revista e Corrigida',
   'Edição clássica (SBB). Texto via API externa.',
   true, 6, 'ARC09')
on conflict (sigla) do update set
  nome = excluded.nome,
  descricao = excluded.descricao,
  ativa = excluded.ativa,
  ordem = excluded.ordem,
  fonte_api_sigla = excluded.fonte_api_sigla;
