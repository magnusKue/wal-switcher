this repo contains all the little scripts used in my arch system, including my solution for a live pywal updater for a bunch of programms. 

Here is how i did it:
Dunst - generate a template config file for pywal and use it from pywals cache by restarting with the -c launch arg
Hyprland - Use sed to edit the config. This should apply live as Hyprland uses a Filewatcher.
Spicetify - Start Spotify using "spicetify watch" (here: launchtify.sh) to enable the filewatcher for colors.ini. This way you can also jsut use sed.
GTK Themes - Generate custom variations of the oomox color theme using the script provided by its creators 
Firefox - Use the pywal plugin
VScode - Use the pywal plugin

Here is how the the live updates look: ![Reddit](https://www.reddit.com/r/unixporn/comments/1chv3tr/hyprland_everything_pywal/)
