#!/bin/bash

status=$(amixer get Master | awk -F'[][%]' '/%/ {if ($5 == "off") {print "muted(100%)"} else {print $2 "%"}}'| head -n 1)

if [ "$status" == "muted(100%)" ]; then
    # echo -e "\033[33m$status\033[0m"
    echo "$status"
    echo
    echo "#EED202"  # Set the color to yellow when muted
else
    echo "$status"
fi