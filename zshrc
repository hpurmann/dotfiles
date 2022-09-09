# Homebrew
export PATH="/usr/local/bin"

# System binaries
export PATH=$PATH:"/usr/bin"
export PATH=$PATH:"/bin"
export PATH=$PATH:"/usr/sbin"
export PATH=$PATH:"/sbin"

# LaTex
export PATH=$PATH:"/Library/TeX/texbin"

# GoLang PATH
export GOPATH=$HOME/dev/go
export GOROOT="/usr/local/go"
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN:$GOROOT/bin


# Rust
export PATH="$PATH:$HOME/.cargo/bin"
export RUST_SRC_PATH="$HOME/dev/rust/src"

# Python
export PATH="$PATH:$HOME/Library/Python/3.7/bin"

# Yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Java
#export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Custom scripts
export PATH=$PATH:~/dotfiles/scripts

# Set language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Rust zsh completions
fpath+=~/.zfunc

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Using robby's awesome theme
ZSH_THEME="robbyrussell"

# Always start tmux in 256 color mode
alias tmux="TERM=screen-256color-bce tmux"

# stash, pull, stash pop
alias stashpull="git stash && git pull --rebase && git stash pop"

# Homebrew update
eval "$(/opt/homebrew/bin/brew shellenv)"
alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"

# Use python 3
alias python=python3

alias k=kubectl

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Name windows in tmux
DISABLE_AUTO_TITLE=true

plugins=(git kubectl helm)

# Fix zsh completion security warning
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

listening() {
    if [ $# -eq 0 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}
