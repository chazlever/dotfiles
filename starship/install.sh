#!/bin/sh
#
# Installs Starship prompt.

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

# shellcheck source-path=SCRIPTDIR/..
# shellcheck source=script/functions
. "$DOTFILES/script/functions"

if command -v starship >/dev/null 2>&1; then
  success "starship already installed"
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
  info "installing starship via Homebrew"
  brew install --quiet starship
else
  info "installing starship to ~/.local/bin"
  mkdir -p ~/.local/bin
  curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir ~/.local/bin -y > /dev/null 2>&1
fi
