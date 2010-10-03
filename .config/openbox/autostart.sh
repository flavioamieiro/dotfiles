. $GLOBALAUTOSTART
#xcompmgr &
#pypanel &
(sleep 2 && conky &)
. $HOME/.fehbg &
tint2 -c ~/.tint2rc &
eval $(ssh-agent)
/usr/bin/xscreensaver -no-splash &
