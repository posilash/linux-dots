#!/bin/bash

if ! pidof -x waypaper; then
	waypaper
else
	pkill waypaper
fi
