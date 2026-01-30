#!/bin/bash
# One-time setup: connects your GitHub account so the Share button works.
# Just run: ./setup.sh

TOKEN=$(gh auth token 2>/dev/null)
if [ -z "$TOKEN" ]; then
  echo "GitHub CLI not logged in. Run: gh auth login"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
URL="file://${SCRIPT_DIR}/auction.html?_token=${TOKEN}"

echo "Opening Auction Slides and connecting your GitHub account..."
xdg-open "$URL" 2>/dev/null || open "$URL" 2>/dev/null || echo "Open this in your browser: $URL"
echo "Done! The Share button will now work."
