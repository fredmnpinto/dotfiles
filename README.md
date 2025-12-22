# Dotfiles

## Setup
Run `./setup.sh` to setup symbolic links from this repo to their respective local paths.

### Backups
By default `setup.sh` will keep a .bak backup of any existing config files. If that is not necessary, pass in the -d option (i.e. `./setup.sh -d`.

### Idempotency
It's safe to run `setup.sh` multiple times as it will automatically detect if a symlink is already present and not try to create a duplicate if so.
