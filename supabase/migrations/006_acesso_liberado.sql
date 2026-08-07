-- Libera o fluxo manual de aprovação para novos cadastros.
-- Perfis existentes continuam com acesso liberado; novos cadastros ficam pendentes
-- até o admin marcar o campo como verdadeiro.

ALTER TABLE public.profiles
ADD COLUMN IF NOT EXISTS acesso_liberado boolean;

UPDATE public.profiles
SET acesso_liberado = true
WHERE acesso_liberado IS NULL;

ALTER TABLE public.profiles
ALTER COLUMN acesso_liberado SET DEFAULT false;

UPDATE public.profiles
SET acesso_liberado = true
WHERE is_admin = true;
