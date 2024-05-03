## kills everything except steam (only gets closed to tray)
# source: https://wiki.hyprland.org/0.23.0beta/Configuring/Uncommon-tips--tricks/

if [[ $(hyprctl activewindow -j | jq -r ".class") == "Steam" ]]; then
    xdotool windowunmap $(xdotool getactivewindow)
else
    hyprctl dispatch killactive ""
fi
