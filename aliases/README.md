# Aliases

This package contains alias files organized by different purposes.

## Files

- `main`: The main file to source in your `.bashrc`.
- `git.sh`: Contains aliases related to Git commands.
- `custom.sh`: Contains custom aliases for the system it is installed on. This file is intended to store security-sensitive aliases and git-ignored.

## Usage

To use these aliases, source the `main_aliases.sh` file in your `.bashrc`:

```sh
# Source main aliases
if [ -f ~/dotfiles/aliases/main.sh ]; then
    . ~/dotfiles/aliases/main.sh
fi