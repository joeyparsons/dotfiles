#!/bin/bash

# ===== WEATHER INDICATOR =====
# Shows current weather conditions using wttr.in
# Display: Fahrenheit (hover for Celsius)
#
# Environment variables:
# - $NAME: The item name ("weather")
# - $SENDER: Event that triggered this (mouse.entered, mouse.exited, mouse.clicked)
# - $BUTTON: Which mouse button was clicked
#
# Click to refresh, hover to see Celsius
# Cache file to avoid hammering the API
CACHE_FILE="/tmp/sketchybar_weather_cache"
CACHE_DURATION=1800  # 30 minutes in seconds

# Configuration: Set your location here
# Options: City name, airport code (e.g., "SFO"), or leave empty for auto-detect
LOCATION="78620"  # Change this to your location, e.g., "San Francisco", "SFO", or zip code

# Get weather data from wttr.in (simple format)
# Format: temp_f|temp_c|condition
get_weather() {
  # Build URL with location if specified
  if [ -n "$LOCATION" ]; then
    URL="wttr.in/$LOCATION"
  else
    URL="wttr.in"
  fi

  # Use wttr.in with custom format
  # %t = temperature, %C = condition
  # m=imperial for Fahrenheit, u=metric for Celsius
  RESULT=$(curl -s "$URL?format=%t|%C&m" 2>/dev/null)  # m = imperial (Fahrenheit)
  TEMP_C=$(curl -s "$URL?format=%t&u" 2>/dev/null)     # u = metric (Celsius)
  echo "$RESULT|$TEMP_C"
}

# Handle mouse hover events
if [ "$SENDER" = "mouse.entered" ]; then
  # Show popup on hover
  sketchybar --set weather popup.drawing=on
elif [ "$SENDER" = "mouse.exited" ]; then
  # Hide popup when mouse leaves
  sketchybar --set weather popup.drawing=off
fi

# Check if we need to refresh the cache
SHOULD_REFRESH=false

if [ ! -f "$CACHE_FILE" ]; then
  SHOULD_REFRESH=true
elif [ "$SENDER" = "mouse.clicked" ]; then
  # Refresh on click
  SHOULD_REFRESH=true
else
  # Check cache age
  CACHE_TIME=$(stat -f %m "$CACHE_FILE" 2>/dev/null || echo 0)
  CURRENT_TIME=$(date +%s)
  AGE=$((CURRENT_TIME - CACHE_TIME))

  if [ $AGE -gt $CACHE_DURATION ]; then
    SHOULD_REFRESH=true
  fi
fi

# Fetch or read from cache
if [ "$SHOULD_REFRESH" = true ]; then
  WEATHER_DATA=$(get_weather)
  if [ -n "$WEATHER_DATA" ]; then
    echo "$WEATHER_DATA" > "$CACHE_FILE"
  fi
else
  WEATHER_DATA=$(cat "$CACHE_FILE" 2>/dev/null)
fi

# Parse weather data
if [ -n "$WEATHER_DATA" ]; then
  IFS='|' read -r TEMP_F TEMP_C CONDITION <<< "$WEATHER_DATA"

  # Choose icon based on condition
  case "$CONDITION" in
    *"Clear"*|*"Sunny"*)
      ICON="󰖙"  # Sun
      COLOR=0xffffb86c
      ;;
    *"Partly cloudy"*)
      ICON="󰖕"  # Partly cloudy
      COLOR=0xfff8f8f2
      ;;
    *"Cloudy"*|*"Overcast"*)
      ICON="󰖐"  # Cloudy
      COLOR=0xff8be9fd
      ;;
    *"Rain"*|*"Drizzle"*)
      ICON="󰖗"  # Rain
      COLOR=0xff8be9fd
      ;;
    *"Snow"*)
      ICON="󰖘"  # Snow
      COLOR=0xfff8f8f2
      ;;
    *"Thunder"*|*"Storm"*)
      ICON="󰖓"  # Thunderstorm
      COLOR=0xffbd93f9
      ;;
    *"Fog"*|*"Mist"*)
      ICON="󰖑"  # Fog
      COLOR=0xff6272a4
      ;;
    *)
      ICON="󰖙"
      COLOR=0xffffffff
      ;;
  esac

  LABEL_F="$TEMP_F"
  LABEL_C="$TEMP_C"
else
  # No weather data available
  ICON="󰼯"  # Question mark
  LABEL_F="--"
  LABEL_C="--"
  COLOR=0xff6272a4
fi

# Update the weather item (Fahrenheit) and popup (Celsius)
sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="$LABEL_F" \
  --set weather.popup \
  label="$LABEL_C"
