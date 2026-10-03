-- Copiloto de conteúdo (issue #189): Instagram pelo WhatsApp.
--
-- Guarda QUAL rascunho está em conversa no WhatsApp: quando o pastor responde
-- "publicar", "refazer" ou "cancelar", é sobre este. Uma linha só (id = 1) —
-- a conversa é com uma pessoa e sobre um post de cada vez. Um "post" novo
-- substitui o anterior.

create table if not exists public.conteudo_whatsapp_pendente (
  id            smallint primary key default 1 check (id = 1),
  carrossel_id  uuid references public.instagram_carrosseis (id) on delete set null,
  ideia         text not null default '',
  tentativas    smallint not null default 0,
  atualizado_em timestamptz not null default now()
);

alter table public.conteudo_whatsapp_pendente enable row level security;

-- Sem política para `authenticated`: só o webhook (cliente de serviço) lê e
-- grava. Ninguém precisa enxergar isto pela tela.
