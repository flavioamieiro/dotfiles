xset -b #Desativa beep do buzzer no X
xset b off
xset +fp /home/amieiro/.local/share/fonts
xset fp rehash
exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) openbox-session
