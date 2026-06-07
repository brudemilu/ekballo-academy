-- 077_agenda_google.sql
-- Eventos do Google sincronizados pelo Apps Script (todas as agendas do usuário,
-- inclusive as compartilhadas — o script roda com o acesso Google dele).
-- O endpoint /api/agenda/sync (service role) substitui a janela a cada sync.
-- Leitura: admin (painel). Escrita: só service role (ignora RLS).
create table if not exists agenda_google (
  id text primary key,
  agenda text,
  titulo text not null,
  inicio timestamptz not null,
  fim timestamptz,
  dia_todo boolean not null default false,
  local text,
  atualizado_em timestamptz not null default now()
);
create index if not exists agenda_google_inicio_idx on agenda_google(inicio);
alter table agenda_google enable row level security;
drop policy if exists "agenda_google_admin_read" on agenda_google;
create policy "agenda_google_admin_read" on agenda_google for select
  to authenticated using (is_admin(auth.uid()));
