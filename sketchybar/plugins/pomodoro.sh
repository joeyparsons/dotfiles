#!/bin/bash

# ===== POMODORO TIMER =====
# Interactive focus timer using the Pomodoro Technique
# 25 minutes work, 5 minutes break
#
# Environment variables:
# - $NAME: The item name ("pomodoro")
# - $SENDER: Event that triggered this
# - $BUTTON: Which mouse button was clicked (left, right, other)
#
# State file stores: status (idle/running/break), start_time, duration
STATE_FILE="/tmp/sketchybar_pomodoro_state"

# Pomodoro durations in seconds
WORK_DURATION=$((25 * 60))    # 25 minutes
BREAK_DURATION=$((5 * 60))     # 5 minutes

# Initialize state file if it doesn't exist
if [ ! -f "$STATE_FILE" ]; then
  echo "idle|0|0" > "$STATE_FILE"
fi

# Read current state
IFS='|' read -r STATUS START_TIME DURATION < "$STATE_FILE"

# Handle click events
if [ "$SENDER" = "mouse.clicked" ]; then
  if [ "$STATUS" = "idle" ]; then
    # Start work session
    echo "running|$(date +%s)|$WORK_DURATION" > "$STATE_FILE"
    STATUS="running"
    START_TIME=$(date +%s)
    DURATION=$WORK_DURATION
  elif [ "$STATUS" = "running" ] || [ "$STATUS" = "break" ]; then
    # Stop/reset timer
    echo "idle|0|0" > "$STATE_FILE"
    STATUS="idle"
  fi
fi

# Calculate and display based on status
if [ "$STATUS" = "idle" ]; then
  # Idle state - ready to start
  ICON="󱫐"  # Tomato icon (pomodoro)
  LABEL="Start"
  COLOR=0xff9ece6a  # Green

elif [ "$STATUS" = "running" ] || [ "$STATUS" = "break" ]; then
  # Timer running - calculate remaining time
  CURRENT_TIME=$(date +%s)
  ELAPSED=$((CURRENT_TIME - START_TIME))
  REMAINING=$((DURATION - ELAPSED))

  if [ $REMAINING -le 0 ]; then
    # Timer completed
    if [ "$STATUS" = "running" ]; then
      # Work session done, start break
      osascript -e 'display notification "Time for a break!" with title "Pomodoro Complete"'
      echo "break|$(date +%s)|$BREAK_DURATION" > "$STATE_FILE"
      STATUS="break"
      START_TIME=$(date +%s)
      DURATION=$BREAK_DURATION
      REMAINING=$BREAK_DURATION
    else
      # Break done, reset to idle
      osascript -e 'display notification "Break over! Ready for another session?" with title "Break Complete"'
      echo "idle|0|0" > "$STATE_FILE"
      STATUS="idle"
      ICON="󱫐"
      LABEL="Start"
      COLOR=0xff9ece6a
    fi
  fi

  if [ "$STATUS" = "running" ] || [ "$STATUS" = "break" ]; then
    # Format remaining time
    MINUTES=$((REMAINING / 60))
    SECONDS=$((REMAINING % 60))

    if [ "$STATUS" = "running" ]; then
      ICON="󱫐"  # Tomato (working)
      # Color based on time remaining
      if [ $REMAINING -lt 300 ]; then
        COLOR=0xfff7768e  # Red (less than 5 min)
      elif [ $REMAINING -lt 600 ]; then
        COLOR=0xffff9e64  # Orange (less than 10 min)
      else
        COLOR=0xff9ece6a  # Green
      fi
    else
      ICON="󰈐"  # Coffee cup (break)
      COLOR=0xff7aa2f7  # Blue
    fi

    LABEL=$(printf "%02d:%02d" $MINUTES $SECONDS)
  fi
fi

# Update the pomodoro item
sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="$LABEL"
