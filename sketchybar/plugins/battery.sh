#!/bin/bash

# ===== BATTERY INDICATOR =====
# Shows battery percentage and charging status with appropriate icon
#
# Environment variables:
# - $NAME: The item name ("battery")
# - $SENDER: Event that triggered this (power_source_change or routine update)
#
# This script uses pmset to get battery information

# Get battery percentage (remove % sign and spaces)
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)

# Check if charging (look for "AC Power" in pmset output)
CHARGING=$(pmset -g batt | grep 'AC Power')

# Select icon based on charge level and charging status
# Nerd Font battery icons: 󰂎 (charging), 󰁹 (full), 󰁽 (75%), 󰁼 (50%), 󰁻 (25%), 󰁺 (low)
if [[ $PERCENTAGE -eq 100 ]] || [[ -n "$CHARGING" ]]; then
  # Charging or full battery
  ICON="󰂄"
  COLOR=0xff9ece6a  # Green
elif [[ $PERCENTAGE -gt 75 ]]; then
  ICON="󰁹"
  COLOR=0xff9ece6a  # Green
elif [[ $PERCENTAGE -gt 50 ]]; then
  ICON="󰁽"
  COLOR=0xfff7768e  # Yellow
elif [[ $PERCENTAGE -gt 25 ]]; then
  ICON="󰁼"
  COLOR=0xffff9e64  # Orange
else
  ICON="󰁺"
  COLOR=0xfff7768e  # Red (low battery)
fi

# Update the battery item
sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="${PERCENTAGE}%"
