#!/bin/bash

pidof hyprlock || hyprlock -q

loginctl lock-session
