Dotfiles
========

My dotfiles. Configured the way I want them to be.
Clean and purely beautiful.

## Installation

```bash
$ git clone https://github.com/hpurmann/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ ./install
```

## Brew Packages

First get [Homebrew](http://brew.sh/).

<!-- TODO: Put neovim in Brewfile -->

```bash
$ brew tap Homebrew/bundle
$ brew bundle
```

## Font

[Meslo](https://github.com/powerline/fonts/blob/master/Meslo/Meslo%20LG%20M%20Regular%20for%20Powerline.otf)

## Plugins

These plugins need special treatment to get working.

<!-- TODO: Handle with vim-plug Plugin-Manager -->

[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

```bash
$ cd ~/dotfiles/vim/bundle/YouCompleteMe/
$ ./install.sh
```
