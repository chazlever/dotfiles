#!/bin/bash
#
# Links Ghostty config directory.

DOTFILES="$(cd "$(dirname "$0")/.." && pwd)"

# shellcheck source-path=SCRIPTDIR/..
# shellcheck source=script/functions
. "$DOTFILES/script/functions"

info "linking ghostty config"
mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES/ghostty" "$HOME/.config/ghostty"
success "ghostty config linked"
