shaders="/usr/share/hyprshade/shaders"

selected=$((echo "off" && ls "$shaders") | sed 's/\.[^.]*$//' | rofi -dmenu -i -p "Select a file")

if [ "$selected" == "off" ]; then
  hyprshade off
  exit 0
fi

echo $selected
hyprshade toggle $selected
