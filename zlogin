# rbenv for ruby environments
eval "$(rbenv init -)"

# Editor
export EDITOR="nvim"

# Docker
function dinit {
    source docker-helper.sh default
}

function dinit_beta {
    source docker-helper.sh
}
