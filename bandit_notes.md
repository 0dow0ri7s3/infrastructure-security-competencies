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
