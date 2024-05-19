#!/bin/bash

# this script loops through all images in a provided directory and converts webp to png images

# Check if ImageMagick is installed
command -v convert >/dev/null 2>&1 || { echo >&2 "ImageMagick is required but not installed. Aborting."; exit 1; }

# Check if a directory is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Check if the provided directory exists
if [ ! -d "$1" ]; then
    echo "Directory '$1' does not exist."
    exit 1
fi

# Loop through all files in the directory
for file in "$1"/*.webp; do
    # Check if file is a .webp image
    if [ -f "$file" ]; then
        
	# Convert .webp to .png
        output_file="${file%.webp}.png"
	
	dunstify -u low "Converting $file to PNG..."
        echo "Converting $file to PNG..."
        
	convert "$file" "$output_file"
        
        
	# Delete the original .webp file
        rm "$file"
	
	dunstify -u low "Deleted $file"
        echo "Deleted $file"
    fi
done

echo "Conversion and cleanup complete."

