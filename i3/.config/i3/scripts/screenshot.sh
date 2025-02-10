#!/usr/bin/env zsh

# Function to create directory if not exist
create_screenshot_dir() {
  mkdir -p "$HOME/Pictures/screenshots"
}

# Function to check if rofi is installed
check_rofi_installed() {
  if ! command -v rofi &> /dev/null; then
    echo "rofi could not be found. Please install rofi."
    exit 1
  fi
}

# Function to take a screenshot and save it to a file
take_screenshot_to_file() {
  currentDate=$(date '+%Y_%m_%d')
  fileName="$HOME/Pictures/screenshots/screenshot_${RANDOM}_$currentDate.png"

  if flameshot gui -p "$fileName"; then
    xclip -selection clipboard -t image/png -i "$fileName" && notify-send "Screenshot" "Saved to $fileName and copied to clipboard."
  else
    notify-send "Error" "Failed to take screenshot or copy to clipboard."
  fi
}

# Function to take a screenshot and copy it directly to the clipboard
take_screenshot_to_clipboard() {
  if flameshot gui -c; then
    notify-send "Screenshot" "Copied to clipboard."
  else
    notify-send "Error" "Failed to take screenshot or copy to clipboard."
  fi
}

# Main script execution

check_rofi_installed
create_screenshot_dir

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
