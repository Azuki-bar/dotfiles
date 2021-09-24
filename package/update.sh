#!/bin/bash

basedir=$HOME/dotfiles/package/

pacman -Qqen >$basedir/pkglist.txt
pacman -Qqem >$basedir/aurlist.txt
