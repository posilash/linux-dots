#!/bin/zsh
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus


bat_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
bat_percentage=$(( (bat_lvl * 100) / 80 ))
pluggedin=$(cat /sys/class/power_supply/AC0/online) 

if [ $bat_percentage -le 15 ] && [ $pluggedin -eq 0]; then
    notify-send --urgency=CRITICAL "Battery Low" "Level: ${bat_percentage}%"
fi
