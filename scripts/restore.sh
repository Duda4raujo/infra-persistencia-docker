#!/bin/bash
set -euo pipefail

VOLUME_NAME="${1:-mysql-prod-data}"
BACKUP_FILE="${2:-backups/mysql-backup.tar.gz}"

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Arquivo de backup nao encontrado: $BACKUP_FILE"
  exit 1
fi

docker volume inspect "$VOLUME_NAME" >/dev/null 2>&1 || docker volume create "$VOLUME_NAME" >/dev/null

docker run --rm \
  -v "${VOLUME_NAME}:/data" \
  -v "$(pwd):/workspace" \
  ubuntu:22.04 \
  bash -c "rm -rf /data/* /data/.[!.]* /data/..?* 2>/dev/null || true; tar xzf \"/workspace/${BACKUP_FILE}\" -C /data"

echo "Backup restaurado com sucesso no volume: ${VOLUME_NAME}"
