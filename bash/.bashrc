# bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

export EDITOR=vim

alias f='flake8'

# asdf and asdf-direnv
export PATH=$(brew --prefix asdf)/bin:$PATH
eval "$(asdf exec direnv hook bash)"
# A shortcut for asdf managed direnv.
direnv() { asdf exec direnv "$@"; }
