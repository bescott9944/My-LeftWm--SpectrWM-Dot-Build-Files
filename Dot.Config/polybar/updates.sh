#!/bin/sh
#update for Arch

updatesarch="$(checkupdates 2> /dev/null | wc -l)"
updatesaur="$(yay -Qum 2> /dev/null | wc -l)"
updates=$(("$updatesarch" + "$updatesaur"))
printf " %s %s \\n" "$updates"

