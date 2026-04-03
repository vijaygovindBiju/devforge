#!/bin/bash

STATE="$HOME/.config/hypr/grayscale"
SHADER="$HOME/.config/hypr/shaders/grayscale.glsl"

if [ -f "$STATE" ]; then
    /usr/bin/hyprctl keyword decoration:screen_shader "[[EMPTY]]"
    rm "$STATE"
    /usr/bin/notify-send "Grayscale" "Deactivated"
else
    /usr/bin/hyprctl keyword decoration:screen_shader "$SHADER"
    touch "$STATE"
    /usr/bin/notify-send "Grayscale" "Activated"
fi
