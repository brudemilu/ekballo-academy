#!/usr/bin/env bash
set -euo pipefail

BASE=/opt/ekballo-supabase
BACKUPS="$BASE/backups"
STAMP=$(date +%Y%m%d-%H%M%S)
DB_CONTAINER=$(docker ps \
  --filter label=com.docker.swarm.service.name=ekballo-supabase_db \
  --format '{{.ID}}' | head -n 1)

if [[ -z "$DB_CONTAINER" ]]; then
  echo "[$(date '+%F %T')] erro: container do banco não encontrado" >&2
  exit 1
fi

mkdir -p "$BACKUPS"
umask 077

docker exec "$DB_CONTAINER" pg_dump -U postgres -d postgres -Fc \
  > "$BACKUPS/db-$STAMP.dump.tmp"
mv "$BACKUPS/db-$STAMP.dump.tmp" "$BACKUPS/db-$STAMP.dump"

docker exec "$DB_CONTAINER" pg_dumpall -U postgres --roles-only \
  > "$BACKUPS/roles-$STAMP.sql.tmp"
mv "$BACKUPS/roles-$STAMP.sql.tmp" "$BACKUPS/roles-$STAMP.sql"

tar -czf "$BACKUPS/config-$STAMP.tar.gz.tmp" \
  -C "$BASE" \
  .env docker-stack.yml swarm-deploy.json configure-target-database.sql \
  volumes/functions
mv "$BACKUPS/config-$STAMP.tar.gz.tmp" "$BACKUPS/config-$STAMP.tar.gz"

# O Storage é grande. Faz uma cópia completa semanal, aos domingos.
if [[ "$(date +%u)" == "7" && -d "$BASE/volumes/storage" ]]; then
  tar -czf "$BACKUPS/storage-$STAMP.tar.gz.tmp" \
    -C "$BASE/volumes" storage
  mv "$BACKUPS/storage-$STAMP.tar.gz.tmp" "$BACKUPS/storage-$STAMP.tar.gz"
fi

find "$BACKUPS" -type f -name 'db-*.dump' -mtime +14 -delete
find "$BACKUPS" -type f -name 'roles-*.sql' -mtime +14 -delete
find "$BACKUPS" -type f -name 'config-*.tar.gz' -mtime +14 -delete
find "$BACKUPS" -type f -name 'storage-*.tar.gz' -mtime +21 -delete
find "$BACKUPS" -type f -name '*.tmp' -mtime +1 -delete

echo "[$(date '+%F %T')] backup $STAMP concluído: db=$(du -h "$BACKUPS/db-$STAMP.dump" | cut -f1)"
