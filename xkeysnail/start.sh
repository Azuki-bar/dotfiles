#!/usr/bin/env bash

exec >> $HOME/.config/xkeysnail/stdout.log 2>&1

killall -q xkeysnail

xhost +si:localuser:xkeysnail
xhost +si:localuser:azukibar
DISPLAY=$DISPLAY /usr/local/bin/xkeysnail -q $HOME/.config/xkeysnail/config.py &
#sudo -u xkeysnail DISPLAY=$DISPLAY /usr/local/bin/xkeysnail -q $HOME/.config/xkeysnail/config.py &
