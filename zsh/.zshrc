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

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Completion
autoload -Uz compinit && compinit

# Git-aware prompt (built-in vcs_info; zsh equivalent of bash-git-prompt)
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats ' (%b%u%c)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a%u%c)'
precmd() { vcs_info }
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f%F{yellow}${vcs_info_msg_0_}%f %# '

# asdf (v0.16+): put shims on PATH
if command -v asdf >/dev/null 2>&1; then
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fi

# direnv
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# Aliases
alias f='flake8'
alias gcl='git clone --recursive'
alias gp='git pull'
alias gps='git submodule update --init --recursive'

# Machine-specific settings that shouldn't be committed
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
