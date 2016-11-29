# rbenv for ruby environments
eval "$(rbenv init -)"

# Editor
export EDITOR="nvim"

# Docker
function dinit {
    source docker-helper.sh
}

autoload -U zmv
alias mmv='noglob zmv -W'
