#!/bin/bash

mkdir -p ~/.config/nvim/
cd ~/dotfiles/vim/
for i in `ls |grep -v '.sh$'`; do
    ln -s `pwd`"/"$i $HOME"/.config/nvim/"$i
done

mkdir -p ~/.config/coc/extensions/
ln -s `pwd`"/coc/package.json" "$home/.config/coc/extensions/"
cd "$home/.config/coc/extensions/"
yarn install --frozen-lockfile
