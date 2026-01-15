#!/bin/bash

IMG="$1"

if [[ ! "$IMG" =~ ^img[1-5]$ ]]; then
  echo "❌ Usage: creeper install img1–img5"
  exit 1
fi

URL="https://raw.githubusercontent.com/codingaxolotl/creeper/main/images/$IMG.png"
DEST="$HOME/Downloads/$IMG.png"

SIZE=$(curl -sI "$URL" | grep -i content-length | awk '{print $2}' | tr -d 
'\r')
SIZE_KB=$((SIZE / 1024))

echo "📦 Image: $IMG.png"
echo "📏 Size: ${SIZE_KB} KB"

read -p "❓ Download this image? (yes/no): " ANSWER

if [[ "$ANSWER" != "yes" ]]; then
  echo "❌ Cancelled."
  exit 0
fi

curl -f -L "$URL" -o "$DEST"
echo "✅ Saved to Downloads."

