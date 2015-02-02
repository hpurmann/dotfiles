Dotfiles
========

My dotfiles. Configured the way I want them to be.
Clean and purely beautiful.

## Installation

```bash
$ git clone https://github.com/hpurmann/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ ./install.sh
```

## Font

[Meslo](https://github.com/powerline/fonts/blob/master/Meslo/Meslo%20LG%20M%20Regular%20for%20Powerline.otf)

## Plugins

These plugins need special treatment to get working.

### [tmux OSX Clipboard](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)

```bash
$ brew install reattach-to-user-namespace
```

### [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)

```bash
$ brew install cmake
$ cd ~/dotfiles/vim/bundle/YouCompleteMe/
$ ./install.sh
```

### [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)

```bash
$ brew install the_silver_searcher
```
