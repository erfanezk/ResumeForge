#!/usr/bin/env bash
# Installs dependencies for resume-forge skill
# Called automatically by install.sh after skill files are copied

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

install_poppler() {
  if command -v pdftotext &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} poppler already installed"
    return
  fi

  echo "  Installing poppler (PDF text extraction)..."

  if command -v brew &>/dev/null; then
    brew install poppler --quiet
  elif command -v apt-get &>/dev/null; then
    sudo apt-get install -y poppler-utils -qq
  elif command -v dnf &>/dev/null; then
    sudo dnf install -y poppler-utils -q
  elif command -v pacman &>/dev/null; then
    sudo pacman -S --noconfirm poppler
  else
    echo -e "  ${YELLOW}⚠️  Could not detect package manager. Install poppler manually:${NC}"
    echo "     macOS:  brew install poppler"
    echo "     Ubuntu: sudo apt install poppler-utils"
    return
  fi

  echo -e "  ${GREEN}✓${NC} poppler installed"
}

install_python_libs() {
  local pip_cmd=""

  if command -v pip3 &>/dev/null; then
    pip_cmd="pip3"
  elif command -v pip &>/dev/null; then
    pip_cmd="pip"
  else
    echo -e "  ${YELLOW}⚠️  pip not found. Skipping Python libraries (pdfplumber, pypdf).${NC}"
    echo "     Install Python and pip, then run: pip install pdfplumber pypdf"
    return
  fi

  echo "  Installing Python PDF libraries (pdfplumber, pypdf)..."
  $pip_cmd install pdfplumber pypdf --quiet 2>/dev/null
  echo -e "  ${GREEN}✓${NC} pdfplumber + pypdf installed"
}

install_poppler
install_python_libs