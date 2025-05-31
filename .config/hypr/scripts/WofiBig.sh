#!/bin/bash

CONFIG="$HOME/.config/wofi/WofiBig/config"

if [[ ! $(pidof wofi) ]]; then
	wofi --show drun --conf ${CONFIG}
else
	pkill wofi
fi
