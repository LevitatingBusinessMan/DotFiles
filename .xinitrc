#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#Disable screenlock
xset s off
xset -dpms
xset s noblank

#My default setup (hori verti)
#~/.screenlayout/code.sh
#~/.screenlayout/single.sh

#start udiskie
#should be handled by systemd now
#udiskie &

#Gaomon tablet
~/config_tablet.sh

# Background color
hsetroot -solid '#777'

# Wish this would work from a kernel param (cpufreq.default_governor=performance)
sudo cpupower frequency-set -g performance

export TERMINAL=alacritty

#start i3
exec i3
