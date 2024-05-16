#!/bin/bash

# Update package repositories
echo "Updating package repositories..."
sudo pacman -Sy

# Perform system upgrade
echo "Upgrading system..."
sudo pacman -Su --noconfirm

# Remove orphaned packages
echo "Removing orphaned packages..."
sudo pacman -Rns --noconfirm $(pacman -Qdtq)

# Clean package cache
echo "Cleaning package cache..."
sudo pacman -Sc --noconfirm

# Optional: AUR package manager (yay) update
if command -v yay &> /dev/null; then
    echo "Updating AUR packages..."
    yay -Syu --noconfirm
fi

echo "System update completed!"

