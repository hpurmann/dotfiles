# rbenv for ruby environments
eval "$(rbenv init -)"

# Docker
function dinit {
    source docker-helper.sh default
}

function tmux-work {
    ~/dotfiles/scripts/tmux-work.sh
}
