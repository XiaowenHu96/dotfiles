#!/usr/bin/env bash

# Output a format that can be recognized by xmobar.
# Depends on the OS, output os logo and its color.
# Logo (most likely) needs nerd font support.

# Necessary to put a space after logo if using mono space 
manjaro_color=#34be5b
manjaro="\uf312 "
archlinux_color=#1793d0
archlinux="\xf303 "

if [[ -f /etc/os-release || \
      -f /usr/lib/os-release || \
      -f /etc/lsb-release ]]; then
    
    # Source env variable from files.
    for file in /usr/lib/os-release /etc/os-release \
                /etc/lsb-release; do
        source "$file" && break
    done
    
    # {val:-default}. Choose a value, or if null, use default.
    os_name="${NAME:-${DISTRIB_ID}}"

    # Give logo with color
    case  $os_name in
        "Manjaro"*) printf "<fc=$manjaro_color>$manjaro</fc>" ;;
        "Arch"*) printf "<fc=$archlinux_color>$archlinux</fc>" ;;
    esac
fi
