Dotfiles
========

My dotfiles. Configured the way I want them to be.
Clean and purely beautiful.

## Installation

```
$ git clone https://github.com/hpurmann/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
$ ./makesymlinks.sh
```

## Clipboard

```
$ brew install reattach-to-user-namespace
```

## Plugins

These plugins need special treatment to get working.

### YouCompleteMe

```
$ cd ~/dotfiles/vim/bundle/YouCompleteMe/
$ ./install.sh
```

### The Silver Searcher

```
$ brew install the_silver_searcher
```
