#!/bin/bash

# ===== RAM USAGE INDICATOR =====
# Shows current RAM/memory usage percentage
#
# Environment variables:
# - $NAME: The item name ("ram")
# - $SENDER: Event that triggered this (routine update)

# Get memory info using vm_stat and calculate usage percentage
# Page size is typically 4096 bytes on macOS
PAGE_SIZE=$(pagesize)

# Get memory statistics
VM_STAT=$(vm_stat)

# Extract pages free and pages used
PAGES_FREE=$(echo "$VM_STAT" | grep "Pages free" | awk '{print $3}' | sed 's/\.//')
PAGES_ACTIVE=$(echo "$VM_STAT" | grep "Pages active" | awk '{print $3}' | sed 's/\.//')
PAGES_INACTIVE=$(echo "$VM_STAT" | grep "Pages inactive" | awk '{print $3}' | sed 's/\.//')
PAGES_SPECULATIVE=$(echo "$VM_STAT" | grep "Pages speculative" | awk '{print $3}' | sed 's/\.//')
PAGES_WIRED=$(echo "$VM_STAT" | grep "Pages wired down" | awk '{print $4}' | sed 's/\.//')
PAGES_COMPRESSED=$(echo "$VM_STAT" | grep "Pages occupied by compressor" | awk '{print $5}' | sed 's/\.//')

# Calculate memory used (active + wired + compressed)
PAGES_USED=$((PAGES_ACTIVE + PAGES_WIRED + PAGES_COMPRESSED))

# Calculate total memory (used + free + inactive + speculative)
PAGES_TOTAL=$((PAGES_USED + PAGES_FREE + PAGES_INACTIVE + PAGES_SPECULATIVE))

# Calculate usage percentage
if [ "$PAGES_TOTAL" -gt 0 ]; then
  RAM_PERCENT=$((PAGES_USED * 100 / PAGES_TOTAL))
else
  RAM_PERCENT=0
fi

# Choose color based on usage
if [ "$RAM_PERCENT" -gt 80 ]; then
  COLOR=0xfff7768e  # Red (high usage)
elif [ "$RAM_PERCENT" -gt 60 ]; then
  COLOR=0xffff9e64  # Orange (moderate usage)
else
  COLOR=0xff9ece6a  # Green (low usage)
fi

# Update the RAM item
sketchybar --set "$NAME" \
  icon="󰍛" \
  icon.color="$COLOR" \
  label="${RAM_PERCENT}%"
