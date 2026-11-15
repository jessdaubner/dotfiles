# Homebrew (Apple Silicon installs to /opt/homebrew, Intel to /usr/local)
for brew_bin in /opt/homebrew/bin/brew /usr/local/bin/brew; do
  if [ -x "$brew_bin" ]; then
    eval "$("$brew_bin" shellenv)"
    break
  fi
done
unset brew_bin

export PATH="$HOME/.local/bin:$PATH"
export EDITOR=vim

# bash-git-prompt
if [ -n "${HOMEBREW_PREFIX:-}" ] && [ -f "$HOMEBREW_PREFIX/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="$HOMEBREW_PREFIX/opt/bash-git-prompt/share"
  source "$__GIT_PROMPT_DIR/gitprompt.sh"
fi

# asdf (v0.16+): put shims on PATH
if command -v asdf >/dev/null 2>&1; then
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi

# direnv
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

alias f='flake8'
alias gcl='git clone --recursive'
alias gp='git pull'
alias gps='git submodule update --init --recursive'
