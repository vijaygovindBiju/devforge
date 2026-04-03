#!/bin/bash

STATE="$HOME/.config/hypr/power_mode"

if [ -f "$STATE" ]; then
    hyprctl keyword animations:enabled 1
    hyprctl keyword decoration:blur:enabled 1
    rm "$STATE"
else
    hyprctl keyword animations:enabled 0
    hyprctl keyword decoration:blur:enabled 0
    touch "$STATE"
fi
