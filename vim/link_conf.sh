#!/bin/bash

mkdir -p ~/.config/nvim/

for i in `ls |grep -v '.sh$'`; do
    ln -s `pwd`"/"$i $HOME"/.config/nvim/"$i
done

