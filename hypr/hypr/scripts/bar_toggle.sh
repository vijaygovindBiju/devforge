#!/bin/bash

STATE="$HOME/.config/hypr/bar_mode"
CONFIG_DIR="$HOME/.config/waybar"

if [ -f "$STATE" ]; then
    cp "$CONFIG_DIR/config.full" "$CONFIG_DIR/config"
    cp "$CONFIG_DIR/config.full" "$CONFIG_DIR/config.jsonc"
    rm "$STATE"
else
    cp "$CONFIG_DIR/config.compact" "$CONFIG_DIR/config"
    cp "$CONFIG_DIR/config.compact" "$CONFIG_DIR/config.jsonc"
    touch "$STATE"
fi

killall waybar
waybar &
