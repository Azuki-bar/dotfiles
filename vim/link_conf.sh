#!/bin/bash

mkdir -p ~/.config/nvim/
cd ~/dotfiles/
for i in `ls vim|grep -v '.sh$'`; do
    ln -s `pwd`"/"$i $HOME"/.config/nvim/"$i
done

