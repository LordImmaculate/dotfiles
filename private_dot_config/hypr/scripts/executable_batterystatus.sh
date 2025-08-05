#!/usr/bin/zsh
BATTERY_DIR=$(ls -d /sys/class/power_supply/BAT* | head -n 1)

CURRENT_PERCENT=$(cat "${BATTERY_DIR}/capacity")
STATUS=$(cat ${BATTERY_DIR}/status)

echo ${CURRENT_PERCENT}%, ${STATUS}
