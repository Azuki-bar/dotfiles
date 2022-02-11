#!/bin/bash

#mkdir -p ~/.config/nvim/
cd ~/dotfiles/nvim
ln -s `pwd` "$HOME/.config"

#for i in `ls |grep -v '.sh$'`; do
#    ln -s `pwd`"/"$i $HOME"/.config/nvim/"$i
#done

