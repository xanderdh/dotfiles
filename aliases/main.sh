#/bin/zsh

if [ -f ~/dotfiles/aliases/custom.sh ]; then
    . ~/dotfiles/aliases/custom.sh
fi

if [ -f ~/dotfiles/aliases/git.sh ]; then
    . ~/dotfiles/aliases/git.sh
fi

if [ -f ~/dotfiles/aliases/system.sh ]; then
    . ~/dotfiles/aliases/system.sh
fi

if [ -f ~/dotfiles/aliases/docker.sh ]; then
    . ~/dotfiles/aliases/docker.sh
fi