#!/bin/zsh

rm -rf ~/.config/nvim/backup
mkdir ~/.config/nvim/backup
cp -R ~/.config/nvim/*.vim ~/.config/nvim/backup

cp -R ./vim/* ~/.config/nvim
print "Done"
