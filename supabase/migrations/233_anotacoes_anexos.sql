-- =============================================================
-- EKBALLO ACADEMY · Anexos das anotações
--
-- O discípulo chega na mesa com o PDF ou o slide da aula e quer guardar
-- aquilo JUNTO da anotação — não num drive à parte que ninguém reabre.
--
-- Os arquivos vão para um bucket privado próprio, com o caminho começando
-- pelo id do dono (`{aluno_id}/{anotacao_id}/{arquivo}`). É esse primeiro
-- pedaço do caminho que as policies conferem: ninguém lê nem escreve na
-- pasta de outro, do mesmo jeito que o caderno é privado por linha.
-- =============================================================

-- ---------- BUCKET ----------
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'anotacoes',
  'anotacoes',
  false,
  31457280, -- 30 MB: slide de aula com imagens passa fácil dos 10
  array[
    -- imagens (foto do quadro, print, digitalização)
    'image/jpeg','image/png','image/webp','image/gif','image/heic','image/heif',
    -- documentos
    'application/pdf','text/plain','text/markdown','text/csv',
    -- slides
    'application/vnd.ms-powerpoint',
    'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'application/vnd.oasis.opendocument.presentation',
    -- textos e planilhas
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/vnd.oasis.opendocument.text',
    'application/vnd.ms-excel',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    -- áudio (gravação da aula)
    'audio/mpeg','audio/mp4','audio/x-m4a','audio/ogg','audio/wav'
  ]
)
on conflict (id) do update
  set file_size_limit = excluded.file_size_limit,
      allowed_mime_types = excluded.allowed_mime_types,
      public = false;

-- ---------- POLICIES DO BUCKET ----------
-- storage.foldername(name) quebra o caminho em pedaços; o [1] é a pasta do
-- dono. Sem isso o bucket ficaria com RLS ligado e zero policies — que foi
-- exatamente o que quebrou os áudios na migração de julho (ver migration 202).
drop policy if exists "anexos_anotacoes_dono_read" on storage.objects;
create policy "anexos_anotacoes_dono_read" on storage.objects for select
  to authenticated
  using (
    bucket_id = 'anotacoes'
    and (storage.foldername(name))[1] = auth.uid()::text
  );

drop policy if exists "anexos_anotacoes_dono_insert" on storage.objects;
create policy "anexos_anotacoes_dono_insert" on storage.objects for insert
  to authenticated
  with check (
    bucket_id = 'anotacoes'
    and (storage.foldername(name))[1] = auth.uid()::text
  );

drop policy if exists "anexos_anotacoes_dono_update" on storage.objects;
create policy "anexos_anotacoes_dono_update" on storage.objects for update
  to authenticated
  using (
    bucket_id = 'anotacoes'
    and (storage.foldername(name))[1] = auth.uid()::text
  );

drop policy if exists "anexos_anotacoes_dono_delete" on storage.objects;
create policy "anexos_anotacoes_dono_delete" on storage.objects for delete
  to authenticated
  using (
    bucket_id = 'anotacoes'
    and (storage.foldername(name))[1] = auth.uid()::text
  );

-- ---------- REGISTRO DOS ANEXOS ----------
-- O bucket guarda o arquivo; esta tabela guarda o que a tela precisa saber
-- (nome original, tipo, tamanho, ordem) sem ter de listar o storage.
create table if not exists public.anotacao_anexos (
  id uuid primary key default gen_random_uuid(),
  anotacao_id uuid not null references public.anotacoes(id) on delete cascade,
  aluno_id uuid not null references public.profiles(id) on delete cascade,
  -- Nome como o discípulo vê ("Aula 3 - perspectivas.pdf").
  nome text not null,
  -- Caminho dentro do bucket. Único: dois arquivos nunca colidem.
  caminho text not null unique,
  tipo text not null default 'application/octet-stream',
  tamanho bigint not null default 0,
  criado_em timestamptz not null default now(),
  check (length(trim(nome)) between 1 and 300),
  check (tamanho >= 0 and tamanho <= 31457280)
);

comment on table public.anotacao_anexos is
  'Arquivos anexados a uma anotação (PDF, slide, foto, áudio). O binário vive no bucket privado "anotacoes"; aqui ficam os metadados.';

create index if not exists anotacao_anexos_anotacao_idx
  on public.anotacao_anexos (anotacao_id, criado_em);

create index if not exists anotacao_anexos_aluno_idx
  on public.anotacao_anexos (aluno_id);

alter table public.anotacao_anexos enable row level security;

drop policy if exists "anotacao_anexos_self" on public.anotacao_anexos;
create policy "anotacao_anexos_self" on public.anotacao_anexos for all
  to authenticated
  using (aluno_id = auth.uid())
  with check (aluno_id = auth.uid());
