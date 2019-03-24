# Homebrew
export PATH="/usr/local/bin"
export PATH="/usr/local/opt/node@10/bin:$PATH"

# System binaries
export PATH=$PATH:"/usr/bin"
export PATH=$PATH:"/bin"
export PATH=$PATH:"/usr/sbin"
export PATH=$PATH:"/sbin"

# LaTex
export PATH=$PATH:"/Library/TeX/texbin"

# GoLang PATH
export GOPATH=$HOME/dev/go
export GOROOT="/usr/local/opt/go/libexec"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# Rust
export PATH="$PATH:$HOME/.cargo/bin"
export RUST_SRC_PATH="$HOME/dev/rust/src"

# Yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Java :/
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
#export ANDROID_HOME=$HOME/Library/Android/sdk
#export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Hyperledger Fabric binaries
export PATH=$PATH:$HOME/dev/go/src/fabric-samples/bin

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

# Actano Vault
export VAULT_ADDR=https://vault.actano.de

# Always start tmux in 256 color mode
alias tmux="TERM=screen-256color-bce tmux"

# stash, pull, stash pop
alias stashpull="git stash && git pull --rebase && git stash pop"

# Homebrew update
alias brewup="brew update && brew upgrade && brew cleanup && brew doctor"

# Quickly exit tmux panes
alias e="exit"

# Fix ctags 'illegal option' error
alias ctags="`brew --prefix`/bin/ctags"

alias k=kubectl

# Make Timemachine backups faster
function throttle {
    sudo sysctl debug.lowpri_throttle_enabled=$1
}

alias yarnlocal="node /Users/hpurmann/dev/yarn/bin/yarn.js"
alias yarndebug="node --inspect --debug-brk /Users/hpurmann/dev/yarn/bin/yarn.js"

function agrequires {
    ag "require.*$1|import.*$1"
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

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Name windows in tmux
DISABLE_AUTO_TITLE=true

plugins=(git kubectl helm)

source $ZSH/oh-my-zsh.sh

# added by travis gem
[ -f /Users/hpurmann/.travis/travis.sh ] && source /Users/hpurmann/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
