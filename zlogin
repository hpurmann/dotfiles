# rbenv for ruby environments
eval "$(rbenv init -)"

# Docker
function dinit {
    source docker-helper.sh default
}

function dinit_beta {
    source docker-helper.sh
}
