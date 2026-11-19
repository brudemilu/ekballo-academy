-- =============================================================
-- 379 · Teste de Dons Ministeriais (Efésios 4.11) — issue #289
--
-- Ferramenta de discipulado do master: ele gera um link, a pessoa
-- responde SEM conta no Ekballo, vê o resultado e o resultado fica
-- guardado exatamente como apareceu. Depois ele acompanha a pessoa
-- com anotações.
--
-- Segurança: as quatro tabelas têm RLS ligado e NENHUMA política.
-- Só a chave de serviço (no servidor) lê e grava — quem responde
-- não tem sessão, e o painel é exclusivo do master. É o mesmo
-- desenho de `instagram_contas_credenciais` e `tiktok_credenciais`.
-- Dado de autoavaliação espiritual com nome, idade e telefone
-- (inclusive de menores) não pode ficar ao alcance da chave anônima.
-- =============================================================

create table if not exists public.dons_pessoas (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  -- E.164 sem "+" (lib/telefone.ts). Nulo quando não informado.
  telefone text,
  criado_em timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

create index if not exists dons_pessoas_telefone_idx on public.dons_pessoas (telefone);

-- Um link. Pessoal (pessoa_id preenchido, vale uma resposta) ou
-- aberto (para um grupo; cada um se identifica e pode haver várias).
create table if not exists public.dons_convites (
  id uuid primary key default gen_random_uuid(),
  token text not null unique,
  pessoa_id uuid references public.dons_pessoas (id) on delete cascade,
  -- Nome que o master deu ao link aberto ("Turma EFL março").
  titulo text,
  ativo boolean not null default true,
  usos integer not null default 0,
  criado_em timestamptz not null default now()
);

create index if not exists dons_convites_pessoa_idx on public.dons_convites (pessoa_id);

create table if not exists public.dons_respostas (
  id uuid primary key default gen_random_uuid(),
  pessoa_id uuid not null references public.dons_pessoas (id) on delete cascade,
  convite_id uuid references public.dons_convites (id) on delete set null,
  respondido_em timestamptz not null default now(),
  -- Como a pessoa se identificou NAQUELE dia (o cadastro pode mudar).
  nome_informado text not null,
  idade integer,
  telefone_informado text,
  versao text not null,
  -- 160 notas de 0 a 4: índices 1–10 vida ministerial, 11–160 dons.
  respostas smallint[] not null,
  -- { vida, dons: { apostolo, profeta, pastor, mestre, evangelista } }
  pontuacao jsonb not null,
  -- O que a tela mostrou para a pessoa (lib/dons.ts → ResultadoDons).
  resultado_exibido jsonb not null,
  -- Só nas respostas vindas da planilha antiga: os totais como a
  -- planilha calculava (a fórmula de Apóstolo tinha erro).
  pontuacao_planilha jsonb,
  origem text not null default 'link' check (origem in ('link', 'planilha')),
  -- Quando o master abriu pela primeira vez (nulo = "nova").
  vista_em timestamptz,
  constraint dons_respostas_160 check (cardinality(respostas) = 160)
);

create index if not exists dons_respostas_pessoa_idx
  on public.dons_respostas (pessoa_id, respondido_em desc);
create index if not exists dons_respostas_convite_idx on public.dons_respostas (convite_id);

-- Acompanhamento: o que o master vai registrando com a pessoa.
create table if not exists public.dons_anotacoes (
  id uuid primary key default gen_random_uuid(),
  pessoa_id uuid not null references public.dons_pessoas (id) on delete cascade,
  texto text not null,
  criado_em timestamptz not null default now()
);

create index if not exists dons_anotacoes_pessoa_idx
  on public.dons_anotacoes (pessoa_id, criado_em desc);

alter table public.dons_pessoas enable row level security;
alter table public.dons_convites enable row level security;
alter table public.dons_respostas enable row level security;
alter table public.dons_anotacoes enable row level security;

-- Sem política de propósito. Além disso, tira os privilégios que o
-- Supabase concede por padrão aos papéis da API.
revoke all on public.dons_pessoas from anon, authenticated;
revoke all on public.dons_convites from anon, authenticated;
revoke all on public.dons_respostas from anon, authenticated;
revoke all on public.dons_anotacoes from anon, authenticated;
