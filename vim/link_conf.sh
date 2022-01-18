#!/bin/bash

mkdir -p ~/.config/nvim/
cd ~/dotfiles/vim/
for i in `ls |grep -v '.sh$'`; do
    ln -s `pwd`"/"$i $HOME"/.config/nvim/"$i
done

mkdir -p $HOME/.config/coc/extensions/
ln -s `pwd`"/coc/package.json" "$HOME/.config/coc/extensions/"
cd "$HOME/.config/coc/extensions/"
yarn install --frozen-lockfile
