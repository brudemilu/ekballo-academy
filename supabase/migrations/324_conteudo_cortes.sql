-- Copiloto de conteúdo (issue #189): cortes de pregação, fase 1.
--
-- Cada linha é a análise de um vídeo do YouTube: a transcrição com os tempos
-- e os melhores momentos que a IA apontou. O processamento leva um ou dois
-- minutos e roda em segundo plano, por isso a linha nasce "processando" e a
-- tela acompanha por `status`/`etapa`.
--
-- A transcrição fica guardada (uns 60 kB por hora de áudio): a fase 2 (corte
-- automático com legenda) vai precisar dela, e o pastor a usa para ler o
-- trecho antes de abrir o vídeo. O áudio em si não é guardado.

create table if not exists public.conteudo_cortes (
  id          uuid primary key default gen_random_uuid(),
  video_id    text not null check (char_length(video_id) = 11),
  titulo      text not null default '',
  duracao_seg integer not null default 0,
  status      text not null default 'processando'
                check (status in ('processando', 'pronto', 'erro')),
  etapa       text not null default '',
  erro        text,
  transcricao jsonb not null default '[]'::jsonb,
  momentos    jsonb not null default '[]'::jsonb,
  criado_em   timestamptz not null default now(),
  atualizado_em timestamptz not null default now()
);

create index if not exists idx_conteudo_cortes_criado
  on public.conteudo_cortes (criado_em desc);

alter table public.conteudo_cortes enable row level security;

drop policy if exists "admin full access conteudo cortes" on public.conteudo_cortes;
create policy "admin full access conteudo cortes"
  on public.conteudo_cortes
  for all
  to authenticated
  using (public.is_admin(auth.uid()))
  with check (public.is_admin(auth.uid()));
