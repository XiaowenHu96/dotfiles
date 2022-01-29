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

# screen lock
xset s on
xset s 1200
xss-lock -- i3lock -i /home/xiaowen/wallpapers/space.png -L &

picom &

# Important! must source in this file and before starting wm
# https://wiki.archlinux.org/title/fcitx
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
# export QT_STYLE_OVERRIDE=Kvantum


# QT theme setting also need to be set before WM
# Arch linux, set Qt5 to use gtk2 theme. (GTK and QT apps use different theme)
# Require qt5-styleplugins, see detail
# https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications#Theme_engines
# export QT_QPA_PLATFORMTHEME=qt5ct

# Set qt5 to use Kvantum theme (which is a wrapper theme based on your choice)
# In Kvantum engine, install the theme you like and apply
export QT_STYLE_OVERRIDE=Kvantum

ibus-daemon -drxR
# to use ibus-rime in wine, ibus-daemon -drxR --xim
exec xmonad
