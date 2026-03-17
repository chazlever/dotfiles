# dotfiles

Personal configuration files for macOS and Linux, organized by topic.

## Install

```sh
git clone --recursive https://github.com/chazlever/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

The bootstrap script will:

- Initialize git submodules
- Prompt for git author name, email, and GitHub username
- Symlink configuration files to your home directory
- Install [Starship](https://starship.rs/) prompt (via Homebrew on macOS, local binary on Linux)

## Update

After the initial bootstrap, use the `dot` command to keep everything
up-to-date:

```sh
dot
```

This pulls the latest changes, updates submodules, and re-runs all topic
installers.

The `dot` command also supports:

- `dot -e` / `dot --edit` — Open the dotfiles directory in `$EDITOR`
- `dot -h` / `dot --help` — Show usage information

## How It Works

### Topical Organization

Everything is organized by topic. Each top-level directory is a topic
containing related configuration:

- `bash/` — Bash shell configuration
- `bin/` — Custom scripts, added to `$PATH`
- `git/` — Git configuration and global gitignore
- `ssh/` — SSH agent helper and proxy functions
- `starship/` — [Starship](https://starship.rs/) prompt configuration and installer
- `system/` — Aliases, exports, and PATH management
- `tmux/` — Tmux configuration and plugins
- `vim/` — Vim configuration and plugins
- `zsh/` — Zsh configuration and plugins

### File Conventions

- **`*.symlink`** — Symlinked to `~/.<basename>` (e.g., `zsh/zshrc.symlink` becomes `~/.zshrc`)
- **`*.config`** — Symlinked to `~/.config/<basename>` (e.g., `starship/starship.toml.config` becomes `~/.config/starship.toml`)
- **`*.zsh`** — Automatically sourced by zshrc. `path.zsh` files are loaded first, `completion.zsh` files are loaded last.
- **`install.sh`** — Per-topic installer, run by `script/install` during bootstrap
- **`*.example`** — Template files with placeholders, copied and configured during bootstrap

### Zsh Plugins

Managed as git submodules under `zsh/plugins/`:

- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

### Local Customizations

Put machine-specific configuration in `~/.localrc` (not tracked by git).

Git author details are stored in `git/gitconfig.local.symlink` (generated
during bootstrap, ignored by git).

## Thanks

The structure of this dotfiles repository is inspired by [Zach Holman's dotfiles](https://github.com/holman/dotfiles).
