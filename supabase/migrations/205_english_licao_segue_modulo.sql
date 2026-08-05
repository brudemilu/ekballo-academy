-- =============================================================
-- EKBALLO ENGLISH · Lição só aparece se o módulo dela estiver no ar
--
-- A policy original de english_licoes olhava apenas o `publicado`
-- da própria lição. Como lição nasce publicada por padrão, escrever
-- o conteúdo de um módulo ainda em produção deixaria as lições
-- visíveis na vitrine antes da hora. Agora a lição herda a
-- publicação do módulo.
-- =============================================================

drop policy if exists "english_licoes_read" on english_licoes;
create policy "english_licoes_read" on english_licoes for select
  to authenticated, anon
  using (
    is_admin(auth.uid())
    or (
      publicado = true
      and exists (
        select 1 from english_modulos m
        where m.id = english_licoes.modulo_id and m.publicado = true
      )
    )
  );

-- Mesma regra pro exercício: sem módulo no ar, sem exercício.
drop policy if exists "english_exercicios_read" on english_exercicios;
create policy "english_exercicios_read" on english_exercicios for select
  to authenticated
  using (
    is_admin(auth.uid())
    or exists (
      select 1
      from english_licoes l
      join english_modulos m on m.id = l.modulo_id
      where l.id = english_exercicios.licao_id
        and l.publicado = true
        and m.publicado = true
    )
  );
