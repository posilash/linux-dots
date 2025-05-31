#!/bin/sh

wifi=$(nmcli r wifi)
if [ "$wifi" == "enabled" ]; then
    rfkill block all &
    notify-send -t 2000 'Airplane Mode ON'
else
    rfkill unblock all &
    notify-send -t 2000 'Airplane Mode OFF'
fi
