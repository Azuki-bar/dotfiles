#!/usr/bin/env bash

# #!/bin/bash
#
# # Terminate already running bar instances
# killall -q polybar
#
# # Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#
# # Launch Polybar, using default config location ~/.config/polybar/config
# polybar &
#

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# polybar azukibar 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar HDMI1 2>&1 | tee -a /tmp/polybar2.log & disown
counter=1
if which "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1 | sort); do
      MONITOR=$m polybar --reload azukibar 2>&1 |tee -a /tmp/polybar$(( counter )).log &
      (( counter ++ ))
  done
else
  polybar --reload azukibar &
fi
echo "Bars launched..." echo "Polybar launched..."
