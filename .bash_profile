# Terminal Theme
function git_branch() {
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1 ; then
        echo "($(git rev-parse --abbrev-ref HEAD)) "
    fi
} 

function prompt() {
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1 ; then
        if [[ `git status --porcelain` ]]; then
            echo " ✖" 
            return
        fi 
    fi
    echo " ➤"
}

function termline() {
    echo "\[\033[92m\]\$(git_branch)\[\033[m\]\[\033[33;1m\]\w\[\033[m\]\$(prompt) "
}

export PS1="$(termline)"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Git
alias gpm="git pull --rebase origin master"
alias gs="git stash"
alias gsa="git stash apply"

# Go
export GOPATH="/Users/kyle.b/code"
export PATH="${PATH}:${GOPATH}/bin:/user/local/go/bin"

# Google Cloud
export PATH="${PATH}:~/dev-tools/google-cloud-sdk/bin/"

# GPG 
export GPG_TTY=$(tty)

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="${PATH}:/usr/local/opt/tomcat@7/bin"
export CLASSPATH=".:/Users/kyle.b/code/bin/algs4.jar"
export TOMCAT_HOME="/usr/local/opt/tomcat@7/libexec/"

# MiniKube
function normal-docker() {
    for dcv in `env |grep DOCKER_ | awk -F'=' '{print $1}'`; do
        unset "$dcv";
    done
}
function minikube-docker() {
    eval $(minikube docker-env)
    kubectl config use-context minikube
}

# Node
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PHP
export PATH="/usr/local/Cellar/php/7.3.6/bin:$PATH"

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/Users/kyle.b/Library/Python/3.6/bin:$PATH"
export PYTHONDONTWRITEBYTECODE="true"

# Utils
function listening() {
    if [ $# -eq 0 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

alias rehash="source ~/.bash_profile"

# Misc
export PATH="$PATH:~/dev-tools"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
