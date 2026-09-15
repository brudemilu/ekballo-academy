#!/usr/bin/env bash
# Compara as migrations de curso do repo com o que existe no banco vivo (box Contabo).
#
# Por que existe: o box NÃO tem supabase_migrations.schema_migrations — as migrations
# são aplicadas à mão via psql. Uma migration pode ser mergeada no master e nunca
# chegar ao banco, sem nenhum sinal. Foi o que aconteceu com 282_curso_imitacao_de_cristo
# (mergeada no PR #92, ausente do banco por semanas).
#
# Uso: scripts/auditar-migrations-box.sh
# Saída: lista de slugs presentes em migrations mas ausentes do banco. Silêncio = tudo em dia.

set -euo pipefail

BOX="${EKBALLO_BOX:-root@158.220.126.74}"
CHAVE="${EKBALLO_SSH_KEY:-$HOME/.ssh/ekballo_migration_ed25519}"
RAIZ="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# Slugs declarados nas migrations de curso do repo.
grep -ohE "where slug = '[a-z0-9-]+'" "$RAIZ"/supabase/migrations/*_curso_*.sql \
  | sed -E "s/.*'([a-z0-9-]+)'.*/\1/" | sort -u > "$tmp/repo.txt"

# Slugs que existem de fato no banco vivo.
ssh -i "$CHAVE" -o ConnectTimeout=20 "$BOX" \
  "CID=\$(docker ps -q -f name=ekballo-supabase_db | head -1); \
   docker exec -i \$CID psql -U postgres -d postgres -At -c 'select slug from cursos'" \
  | sort -u > "$tmp/box.txt"

echo "migrations de curso no repo: $(wc -l < "$tmp/repo.txt")"
echo "cursos no banco vivo:        $(wc -l < "$tmp/box.txt")"
echo

drift=$(comm -23 "$tmp/repo.txt" "$tmp/box.txt")
if [ -n "$drift" ]; then
  echo "DRIFT — mergeado no repo, ausente do banco:"
  echo "$drift" | sed 's/^/  - /'
  echo
  echo "Aplicar com: scripts/aplicar-migration-box.sh supabase/migrations/NNN_curso_<slug>.sql"
  exit 1
fi

echo "OK — toda migration de curso do repo está no banco."
