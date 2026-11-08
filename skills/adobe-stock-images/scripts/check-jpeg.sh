#!/bin/bash
set -euo pipefail

if [[ $# -ne 1 || ! -f ${1:-} ]]; then
  echo "Usage: $0 IMAGE.jpg" >&2
  exit 2
fi

file=$1
if [[ "$file" != /* ]]; then
  file="$PWD/$file"
fi
metadata=$(sips -g format -g profile -g pixelWidth -g pixelHeight "$file")
format=$(awk '/^  format: / { print $2 }' <<< "$metadata")
profile=$(sed -n 's/^  profile: //p' <<< "$metadata")
width=$(awk '/^  pixelWidth: / { print $2 }' <<< "$metadata")
height=$(awk '/^  pixelHeight: / { print $2 }' <<< "$metadata")
bytes=$(wc -c < "$file")
bytes=$((bytes + 0))

if [[ "$format" != jpeg || ! "$profile" =~ ^[sS][rR][gG][bB]([[:space:]]|$) ||
      ! "$width" =~ ^[0-9]+$ || ! "$height" =~ ^[0-9]+$ ]]; then
  echo "FAIL: expected a JPEG with an embedded sRGB profile and valid dimensions." >&2
  exit 1
fi

pixels=$((width * height))
if (( pixels < 4000000 || pixels > 100000000 || bytes > 45000000 )); then
  printf 'FAIL: %s × %s, %s pixels, %s bytes\n' "$width" "$height" "$pixels" "$bytes" >&2
  exit 1
fi

printf 'PASS: %s × %s, %s pixels, %s bytes, JPEG, %s\n' "$width" "$height" "$pixels" "$bytes" "$profile"
