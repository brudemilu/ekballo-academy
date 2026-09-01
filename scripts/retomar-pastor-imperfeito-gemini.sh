#!/bin/zsh

set -u

PROJECT_DIR="/Users/brunofernandes/Projects/ekballo-academy"
MARKER="$PROJECT_DIR/scripts/leituras-geradas/.pastor-imperfeito-mesa-07-gemini-pronto"
LOG_FILE="$PROJECT_DIR/scripts/pastor-imperfeito-gemini.log"

# Depois que a aula for publicada, as execuções diárias viram no-op.
[[ -f "$MARKER" ]] && exit 0

RUN_LOG="$(mktemp -t ekballo-gemini-mesa07)"
trap 'rm -f "$RUN_LOG"' EXIT

cd "$PROJECT_DIR" || exit 1

TTS_BACKEND=gemini \
GEMINI_TTS_MODEL=gemini-3.1-flash-tts-preview \
GEMINI_TTS_FALLBACK_MODEL=gemini-2.5-flash-preview-tts \
VOZ_LEITURA=Sulafat \
LEITURA_MAX_CHARS=900 \
GEMINI_TTS_CONCURRENCY=1 \
/usr/local/bin/node scripts/gerar-leituras.mjs \
  --slug=o-pastor-imperfeito \
  --aula=7 \
  --force >"$RUN_LOG" 2>&1
STATUS=$?

{
  printf '\n[%s] Retomada Gemini Mesa 07\n' "$(date '+%Y-%m-%d %H:%M:%S')"
  cat "$RUN_LOG"
} >>"$LOG_FILE"

if grep -q 'geradas=1' "$RUN_LOG"; then
  touch "$MARKER"
fi

exit "$STATUS"
