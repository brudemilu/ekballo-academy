-- ============================================================
-- EKBALLO ACADEMY · Hardening das funções SECURITY DEFINER
-- Resolve os warnings 0028/0029 do database linter.
-- ============================================================

-- handle_new_user é gatilho de trigger; ninguém deve chamá-la via RPC.
revoke execute on function public.handle_new_user() from public, anon, authenticated;

-- is_admin é usada dentro de policies; SECURITY INVOKER é suficiente porque
-- a RLS de profiles já garante que o user só lê o próprio is_admin
-- (auth.uid() = id), evitando vazamento de status alheio via RPC.
create or replace function public.is_admin(uid uuid)
returns boolean
language sql
security invoker
set search_path = public
stable
as $$
  select coalesce((select is_admin from profiles where id = uid), false);
$$;
