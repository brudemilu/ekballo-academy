#!/usr/bin/env bash
# Aplica uma migration no banco vivo (box Contabo) — o passo 4 do fluxo de subir livro.
#
# O box não tem tabela de controle de migrations: mergear no master NÃO aplica nada.
# Depois de mergear, rode este script; depois confira com scripts/auditar-migrations-box.sh.
#
# Uso: scripts/aplicar-migration-box.sh supabase/migrations/282_curso_imitacao_de_cristo.sql

set -euo pipefail

ARQ="${1:?uso: $0 <caminho/da/migration.sql>}"
[ -f "$ARQ" ] || { echo "arquivo não encontrado: $ARQ" >&2; exit 1; }

BOX="${EKBALLO_BOX:-root@158.220.126.74}"
CHAVE="${EKBALLO_SSH_KEY:-$HOME/.ssh/ekballo_migration_ed25519}"
BASE=$(basename "$ARQ")

echo "→ enviando $BASE para o box"
scp -i "$CHAVE" -o ConnectTimeout=20 "$ARQ" "$BOX:/tmp/$BASE"

echo "→ aplicando em ekballo-supabase_db (ON_ERROR_STOP)"
ssh -i "$CHAVE" -o ConnectTimeout=20 "$BOX" \
  "CID=\$(docker ps -q -f name=ekballo-supabase_db | head -1); \
   docker exec -i \$CID psql -U postgres -d postgres -v ON_ERROR_STOP=1 < /tmp/$BASE"

echo "→ aplicada. Conferindo drift:"
"$(dirname "${BASH_SOURCE[0]}")/auditar-migrations-box.sh"
