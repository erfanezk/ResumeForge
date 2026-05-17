#!/usr/bin/env bash
set -e

REPO="erfanezk/resume-forge"
BRANCH="main"
SKILL_NAME="resume-forge"
SKILL_PATH="skills/resume-forge"
CLAUDE_SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo ""
echo "🔨 Installing resume-forge skill for Claude Code..."
echo ""

# Check required tools
if ! command -v curl &>/dev/null; then
  echo -e "${RED}Error: curl is required but not installed.${NC}"
  exit 1
fi

if ! command -v tar &>/dev/null; then
  echo -e "${RED}Error: tar is required but not installed.${NC}"
  exit 1
fi

# Create skills directory if it doesn't exist
mkdir -p "$CLAUDE_SKILLS_DIR"

DEST="$CLAUDE_SKILLS_DIR/$SKILL_NAME"

# Remove existing install if present
if [ -d "$DEST" ]; then
  echo -e "${YELLOW}⚠️  Existing installation found. Updating...${NC}"
  rm -rf "$DEST"
fi

# Download and extract only the skill folder from the repo
echo -e "${BLUE}⬇️  Downloading skill files...${NC}"
TARBALL_URL="https://github.com/$REPO/archive/refs/heads/$BRANCH.tar.gz"

curl -fsSL "$TARBALL_URL" | \
  tar -xz \
  --strip-components=2 \
  -C "$CLAUDE_SKILLS_DIR" \
  "resume-forge-$BRANCH/$SKILL_PATH"

# Verify skill files landed correctly
if [ ! -f "$DEST/SKILL.md" ]; then
  echo -e "${RED}❌ Installation failed: SKILL.md not found at $DEST${NC}"
  echo "   Please check your network connection and try again."
  echo "   Or install manually: https://github.com/$REPO"
  exit 1
fi

# Run setup script to install dependencies
if [ -f "$DEST/setup.sh" ]; then
  echo ""
  echo -e "${BLUE}📦 Installing dependencies...${NC}"
  chmod +x "$DEST/setup.sh"
  bash "$DEST/setup.sh"
else
  echo -e "${YELLOW}⚠️  setup.sh not found, skipping dependency install.${NC}"
fi

echo ""
echo -e "${GREEN}✅ resume-forge installed successfully!${NC}"
echo ""
echo "   Location : $DEST"
echo ""
echo "   Restart Claude Code to activate the skill."
echo "   Then try : \"Can you review my resume?\""
echo ""