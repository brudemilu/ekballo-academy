-- =============================================================
-- EKBALLO ACADEMY · Telefone obrigatório no cadastro (nível banco)
-- =============================================================
-- O formulário de /cadastro já exige telefone, mas o trigger aceitava
-- NULL — então qualquer cadastro fora do formulário criava conta sem
-- telefone. Como o reset de senha agora depende do WhatsApp, todo novo
-- cadastro PRECISA ter telefone.
--
-- Este trigger passa a VALIDAR e REJEITAR cadastro sem telefone válido
-- (celular 11 ou fixo 10 dígitos, com ou sem o DDI 55). Guarda sempre
-- normalizado como "55" + dígitos nacionais.
--
-- IMPORTANTE: a criação manual de admin via INSERT em auth.users também
-- dispara este trigger — inclua `telefone` em raw_user_meta_data ao criar
-- usuários por SQL, senão o INSERT é rejeitado.
--
-- Não mexe nos perfis já existentes (não adiciona NOT NULL na coluna),
-- só barra novos cadastros sem telefone.
-- -------------------------------------------------------------

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  v_curso record;
  v_tel   text;
begin
  -- Normaliza/valida o telefone vindo do signup.
  v_tel := regexp_replace(coalesce(new.raw_user_meta_data->>'telefone', ''), '\D', '', 'g');
  -- Tira o DDI 55 se veio junto (12 ou 13 dígitos).
  if length(v_tel) in (12, 13) and left(v_tel, 2) = '55' then
    v_tel := substr(v_tel, 3);
  end if;
  -- Exige fixo (10) ou celular (11) dígitos nacionais.
  if length(v_tel) not in (10, 11) then
    raise exception 'Telefone (WhatsApp) é obrigatório no cadastro.'
      using errcode = 'check_violation';
  end if;

  insert into public.profiles (id, email, nome, telefone)
  values (
    new.id,
    new.email,
    coalesce(new.raw_user_meta_data->>'nome', split_part(new.email, '@', 1)),
    '55' || v_tel
  )
  on conflict (id) do nothing;

  -- Matrícula automática em todos os cursos "abertos por padrão".
  for v_curso in
    select id from public.cursos where external_path is not null
  loop
    insert into public.matriculas (aluno_id, curso_id)
    values (new.id, v_curso.id)
    on conflict (aluno_id, curso_id) do nothing;
  end loop;

  return new;
end;
$$;
