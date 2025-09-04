#!/usr/bin/zsh
for BATTERY_DIR in /sys/class/power_supply/BAT*; do
	BATTERY_NAME=$(basename ${BATTERY_DIR})
	PERCENT=$(cat "${BATTERY_DIR}/capacity")
	STATUS=$(cat "${BATTERY_DIR}/status")

	echo "${BATTERY_NAME}: ${PERCENT}%, ${STATUS}\n"
done
