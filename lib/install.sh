#!/bin/bash

IMG="$1"

if [[ ! "$IMG" =~ ^img[0-9]+$ ]]; then
  echo "❌ Usage: creeper install img<number>"
  exit 1
fi

URL="https://raw.githubusercontent.com/YOUR_USERNAME/creeper/main/images/$IMG.png"
DEST="$HOME/Downloads/$IMG.png"

echo "⬇️ Downloading $IMG.png..."
curl -f -L "$URL" -o "$DEST"

if [ $? -eq 0 ]; then
  echo "✅ Saved to Downloads: $IMG.png"
else
  echo "❌ Image not found."
fi
