#!/bin/bash
set -euo pipefail

APP_NAME="Aura"
GITHUB_REPO="daboonucleardaboo68/Aura"

echo "🌌 Starting Aura Installer..."

# Create the folders on the Mac
mkdir -p ~/Aura/Scripts
mkdir -p ~/Aura/AutoExec

echo "✅ Created directories at ~/Aura"
echo "⚠️ Note: To run the app, you need to build the project using 'npm install && npm start' in your project folder."
