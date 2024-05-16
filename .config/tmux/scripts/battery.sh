#!/usr/bin/env bash

# Fetch the current battery percentage on macOS
battery_percentage=$(pmset -g batt | grep -Eo "\d+%")
# Output the battery percentage
echo $battery_percentage
