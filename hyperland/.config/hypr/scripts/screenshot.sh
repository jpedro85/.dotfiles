#!/usr/bin/env zsh

# Function to create directory if not exist
create_screenshot_dir() {
    mkdir -p "$HOME/Pictures/screenshots"
}
check_dunst_installed() {
    if ! command -v dunst &>/dev/null; then
        notify-send "dunst could not be found. Please install dunst."
        echo "dunst could not be found. Please install dunst."
        exit 1
    fi
}

# Function to check if grim is installed
check_grim_installed() {
    if ! command -v grim &>/dev/null; then
        notify-send "grim could not be found. Please install grim."
        echo "grim could not be found. Please install grim."
        exit 1
    fi
}

# Function to check if slurp is installed
check_slurp_installed() {
    if ! command -v slurp &>/dev/null; then
        notify-send "slurp could not be found. Please install slurp."
        echo "slurp could not be found. Please install slurp."
        exit 1
    fi
}

# Function to check if wl-copy is installed
check_wl_copy_installed() {
    if ! command -v wl-copy &>/dev/null; then
        notify-send "wl-copy could not be found. Please install wl-copy."
        echo "wl-copy could not be found. Please install wl-copy."
        exit 1
    fi
}

# Function to check if dmenu is installed
check_rofi_installed() {
    if ! command -v rofi &>/dev/null; then
        notify-send "rofi could not be found. Please install rofi-wayland."
        echo "rofi could not be found. Please install rofi-wayland."
        exit 1
    fi
}

# Function to take a screenshot and save it to a file
take_screenshot_to_file() {
    currentDate=$(date '+%Y_%m_%d')
    fileName="$HOME/Pictures/screenshots/screenshot_${RANDOM}_$currentDate.png"

    if flameshot gui -p "$fileName"; then
        wl-copy <"$fileName" && notify-send "Screenshot" "Saved to $fileName and copied to clipboard."
    else
        notify-send "Error" "Failed to take screenshot or copy to clipboard."
    fi
}

# Function to take a screenshot and copy it directly to the clipboard
take_screenshot_to_clipboard() {
    if flameshot gui -r | wl-copy; then
        notify-send "Screenshot" "Copied to clipboard."
        echo "Screenshot" "Copied to clipboard."
    else
        notify-send "Error" "Failed to take screenshot or copy to clipboard."
        echo "Error" "Failed to take screenshot or copy to clipboard."
    fi
}

# Main script execution

check_dunst_installed
check_grim_installed
check_slurp_installed
check_wl_copy_installed
check_rofi_installed
create_screenshot_dir

choice=$(echo -e "Save to file and clipboard\nCopy to clipboard only" | rofi -dmenu -p "Choose screenshot action")
# To ensure rofi is out of the screenshot
sleep 0.29

case $choice in
"Save to file and clipboard")
    take_screenshot_to_file
    ;;
"Copy to clipboard only")
    take_screenshot_to_clipboard
    ;;
*)
    notify-send "Screenshot" "Invalid choice. Exiting."
    echo "Screenshot" "Invalid choice. Exiting."
    ;;
esac
