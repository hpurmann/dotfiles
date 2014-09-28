# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Using robby's awesome theme
ZSH_THEME="robbyrussell"

# Always start tmux in 256 color mode
alias tmux="TERM=screen-256color-bce tmux"

# Name windows in tmux
DISABLE_AUTO_TITLE=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/Users/hpurmann/Library/Haskell/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Library/Haskell/bin:/usr/texbin:/opt/local:/opt/local/bin"
