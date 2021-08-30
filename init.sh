#!/usr/bin/env bash
ROOTDIR=~/dotfiles/
cd ~
git clone https://github.com/Azuki-bar/dotfiles.git
cd $ROOTDIR
${ROOTDIR}/vim/link_conf.sh
$ROOTDIR/add_conf.sh
