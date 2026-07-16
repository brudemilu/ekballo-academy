-- 202: Restaura a policy de leitura do bucket privado `materiais-cursos`.
--
-- Contexto: na migração para o self-hosted (Contabo, jul/2026) os dados vieram,
-- mas as RLS policies de `storage.objects` NÃO foram recriadas. O bucket
-- `materiais-cursos` é privado (public=false) e ficou com RLS ligado e ZERO
-- policies — então o app (que assina URLs como papel `authenticated`, não
-- service_role) não conseguia mais criar signed URLs. Efeito: os players de
-- áudio de leitura/narração (`aulas.audio_leitura_url`), os áudios conversa
-- (`aulas.audio_url`) e os PDFs de material (`aulas.material_url`) sumiam de
-- TODOS os capítulos/livros, mesmo com arquivos e metadados presentes.
--
-- O controle de acesso real acontece na camada da aplicação (checagem de
-- matrícula na página antes de gerar a signed URL) e as URLs são curtas (6h),
-- então uma leitura em nível de bucket para `authenticated` é o comportamento
-- de antes da migração. Idempotente.

DROP POLICY IF EXISTS "materiais_cursos_authenticated_read" ON storage.objects;

CREATE POLICY "materiais_cursos_authenticated_read"
  ON storage.objects
  FOR SELECT
  TO authenticated
  USING (bucket_id = 'materiais-cursos');
