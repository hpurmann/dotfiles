# User configuration
export PATH="/usr/local/bin:/usr/local/go/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin"

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

# Quickly exit tmux panes
alias e="exit"

# Quickly ssh into vagrant
alias vash="vagrant ssh"

# Fix ctags 'illegal option' error
alias ctags="`brew --prefix`/bin/ctags"

# Name windows in tmux
DISABLE_AUTO_TITLE=true

plugins=(git)

source $ZSH/oh-my-zsh.sh
