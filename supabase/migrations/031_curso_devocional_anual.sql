-- =============================================================
-- EKBALLO ACADEMY · Devocional Anual vira curso matriculável
-- Mesmo padrão da Bíblia e Jornada 180º:
--   - Card aparece no /dashboard e /admin
--   - external_path leva pra /devocional
--   - handle_new_user já matricula novos cadastros automático
--     (porque external_path está setado)
-- =============================================================

insert into public.cursos
  (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado, external_path)
values (
  'devocional-anual',
  'Devocional Anual — 365 dias com Cristo',
  '365 devocionais escritos pelo Pr. Bruno Fernandes, um por dia, organizados em 12 temas mensais: Recomeço, Coração, Família, Cruz e vida nova, Honra, Espírito Santo, Propósito, Mordomia, Arrependimento, Igreja, Perseverança e Emanuel. Leia no seu ritmo e marque cada um conforme for fazendo. Linguagem simples pro dia a dia.',
  null,
  false,
  0,
  102,
  true,
  '/devocional'
)
on conflict (slug) do update set
  titulo = excluded.titulo,
  descricao = excluded.descricao,
  external_path = excluded.external_path,
  publicado = excluded.publicado,
  ordem = excluded.ordem;

-- Backfill: matricula todos os discípulos existentes neste curso novo.
-- (O trigger handle_new_user já matricula os novos automaticamente,
-- porque external_path está setado.)
insert into public.matriculas (aluno_id, curso_id)
select p.id, c.id
from public.profiles p
cross join public.cursos c
where c.slug = 'devocional-anual'
on conflict (aluno_id, curso_id) do nothing;
