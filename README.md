## Overview

This repository contains my personal dotfiles for configuring my development environment. These dotfiles include configurations for various tools and applications such as `bash`, `vim`, `neovim`, `git`, `tmux`, and more.

## Files Included

- `.bashrc`
- `.vimrc`
- `.gitconfig`
- `.tmux.conf`
- `.config/nvim/init.vim`
- Other configuration files for various tools

## Installation

### Prerequisites

- Ensure you have [stow](https://github.com/aspiers/stow) installed. You can install it using your package manager:
  - For Debian/Ubuntu: `sudo apt-get install stow`
  - For macOS: `brew install stow`

### Stowing Dotfiles

1. Clone this repository to your home directory or any directory you prefer:
   ```sh
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   ```
2. Navigate to the dotfiles directory:
   ```sh
   cd ~/dotfiles
   ```
3. Use `stow` to create symlinks for the configuration files you want to use. For example, to stow the `tmux` configuration:
   ```sh
   stow tmux
   ```
   Repeat this step for each set of dotfiles you want to stow (e.g., `vim`, `neovim`, `git`, `tmux`).

### Unstowing Dotfiles

If you need to remove the symlinks created by `stow`, you can use the `-D` option:
`sh
     stow -D bash
     `
Repeat this step for each set of dotfiles you want to unstow.
