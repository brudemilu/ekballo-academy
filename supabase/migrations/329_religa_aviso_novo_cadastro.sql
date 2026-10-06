-- =============================================================
-- Religa o aviso de novo cadastro — e passa a avisar pelo WhatsApp.
--
-- Na migração pro Contabo (jul/2026) os dois gatilhos de auth.users
-- não foram recriados: as funções vieram, os gatilhos não (o schema
-- auth é do GoTrue e ficou fora da cópia). Desde então:
--   - on_auth_user_created (handle_new_user) não roda: o perfil só
--     nasce pelo upsert do navegador em /cadastro, e ninguém é
--     matriculado nas temáticas abertas (Bíblia, devocional, planos);
--   - on_auth_user_created_notificar_admin não roda: o líder não
--     fica sabendo que alguém se cadastrou e a pessoa fica esperando
--     liberação (quatro cadastros ficaram parados entre set e out/2026).
--
-- O aviso também muda de canal: sai pelo WhatsApp (whatsapp_fila), não
-- mais por e-mail. Decisão do Bruno (out/2026): a plataforma não usa
-- e-mail para nada. Pelo mesmo motivo esta migration desliga os outros
-- dois e-mails que o banco disparava sozinho:
--   - boas-vindas a cada matrícula (o convite já sai por WhatsApp e
--     push, em lib/matricula.ts);
--   - lembrete diário de inatividade.
-- Os dois já não chegavam a ninguém: a Brevo do box responde 401.
--
-- Idempotente.
-- =============================================================

create or replace function public.tg_notificar_novo_cadastro()
returns trigger
language plpgsql
security definer
set search_path = public, pg_temp
as $$
declare
  v_nome text;
  v_tel  text;
  v_link text;
begin
  v_nome := coalesce(
    nullif(trim(new.raw_user_meta_data ->> 'nome'), ''),
    nullif(trim(new.raw_user_meta_data ->> 'full_name'), ''),
    split_part(new.email, '@', 1)
  );
  v_tel := regexp_replace(coalesce(new.raw_user_meta_data ->> 'telefone', ''), '\D', '', 'g');
  v_link := 'https://ekballo.escoladodiscipuloimw.com.br/admin/alunos/' || new.id;

  -- WhatsApp: um aviso por telefone de admin (vários admins podem
  -- dividir o mesmo número — distinct evita mensagem repetida).
  begin
    insert into public.whatsapp_fila (telefone, corpo)
    select distinct regexp_replace(p.telefone, '\D', '', 'g'),
      '🔔 *Novo cadastro na Ekballo*' || E'\n\n' ||
      v_nome || E'\n' ||
      new.email ||
      case when v_tel <> '' then E'\n' || 'WhatsApp: ' || v_tel else '' end ||
      E'\n\n' || 'Está aguardando a sua liberação:' || E'\n' || v_link
    from public.profiles p
    where p.is_admin = true
      and length(regexp_replace(coalesce(p.telefone, ''), '\D', '', 'g')) >= 10;
  exception when others then
    raise warning 'tg_notificar_novo_cadastro: erro ao enfileirar WhatsApp — %', sqlerrm;
  end;

  return new;
exception when others then
  -- Nunca deixa um erro de aviso quebrar o signup
  raise warning 'tg_notificar_novo_cadastro: %', sqlerrm;
  return new;
end;
$$;

revoke execute on function public.tg_notificar_novo_cadastro() from public, anon, authenticated;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();

drop trigger if exists on_auth_user_created_notificar_admin on auth.users;
create trigger on_auth_user_created_notificar_admin
  after insert on auth.users
  for each row execute function public.tg_notificar_novo_cadastro();

-- -------------------------------------------------------------
-- Desliga os e-mails automáticos do banco.
-- As funções ficam (nada mais as chama) — só o disparo é removido.
-- -------------------------------------------------------------
drop trigger if exists on_matricula_inserted_boas_vindas on public.matriculas;

do $$
declare
  v_jobid bigint;
begin
  if to_regclass('cron.job') is null then
    return;
  end if;
  select jobid into v_jobid from cron.job where jobname = 'lembrete-inatividade-diario';
  if v_jobid is not null then
    perform cron.unschedule(v_jobid);
  end if;
end $$;
