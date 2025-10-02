#!/bin/bash

# ===== WIFI INDICATOR =====
# Shows WiFi connection status and network name (SSID)
#
# Environment variables:
# - $NAME: The item name ("wifi")
# - $SENDER: Event that triggered this (wifi_change or routine update)
# - $INFO: The WiFi SSID on wifi_change event (empty on disconnect)
#
# Note: wifi_change event doesn't work on macOS Sonoma+, so we use update_freq instead
# Note: macOS Sequoia 15+ broke networksetup and airport commands for SSID detection

# Try multiple methods to get WiFi SSID (macOS Sequoia compatible)
# Method 1: ipconfig (works on Sequoia 15+, fastest)
SSID=$(ipconfig getsummary en0 2>/dev/null | awk -F ' SSID : ' '/ SSID : / {print $2}')

# Method 2: system_profiler (slower but reliable fallback)
if [ -z "$SSID" ]; then
  SSID=$(system_profiler SPAirPortDataType -detailLevel basic 2>/dev/null | awk -F': ' '/Current Network/ {getline; gsub(/^[ \t]+|:$/, "", $2); print $2; exit}')
fi

# Method 3: Check if we're on Ethernet instead
if [ -z "$SSID" ]; then
  # Check if any Ethernet interface is active
  if ifconfig en1 2>/dev/null | grep -q "status: active" || \
     ifconfig en2 2>/dev/null | grep -q "status: active" || \
     ifconfig en3 2>/dev/null | grep -q "status: active"; then
    ICON="󰈀"  # Nerd Font Ethernet icon
    COLOR=0xff9ece6a  # Green (connected)
    LABEL="Ethernet"
  else
    # No connection found
    ICON="󰖪"  # Nerd Font WiFi off icon
    COLOR=0xfff7768e  # Red (disconnected)
    LABEL="No Network"
  fi
else
  # WiFi connected
  ICON="󰖨"  # Nerd Font WiFi icon
  COLOR=0xff9ece6a  # Green (connected)
  LABEL="$SSID"
fi

# Update the wifi item
sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="$LABEL" \
  click_script="open x-apple.systempreferences:com.apple.Network-Settings.extension"
