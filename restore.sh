wal -R

selected_path=$(cat /home/Magnus/.cache/wal/wal)

sudo python /home/Magnus/code/system/rofi-wallpath-changer.py /home/Magnus/.cache/wal/style-5.rasi $selected_path

sudo python /home/Magnus/code/system/hyprlock-wallpath-changer.py /home/Magnus/.config/hypr/hyprlock.conf $selected_path
