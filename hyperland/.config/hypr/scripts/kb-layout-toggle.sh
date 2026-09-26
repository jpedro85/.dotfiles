#!/bin/sh
# Cycles every keyboard device between the configured layouts (pt,us; see
# lua/input.lua) and refreshes the waybar indicator + eww picker state.

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

for device in $(hyprctl devices -j | jq -r '.keyboards[].name'); do
    hyprctl switchxkblayout "$device" next >/dev/null
done

layout=$("$SCRIPT_DIR/kb-layout-get.sh")

# Refresh the waybar custom/kblayout module immediately (it has "signal": 8).
pkill -RTMIN+8 waybar >/dev/null 2>&1
eww update kb_layout="$layout" >/dev/null 2>&1
