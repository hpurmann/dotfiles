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

## Font

[Meslo](https://github.com/hpurmann/dotfiles/blob/master/fonts/Meslo%20LG%20M%20Regular%20for%20Powerline.otf)


## Brew Packages

1. Manually sign in to the Mac App Store

1. Install brew packages
    ```bash
    $ brew bundle
    ```

## oh-my-zsh

* [Install oh-my-zsh](https://ohmyz.sh/)
* Remove raw .zshrc and symlink version from the repo again
    ```bash
    rm ~/.zshrc && ln -s ~/dotfiles/zshrc ~/.zshrc
    ```

## nvim

* Open nvim and install plugins with `:PlugInstall` inside nvim

## iTerm
* Set fullscreen mode to non-native (General -> Window)
* Set #222222 as background colour
* Set Meslo LG M Font (Profiles -> Text)
* [Fix alt + (left/right) to jump words](https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x)

## Docker for Mac

Download and install [Docker for Mac](https://docs.docker.com/desktop/mac/install/)

## Fix Side buttons on external mouse

[Install SensibleSideButtons](https://sensible-side-buttons.archagon.net/)

## FireFox browser extensions

* DF Youtube
* Ecosia
* uBlock origin
* Vimium

## Install Java
[Install prebuilt AdoptOpenJDK](https://adoptopenjdk.net/)

## Python support for neovim

```bash
$ pip3 install neovim
```

## Tmuxinator

```bash
$ rbenv install <latest stable version>
$ rbenv global <latest stable version>
```
Open a new terminal window and confirm that the correct ruby version is used.
```
$ ruby --version
$ gem install tmuxinator
```

## Visual Studio Code

Symlink files to Visual Studio Code folder:

```bash
rm $HOME/Library/Application\ Support/Code/User/settings.json
rmdir $HOME/Library/Application\ Support/Code/User/snippets
ln -s $HOME/dotfiles/VSCode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $HOME/dotfiles/VSCode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -s $HOME/dotfiles/VSCode/snippets $HOME/Library/Application\ Support/Code/User/snippets
```

## Disable press and hold

[Disable press and hold](https://apple.stackexchange.com/a/85352)
```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```

## IntelliJ
* [Add live template for variable expansion](https://stackoverflow.com/questions/14053301/how-to-use-variable-value-in-live-templates-in-intellij-idea)
* Give more memory
