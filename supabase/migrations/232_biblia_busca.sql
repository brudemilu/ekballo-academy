-- =============================================================
-- EKBALLO ACADEMY · Busca na Bíblia por palavra
--
-- Até aqui só dava pra NAVEGAR (livro → capítulo). Quem está escrevendo uma
-- anotação e lembra do versículo pela frase, não pela referência, ficava sem
-- saída — tinha que sair da plataforma pra procurar.
--
-- São ~31 mil versículos por versão, então varredura com LIKE está fora de
-- questão: aqui entra índice GIN de full-text.
--
-- Acento: quem digita rápido escreve "coracao". O dicionário `portuguese`
-- sozinho não casaria com "coração", então, quando a extensão `unaccent`
-- existir, criamos uma configuração de busca que tira o acento ANTES de
-- reduzir a palavra ao radical. Índice e consulta precisam usar exatamente a
-- mesma configuração — por isso ela é escolhida uma vez e o índice e a função
-- são criados com o nome dela.
-- =============================================================

do $$
declare
  cfg text := 'portuguese';
  tem_unaccent boolean;
begin
  -- 1) unaccent disponível? (não falha o deploy se não estiver)
  begin
    create extension if not exists unaccent;
  exception when others then
    raise notice 'unaccent indisponível: a busca ficará sensível a acento';
  end;

  select exists (select 1 from pg_extension where extname = 'unaccent')
    into tem_unaccent;

  if tem_unaccent then
    if not exists (
      select 1 from pg_ts_config where cfgname = 'pt_sem_acento'
    ) then
      create text search configuration public.pt_sem_acento (copy = portuguese);
      alter text search configuration public.pt_sem_acento
        alter mapping for hword, hword_part, word
        with unaccent, portuguese_stem;
    end if;
    cfg := 'public.pt_sem_acento';
  end if;

  -- 2) Índice de busca, na configuração escolhida.
  execute format(
    'create index if not exists biblia_versiculos_busca_idx
       on public.biblia_versiculos using gin (to_tsvector(%L, texto))',
    cfg
  );

  -- 3) Função de busca. SECURITY INVOKER: as tabelas da Bíblia já são de
  --    leitura livre (policy "biblia_versiculos_read"), então a função não
  --    precisa — nem deve — de privilégio próprio.
  execute format($f$
    create or replace function public.buscar_biblia(
      termo text,
      p_versao text default 'ACF',
      limite int default 40
    )
    returns table (
      livro_id int,
      livro_nome text,
      livro_abrev text,
      capitulo int,
      versiculo int,
      texto text,
      relevancia real
    )
    language sql
    stable
    security invoker
    set search_path = public
    as $corpo$
      select v.livro_id,
             l.nome,
             l.abrev,
             v.capitulo,
             v.versiculo,
             v.texto,
             ts_rank(to_tsvector(%L, v.texto),
                     websearch_to_tsquery(%L, termo))::real
        from public.biblia_versiculos v
        join public.biblia_livros l on l.id = v.livro_id
       where v.versao = p_versao
         and length(btrim(termo)) >= 2
         and to_tsvector(%L, v.texto) @@ websearch_to_tsquery(%L, termo)
       order by 7 desc, v.livro_id, v.capitulo, v.versiculo
       limit least(greatest(coalesce(limite, 40), 1), 100);
    $corpo$
  $f$, cfg, cfg, cfg, cfg);
end;
$$;

comment on function public.buscar_biblia(text, text, int) is
  'Busca versículos por palavra/frase (full-text em português, sem sensibilidade a acento quando unaccent existe). Usada pelo campo de pesquisa do caderno de anotações.';

grant execute on function public.buscar_biblia(text, text, int) to authenticated, anon;
