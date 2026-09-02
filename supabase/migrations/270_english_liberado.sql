-- =============================================================
-- EKBALLO ENGLISH · Acesso por convite
--
-- O English deixa de aparecer para todo mundo: cada discípulo é
-- liberado individualmente pelo master (painel /admin/english ou
-- na ficha do aluno). Mesmo princípio de `acesso_liberado`, mas
-- só para a vertente de inglês.
--
-- Quem já estava praticando NÃO perde acesso — a coluna nasce
-- true para quem tem progresso, streak ou revisão gravada.
-- Admins não dependem da coluna (a checagem no app libera master
-- e admin sempre).
-- =============================================================

ALTER TABLE public.profiles
ADD COLUMN IF NOT EXISTS english_liberado boolean NOT NULL DEFAULT false;

-- Não tirar o curso de quem já começou.
UPDATE public.profiles p
SET english_liberado = true
WHERE english_liberado = false
  AND (
    p.is_admin
    OR EXISTS (SELECT 1 FROM public.english_progresso e WHERE e.aluno_id = p.id)
    OR EXISTS (SELECT 1 FROM public.english_streak s WHERE s.aluno_id = p.id)
  );

COMMENT ON COLUMN public.profiles.english_liberado IS
  'Ekballo English liberado para este discípulo (acesso por convite; admin sempre tem).';
