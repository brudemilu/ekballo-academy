-- =============================================================
-- EKBALLO ACADEMY · Caderno de anotações: pastas e lixeira
--
-- Duas faltas que apareceram no uso (Bruno, 26/ago/2026):
--
-- 1. LIXEIRA. Excluir era definitivo e sem rede: um clique errado levava
--    junto o que o discípulo escreveu. Agora "excluir" só carimba
--    `excluida_em`; a anotação some das listas, fica 30 dias na lixeira
--    (dá pra restaurar) e só então é apagada de verdade, por um job diário.
--
-- 2. PASTAS. `categoria` classifica o TIPO da anotação (aula, trabalho,
--    ideia) — não serve pra agrupar por assunto. Quem faz um curso chamado
--    "Perspectivas" quer uma pasta com esse nome e as anotações das aulas
--    dentro. É um segundo eixo, livre e nomeado pelo próprio dono.
-- =============================================================

-- ---------- PASTAS ----------
create table if not exists public.anotacao_pastas (
  id uuid primary key default gen_random_uuid(),
  aluno_id uuid not null references public.profiles(id) on delete cascade,
  nome text not null,
  cor text not null default 'areia',
  -- Ordem manual na barra lateral; empate desempata por nome.
  ordem int not null default 0,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  check (length(trim(nome)) between 1 and 60),
  check (cor in ('areia','terracota','oliva','azul','rosa','roxo'))
);

comment on table public.anotacao_pastas is
  'Pastas do caderno (ex.: "Perspectivas"). Cada uma pertence a um aluno; agrupa anotações por assunto, independente da categoria.';

-- Duas pastas com o mesmo nome no mesmo caderno só confundem.
create unique index if not exists anotacao_pastas_nome_idx
  on public.anotacao_pastas (aluno_id, lower(trim(nome)));

alter table public.anotacao_pastas enable row level security;

drop policy if exists "anotacao_pastas_self" on public.anotacao_pastas;
create policy "anotacao_pastas_self" on public.anotacao_pastas for all
  to authenticated
  using (aluno_id = auth.uid())
  with check (aluno_id = auth.uid());

-- ---------- COLUNAS NOVAS EM anotacoes ----------
-- `set null`: apagar a pasta NUNCA pode apagar o que está dentro dela —
-- as anotações apenas voltam pra "Sem pasta".
alter table public.anotacoes
  add column if not exists pasta_id uuid references public.anotacao_pastas(id) on delete set null;

alter table public.anotacoes
  add column if not exists excluida_em timestamptz;

comment on column public.anotacoes.excluida_em is
  'Carimbo da ida pra lixeira. NULL = ativa. Expurgada 30 dias depois pelo job anotacoes-expurgo-lixeira.';

-- Índices parciais: as listagens do caderno sempre pedem `excluida_em is null`,
-- e a lixeira sempre pede o contrário.
create index if not exists anotacoes_ativas_idx
  on public.anotacoes (aluno_id, arquivada, fixada desc, atualizado_em desc)
  where excluida_em is null;

create index if not exists anotacoes_lixeira_idx
  on public.anotacoes (aluno_id, excluida_em desc)
  where excluida_em is not null;

create index if not exists anotacoes_pasta_idx
  on public.anotacoes (aluno_id, pasta_id)
  where pasta_id is not null;

-- ---------- TOQUE DE `atualizado_em` NAS PASTAS ----------
drop trigger if exists anotacao_pastas_touch on public.anotacao_pastas;
create trigger anotacao_pastas_touch
  before update on public.anotacao_pastas
  for each row execute function public.tg_anotacoes_touch();

-- ---------- EXPURGO DA LIXEIRA ----------
-- SECURITY DEFINER: roda no cron, sem usuário logado — precisa enxergar as
-- linhas de todos os cadernos pra limpar. Não devolve conteúdo nenhum,
-- só a contagem do que apagou.
create or replace function public.expurgar_anotacoes_lixeira(dias int default 30)
returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  apagadas int;
begin
  delete from public.anotacoes
   where excluida_em is not null
     and excluida_em < now() - (dias || ' days')::interval;
  get diagnostics apagadas = row_count;
  return apagadas;
end;
$$;

revoke execute on function public.expurgar_anotacoes_lixeira(int) from public, anon, authenticated;

comment on function public.expurgar_anotacoes_lixeira(int) is
  'Apaga em definitivo o que passou de N dias na lixeira. Chamada pelo job diário; não exposta ao app.';

-- Agenda diária às 04:10 UTC (01:10 em São Paulo) — horário morto, e o
-- atraso de algumas horas não muda nada numa janela de 30 dias.
do $$
begin
  if exists (select 1 from pg_extension where extname = 'pg_cron') then
    perform cron.unschedule('anotacoes-expurgo-lixeira')
      where exists (select 1 from cron.job where jobname = 'anotacoes-expurgo-lixeira');
    perform cron.schedule(
      'anotacoes-expurgo-lixeira',
      '10 4 * * *',
      $cron$select public.expurgar_anotacoes_lixeira(30);$cron$
    );
  else
    raise notice 'pg_cron ausente: o expurgo da lixeira precisará de outro agendador';
  end if;
end;
$$;
