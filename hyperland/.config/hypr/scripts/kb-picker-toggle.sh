#!/bin/sh
# Toggles the eww keyboard layout picker (a fullscreen, transparent window;
# click anywhere outside the card to dismiss it). Bound to the waybar
# custom/kblayout module's right-click.

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

if eww active-windows 2>/dev/null | grep -q '^kb-picker:'; then
    eww close kb-picker >/dev/null 2>&1
else
    layout=$("$SCRIPT_DIR/kb-layout-get.sh")
    eww update kb_layout="$layout" preview_layout="$layout" >/dev/null 2>&1
    eww open kb-picker >/dev/null 2>&1
fi
