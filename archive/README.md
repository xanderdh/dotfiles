### Vim Requirements

- [nodejs](https://nodejs.org/en/)
- [vim-plug](https://github.com/junegunn/vim-plug)
- for syntax-highlighted preview, install [bat](https://github.com/sharkdp/bat)
- If [delta](https://github.com/dandavison/delta) is available, `GF?`, `Commits` and `BCommits` will use it to format `git diff` output.
- `Rg` requires [ripgrep (rg)](https://github.com/BurntSushi/ripgrep)

### Install vim config

- clone this repo
- run `cd dotfiles`
- run `chmod +x ./install.sh`
- run `./install.sh`

open nivm

- install vim plugins `:PlugInstall`
- install spell checker`:CocInstall coc-spell-checker`
