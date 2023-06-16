#!/bin/bash

ROOT=~/.config/swaylock/
# Modify if multiple monitors are used 
grim $ROOT/screenshot_0.png
convert $ROOT/screenshot_0.png -filter Gaussian -blur 0x5 $ROOT/screenshot.png
swaylock -f -i $ROOT/screenshot.png --indicator-radius 60
