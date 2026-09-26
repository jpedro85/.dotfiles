#!/usr/bin/env bash
set -euo pipefail

PROFILE_DIR="${1:-}"

if [[ -z "$PROFILE_DIR" ]]; then
    PROFILE_DIR="$(find \
        "$HOME/.config/librewolf" \
        "$HOME/.mozilla/firefox" \
        -type f -name 'previous.jsonlz4' \
        -printf '%h\n' 2>/dev/null | head -n 1 || true)"
fi

if [[ -z "$PROFILE_DIR" ]]; then
    echo "Could not find previous.jsonlz4."
    echo
    echo "Usage:"
    echo "  $0 /path/to/librewolf/profile"
    exit 1
fi

SESSION_FILE="$PROFILE_DIR/sessionstore-backups/previous.jsonlz4"
URL_FILE="$HOME/librewolf-recovered-urls.txt"

echo "Using session:"
echo "  $SESSION_FILE"
echo

uv run --with lz4 python - "$SESSION_FILE" "$URL_FILE" <<'PY'
import sys
import struct
import json
import lz4.block
from pathlib import Path

session_file = Path(sys.argv[1])
url_file = Path(sys.argv[2])

data = session_file.read_bytes()

if data[:8] != b"mozLz40\0":
    raise SystemExit("ERROR: Not a Mozilla JSONLZ4 file.")

size = struct.unpack("<I", data[8:12])[0]
raw = lz4.block.decompress(data[12:], uncompressed_size=size)
session = json.loads(raw)

urls = []

for wi, window in enumerate(session.get("windows", []), 1):
    print(f"\n=== Window {wi} ===")

    for ti, tab in enumerate(window.get("tabs", []), 1):
        entries = tab.get("entries", [])

        if not entries:
            print(f"{ti}. [no URL]")
            continue

        url = entries[-1].get("url")

        if url:
            urls.append(url)
            print(f"{ti}. {url}")
        else:
            print(f"{ti}. [no URL]")

url_file.write_text(
    "\n".join(urls) + ("\n" if urls else ""),
    encoding="utf-8"
)

print(f"\nSaved {len(urls)} URLs to:")
print(f"  {url_file}")
PY

echo
echo "Recovered URLs are in:"
echo "  $URL_FILE"
echo
echo "To reopen them:"
echo "  xargs -d '\n' librewolf < '$URL_FILE'"
