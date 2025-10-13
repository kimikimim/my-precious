# my-precious

**Collection of CTF / red-team tools and proof-of-concept scripts (collected materials).**

> ⚠️ **Safety & Legal Notice**  
> This repository contains offensive / dual-use tools and proof-of-concept (PoC) code (web shells, reverse-shell payloads, SSRF/token/flag hunters, upload payloads, automation scripts, etc.). These files can be used to compromise systems if executed on targets.  
> **Do not run these tools on systems you do not own or have explicit permission to test.** Use only in isolated environments (air-gapped labs, disposable VMs, or authorized CTF platforms). The author and contributors are not responsible for misuse.

---

## About / Purpose

This repository is an archive of scripts, payloads and utility tools used during CTFs, penetration testing practice and red-team exercises. It is intended for:

- Learning and research in controlled/safe environments.  
- Reproducing CTF scenarios for study and practice.  
- Archiving PoC snippets, payload variations and automation helpers used in past exercises.

> **Important:** Some files in this repository were collected from public sources, other people, or CTF events and may not be authored by the repository owner. See the *Source & Attribution* section below.

---

## Source & Attribution (Important)

- This repo is a **collection** of items. Not all files are original work by the repository owner.  
- Look inside each file for header comments (e.g., `__author__`, `__version__`, or other attribution). If a file lacks attribution, treat it as *collected / unknown origin*.  
- If you are the original author of a file and prefer it removed or attributed differently, please open an issue or send a PR. Sensitive items (accidental credentials, PII, etc.) will be removed on request.

Suggested per-file label (optional):  
`Author: unknown/collected` — replace with `Author: <your name>` if you authored it.

---

## High-level contents (non-exhaustive, intentionally non-actionable)

> The following is a concise overview. For safety reasons the descriptions avoid exploitation steps or execution guidance.

- `*.php`, `*.phtml` — small server-side PoCs, upload probes, simple web shell variants (for testing upload/validation behaviors).  
- `*.sh` — automation scripts for scanning, uploading, or repetitive CTF tasks.  
- `*.py` — Python utilities (SSRF/token scanners, recon helpers, parsers).  
- `*.txt`, `*.json` — supporting lists, caches or notes.  
- `*.yara`, `*.yml` — detection rules or config fragments used in analysis.  
- `misc payload variants` — same payloads with different names/extensions to test filtering.

**Example filenames & short (non-actionable) notes**  
(Replace or extend with your exact file list and attribution.)

- `php-reverse-shell.php` — demonstration reverse-shell payload (dangerous if run).  
- `upload_configpeek.php` / `upload_configpeek.phtml` — upload-testing variants (used to evaluate upload handling).  
- `ssrf_flag_hunter.py` — script to probe internal endpoints (for reconnaissance in lab).  
- `token_hunter.sh` — helper to search/harvest tokens from accessible endpoints.  
- `myjson-transform.py`, `teeplus.py`, `ipaddress.py`, `vtsearch.py`, `pecheck.py` — assorted analysis/util scripts (parsers, JSON transformers, tee-like file saver, IP utilities, VirusTotal search helper, PE inspection tool).  
*(This list is only illustrative — please keep the repository's file list updated with your own descriptions and authorship.)*

---

## Safety & recommended usage

- **Do not** run code on production systems or systems you do not own.  
- Always **read the source code first** and understand what it does before running anything.  
- When you must run tools, use an isolated environment:
  - Disposable VM or container with **no** sensitive data or network access (air-gapped when possible).  
  - Create snapshots so you can revert or destroy the environment afterward.  
- Treat any discovered credentials, shells or collected data as sensitive — handle and wipe them responsibly.

---

## Suggested repository organization

- `bin/` — small executables or single-file PoCs.  
- `scripts/` — automation helpers and utility scripts.  
- `rules/` — YARA/signature rules or detection pieces.  
- `data/` — lists, caches and supporting files (no real secrets!).  
- `docs/` — notes, lab writeups and safe usage guidelines.  
- `safe/` — examples sanitized for public sharing (recommended).

---

## Contributing

1. Open an issue to discuss new files or changes.  
2. Submit a PR with:
   - File(s) and short description (non-actionable summary).  
   - Intended, non-malicious use-case and recommended safety environment.  
   - Prefer adding an `Author` and `Source` header to new files.  
3. The maintainers may reject contributions that appear designed for malicious usage or lack safety guidance.

---

## Disclaimer & License

This repository is provided for educational and defensive research only. The maintainers do not endorse illegal activity. By using these materials you accept full responsibility for your actions and must comply with applicable laws.

**License:** Specify a license you choose (e.g., `MIT`, `GPL-3.0`, or public domain). If you want, maintainers can recommend an appropriate license snippet.

---

## Contact / Reporting

If you find sensitive content that should not be public (accidental credentials, PII, etc.), please open an issue or contact the repository owner so we can safely remove it.
