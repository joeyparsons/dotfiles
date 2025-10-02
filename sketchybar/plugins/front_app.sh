#!/bin/bash

# ===== FRONT APP DISPLAY =====
# Shows the name of the currently focused application
#
# Environment variables:
# - $NAME: The item name ("front_app")
# - $SENDER: The event that triggered this ("front_app_switched")
# - $INFO: The name of the front application (provided by SketchyBar)

# Update the label to show the current app name
# $INFO contains the application name from the front_app_switched event
sketchybar --set "$NAME" label="$INFO"
