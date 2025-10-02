#!/bin/bash

# ===== VOLUME INDICATOR =====
# Shows current system volume with appropriate icon
#
# Environment variables:
# - $NAME: The item name ("volume")
# - $SENDER: Event that triggered this (volume_change)
# - $INFO: The new volume level in percent (provided by volume_change event)

# Get current volume (0-100)
# Use $INFO if available from event, otherwise query osascript
if [ -n "$INFO" ]; then
  VOLUME="$INFO"
else
  VOLUME=$(osascript -e "output volume of (get volume settings)")
fi

# Check if muted
MUTED=$(osascript -e "output muted of (get volume settings)")

# Select icon based on volume level and mute status
# Nerd Font volume icons: 󰕾 (high), 󰖀 (medium), 󰕿 (low), 󰝟 (muted)
if [[ "$MUTED" == "true" ]]; then
  ICON="󰝟"
  COLOR=0xfff7768e  # Red (muted)
elif [[ $VOLUME -gt 66 ]]; then
  ICON="󰕾"
  COLOR=0xffffffff  # White
elif [[ $VOLUME -gt 33 ]]; then
  ICON="󰖀"
  COLOR=0xffffffff  # White
elif [[ $VOLUME -gt 0 ]]; then
  ICON="󰕿"
  COLOR=0xffffffff  # White
else
  ICON="󰝟"
  COLOR=0xff7aa2f7  # Blue (zero volume)
fi

# Update the volume item
sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="${VOLUME}%"
