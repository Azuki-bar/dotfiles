#!/usr/bin/env bash
ROOTDIR=~/dotfiles/

git clone https://github.com/Azuki-bar/dotfiles.git
cd $ROOTDIR
${ROOTDIR}/vim/link_conf.sh
$ROOTDIR/git/add_conf.sh
