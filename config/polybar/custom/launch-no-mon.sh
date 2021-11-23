#!/bin/sh

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
polybar example 2>&1 | tee -a /tmp/polybar1.log & disown
polybar botstatus 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
