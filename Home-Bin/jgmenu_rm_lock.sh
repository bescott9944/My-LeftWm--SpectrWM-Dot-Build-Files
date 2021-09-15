#!/bin/bash
# A Bash Script to remove JgMenu Lock file in "/home"
#jgmenu

if [[ -f ~/.jgmenu-lockfile ]]; then
    rm ~/.jgmenu-lockfile &> /dev/null
fi
jgmenu

#>/dev/null 2>&1
