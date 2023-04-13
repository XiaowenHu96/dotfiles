#!/bin/bash

set -xe

if [ $# -eq 1 ]; then
    coproc (hyprctl dispatch workspace $1 > /dev/null 2>&1)
    exit
fi

# select only non-numerical worksapce name
hyprctl workspaces | sed -n "s/^.*workspace ID -\?[0-9]\+ (\([^0-9]*\)).*$/\1/p"
