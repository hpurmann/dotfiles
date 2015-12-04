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
export PATH=$PATH:"/usr/texbin"

# GoLang PATH
export GOPATH=$HOME/dev/go
export PATH=$PATH:$GOPATH/bin

# Set language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
#
# Using robby's awesome theme
ZSH_THEME="robbyrussell"

# Always start tmux in 256 color mode
alias tmux="TERM=screen-256color-bce tmux"

# stash, pull, stash pop
alias stashpull="git stash && git pull --rebase && git stash pop"

# Homebrew update
alias brewup="brew update && brew upgrade"

# Quickly exit tmux panes
alias e="exit"

# Kill chrome inside the docker container
alias killchrome="docker exec -it selenium_chrome pkill -9 -x chrome"

# Fix ctags 'illegal option' error
alias ctags="`brew --prefix`/bin/ctags"

# Print documents
function printUni {
    cat $1 | ssh andorra.imp.fu-berlin.de lpr -P t9-k42-zedat01
}

# Name windows in tmux
DISABLE_AUTO_TITLE=true

plugins=(git)

source $ZSH/oh-my-zsh.sh
