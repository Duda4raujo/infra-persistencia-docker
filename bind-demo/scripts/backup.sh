#!/bin/bash

DATA=$(date +%y-%m-%d_%H-%M-%S)

docker run --rm \
-v mysql-prod-data:/data \
-v $(pwd):/backup \
ubuntu \
tar czf /backup/backup_$DATA.tar.gz -C /data.

echo "Backup criado com sucesso: backup_$DATA.tar.gz"
