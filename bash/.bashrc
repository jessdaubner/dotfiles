# Adds Homebrew installed Python to PATH
export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin/python
export WORKON_HOME=~/.envs/
source /usr/local/bin/virtualenvwrapper.sh

# See https://docs.python-guide.org/starting/install3/osx/
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Adds Python 3.7 location to PATH to locate pip installed packages
export PATH=~/Library/Python/3.7/bin:$PATH

# bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

export EDITOR=vim

alias f='flake8'
