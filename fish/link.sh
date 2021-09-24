#!/usr/bin/env bash

confdir=$HOME/dotfiles/fish/
basedir=$HOME/.config/fish/
mkdir -p $basedir

for i in `ls $confdir |grep fish`; do
    ln -s $confdir/$i $basedir/$i
done 

