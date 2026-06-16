-- =============================================================
-- Curso: Liderança com Propósitos (Rick Warren)
--
-- Esta migration cria APENAS a casca do curso (registro em `cursos`)
-- com descrição autoral e a capa (rota OG + capa real do livro em
-- /public/capas/lideranca-com-propositos.jpg).
--
-- As aulas NÃO são criadas aqui. O conteúdo de cada capítulo entra em
-- migrations seguintes (108, 109, ...), uma vez definido COMO o curso
-- será montado:
--   (A) material de estudo autoral por capítulo (resumo fiel + aplicação
--       pelos 5 propósitos + reflexões), ou
--   (B) texto fornecido pelo próprio admin.
--
-- O curso entra com publicado = TRUE para o CARD (com a capa) já aparecer
-- na lista de cursos. Como ainda não há aulas, a página interna fica vazia
-- até o conteúdo ser definido.
--
-- Idempotente: pode ser reaplicada sem duplicar o curso.
-- =============================================================

do $migration$
declare
  v_curso_id uuid;
  v_next_ordem int;
begin
  select id into v_curso_id from public.cursos
  where slug = 'lideranca-com-propositos';

  if v_curso_id is null then
    select coalesce(max(ordem), 0) + 1 into v_next_ordem from public.cursos;
    insert into public.cursos
      (slug, titulo, descricao, imagem_url, is_pago, preco_centavos, ordem, publicado)
    values (
      'lideranca-com-propositos',
      'Liderança com Propósitos',
      'Um estudo de liderança cristã a partir da vida de Neemias — o homem que reconstruiu os muros de Jerusalém em 52 dias. A cada capítulo, um princípio: como um líder se forma, ora, planeja, motiva, organiza um projeto, enfrenta oposição, resolve conflitos, vence as tentações do poder e sustenta o sucesso ao longo do tempo. Inspirado em "Liderança com Propósitos", de Rick Warren, o curso traz o princípio central de cada etapa, o exemplo bíblico de Neemias, a aplicação pelos cinco propósitos (Comunhão, Discipulado, Ministério, Evangelismo e Adoração) e perguntas para você examinar a própria liderança.',
      '/api/og/curso/lideranca-com-propositos',
      false,
      0,
      v_next_ordem,
      true  -- card aparece já; página interna fica vazia até ter aulas
    );
  end if;
end
$migration$;
