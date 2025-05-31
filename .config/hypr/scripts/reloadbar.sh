#!/bin/bash

STATE_FILE="/tmp/waybar_state_auto"

if [[ ! $(pidof waybar) ]]; then
	waybar --log-level error
	echo '1' > "$STATE_FILE"
else
	killall waybar &&
	waybar --log-level error
	echo '1' > "$STATE_FILE"
fi
