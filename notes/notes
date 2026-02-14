# OverTheWire: Bandit Level Walkthrough
**Engineer:** Odoworitse

**Objective:** Mastering Linux CLI, security concepts, and DevOps fundamentals.

---

## Level 0: The Entry
* **Goal:** Connect to the game server via SSH.
* **Command:** `ssh bandit0@bandit.labs.overthewire.org -p 2220`
* **Password:** `bandit0`
* **Key Concept:** SSH (Secure Shell) is the standard for managing remote Linux servers.

## Level 1: The Dash Filename
* **Goal:** Read a file named `-` in the home directory.
* **The Problem:** Commands like `cat -` fail because the dash is interpreted as an option flag.
* **The Fix:** Use a relative path to specify the file.
* **Command:** `cat ./-`
* **Key Concept:** Relative paths (`./`) are essential when dealing with "tricky" filenames in automation scripts.

## Level 2: Spaces in Filenames
* **Goal:** Read a file named `spaces in this filename`.
* **The Fix:** Use double quotes or backslash escaping.
* **Command:** `cat "spaces in this filename"` or `cat spaces\ in\ this\ filename`
* **Key Concept:** Always quote variables in shell scripts to prevent spaces from breaking the logic.

## Level 3: Hidden Files
* **Goal:** Find a hidden file inside the `inhere` directory.
* **The Problem:** Standard `ls` hides files starting with a dot `.`.
* **The Fix:** Use the "all" flag.
* **Command:** `ls -a` inside the directory.
* **Key Concept:** Configuration files (like `.env` or `.dockerignore`) are often hidden; `ls -la` is the go-to command for engineers.

## Level 4: File Type Identification
* **Goal:** Find the only human-readable (ASCII) file in a folder of binary data.
* **The Tool:** The `file` command.
* **Command:** `file ./*`
* **Key Concept:** ASCII stands for American Standard Code for Information Interchange. Distinguishing between text (ASCII) and binary data is crucial for debugging corrupted artifacts.

## Level 5: Precise Searching
* **Goal:** Find a file with specific metadata: 1033 bytes, ASCII, and not executable.
* **The Tool:** The `find` command.
* **Command:** `find . -type f -size 1033c ! -executable`
* **Key Concept:** `find` is a power tool for system maintenance (e.g., finding large logs or specific configuration files).

## Level 6: System-Wide Search & Redirection
* **Goal:** Find a file owned by user `bandit7` and group `bandit6` across the entire server.
* **The Problem:** Searching the root (`/`) generates many "Permission Denied" errors.
* **The Fix:** Redirect Standard Error (stream 2) to the "black hole" (`/dev/null`).
* **Command:** `find / -user bandit7 -group bandit6 -size 33c 2>/dev/null`
* **Key Concept:** Standard Streams (STDIN 0, STDOUT 1, STDERR 2). Redirecting errors keeps your logs clean.

## Level 7: Data Filtering
* **Goal:** Find the password next to the word "millionth" inside a massive file.
* **The Tool:** `grep`.
* **Command:** `grep "millionth" data.txt`
* **Key Concept:** `grep` is the industry standard for searching through gigabytes of logs to find specific errors or events.

---
## Level 8: Finding Unique Data
* **Goal:** Find the only line in `data.txt` that occurs exactly once.
* **The Problem:** The `uniq` command only detects duplicates if they are adjacent (next to each other).
* **The Fix:** Sort the file first, then use the unique flag.
* **Command:** `sort data.txt | uniq -u`
* **Key Concept:** Pipelines (`|`). By chaining `sort` and `uniq`, we can perform complex data analysis on logs.

## Level 9: Human-Readable Strings
* **Goal:** Find a password hidden inside a binary (non-text) file.
* **The Problem:** Using `cat` on a binary file results in terminal "garbage" and unreadable symbols.
* **The Fix:** Use `strings` to filter out everything except printable text.
* **Command:** `strings data.txt | grep "=="`
* **Key Concept:** Secret Scanning. `strings` is used to find hardcoded passwords or keys hidden inside compiled programs.

## Level 10: Base64 Decoding
* **Goal:** Decode the password stored in Base64 format.
* **The Problem:** The data is encoded (e.g., `VGhlIHBhc3N3b3Jk...`) and cannot be read directly.
* **The Fix:** Use the system's native decoder.
* **Command:** `base64 -d data.txt`
* **Key Concept:** Base64 is NOT encryption; it is encoding. In DevOps, Kubernetes Secrets and Cloud-init scripts use Base64 constantly.

---
## Level 11: ROT13 Cipher
* **Goal:** Decode a password where letters are rotated by 13 positions.
* **The Tool:** `tr` (Translate).
* **Command:** `cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'`
* **Key Concept:** Substitution Ciphers. While not used for real security today, the `tr` command is essential in DevOps for "sanitizing" data (e.g., converting lowercase to uppercase or stripping special characters).

## Level 12: The "Russian Doll" (Nested Compression)
* **Goal:** Extract a password hidden under multiple layers of different compression formats.
* **The Tools:** `xxd`, `file`, `gzip`, `bzip2`, `tar`.
* **The Process:** 1. Reverse the hexdump: `xxd -r data.txt > data.bin`
    2. Repeatedly check the type using `file`.
    3. Decompress accordingly until reaching ASCII text.
* **Key Concept:** Magic Bytes. File extensions can be changed or faked, but the `file` command reads the internal data structure to identify the true file type.

## Level 13: SSH Key Authentication
* **Goal:** Log into the next level using a private SSH key instead of a password.
* **The Tool:** `ssh` with the `-i` flag.
* **Command:** `ssh -i sshkey.private bandit14@localhost -p 2220`
* **Key Concept:** Public Key Infrastructure (PKI). Using SSH keys is the industry standard for DevOps automation and server hardening.

## Level 14: Interacting with Local Services
* **Goal:** Send the current password to a service listening on port 30000.
* **The Tool:** `nc` (Netcat).
* **Command:** `cat /etc/bandit_pass/bandit14 | nc localhost 30000`
* **Key Concept:** Ports and Sockets. Services often run on internal ports (localhost) to communicate between different parts of an application.

## Level 15: SSL/TLS Encrypted Communication
* **Goal:** Send the password to a secure port (30001) that requires encryption.
* **The Tool:** `openssl s_client`.
* **Command:** `openssl s_client -connect localhost:30001`
* **Key Concept:** Encryption in Transit. In production, you never send sensitive data over plain text. `openssl` allows you to debug and verify secure handshakes.

