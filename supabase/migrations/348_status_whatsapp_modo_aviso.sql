-- =============================================================
-- 348 · Status do WhatsApp: modo "aviso" (issue #258)
-- =============================================================
-- O gateway (Evolution v2.3.7) aceita o pedido de Status e não o entrega. Até
-- isso se resolver, a rotina passa a ter dois modos:
--   aviso      — manda no chat do próprio pastor a capa com o link (ou o story)
--                pronto para ele encaminhar ao Status em dois toques;
--   automatico — publica direto no Status (o que a 347 fazia).
-- O padrão é "aviso", que só depende do envio de mensagem comum, que funciona.

alter table public.whatsapp_status_config
  add column if not exists modo text not null default 'aviso'
    check (modo in ('aviso', 'automatico'));
