#!/bin/bash
set -euo pipefail

APP_NAME="Aura"
INSTALL_DIR="/Applications"
GITHUB_REPO="daboonucleardaboo68/Aura"
API_URL="https://api.github.com/repos/$GITHUB_REPO/releases/latest"

detect_arch() {
  case "$(uname -m)" in
    arm64)   echo "arm64" ;;
    x86_64)  echo "x64" ;;
    *) echo "Unsupported CPU"; exit 1 ;;
  esac
}

main() {
  ARCH=$(detect_arch)
  echo "Checking for latest Aura release ($ARCH)..."
  
  # This finds the download link in your GitHub Release
  DOWNLOAD_URL=$(curl -s "$API_URL" | grep "browser_download_url" | grep -i "$ARCH" | cut -d '"' -f 4)

  if [[ -z "$DOWNLOAD_URL" ]]; then
    echo "❌ Error: No release found for $ARCH. Did you upload the .zip to GitHub Releases?"
    exit 1
  fi

  echo "Downloading Aura..."
  curl -L "$DOWNLOAD_URL" -o "Aura.zip"
  unzip -q "Aura.zip" -d "$INSTALL_DIR"
  rm "Aura.zip"
  
  echo "✅ Aura installed successfully in /Applications!"
}

main
