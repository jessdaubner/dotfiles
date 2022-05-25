# oh-my-zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# poetry and pyenv
export PATH="$HOME/.poetry/bin:$PATH"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
eval "$(pyenv init --path)"

# hook direnv into shell
eval "$(direnv hook zsh)"

# mysql client
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

# shortcuts for navigating team projects and repos
alias bm='cd ~/code/protections-cloud/libraries/python/buildmodel'
alias lm='cd ~/code/protections-cloud/services/labelmaker2'
alias ml='cd ~/code/security-ml'
alias mp='cd ~/code/protections-cloud/tools/malwarescore_publishing'

alias awslogin='aws-okta login datasci && eval $(aws-okta env datasci)'
alias desccomp='uname -amnprsv'
