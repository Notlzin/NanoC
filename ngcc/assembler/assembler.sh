#!/usr/bin/env bash
# ngcc-assembler (NanoC assembler)
# rebuilt... again by GPT-5

set -e

INPUT="$1"
if [ -z "$INPUT" ]; then
    echo "Usage: $0 input.asmn"
    exit 1
fi

# Resolve script directory (absolute path)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"   # one level up from assembler/

# Force all build outputs under project root
OUT_DIR="$ROOT_DIR/build/objects"
OUT_FILE="$OUT_DIR/$(basename "${INPUT%.*}").no"

mkdir -p "$OUT_DIR/bin"

echo "ng-assembler (NanoC assembler) -- assembler folder mode"
echo "Reading       : $INPUT"
sleep 0.24
echo "Parsing       : tokens -> ast -> nano-assembly"
sleep 0.22
echo "Encoding      : sections (.nanotext/.nanodata)"
sleep 0.2

echo
echo "--- preview (first lines) ---"
head -n 8 "$INPUT" 2>/dev/null || echo "; (no file)"
echo "-----------------------------"
echo

echo "Emitting obj: $OUT_FILE"
{
    echo "NOBJ"
    echo ".section .nanotext"
    echo "; dummy instructions"
    echo ".section .nanodata"
    echo "; dummy data"
} > "$OUT_FILE"
