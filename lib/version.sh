#!/bin/bash

VERSION_URL="https://raw.githubusercontent.com/CodingAxolotl/creeper/main/version/v2.txt"
VERSION=$(curl -s "$VERSION_URL" | tr -d '\n')

if [ -z "$VERSION" ]; then
  echo "❌ Could not fetch version."
  exit 1
fi

echo "🟢 Creeper version: $VERSION"
