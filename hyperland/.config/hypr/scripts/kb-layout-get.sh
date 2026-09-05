#!/bin/sh
# Prints "pt" or "us" for the currently active layout of the main keyboard.
# Used by eww to drive the layout indicator/preview.

active=$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')

case "$active" in
    *Portuguese*) echo pt ;;
    *) echo us ;;
esac
