#!/bin/zsh

nvim_path="~/.config/nvim/"

rm -rf ~/.config/nvim/backup
mkdir ~/.config/nvim/backup
cp -R ~/.config/nvim/*.vim ~/.config/nvim/backup

cp -R ./vim/* ~/.config/nvim
print "Done"
