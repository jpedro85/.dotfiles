#!/usr/bin/env zsh

# Format the date as Year_Month_Day
currentDate=$(date '+%Y_%m_%d')

# Include the formatted date at the end of the filename, before the file extension
fileName="$HOME/Pictures/screenshots/screenshot_${RANDOM}_$currentDate.png"

# Take the screenshot and save it to the specified fileName
import "$fileName"
