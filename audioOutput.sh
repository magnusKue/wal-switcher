#!/bin/bash

# Get available sink names
sink_names=$(pactl list short sinks | awk '{split($2, a, "."); print a[length(a)]}')

# Prompt user to select a sink
selected_sink=$(echo "$sink_names" | rofi -dmenu -p "Select audio output")

# Get the full name of the selected sink
full_sink_name=$(pactl list short sinks | awk -v selected="$selected_sink" '{split($2, a, "."); if (a[length(a)] == selected) {print $2}}')

# Get the index of the selected sink
sink_index=$(pactl list short sinks | awk -v selected="$full_sink_name" '$2 == selected {print $1}')

# Set the selected sink as the default
if [ -n "$sink_index" ]; then
    pactl set-default-sink "$sink_index"
    notify-send "Audio output set to $selected_sink"
else
    notify-send "No audio output selected"
fi

