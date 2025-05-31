#!/usr/bin/env bash


if [[ ! $(pidof swaync) ]]; then
	swaync
else
    killall swaync &&
    swaync
fi
