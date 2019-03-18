export PATH="/usr/local/sbin:$PATH"
export PATH="~/bin:$PATH"

# bash-git-prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
export VIRTUALENVWRAPPER_HOOK_DIR=$HOME/dev
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3.7
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
source /usr/local/bin/virtualenvwrapper.sh

# Add awscli executable to PATH
# export PATH=~/.local/bin:$PATH

# Required for traverse-stream local Spark dev
export PATH=$PATH:$HOME/dev/journera/traverse-stream/traverse
export PATH=$PATH:/usr/local/Cellar/apache-spark/2.2.1/bin
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.2.1/libexec
export PYTHONPATH=$SPARK_HOME/python/

alias ts='cd ~/dev/journera/traverse-stream/traverse && workon ts'
alias tb='cd ~/dev/journera/traverse-batch/traverse && workon tb'
alias d='cd ~/dev/journera/tools/docker'
alias se='cd ~/dev/journera/traverse-script/emr'
alias a='cd ~/dev/journera/traverse-script/athena/traverse_refactor/ddl'
alias nt='cd ~/dev/me/notes/'

# copy local travers-batch repo to S3 from running with iPython to step through code
alias acp='aws s3 cp --profile ds-prod --recursive ~/dev/journera/customer-matching/ s3://journera-ds-artifact-prod/customer-matching/'

alias acpb='aws s3 cp --profile ds-prod --recursive ~/dev/journera/traverse-batch/ s3://journera-ds-artifact/traverse-batch/'

# ssh into jump box
alias j='ssh jump.cleanroom.journera.net'
alias jp='ssh jump.prod.journera.net'
alias js='ssh jump.stag.journera.net'
alias jd='ssh jump.dev.journera.net'

# run flake8 in python repository for which it's configured
alias f='flake8'

# build python .egg file
alias b='docker-compose run app build'

# copy traverse-batch .egg from local to S3
alias ce='aws s3 cp --profile ds-prod ~/dev/journera/traverse-batch/dist/traverse_batch-1.0.0-py3.4.egg s3://journera-ds-artifact/traverse/'

# add a step to a running EMR cluster; change cluster id and json step
alias as='aws emr --profile ds-prod add-steps --cluster-id j-2FWCIML2K3KP0 --steps file://~/dev/journera/traverse-script/emr/steps/batch/copy_from_s3_to_hdfs.json'
alias ac='aws emr --profile ds-prod add-steps --cluster-id j-2FWCIML2K3KP0 --steps file://~/dev/journera/traverse-script/emr/steps/batch/s3distcp_counts.json'
alias hj='aws emr --profile ds-prod add-steps --cluster-id j-2FWCIML2K3KP0 --steps file://~/dev/journera/traverse-script/emr/steps/batch/hive.json'

alias t='docker-compose run app test'
# Run IPython notebook by default when starting PySpark
# export PYSPARK_DRIVER_PYTHON='jupyter'
# export PYSPARK_DRIVER_PYTHON_OPTS='console'

# Set vim as prefered text editor
export EDITOR=vim
export LOG_DIRS=test

# Required for Journera GOAPI Project
export PATH=$PATH:$HOME/dev/gowork/bin
source $HOME/dev/gowork/journera.alias
eval "$(direnv hook bash)"

alias gcl='git clone --recursive'
alias gp='git pull'
alias gps='git submodule update --init --recursive'

alias gh='cd ~/dev/journera/hike/'

alias python=python3
alias pip=pip3
alias python2=python2
