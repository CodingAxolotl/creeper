#!/bin/bash

COUNT="$1"

if ! [[ "$COUNT" =~ ^[0-9]+$ ]]; then
  echo "❌ Usage: creeper explore <number>"
  exit 1
fi

IMAGES=(img1 img2 img3 img4 img5)
SELECTED=($(shuf -n "$COUNT" -e "${IMAGES[@]}"))

TOTAL_SIZE=0

echo "🔍 Exploring images:"
for IMG in "${SELECTED[@]}"; do
  
URL="https://raw.githubusercontent.com/codingaxolotl/creeper/main/images/$IMG.png"
  SIZE=$(curl -sI "$URL" | grep -i content-length | awk '{print $2}' | tr 
-d '\r')
  SIZE_KB=$((SIZE / 1024))
  TOTAL_SIZE=$((TOTAL_SIZE + SIZE))
  echo "• $IMG.png — ${SIZE_KB} KB"
done

TOTAL_KB=$((TOTAL_SIZE / 1024))
echo "📏 Total size: ${TOTAL_KB} KB"

read -p "❓ Download these images? (yes/no): " ANSWER

if [[ "$ANSWER" != "yes" ]]; then
  echo "❌ Cancelled."
  exit 0
fi

for IMG in "${SELECTED[@]}"; do
  curl -sL 
"https://raw.githubusercontent.com/codingaxolotl/creeper/main/images/$IMG.png" 
\
    -o "$HOME/Downloads/$IMG.png"
done

echo "✅ Download complete."

