-- Copiloto de conteúdo (issue #189), fatia 4: roteiros de vídeo falado.
--
-- Cada linha é um roteiro que o pastor decidiu guardar. O roteiro inteiro
-- (ganchos, blocos Falar/Tela/Mostrar, legenda e os trechos da fonte que o
-- sustentam) vive em `roteiro` jsonb: é lido e gravado sempre de uma vez, e a
-- forma ainda vai mudar (teleprompter, narração). `fonte` guarda só de onde
-- veio (tipo, título, autor) — o texto da fonte não é copiado para cá.

create table if not exists public.conteudo_roteiros (
  id         uuid primary key default gen_random_uuid(),
  titulo     text     not null check (char_length(btrim(titulo)) between 1 and 200),
  duracao    smallint not null check (duracao in (15, 30, 60, 90)),
  fonte      jsonb    not null default '{}'::jsonb,
  roteiro    jsonb    not null,
  criado_em  timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

create index if not exists idx_conteudo_roteiros_criado
  on public.conteudo_roteiros (criado_em desc);

alter table public.conteudo_roteiros enable row level security;

drop policy if exists "admin full access conteudo roteiros" on public.conteudo_roteiros;
create policy "admin full access conteudo roteiros"
  on public.conteudo_roteiros
  for all
  to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));
