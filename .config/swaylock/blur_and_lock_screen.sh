#!/bin/bash

ROOT=~/.config/swaylock/
# Modify if multiple monitors are used 
# grim $ROOT/screenshot_0.png
# convert $ROOT/screenshot_0.png -filter Gaussian -blur 0x5 $ROOT/screenshot.png
# swaylock -f -i $ROOT/screenshot.png --indicator-radius 60

# This is swaylock-effect-git, has built-in blur feature and clock
swaylock \
--screenshots \
--indicator \
--clock \
--inside-wrong-color fb4934 \
--line-wrong-color fb4934 \
--ring-wrong-color fb4934  \
--inside-clear-color 8ec07c \
--ring-clear-color 8ec07c \
--line-clear-color 8ec07c \
--inside-ver-color 83a598 \
--ring-ver-color 83a598 \
--line-ver-color 83a598  \
--text-color  fbf1c7 \
--indicator-radius 80 \
--indicator-thickness 16 \
--effect-blur 9x9 \
--ring-color 32302f \
--key-hl-color d3869b \
--line-color 32302f \
--inside-color 32302f \
--separator-color 00000000 \
--fade-in 0.15 &
