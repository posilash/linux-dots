#!/bin/bash

ICON="$HOME/.config/swaync/icons/lowbattery.svg"
SOUND="$HOME/.config/swaync/sounds"


# Set your low battery threshold
LOW_BATTERY_LEVEL=30
CRITICAL_BATTERY_LEVEL=15


# Get battery info
BATTERY_LEVEL=$(upower -i $(upower -e | grep BAT) | grep percentage | awk '{print $2}' | sed 's/%//')
BATTERY_STATE=$(upower -i $(upower -e | grep BAT) | grep state | awk '{print $2}')



# Check if battery is discharging and below threshold
if [[ "$BATTERY_STATE" == "discharging" && "$BATTERY_LEVEL" -le "$LOW_BATTERY_LEVEL" ]]; then

	  notify-send -i ${ICON} -a "Battery"  "⚠️ Low Battery" "${BATTERY_LEVEL}% remaining" -u critical

	  canberra-gtk-play -f "${SOUND}/battery_low.wav"

elif	[[ "$BATTERY_STATE" == "discharging" && "$BATTERY_LEVEL" -le "$CRITICAL_BATTERY_LEVEL" ]]; then

	  notify-send -i ${ICON} -a "Battery"  "⚠️ Critical Battery" "${BATTERY_LEVEL}% remaining" -u crittica

	  canberra-gtk-play -f "${SOUND}/battery_critical.wav"
fi
