#!/bin/zsh
# Gera a leitura em áudio (audiolivro) apontando para o Supabase DE PRODUÇÃO
# (o box no Contabo), e não para o Supabase Cloud antigo do .env.local.
#
# POR QUE ISSO EXISTE: o .env.local ainda aponta para o projeto Cloud
# `yasfxwqomvhmxxqnunat`, que ficou congelado no snapshot de julho/2026 quando
# a plataforma migrou para o self-hosted. Rodar o gerar-leituras.mjs direto
# grava o áudio num banco que ninguém lê. Este wrapper carrega o .env.box
# ANTES, e como o gerar-leituras.mjs só preenche variável ainda indefinida,
# o box vence.
#
# Uso (aceita os mesmos argumentos do gerar-leituras.mjs):
#   scripts/gerar-leituras-box.sh --slug=o-pastor-imperfeito --force
#   scripts/gerar-leituras-box.sh --slug=o-pastor-imperfeito --aula=1 --force
#
# Requer: .env.box na raiz (SUPABASE_URL + SUPABASE_SERVICE_ROLE_KEY do box).
# Recriar com:
#   ssh -i ~/.ssh/ekballo_migration_ed25519 root@<IP-DO-BOX> \
#     "grep -E '^(NEXT_PUBLIC_SUPABASE_URL|SUPABASE_SERVICE_ROLE_KEY)=' /opt/ekballo-app/.env" \
#     > .env.box && chmod 600 .env.box

set -eu

DIR="${0:A:h}/.."
cd "$DIR"

if [[ ! -f .env.box ]]; then
  echo "ERRO: .env.box não existe. Veja o cabeçalho deste script." >&2
  exit 1
fi

set -a
source .env.box
set +a
export SUPABASE_URL="${SUPABASE_URL:-$NEXT_PUBLIC_SUPABASE_URL}"

# Voz da leitura. Thalita é nativa pt-BR e da geração nova ("multilingual"),
# escolhida pelo Bruno em 03/09/2026 por soar como conversa, e não como
# locutor lendo. A anterior era pt-BR-AntonioNeural.
export TTS_BACKEND="${TTS_BACKEND:-edge}"
export EDGE_VOICE="${EDGE_VOICE:-pt-BR-ThalitaMultilingualNeural}"
export EDGE_RATE="${EDGE_RATE:--4%}"

echo "Banco : $SUPABASE_URL"
echo "Voz   : $EDGE_VOICE ($TTS_BACKEND, ritmo $EDGE_RATE)"
echo

exec /usr/local/bin/node scripts/gerar-leituras.mjs "$@"
