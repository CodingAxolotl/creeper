#!/bin/bash

LOCAL_VERSION_FILE="$HOME/.creeper_version.txt"
REMOTE_VERSION="v1"

if [ ! -f "$LOCAL_VERSION_FILE" ]; then
  echo "⚠️ Local version not found. Creating version file..."
  echo "v1" > "$LOCAL_VERSION_FILE"
fi

LOCAL_VERSION=$(cat "$LOCAL_VERSION_FILE")

if [ "$REMOTE_VERSION" = "$LOCAL_VERSION" ]; then
  echo "✅ You are on the latest version ($LOCAL_VERSION)"
else
  echo "⬆️ Updating Creeper from $LOCAL_VERSION → $REMOTE_VERSION"
  echo "$REMOTE_VERSION" > "$LOCAL_VERSION_FILE"
  echo "✅ Update complete!"
fi
