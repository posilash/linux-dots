#!/bin/sh

sleep 0.1

wifi=$(nmcli r wifi)
if [ "$wifi" == "enabled" ]; then
    notify-send -t 2000 'Airplane Mode OFF'
else
    notify-send -t 2000 'Airplane Mode ON'
fi
