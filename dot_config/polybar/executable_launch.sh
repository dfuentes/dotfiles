#!/usr/bin/env bash


polybar-msg cmd quit
echo "---" | tee -a /tmp/polybarleft.log /tmp/polybarright.log
MONITORLEFT=$(polybar -m|tail -1|sed -e 's/:.*$//g') polybar --reload left 2>&1 | tee -a /tmp/polybarleft.log & disown
MONITORRIGHT=$(polybar -m|head -1|sed -e 's/:.*$//g') polybar --reload right 2>&1 | tee -a /tmp/polybarright.log & disown

echo "Bars launched..."
