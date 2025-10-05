#!/bin/bash

BACKUP_NAME="Mac_Backup_$(date +%Y-%m-%d_%H-%M-%S).zip"
BACKUP_PATH=~/Desktop/$BACKUP_NAME

echo "[*] 백업을 시작합니다. 이 작업은 몇 분 정도 걸릴 수 있습니다..."

zip -r "$BACKUP_PATH" ~ \
  -x "*/Library/*" \
  -x "*/Applications/*" \
  -x "*/Downloads/*" \
  -x "*/Movies/*" \
  -x "*/Music/*" \
  -x "*.Trash/*" \
  -x "*.cache/*" \
  -x "*.log" \
  -x "*/.Trash/*" \
  -x "*/.zsh_sessions/*" \
  -x "*/.DS_Store"

echo "[+] 백업 완료! 압축 파일 위치: $BACKUP_PATH"
