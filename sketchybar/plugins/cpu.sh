#!/bin/bash

# ===== CPU USAGE INDICATOR =====
# Shows current CPU usage percentage
#
# Environment variables:
# - $NAME: The item name ("cpu")
# - $SENDER: Event that triggered this (routine update)

# Get CPU usage using top command
# Sample output: "CPU usage: 12.34% user, 5.67% sys, 81.99% idle"
CPU_USAGE=$(top -l 2 -n 0 -F -R -stats pid | grep "CPU usage" | tail -1 | awk '{print $3}' | sed 's/%//')

# If we got a valid number, format it
if [ -n "$CPU_USAGE" ]; then
  # Round to integer
  CPU_INT=$(printf "%.0f" "$CPU_USAGE")

  # Choose color based on usage
  if [ "$CPU_INT" -gt 80 ]; then
    COLOR=0xfff7768e  # Red (high usage)
  elif [ "$CPU_INT" -gt 50 ]; then
    COLOR=0xffff9e64  # Orange (moderate usage)
  else
    COLOR=0xff9ece6a  # Green (low usage)
  fi
else
  CPU_INT="0"
  COLOR=0xffffffff
fi

# Update the CPU item
sketchybar --set "$NAME" \
  icon="󰻠" \
  icon.color="$COLOR" \
  label="${CPU_INT}%"
