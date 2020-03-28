#!/bin/bash

## 原則 readme.md に従いインストールすること



set -e

printf "sudo password :"
read password



echo "$address" | sudo apt install -y zsh curl git vim

address=`which zsh`

echo "$password" | sudo echo "$address" >> /etc/shells

chsh -s $address

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


echo "$password" | sudo apt install vim 

cd ~/

mv .zshrc .zshrc.old

for file in .vimrc .zshrc .gitignore_global
do
ln -s ~/dotfiles/"$file"
done 
