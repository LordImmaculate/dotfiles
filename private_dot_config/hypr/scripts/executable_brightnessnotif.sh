#!/usr/bin/zsh

MAX_BRIGHTNESS=$(brightnessctl max)
CURRENT_BRIGHTNESS=$(brightnessctl get)

BRIGHTNESS_PERCENT=$(awk "BEGIN {print int(${CURRENT_BRIGHTNESS}/${MAX_BRIGHTNESS}*100)}")

notify-send "Brightness: ${BRIGHTNESS_PERCENT}%" -h int:value:$BRIGHTNESS_PERCENT -h string:x-dunst-stack-tag:brightness
