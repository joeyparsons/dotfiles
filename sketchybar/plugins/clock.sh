#!/bin/bash

# ===== CLOCK DISPLAY =====
# Shows current time and date
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

# Format: "Mon Jan 02 03:04 PM"
TIME=$(date "+%a %b %d %I:%M %p")

# Update the clock item with the formatted time
sketchybar --set "$NAME" label="$TIME"
