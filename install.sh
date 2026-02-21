#!/bin/bash
set -euo pipefail

APP_NAME="Aura"
GITHUB_REPO="daboonucleardaboo68/Aura"
INSTALL_DIR="/Applications"

echo "🌌 Downloading Aura Application..."

# This command looks for the ZIP file in your GitHub Releases
DOWNLOAD_URL=$(curl -s "https://api.github.com/repos/$GITHUB_REPO/releases/latest" | grep "browser_download_url" | cut -d '"' -f 4)

if [ -z "$DOWNLOAD_URL" ]; then
    echo "❌ No app file found in GitHub Releases. Please upload Aura.zip to your release page!"
    exit 1
fi

curl -L "$DOWNLOAD_URL" -o "Aura.zip"
unzip -o "Aura.zip" -d "$INSTALL_DIR"
rm "Aura.zip"

echo "✅ Aura is now in your Applications folder!"
