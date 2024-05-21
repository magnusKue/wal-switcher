#!/bin/bash

killall rofi
sleep 0.5

# Define the directory to save screenshots
save_dir="/home/Magnus/Bilder/Screenshots"

# Generate a unique filename for the screenshot
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
filename="screenshot_$timestamp.png"
if [[ " $@ " =~ " -f " ]]; then
	grimshot --notify savecopy screen "$save_dir/$filename"
fi

if [[ " $@ " =~ " -a " ]]; then
	grimshot --notify savecopy area "$save_dir/$filename"
fi
