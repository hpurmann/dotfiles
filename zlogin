# rbenv for ruby environments
eval "$(rbenv init -)"

# Editor
export EDITOR="nvim"

# Docker
function dinit {
    source docker-helper.sh
}

function dinit_vm {
    source docker-helper.sh default
}

autoload -U zmv
alias mmv='noglob zmv -W'
