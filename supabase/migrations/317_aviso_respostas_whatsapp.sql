-- =============================================================
-- AVISO NO WHATSAPP QUANDO O DISCÍPULO RESPONDE  (issue #171)
--
-- Miguel e Luiza respondem fora do horário em que alguém abre o
-- painel. Sem aviso, a resposta espera dias por devolutiva. Esta
-- migration dá ao app o que falta para avisar:
--
--   1) `aulas.resumo_curto` — resumo do capítulo em duas ou três
--      frases, escrito uma vez e reaproveitado nos avisos seguintes;
--   2) `avisos_resposta`    — registro do que já foi avisado, para
--      não repetir a cada rodada do cron;
--   3) o job pg_cron de 5 em 5 minutos que chama a rota.
--
-- A rota é GET /api/cron/avisar-respostas — ela é quem decide o que
-- está "pronto para avisar" (resposta parada há alguns minutos).
-- =============================================================

-- 1) Resumo do capítulo -----------------------------------------
alter table public.aulas
  add column if not exists resumo_curto text;

comment on column public.aulas.resumo_curto is
  'Resumo do capítulo em 2-3 frases, escrito por IA com palavras próprias (não é trecho do livro). Usado no aviso de WhatsApp para dar contexto à resposta do discípulo. Gerado sob demanda na primeira vez.';

-- 2) O que já foi avisado ---------------------------------------
-- `referencia` guarda o updated_at avisado: se a pessoa EDITAR a
-- resposta depois, a referência fica para trás e o aviso sai de novo
-- — edição semanas depois é notícia; a mesma resposta relida, não.
create table if not exists public.avisos_resposta (
  origem text not null check (origem in ('resposta', 'devocional')),
  chave text not null,
  referencia timestamptz not null,
  enviado_em timestamptz not null default now(),
  primary key (origem, chave)
);

alter table public.avisos_resposta enable row level security;

comment on table public.avisos_resposta is
  'Qual resposta já gerou aviso no WhatsApp do líder, e em que versão dela. Sem policy de RLS: só o service_role escreve aqui.';

-- 2b) Histórico não é notícia -----------------------------------
-- Miguel e Luiza já têm 32 reflexões de livro e 177 do devocional
-- gravadas. Sem isso, a primeira rodada do cron despejaria duzentas
-- mensagens de anos atrás no WhatsApp do líder — e derrubaria a
-- sessão do WhatsApp junto (envio em massa é o que o número comum
-- não aguenta). Então tudo que já existe entra como "já avisado".
--
-- Note que isso NÃO silencia essas respostas para sempre: a marca
-- guarda o updated_at de hoje; se a pessoa voltar e reescrever a
-- resposta, ela passa a ser mais nova que a marca e o aviso sai.
insert into public.avisos_resposta (origem, chave, referencia)
select 'resposta', id::text, updated_at from public.respostas
on conflict (origem, chave) do nothing;

insert into public.avisos_resposta (origem, chave, referencia)
select 'devocional', aluno_id::text || ':' || dia_ano::text, atualizado_em
  from public.devocional_anual_reflexao
on conflict (origem, chave) do nothing;

-- 3) Cron -------------------------------------------------------
create or replace function public.disparar_aviso_respostas()
returns void
language plpgsql
security definer
set search_path to 'public'
as $fn$
declare v_secret text;
begin
  select decrypted_secret into v_secret
    from vault.decrypted_secrets where name = 'agenda_sync_secret';
  if v_secret is null then return; end if; -- ainda não configurado
  perform net.http_get(
    url := 'https://ekballo.escoladodiscipuloimw.com.br/api/cron/avisar-respostas?secret=' || v_secret
  );
end;
$fn$;

-- SECURITY DEFINER em schema público recebe EXECUTE de PUBLIC por
-- padrão; revogar evita que um cliente dispare avisos pela Data API.
revoke all on function public.disparar_aviso_respostas() from public, anon, authenticated;

select cron.unschedule('aviso-respostas')
 where exists (select 1 from cron.job where jobname = 'aviso-respostas');

-- De 5 em 5 minutos: a rota só avisa o que está parado há 10, então o
-- aviso chega poucos minutos depois de a pessoa terminar de escrever.
select cron.schedule(
  'aviso-respostas',
  '*/5 * * * *',
  'select public.disparar_aviso_respostas()'
);
