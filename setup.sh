#!/usr/bin/env bash
# Set up a new Mac: install Homebrew + Brewfile, link dotfiles, install vim plugins.
# Safe to re-run.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

load_brew() {
  for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    if [ -x "$brew_bin" ]; then
      eval "$("$brew_bin" shellenv)"
      return 0
    fi
  done
  return 1
}

# --- Homebrew ---------------------------------------------------------------
command -v brew >/dev/null 2>&1 || load_brew || true

if ! command -v brew >/dev/null 2>&1; then
  if sudo -v; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    load_brew
  else
    echo "Skipping Homebrew: it needs sudo to create its install prefix." >&2
    echo "On a managed Mac, ask IT for Homebrew or admin rights, then re-run this script." >&2
  fi
fi

if command -v brew >/dev/null 2>&1; then
  echo "Installing software with Homebrew"
  brew bundle --file="$DOTFILES/Brewfile"
fi

# --- Dotfiles ---------------------------------------------------------------
link() {
  local src="$1" dest="$2"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak.$(date +%Y%m%d%H%M%S)"
    echo "Backed up existing $dest"
  fi
  ln -sfn "$src" "$dest"
  echo "Linked $dest -> $src"
}

link "$DOTFILES/zsh/.zshrc"    "$HOME/.zshrc"
link "$DOTFILES/bash/.bashrc"  "$HOME/.bashrc"
link "$DOTFILES/bash/.profile" "$HOME/.profile"
link "$DOTFILES/vim/.vimrc"    "$HOME/.vimrc"
link "$DOTFILES/.tmux.conf"    "$HOME/.tmux.conf"

# --- Vim plugins ------------------------------------------------------------
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
vim -Es -u "$HOME/.vimrc" +PlugInstall +qall || true

echo "Done. Open a new terminal to pick up the shell config."
