-- =============================================================
-- HISTÓRICO DO VIGIA DA CONEXÃO DO WHATSAPP
--
-- Em 04/set/2026 o socket do WhatsApp morreu e a plataforma ficou QUATRO
-- DIAS muda (devocional dos grupos, lembrete da agenda, boas-vindas,
-- recuperação de senha) sem ninguém perceber. Esta tabela é a memória do
-- vigia que passou a existir por causa disso: aqui ficam as transições —
-- caiu, foi reparado, voltou, avisou.
--
-- Quem escreve é o vigia que roda no HOST (scripts/whatsapp-vigia.sh,
-- instalado no cron do box). Ele não vive no app de propósito: o conserto
-- que funciona é recriar o container da Evolution, e dar ao container do
-- Next — que está exposto à internet — acesso ao socket do Docker seria
-- trocar uma queda de WhatsApp por um risco de root na máquina.
--
-- NÃO há pg_cron aqui: o agendamento é do cron do sistema, porque só o
-- host consegue executar o reparo.
-- =============================================================

-- Só transições, nunca uma linha por rodada: a cada 3 minutos, "uma linha
-- por checagem" viraria ~480 registros por dia e esconderia justamente o
-- que interessa — quando caiu e quando voltou.
create table if not exists public.whatsapp_vigia (
  id bigserial primary key,
  criado_em timestamptz not null default now(),
  status text not null check (status in ('ok', 'caido', 'reparado', 'alerta')),
  estado text,
  detalhe text
);

create index if not exists whatsapp_vigia_criado_em_idx
  on public.whatsapp_vigia (criado_em desc);

alter table public.whatsapp_vigia enable row level security;

-- Só o service_role escreve (ele bypassa RLS). Admin lê pra poder olhar o
-- histórico de quedas; aluno não tem nada que ver aqui.
drop policy if exists "whatsapp_vigia_admin_read" on public.whatsapp_vigia;
create policy "whatsapp_vigia_admin_read" on public.whatsapp_vigia
  for select using (public.is_admin(auth.uid()));

comment on table public.whatsapp_vigia is
  'Transições da conexão do WhatsApp vistas pelo vigia do host: queda, reparo, volta e alerta.';
