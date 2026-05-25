#!/bin/bash
set -euo pipefail

VOLUME_NAME="${1:-mysql-prod-data}"
BACKUP_DIR="${BACKUP_DIR:-backups}"
TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"
BACKUP_NAME="${VOLUME_NAME}_${TIMESTAMP}.tar.gz"
LOG_FILE="${BACKUP_DIR}/backup.log"

mkdir -p "$BACKUP_DIR"

docker run --rm \
  -v "${VOLUME_NAME}:/data:ro" \
  -v "$(pwd)/${BACKUP_DIR}:/backup" \
  ubuntu:22.04 \
  tar czf "/backup/${BACKUP_NAME}" -C /data .

echo "$(date '+%Y-%m-%d %H:%M:%S') Backup criado com sucesso: ${BACKUP_DIR}/${BACKUP_NAME}" | tee -a "$LOG_FILE"
