-- =============================================================
-- Adiciona aulas.audio_url — caminho (no bucket privado `materiais-cursos`,
-- pasta `audios/`) do "overview em podcast" gerado por IA para a aula, no
-- estilo NotebookLM (diálogo de 2 vozes via Gemini TTS).
--
-- O acesso é mediado por signed URL gerada server-side em lib/db.ts →
-- getAudioUrl() (validade longa o bastante para a audição). Quando NULL,
-- a página simplesmente não mostra o player.
--
-- Os arquivos são produzidos offline por scripts/gerar-audios.mjs e
-- enviados ao Storage; este script também grava o audio_url de cada aula.
-- =============================================================

alter table public.aulas
  add column if not exists audio_url text;

comment on column public.aulas.audio_url is
  'Caminho no bucket materiais-cursos (audios/<id>.wav) do overview em áudio da aula; NULL = sem áudio.';
