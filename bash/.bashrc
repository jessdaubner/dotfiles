# remove annoying zsh message
export BASH_SILENCE_DEPRECATION_WARNING=1

# set terminal prompt
PS1="jess> "
cd ~/dev

# bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# bash-completion
if [ -f /sw/etc/bash_completion ]; then
   . /sw/etc/bash_completion
fi
