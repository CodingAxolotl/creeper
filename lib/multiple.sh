#!/bin/bash

IMAGES=("$@")

if [ "${#IMAGES[@]}" -eq 0 ]; then
  echo "❌ Usage: creeper multiple img1 img2 ..."
  exit 1
fi

TOTAL_SIZE=0
VALID_IMAGES=()

for IMG in "${IMAGES[@]}"; do
  if [[ "$IMG" =~ ^img[1-5]$ ]]; then
    
URL="https://raw.githubusercontent.com/codingaxolotl/creeper/main/images/$IMG.png"
    SIZE=$(curl -sI "$URL" | grep -i content-length | awk '{print $2}' | 
tr -d '\r')
    TOTAL_SIZE=$((TOTAL_SIZE + SIZE))
    VALID_IMAGES+=("$IMG")
  fi
done

TOTAL_KB=$((TOTAL_SIZE / 1024))

echo "📦 Images: ${VALID_IMAGES[*]}"
echo "📏 Total size: ${TOTAL_KB} KB"

read -p "❓ Download all? (yes/no): " ANSWER

if [[ "$ANSWER" != "yes" ]]; then
  echo "❌ Cancelled."
  exit 0
fi

for IMG in "${VALID_IMAGES[@]}"; do
  curl -sL 
"https://raw.githubusercontent.com/codingaxolotl/creeper/main/images/$IMG.png" 
\
    -o "$HOME/Downloads/$IMG.png"
done

echo "✅ All images downloaded."

