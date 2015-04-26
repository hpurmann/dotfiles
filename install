#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles_old
files="vimrc vim nvimrc nvim tmux.conf zshrc gitconfig oh-my-zsh"

function create_backup_dir {
    mkdir -p $olddir
}

function create_vim_dirs {
    cd $dir
    mkdir -p "vim/tmp/undo"
    mkdir -p "vim/tmp/backup"
    mkdir -p "vim/tmp/swap"
}

function backup_create_symlinks {
    echo "Backing up dotfiles to $olddir"
    cd ~
    for file in $files; do
        if [ -f ".$file" ]; then
            mv ~/.$file $olddir
        fi

        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    done
}

create_backup_dir
create_vim_dirs
backup_create_symlinks
