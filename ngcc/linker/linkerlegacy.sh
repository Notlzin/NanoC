#!/usr/bin/env bash
# tools/nglink/link.sh - Fake linker in bash (folder illusion mode)
# Usage: ./link.sh out.nexe in1.no in2.no ...

set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Usage: $0 out.nexe in1.no [in2.no in3.no ...]"
    exit 1
fi

OUT="$1"
shift
INPUTS=( "$@" )

echo "ng-linker (Nano Linker) -- folder illusion"
echo

# read files
echo "part-1: reading obj files ..."
NANOTEXT_CONTENT=""
NANODATA_CONTENT=""
for f in "${INPUTS[@]}"; do
    if [ -f "$f" ]; then
    echo " - found objects: $f"
    # simple heuristic
    if grep -qE ".\nanodata" "$f"; then
        NANODATA_CONTENT="${NANODATA_CONTENT}"$'\n'"; from ${f}"$'\n'$(sed -n '1,800p' "$f")
    else
        NANOTEXT_CONTENT="${NANOTEXT_CONTENT}"$'\n'"; from ${f}"$'\n'$(sed -n '1,800p' "$f")
    fi
else
    echo " -missing (placeholder): $f"
    NANOTEXT_CONTENT="${NANOTEXT_CONTENT} $'\n'"; from ${f}"$'\n'; MISSING FILE"
    fi
done

echo
echo "part-2: collecting sections && symbols"
sleep 0.15
echo "[C]  -> .nanotext size: $(echo "$NANOTEXT_CONTENT" | wc -c) bytes (approximately)"
echo "[C]  -> .nanodata size: $(echo "$NANODATA_CONTENT" | wc -c) bytes (approximately)"
echo

# building a tiny header
mkdir -p "$(dirname "$OUT")"
echo "[W] Writing: $OUT"
{
    printf "ENTRY: main\n"
    printf "SECTIONS:\n"
    printf "  .nanotext @0x%08X (size 0x%08X) flags=exec|read\n" 0x80 "$(echo "$NANOTEXT_CONTENT" | wc -c)"
    printf "  .nanodata @0x%08X (size 0x%08X) flags=read\n" 0x80 "$(( $(echo "$NANOTEXT_CONTENT" | wc -c) + 0 ))"
    printf "\nPAYLOAD:\n"
    printf "--- .nanotext ---\n"
    # write nanotext - limit output size so file dont explode
    echo "$NANOTEXT_CONTENT" | sed -n '1,1200p'
    if [ "$(echo "$NANOTEXT_CONTENT" | wc -c)" -gt 1200 ]; then
        echo "[E] ... (truncated)"
        fi
    else
        echo "; (no nanotext)"
    fi
    printf "\n--- .nanodata ---\n"
    if [ -n "$NANODATA_CONTENT" ]; then
        echo "$NANODATA_CONTENT" | sed -n '1,400p'
        if [ "$(echo "$NANODATA_CONTENT" | wc -c)" -gt 400 ]; then
        echo "[T] ... (truncated)"
        fi
    else
        echo "; [E] (no nanodata)"
    fi
    printf "\nSYMBOLS: none\n"
} > "$OUT"

sleep 0.06
echo "[F] finished. output written to: $OUT"
echo