#!/bin/sh
# Cycles every keyboard device between the configured layouts (pt,us; see
# lua/input.lua) and pokes eww so the indicator/preview reflect the change.

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

for device in $(hyprctl devices -j | jq -r '.keyboards[].name'); do
    hyprctl switchxkblayout "$device" next >/dev/null
done

layout=$("$SCRIPT_DIR/kb-layout-get.sh")

eww update kb_layout="$layout" >/dev/null 2>&1
eww open kb-preview --duration 1.5s >/dev/null 2>&1
