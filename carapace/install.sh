#!/bin/sh
#
# Installs carapace-bin for shell completions.

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

# shellcheck source-path=SCRIPTDIR/..
# shellcheck source=script/functions
. "$DOTFILES/script/functions"

if command -v carapace >/dev/null 2>&1; then
  success "carapace already installed"
  exit 0
fi

if [ "$(uname)" = "Darwin" ]; then
  info "installing carapace via Homebrew"
  brew install --quiet carapace
else
  info "installing carapace to ~/.local/bin"
  mkdir -p ~/.local/bin
  ARCH="$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/')"
  URL="$(curl -sS https://api.github.com/repos/carapace-sh/carapace-bin/releases/latest \
    | grep -o "https://[^\"]*linux_${ARCH}.tar.gz" | head -n1)"
  curl -sSL "$URL" | tar -xz -C ~/.local/bin carapace
fi
