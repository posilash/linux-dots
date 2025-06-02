
#!/bin/bash

# Notify send Icon
NOTI_ICON="$HOME/.config/swaync/icons/rog.svg"

# Icons
ICON_PERFORMANCE="󰑮"
ICON_BALANCED=""
ICON_QUIET=""

# Handle click (cycle profiles)
if [[ "$1" == "next" ]]; then
    asusctl profile -n > /dev/null
    CURRENT_PROFILE=$(asusctl profile -p | tail -n1 | awk '{print tolower($NF)}')
    notify-send -i ${NOTI_ICON} -a "ASUS Profile" "ASUS Profile" "${CURRENT_PROFILE^} Mode"
    canberra-gtk-play -f $HOME/.config/swaync/sounds/notify_1.wav
    exit 0
fi

# Get current profile for display
CURRENT_PROFILE=$(asusctl profile -p | tail -n1 | awk '{print tolower($NF)}')

# Set icon
case "$CURRENT_PROFILE" in
    performance)
        ICON=$ICON_PERFORMANCE
        ;;
    balanced)
        ICON=$ICON_BALANCED
        ;;
    quiet)
        ICON=$ICON_QUIET
        ;;
esac

# Output for Waybar
echo "{\"text\": \"$ICON\", \"tooltip\": \"Profile: ${CURRENT_PROFILE^}\"}"
