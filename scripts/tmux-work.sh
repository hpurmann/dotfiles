#!/bin/bash
SESSION=0
DEV_ROOT=~/dev
WORK_REPOSITORY=actano/rplan

function tmux-select {
    tmux select-window -t $SESSION:$1
    tmux select-pane -t $2
}

function cd_to_work {
    tmux send-keys "cd $WORK_REPOSITORY" C-m
}

cd $DEV_ROOT
tmux -2 new-session -d -s $SESSION

tmux rename-window -t $SESSION:0 'rplan'
tmux-select 0 0
cd_to_work
tmux send-keys "nvim" C-m

tmux new-window -t $SESSION:1 -n 'docker'
tmux split-window -h
tmux-select 1 1
cd_to_work
tmux-select 1 0
cd_to_work

# Set default window
tmux select-window -t $SESSION:0

# Attach to session
tmux -2 attach-session -t $SESSION
