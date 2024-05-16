#!/bin/bash

# Define the directory to save screenshots
save_dir="/home/Magnus/Bilder/Screenshots"

# Generate a unique filename for the screenshot
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
filename="screenshot_$timestamp.png"

grimshot --notify savecopy area "$save_dir/$filename"
