# Dotfiles

## Requirements

### System packages
  - jq
  - waybar
  - neovim
  - hyprland
  - hyprlock
  - hypridle
  - fuzzel
  - kitty

---

## Setup
Run `./setup.sh` to setup symbolic links from this repo to their respective local paths.

### Backups
By default `setup.sh` will keep a .bak backup of any existing config files. If that is not necessary, pass in the -d option (i.e. `./setup.sh -d`.

### Idempotency
It's safe to run `setup.sh` multiple times as it will automatically detect if a symlink is already present and not try to create a duplicate if so.

---

## Add new folders/configs
1. Add the config file or folder to the root of the repo.

2. Add the new config path to `./paths.json`. The key is the name of the folder/file while the value is the path the config should have in the system, e.g. `"nvim": "$HOME/.config/nvim"`.

**Example**:
```json
{
# [...]
  "nvim": "$HOME/.config/nvim",
  "another_config": "/path/to/config"
# [...]
}
```
```
