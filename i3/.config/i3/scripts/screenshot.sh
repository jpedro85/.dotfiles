#!/usr/bin/env zsh

# Function to take a screenshot and save it to a file
take_screenshot_to_file() {
  # Format the date as Year_Month_Day
  currentDate=$(date '+%Y_%m_%d')

  # Include the formatted date at the end of the filename, before the file extension
  fileName="$HOME/Pictures/screenshots/screenshot_${RANDOM}_$currentDate.png"

  # Take the screenshot and save it to the specified fileName
  flameshot gui -p "$fileName"

  # Copy the screenshot to the clipboard
  xclip -selection clipboard -t image/png -i "$fileName"

  notify-send "Screenshot" "Saved to $fileName and copied to clipboard."
}

# Function to take a screenshot and copy it directly to the clipboard
take_screenshot_to_clipboard() {
  # Take the screenshot and copy it to the clipboard
  flameshot gui -c

  notify-send "Screenshot" "Copied to clipboard."
}

# Prompt the user to choose an action
choice=$(echo -e "Save to file and clipboard\nCopy to clipboard only" | rofi -dmenu -p "Choose screenshot action")

case $choice in
  "Save to file and clipboard")
    take_screenshot_to_file
    ;;
  "Copy to clipboard only")
    take_screenshot_to_clipboard
    ;;
  *)
    notify-send "Screenshot" "Invalid choice. Exiting."
    ;;
esac
