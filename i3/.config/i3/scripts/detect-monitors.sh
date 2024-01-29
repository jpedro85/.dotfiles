#!/bin/env zsh

# Get the number of connected monitors
MONITORS=$(xrandr --query | grep ' connected' | wc -l)

# Apply configurations based on the number of monitors
if [ "$MONITORS" -eq "1" ]; then
    # Configuration for one monitor
    i3-msg 'workspace 1; move workspace to output eDP'
    i3-msg 'workspace 3; move workspace to output eDP'
    # Additional commands for one monitor setup
else
    # Configuration for two monitors
    i3-msg 'workspace 1; move workspace to output HDMI-1-0'
    i3-msg 'workspace 3; move workspace to output HDMI-1-0'
    # Additional commands for two monitor setup
fi
