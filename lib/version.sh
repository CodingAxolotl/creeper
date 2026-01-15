#!/bin/bash

VERSION_URL="https://raw.githubusercontent.com/CodingAxolotl/creeper/refs/heads/main/version/latest.txt"
VERSION=$(curl -s "$VERSION_URL" | tr -d '\n')

if [ -z "$VERSION" ]; then
  echo "❌ Could not determine Creeper version."
  exit 1
fi

echo "🟢 Creeper version: $VERSION"
