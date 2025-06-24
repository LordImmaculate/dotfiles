#!/usr/bin/zsh

VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
notify-send "Volume: ${VOL}%" -h int:value:$VOL -h string:x-dunst-stack-tag:volume
