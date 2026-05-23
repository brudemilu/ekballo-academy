-- =============================================================
-- Material complementar do curso "Ego Transformado" (Tim Keller)
-- Aponta as 4 aulas para o livro completo em PDF no bucket
-- privado `materiais-cursos`, path:
--   ego-transformado-keller/livro-completo.pdf
--
-- O upload do arquivo é feito separadamente via Supabase Dashboard
-- (Storage → materiais-cursos → pasta ego-transformado-keller →
-- upload do PDF como livro-completo.pdf). A página da aula renderiza
-- o botão "Baixar PDF" automaticamente quando material_url está
-- preenchido (resolução via getMaterialUrl → signed URL de 15min).
--
-- Mesma estrutura usada no curso "olhe-para-jesus".
-- =============================================================

update public.aulas
set material_url = 'ego-transformado-keller/livro-completo.pdf'
where curso_id = (
  select id from public.cursos where slug = 'ego-transformado-keller'
);
