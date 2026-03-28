#!/usr/bin/env bash
set -eu

GREEN='\033[0;32m'
NC='\033[0m'

info() { echo -e "${GREEN}$1${NC}"; }

link() {
  local src=$(realpath "$1")
  local dst="$2"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dst" "$BACKUP_DIR/"
    echo "Backed up $dst to $BACKUP_DIR/"
  fi
  ln -s -f "$src" "$dst"
}

BACKUP_DIR="$HOME/.emacs.d.backup.$(date +%Y%m%d%H%M%S)"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install brew packages
if [[ "$(uname)" == "Darwin" ]]; then
  info "Installing brew packages..."
  brew install emacs-app

  info "Installing optional packages (ag, ispell, ripgrep, multimarkdown)..."
  brew install the_silver_searcher ispell ripgrep multimarkdown
fi

# Symlink this repo to ~/.emacs.d
info "Linking $SCRIPT_DIR -> ~/.emacs.d..."
link "$SCRIPT_DIR" "$HOME/.emacs.d"

info "Done!"
