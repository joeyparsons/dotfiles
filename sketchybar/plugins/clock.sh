#!/bin/bash

# ===== CLOCK DISPLAY =====
# Shows current time and date
# Hover to show UTC time in popup
#
# Environment variables:
# - $NAME: The item name ("clock")
# - $SENDER: Event that triggered this (mouse.entered, mouse.exited, or routine update)
#
# Update frequency: 10 seconds (set in sketchybarrc)
#
# Date formatting uses strftime format codes:
# %a = Abbreviated weekday (Mon, Tue, etc.)
# %b = Abbreviated month (Jan, Feb, etc.)
# %d = Day of month (01-31)
# %I = Hour 12-hour format (01-12)
# %M = Minute (00-59)
# %p = AM/PM

# Handle mouse hover events
if [ "$SENDER" = "mouse.entered" ]; then
  # Show popup on hover
  sketchybar --set clock popup.drawing=on
elif [ "$SENDER" = "mouse.exited" ]; then
  # Hide popup when mouse leaves
  sketchybar --set clock popup.drawing=off
fi

# Format: "Mon Jan 02 15:04 CDT" (24-hour with timezone)
TIME=$(date "+%a %b %d %H:%M %Z")

# UTC time for popup
UTC_TIME=$(TZ=UTC date "+%a %b %d %H:%M UTC")

# Update the clock item and popup with the formatted times
sketchybar --set "$NAME" \
  label="$TIME" \
  --set clock.popup \
  label="$UTC_TIME"
