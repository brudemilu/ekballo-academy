#!/usr/bin/env bash
# Atalho diário para gerar os áudios "overview em podcast" das aulas.
#
# Carrega as credenciais do .env.local (GEMINI_API_KEY + SUPABASE_SERVICE_ROLE_KEY
# + NEXT_PUBLIC_SUPABASE_URL) e roda o gerador. O script é idempotente: pula as
# aulas que já têm áudio e só faz as que faltam.
#
# No free tier do Gemini o TTS é limitado a ~10 áudios/dia; quando bate o teto,
# o script para limpo avisando para rodar de novo amanhã.
#
#   ./scripts/gerar-audios.sh                              # os 3 cursos, o que faltar
#   ./scripts/gerar-audios.sh --slug=seja-um-lider-de-verdade
#   ./scripts/gerar-audios.sh --force                      # regera tudo
set -euo pipefail
cd "$(dirname "$0")/.."
exec node --env-file=.env.local scripts/gerar-audios.mjs "$@"
