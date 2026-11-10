#!/usr/bin/env bash
set -euo pipefail

# Run from the checkout containing this launcher.
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

# Capture files may not exist before the first run.
for capture in capture.hc22000 capture.pcap; do
    if [[ -f "$capture" ]]; then
        ls -lh -- "$capture"
    else
        printf 'Not found: %s\n' "$capture"
    fi
done

if ! command -v python3 >/dev/null 2>&1; then
    printf 'Python 3 is required. Install it before running this launcher.\n' >&2
    exit 1
fi

exec python3 WiFiCrackPy.py "$@"
