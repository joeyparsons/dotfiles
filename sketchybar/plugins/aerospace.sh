#!/bin/bash

# ===== AEROSPACE WORKSPACE INDICATOR =====
# This script highlights the currently active workspace
# It's called when the aerospace_workspace_change event is triggered
#
# Environment variables available:
# - $NAME: The name of the item that called this script (e.g., "space.1")
# - $SENDER: The event that triggered this script (e.g., "aerospace_workspace_change")
# - $FOCUSED_WORKSPACE: The currently focused workspace number (passed from AeroSpace)

# Get the workspace number from the item name (e.g., "space.1" -> "1")
# This is passed as the first argument when the script is called
WORKSPACE_ID="$1"

# Check if this workspace is the currently focused one
if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
  # Highlight: Turn on background drawing to show active workspace
  sketchybar --set "$NAME" \
    background.drawing=on \
    icon.highlight=on
else
  # Unhighlight: Turn off background drawing for inactive workspaces
  sketchybar --set "$NAME" \
    background.drawing=off \
    icon.highlight=off
fi
