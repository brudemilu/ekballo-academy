-- =============================================================
-- Adiciona aulas.audio_leitura_url — caminho (no bucket privado
-- `materiais-cursos`, pasta `audios-leitura/`) da LEITURA LITERAL da aula:
-- uma narração, em voz única realista (Gemini TTS), do próprio texto de
-- `conteudo` — palavra por palavra, sem reconto.
--
-- NÃO confundir com aulas.audio_url (055), que é o "overview em podcast"
-- (diálogo de 2 vozes que RESUME a aula). Aqui é a leitura do que está
-- escrito, para quem prefere ouvir a ler.
--
-- O acesso é mediado por signed URL gerada server-side em lib/db.ts →
-- getAudioUrl() (mesmo esquema do audio_url). Quando NULL, a página
-- simplesmente não mostra o player de leitura.
--
-- Os arquivos são produzidos offline por scripts/gerar-leituras.mjs e
-- enviados ao Storage; aquele script também grava o audio_leitura_url.
-- =============================================================

alter table public.aulas
  add column if not exists audio_leitura_url text;

comment on column public.aulas.audio_leitura_url is
  'Caminho no bucket materiais-cursos (audios-leitura/<id>.wav) da leitura literal (voz única) do conteudo da aula; NULL = sem leitura.';
