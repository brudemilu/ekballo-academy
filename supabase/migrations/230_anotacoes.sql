-- =============================================================
-- EKBALLO ACADEMY · Caderno de anotações do discípulo
--
-- Até aqui o discípulo só conseguia escrever DENTRO de alguma coisa:
-- resposta de reflexão (presa à atividade), grifo (preso ao parágrafo),
-- "anotações da mesa" (atividade com razao='anotacao'). Tudo isso é
-- pastoral e nasce do conteúdo — não serve pra ideia solta, esboço de
-- pregação, trabalho da faculdade, lista de estudo.
--
-- `anotacoes` é o caderno livre: texto formatado (HTML sanitizado no
-- servidor antes de gravar), categoria, tags, cor, fixar, arquivar,
-- e vínculo OPCIONAL com livro/mesa — quando a anotação nasce de uma
-- leitura ela guarda de onde veio, mas não depende disso pra existir.
--
-- O caderno é ESTRITAMENTE privado: cada pessoa lê apenas o que ela mesma
-- escreveu. Não há caminho de leitura para outra conta — nem para o master.
-- =============================================================

create table if not exists public.anotacoes (
  id uuid primary key default gen_random_uuid(),
  aluno_id uuid not null references public.profiles(id) on delete cascade,
  titulo text not null default '',
  -- HTML já sanitizado (whitelist em lib/sanitizar-html.ts). Nunca gravar
  -- HTML cru vindo do navegador aqui.
  conteudo_html text not null default '',
  -- Espelho em texto puro: alimenta a busca e a prévia do card sem precisar
  -- limpar tags em toda listagem.
  conteudo_texto text not null default '',
  categoria text not null default 'ideia',
  cor text not null default 'areia',
  tags text[] not null default '{}',
  -- Vínculo opcional com a leitura de onde a anotação nasceu. `set null`
  -- porque perder o livro não pode apagar o que o discípulo escreveu.
  curso_id uuid references public.cursos(id) on delete set null,
  aula_id uuid references public.aulas(id) on delete set null,
  fixada boolean not null default false,
  arquivada boolean not null default false,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now(),
  check (categoria in ('aula','trabalho','ideia','estudo','sermao','oracao','outro')),
  check (cor in ('areia','terracota','oliva','azul','rosa','roxo'))
);

comment on table public.anotacoes is
  'Caderno livre do discípulo: aulas, trabalhos, ideias. Estritamente privado — cada conta lê só o que escreveu.';

-- Listagem do caderno (mais recente primeiro, fixadas no topo).
create index if not exists anotacoes_aluno_idx
  on public.anotacoes (aluno_id, arquivada, fixada desc, atualizado_em desc);

-- "Anotações desta mesa" na página da aula.
create index if not exists anotacoes_aula_idx
  on public.anotacoes (aluno_id, aula_id) where aula_id is not null;

create index if not exists anotacoes_curso_idx
  on public.anotacoes (aluno_id, curso_id) where curso_id is not null;

create index if not exists anotacoes_tags_idx
  on public.anotacoes using gin (tags);

-- Busca textual em português (título pesa mais que o corpo).
create index if not exists anotacoes_busca_idx
  on public.anotacoes using gin (
    (setweight(to_tsvector('portuguese', coalesce(titulo, '')), 'A') ||
     setweight(to_tsvector('portuguese', coalesce(conteudo_texto, '')), 'B'))
  );

-- `atualizado_em` no relógio do banco: o autosave do editor manda PATCH a
-- cada pausa de digitação e não dá pra confiar no relógio do navegador pra
-- ordenar o caderno.
create or replace function public.tg_anotacoes_touch()
returns trigger
language plpgsql
security invoker
set search_path = public
as $$
begin
  new.atualizado_em = now();
  return new;
end;
$$;

drop trigger if exists anotacoes_touch on public.anotacoes;
create trigger anotacoes_touch
  before update on public.anotacoes
  for each row execute function public.tg_anotacoes_touch();

-- ---------- RLS ----------
alter table public.anotacoes enable row level security;

-- O dono faz tudo com o próprio caderno.
drop policy if exists "anotacoes_self" on public.anotacoes;
create policy "anotacoes_self" on public.anotacoes for all
  to authenticated
  using (aluno_id = auth.uid())
  with check (aluno_id = auth.uid());

-- Sem policy de leitura para admin, de propósito: o master não lê o caderno
-- de ninguém. Cada conta enxerga só as próprias linhas.

