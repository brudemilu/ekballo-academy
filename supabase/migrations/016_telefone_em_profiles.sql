-- ============================================================
-- EKBALLO ACADEMY · Telefone no perfil do aluno
-- Adiciona coluna `telefone` em profiles e atualiza o trigger
-- handle_new_user para preencher a partir do raw_user_meta_data
-- no momento do cadastro. Necessário para envio de WhatsApp.
-- ============================================================

alter table profiles
  add column if not exists telefone text;

-- Trigger atualizado: agora também copia `telefone` do metadata do signup
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, email, nome, telefone)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'nome', split_part(new.email, '@', 1)),
    new.raw_user_meta_data->>'telefone'
  )
  on conflict (id) do nothing;
  return new;
end;
$$;
