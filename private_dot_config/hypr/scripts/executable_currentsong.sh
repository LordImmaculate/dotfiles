#!/usr/bin/zsh

TITLE=$(playerctl metadata title)
ARTIST=$(playerctl metadata artist)

echo $TITLE - $ARTIST
