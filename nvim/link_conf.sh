#!/bin/bash

mkdir $HOME/.config
touch $HOME/.config/tmp
cd ~/dotfiles/nvim
ln -s `pwd` "$HOME/.config"
rm $HOME/.config/tmp

#for i in `ls |grep -v '.sh$'`; do
#    ln -s `pwd`"/"$i $HOME"/.config/nvim/"$i
#done

