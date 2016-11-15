# Homebrew
export PATH="/usr/local/bin"

# Go tools
export PATH=$PATH:"/usr/local/go/bin"

# System binaries
export PATH=$PATH:"/usr/bin"
export PATH=$PATH:"/bin"
export PATH=$PATH:"/usr/sbin"
export PATH=$PATH:"/sbin"

# LaTex
export PATH=$PATH:"/Library/TeX/texbin"

# GoLang PATH
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Custom scripts
export PATH=$PATH:~/dotfiles/scripts

# Set language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Using robby's awesome theme
ZSH_THEME="robbyrussell"

# Always start tmux in 256 color mode
alias tmux="TERM=screen-256color-bce tmux"

# stash, pull, stash pop
alias stashpull="git stash && git pull --rebase && git stash pop"

# Homebrew update
alias brewup="brew update && brew upgrade --all && brew cleanup; brew doctor"

# Quickly exit tmux panes
alias e="exit"

# Fix ctags 'illegal option' error
alias ctags="`brew --prefix`/bin/ctags"

function throttle {
    sudo sysctl debug.lowpri_throttle_enabled=$1
}

# Print documents
function printUni {
    cat $1 | ssh andorra.imp.fu-berlin.de lpr -P t9-k42-zedat01
}

function dex {
    local container=$1
    shift
    docker exec -it $container /bin/bash -c "$*"
}

alias ctw='dex rplan npm run client-test:watch -- --reporters spec --files'

# Name windows in tmux
DISABLE_AUTO_TITLE=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

# added by travis gem
[ -f /Users/hpurmann/.travis/travis.sh ] && source /Users/hpurmann/.travis/travis.sh
