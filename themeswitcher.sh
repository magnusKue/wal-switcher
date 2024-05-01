#!/bin/bash

directory="/home/Magnus/Pictures/wallpapers"

items=$(ls /home/Magnus/Pictures/wallpapers/)

selected=$(echo "$items" | rofi -dmenu -p "Select an item:")

if [ -n "$selected" ]; then
	selected_path="$directory/$selected"
	echo "$selected_path"
else
	echo "No item selected."
fi

###### INITIATE ANIMATION ---------------------------------------------

## change wallpaper
swww img "$selected_path" --transition-type center &

## kill dunst
killall dunst

sleep 1.5 # wait for wallpaper animation

##### MAKE COLORS ------------------------------------------------------

wal -i "$selected_path" -n

source /home/Magnus/.cache/wal/colors.sh

# define highlight colors
hl="${color6:1}"
hl2="${color4:1}"
hlt="ff0000"

filename=$(basename "$selected_path")
filetitle="${filename%.*}"

#### --------------------------------------------------------------------


### UPDATE

pywalfox update

### Hyprland
sed -i "s/^    col.active_border =.*/    col.active_border = rgba(${color7:1}ff) rgba(${color4:1}ff) 90deg/" /home/Magnus/.config/hypr/hyprland.conf
sed -i "s/^    col.inactive_border =.*/    col.inactive_border = rgba(${color2:1}aa)" /home/Magnus/.config/hypr/hyprland.conf

## Edit Spicetify theme

sed -i "/^main[[:space:]]*=/s/=.*/= ${background:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^sidebar[[:space:]]*=/s/=.*/= ${background:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^nav-active-text[[:space:]]*=/s/=.*/= ${background:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^main-secondary[[:space:]]*=/s/=.*/= ${background:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^player[[:space:]]*=/s/=.*/= ${background:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^subtext[[:space:]]*=/s/=.*/= ${foreground:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^playback-bar[[:space:]]*=/s/=.*/= ${hl2}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^play-button[[:space:]]*=/s/=.*/= ${hl2}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^nav-active-text[[:space:]]*=/s/=.*/= ${background:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^text[[:space:]]*=/s/=.*/= ${hl}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^button[[:space:]]*=/s/=.*/= ${hl2}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^button-secondary[[:space:]]*=/s/=.*/= ${hl}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^button-active[[:space:]]*=/s/=.*/= ${hl2}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^card[[:space:]]*=/s/=.*/= ${background:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^shadow[[:space:]]*=/s/=.*/= ${background:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^nav-active[[:space:]]*=/s/=.*/= ${color5:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^tab-active[[:space:]]*=/s/=.*/= ${background:1}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^notfication[[:space:]]*=/s/=.*/= ${hl}/" ~/.config/spicetify/Themes/Sleek/color.ini
sed -i "/^misc[[:space:]]*=/s/=.*/= ${color6:1}/" ~/.config/spicetify/Themes/Sleek/color.ini

## restart dunst
dunst -conf ~/.cache/wal/dunstrc &

## Generate GTK-Theme if not cached yet
if [ ! -d "/home/Magnus/.themes/${filetitle}" ] || [ "$1" = "-R" ]; then
	/home/Magnus/apps/oomox-gtk-theme/change_color.sh -o "$filetitle" <(echo -e "BG=${background:1}\nBTN_BG=${background:1}\nBTN_FG=${foreground:1}\nFG=${foreground:1}\nGRADIENT=0.0\nHDR_BTN_BG=FF0000\nHDR_BTN_FG=0e0021\nHDR_BG=${hl2}\nHDR_FG=${foreground:1}\nROUNDNESS=4\nSEL_BG=${hl}\nSEL_FG=000000\nSPACING=3\nTXT_BG=${background:1}\nTXT_FG=${foreground:1}\nWM_BORDER_FOCUS=9edc60\nWM_BORDER_UNFOCUS=0e0021\n")
else
	echo "gtk-theme found at /home/Magnus/.themes/${filetitle} => skipping regeneration"
fi

## Apply GTK-Theme
sed -i "s/^gtk-theme-name=.*/gtk-theme-name=${filetitle}/" "/home/Magnus/.config/gtk-3.0/settings.ini"
/home/Magnus/code/gtk-themeswitcher.sh

dunstify -u low -r 2354 Theme updated
