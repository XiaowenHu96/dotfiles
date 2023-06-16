#!/bin/bash

not_in_group=$(hyprctl activewindow | grep -c "grouped: 0")
## for toggle (t)
## if is not a group, make it a group and lock it.
## Otherwise, close the group
if [ $1 = 't' ]; then
    hyprctl dispatch togglegroup
    if [ $not_in_group -eq 1 ]; then
        hyprctl dispatch lockgroups lock
    fi
fi

## for movements:
## If in a active group, switch tabpage. Otherwise, move window to group in direction.
# if $1 is one of the 'lrud', then print OK
if [[ $1 =~ [lrud] ]]; then
    if [ $not_in_group -eq 1 ]; then
        hyprctl dispatch moveintogroup $1
    else
        if [ $1 = 'r' ]; then
            hyprctl dispatch changegroupactive f
        fi
        if [ $1 = 'l' ]; then
            hyprctl dispatch changegroupactive b
        fi
    fi
fi
