#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#
## Available Styles
#
## style-1   style-2   style-3   style-4   style-5
## style-6   style-7   style-8   style-9   style-10

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-2"
theme='style-1'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
speaker='󰓃 '
speaker='󰴸 '
headphones=' '
bluetooth=' '
# bluetooth='󰥰 ' 

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
		-me-accept-entry "MousePrimary" \
		-me-select-entry "MouseDPrimary" \
		-click-to-exit \
		-theme-str 'window {location: west; anchor: west; fullscreen: false; width: 80px; x-offset: 4px;}' \
		-theme-str 'listview {columns: 1; lines: 3;}' \
		-theme-str 'element-text {horizontal-alignment: 3.0;}' \
		-theme /usr/share/rofi/themes/ssmenu.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 3; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme /usr/share/rofi/themes/ssmenu.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$headphones\n$speaker\n$bluetooth" | rofi_cmd
}


# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $headphones)
        	pactl set-default-sink "alsa_output.pci-0000_0b_00.3.pro-output-0"
		notify-send -u low "Default audio sink set to HEADPHONES"
	;;
    $speaker)
        	pactl set-default-sink "alsa_output.pci-0000_09_00.1.hdmi-stereo-extra4"
		notify-send -u low "Default audio sink set to HDMI"
        ;;
    $bluetooth)
	    	pactl set-default-sink "bluez_output.80_C3_BA_59_9C_54.1"
		notify-send -u low "Default audio sink set to Bluez"
	;;
esac
