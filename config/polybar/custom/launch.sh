#!/bin/sh

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar example 2>&1 | tee -a /tmp/polybar1.log & disown
    MONITOR=$m polybar botstatus 2>&1 | tee -a /tmp/polybar2.log & disown
  done
else
  polybar example 2>&1 | tee -a /tmp/polybar1.log & disown
  polybar botstatus 2>&1 | tee -a /tmp/polybar2.log & disown
fi

echo "Bars launched..."
