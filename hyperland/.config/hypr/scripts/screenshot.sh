#!/usr/bin/env zsh

OUTPUT_FOLDER="$HOME/Pictures/screenshots"

# Function to create directory if not exist
create_screenshot_dir() {
    mkdir -p OUTPUT_FOLDER
}

# Function to check if a command is installed
check_command() {
    if ! command -v "$1" &>/dev/null; then
        notify-send "$1 could not be found. Please install $1."
        echo "$1 could not be found. Please install $1."
        exit 1
    fi
}

# Check all required dependencies
dependencies=("dunst" "grim" "slurp" "wl-copy" "rofi" "hyprshot" "ksnip")
for cmd in "${dependencies[@]}"; do
    check_command "$cmd"
done

# Function to take a screenshot to file using Hyprshot
take_screenshot_to_file() {
    local current_date=$(date '+%Y_%m_%d')
    local fileName="screenshot_${RANDOM}_${current_date}.png"
    local filePath="$OUTPUT_FOLDER/$fileName"
    hyprshot -m region -o $OUTPUT_FOLDER -f $fileName && wl-copy < "$fileName"
}

# Function to take a screenshot to clipboard using Hyprshot
take_screenshot_to_clipboard() {
    # Only this place handles hyprshot like this due to not knowing if uses the wl-copy or not
    if hyprshot -r -z -m region  | wl-copy; then
        notify-send "Screenshot" "Copied to clipboard."
    else
        notify-send "Error" "Failed to take screenshot."
        echo "Error: Failed to take screenshot."
    fi
}

# Function to take a screenshot and annotate with Knsip before copying to clipboard
annotate_screenshot_to_clipboard() {
    local current_date=$(date '+%Y_%m_%d')
    local fileName="screenshot_${RANDOM}_${current_date}.png"
    local filePath="$OUTPUT_FOLDER/$fileName"

    hyprshot -m region -o $OUTPUT_FOLDER -f $fileName
    ksnip $filePath && wl-copy < "$filePath"
}

# Create screenshot directory
create_screenshot_dir

choice=$(echo -e "Save to file and clipboard\nCopy to clipboard only\nAnnotate screenshot (saves to a file)" | rofi -dmenu -p "Choose screenshot action")

# To ensure rofi is out of the screenshot
sleep 0.29

case $choice in

    "Save to file and clipboard")
        take_screenshot_to_file
        ;;
    "Copy to clipboard only")
        take_screenshot_to_clipboard
        ;;
    "Annotate screenshot (saves to a file)")
        annotate_screenshot_to_clipboard
        ;;
    *)
        notify-send "Screenshot" "Invalid choice. Exiting."
        ;;
esac
