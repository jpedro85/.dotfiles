#!/bin/sh
# Sets every keyboard device to a specific layout by name (pt|us) - the
# index must match the order of kb_layout in lua/input.lua ("pt,us").
# Used by the eww kb-picker list (click an item to apply it).

set -eu

layout=$1

case "$layout" in
    pt) index=0 ;;
    us) index=1 ;;
    *) echo "usage: kb-layout-set.sh pt|us" >&2; exit 1 ;;
esac

for device in $(hyprctl devices -j | jq -r '.keyboards[].name'); do
    hyprctl switchxkblayout "$device" "$index" >/dev/null
done

eww update kb_layout="$layout" preview_layout="$layout" >/dev/null 2>&1
eww close kb-picker >/dev/null 2>&1
