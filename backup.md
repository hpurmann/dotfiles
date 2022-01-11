# Things to back up before doing a clean install

## Back up

* SSH key (or discard and re-generate)
* GPG key
* Push changes in dotfiles repository to origin
* Look through home directory if anything else is worth backing up
* Opened tabs? => Pocket?
* Browser Extension list + settings
* Password manager
* List of installed applications, check if available in brew (e.g. do `brew bundle dump` and diff)
* Run full backup with TimeMachine

## VSCode

* Verify that `settings.json` and `keybindings.json` are committed to this repository
* Generate [list of installed extensions: `code --list-extensions`](https://superuser.com/a/1452176)

## Restore

### Development environment

See main Readme.md

### SSH settings

```ssh
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

### Restore macOS settings

* Dock & Menu Bar
  * Size: 1/3
  * Magnification: off
  * Minimise windows using: Scale effect
  * Automatically hide and show the Dock: on
  * Show recent applications in Dock: off
* Language and region: English (UK or US)
* Internet accounts
  * Add E-Mail providers
* Security & Privacy
  * Require password: immediately
  * Allow apps downloaded from: App store and identified developers
  * FileVault: on
  * Firewall: on
* Keyboards
  * Modifier keys: Caps Lock: ^ Control
  * Key Repeat: fastest
  * Delay Until Repeat: shortest
  * Correct spelling automatically: off
  * Capitalise words automatically: off
  * Add full stop with double space: off
  * Input Sources: U.S.
* Trackpad
  * Tap to click: on
  * Scroll direction: Natural: off
* Display
  * Setting 4 (more space, smaller text)
* Sharing
  * Set Computer Name


### Restore iTerm settings

tbd
