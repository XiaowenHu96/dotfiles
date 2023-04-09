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

# Gnome-keyring issue
# Source https://bbs.archlinux.org/viewtopic.php?pid=1640822#p1640822
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# Home screen setting
xrandr --output HDMI-A-0 --primary --mode 3840x2160 --output eDP --same-as HDMI-A-0

# screen lock
xset s on
xset s 1200
xss-lock -- i3lock -S1 -B10  &

picom &

blueman-applet &

# Scaling
# Honour DPI
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# Only steam needs it...
# export GDK_SCALE=2

# ibus input
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
ibus-daemon -drxR

solaar --window=hide &

exec xmonad
