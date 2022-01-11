Dotfiles
========

My dotfiles. Configured the way I want them to be.
Clean and purely beautiful.

## Installation

Read instructions on https://sourabhbajaj.com/mac-setup/

* Install xCode
* Install [Homebrew](http://brew.sh/)

```bash
$ git clone https://github.com/hpurmann/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ ./install
```

## Brew Packages

1. Manually sign in to the Mac App Store

1. Install brew packages
    ```bash
    $ brew bundle
    ```

## oh-my-zsh

* [Install oh-my-zsh](https://ohmyz.sh/)
* Remove raw .zshrc and symlink version from the repo again

## iTerm
[Fix alt + (left/right) to jump words](https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x)

## Fix Side buttons on external mouse

[Install SensibleSideButtons](https://sensible-side-buttons.archagon.net/)

## Install Java
[Install prebuilt AdoptOpenJDK](https://adoptopenjdk.net/)

## NeoVim
Install [vim-plug](https://github.com/junegunn/vim-plug)

## Python support for neovim

```bash
$ pip3 install neovim
```

## Tmuxinator

```bash
$ rbenv install <latest stable version>
$ rbenv global <latest stable version>
$ gem install tmuxinator
```

## Font

[Meslo](https://github.com/hpurmann/dotfiles/blob/master/fonts/Meslo%20LG%20M%20Regular%20for%20Powerline.otf)

## Visual Studio Code

Symlink files to Visual Studio Code folder:

```bash
ln -s $HOME/dotfiles/VSCode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $HOME/dotfiles/VSCode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
```

## IntelliJ
* [Add live template for variable expansion](https://stackoverflow.com/questions/14053301/how-to-use-variable-value-in-live-templates-in-intellij-idea)
* Give more memory
