#!/usr/bin/env bash

# Colors
GREEN="\033[0;32m"
RED="\033[0;31m"
NC="\033[0m" # No Color

# Check input
if [[ -z "$1" ]]; then
  echo "Usage: $0 <input_file> [output_file]"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"

if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Error: File not found!"
  exit 1
fi

echo "Checking URLs..."

while read -r url; do
  status=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "$url")

  if [[ "$status" == "200" || "$status" == "301" || "$status" == "302" ]]; then
    echo -e "${GREEN}[ALIVE]${NC} $url -> $status"
    [[ -n "$OUTPUT_FILE" ]] && echo "[ALIVE] $url -> $status" >> "$OUTPUT_FILE"
  else
    echo -e "${RED}[DEAD]${NC}  $url -> $status"
  fi
done < "$INPUT_FILE"

echo "Done!"