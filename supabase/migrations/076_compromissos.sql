-- 076_compromissos.sql
--
-- Agenda pessoal no painel admin. Compromissos cadastrados manualmente pelo
-- admin (os eventos do Google Calendar são lidos em tempo real via iCal e NÃO
-- ficam aqui — esta tabela é só pros compromissos próprios criados no painel).
--
-- Acesso restrito a admin (leitura/escrita). RLS espelha o padrão das demais
-- tabelas administrativas (is_admin(auth.uid())).

create table if not exists compromissos (
  id uuid primary key default gen_random_uuid(),
  titulo text not null,
  inicio timestamptz not null,
  fim timestamptz,
  dia_todo boolean not null default false,
  local text,
  nota text,
  criado_por uuid references profiles(id) on delete set null,
  created_at timestamptz not null default now()
);

create index if not exists compromissos_inicio_idx on compromissos(inicio);

alter table compromissos enable row level security;

drop policy if exists "compromissos_admin_all" on compromissos;
create policy "compromissos_admin_all" on compromissos for all
  to authenticated
  using (is_admin(auth.uid()))
  with check (is_admin(auth.uid()));
