#!/bin/bash

# Device alias to match against
DEVICE_ALIAS="WH-1000XM4"
opt=""

# Fetch the card name for the device
CARD_NAME=$(pactl list cards | awk '/Name:/ {name=$2} /device.alias = "WH-1000XM4"/ {print name}')

# If the card name is empty, exit
if [ -z "$CARD_NAME" ]; then
    notify-send "Unable to find the card for device $DEVICE_ALIAS"
    exit
fi

# Retrieve all supported profiles for the card
SUPPORTED_PROFILES=$(pactl list cards | awk -v card="$CARD_NAME" '/Name: / {if ($2 == card) {f=1} else {f=0}} f && /Profiles:/, /Active Profile:/ {if (!/Profiles:/ && !/Active Profile:/) print $1}')

# Declare an associative array for profiles
declare -A PROFILES
PROFILES["a2dp-sink"]="High Quality Audio Only"
PROFILES["headset-head-unit-cvsd"]="Mono audio w/ mic"

# Create an array of profiles that we're interested in and are supported by the device
FILTERED_PROFILES=()
for profile in "${!PROFILES[@]}"; do
    if echo "$SUPPORTED_PROFILES" | grep -q "^${profile}:"; then
        FILTERED_PROFILES+=("$profile (${PROFILES[$profile]})")
    fi
done

if [ ${#FILTERED_PROFILES[@]} -eq 0 ]; then
    notify-send "None of the desired profiles are supported by device $DEVICE_ALIAS"
    exit
fi

# Function to change the profile to the high quality audio
choose_high_quality()
{
    pactl set-card-profile "$CARD_NAME" "a2dp-sink"
    notify-send "Audio Profile" "Switched to profile: High Quality Audio Only."
}

# Function to change the profile to the mono audio with microphone
choose_mono_with_mic()
{
    pactl set-card-profile "$CARD_NAME" "headset-head-unit-cvsd"
    notify-send "Audio Profile" "Switched to profile: Mono audio w/ mic."
}

# Prompt the user to choose an action
choice=$(printf "%s\n" "${PROFILES[@]}" | rofi -dmenu -p "Select profile for $DEVICE_ALIAS")

case $choice in
  "High Quality Audio Only")
    choose_high_quality
    ;;
  "Mono audio w/ mic")
    choose_mono_with_mic
    ;;
  *)
    notify-send "Audio Profile" "Invalid choice. Exiting."
    ;;
esac
