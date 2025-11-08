#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

keymap=pl

# set up displays
# (change to match current setup)
displayl=DP-2
displayl_res=1920x1080
displayl_ref=144
displayr=DP-0
displayr_res=1920x1080
displayr_ref=165

xrandr --output $displayl\
    --mode $displayl_res\
    --refresh $displayl_ref\
    --left-of $displayr
xrandr --output $displayr\
    --mode $displayr_res\
    --refresh $displayr_ref\
    --right-of $displayl

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

# set up keymap just in case
setxkbmap $keymap

# start some nice programs
exec dbus-launch i3

