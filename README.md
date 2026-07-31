## Overview

This repository contains dotfiles for configuring a development environment. It is organized as a set of [GNU Stow](https://www.gnu.org/software/stow/) packages, one per tool, plus an `aliases` folder that is sourced manually and an `archive` folder with older, no-longer-maintained configs.

## Packages Included

- `tmux/` — `.tmux.conf` (see `tmux/README.md` for [TPM](https://github.com/tmux-plugins/tpm) setup)
- `my_nvim/` — `.config/nvim/init.lua` Neovim config
- `nvChad/` — `.config/nvim/init.lua` NvChad-based Neovim config
- `herdr/` — `.config/herdr/config.toml`, `plugins.json`
- `aliases/` — `main.sh`, `git.sh`, `system.sh`, `docker.sh` shell aliases (not a stow package, see below)
- `archive/` — legacy vim/bash configs kept for reference, installed via its own `install.sh`

## Installation

### Prerequisites

- Ensure you have [stow](https://www.gnu.org/software/stow/) installed. You can install it using your package manager:
  - For Debian/Ubuntu: `sudo apt-get install stow`
  - For macOS: `brew install stow`

### Stowing Dotfiles

1. Clone this repository to your home directory or any directory you prefer:
   ```sh
   git clone git@github.com:xanderdh/dotfiles.git ~/dotfiles
   ```
2. Navigate to the dotfiles directory:
   ```sh
   cd ~/dotfiles
   ```
3. Use `stow` to create symlinks for the package you want to use. For example, to stow the `tmux` configuration:
   ```sh
   stow tmux
   ```
   Repeat this step for each package you want to stow (e.g., `tmux`, `my_nvim`, `nvChad`, `herdr`). Only use one of `my_nvim` or `nvChad` at a time, since both provide `.config/nvim`.

### Unstowing Dotfiles

If you need to remove the symlinks created by `stow`, you can use the `-D` option:
```sh
stow -D tmux
```
Repeat this step for each package you want to unstow.

### Aliases

The `aliases` folder is not a stow package — source it manually from your `.bashrc`:

```sh
if [ -f ~/dotfiles/aliases/main.sh ]; then
    . ~/dotfiles/aliases/main.sh
fi
```

Create `aliases/custom.sh` yourself for machine-specific aliases (see `aliases/README.md`).
