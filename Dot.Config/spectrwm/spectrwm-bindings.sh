#!/bin/bash

#Linux Dabbler SpectrWm keybinding script to show
# what the key bindings are... 
# NOTE: you will need to set a QURIK in the SpectrWm.conf
# So this will work...
# "quirk[xterm:xterm}                 = FLOAT"

bold=$(tput bold)
normal=$(tput sgr0)

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
NC='\033[0m'

printf ${RED}${bold}" ALT (${GREEN}MoD-Key${RED}${bold}) KEY BINDINGS FOR SPECTRWM\n"${NC}${normal} > $HOME/.config/spectrwm/bindings.txt
grep "=" $HOME/.config/spectrwm/spectrwm.conf | grep bind | awk {'print $1,$3'} | sed 's/ un//g' | sed 's/bind//g' | sed 's/#//g' | sed 's/0//g' | sed 's/=//g' | column >> ~/.config/spectrwm/bindings.txt

 cat ~/.config/spectrwm/bindings.txt

 read

# grep MOD ~/.config/spectrwm/spectrwm.conf | awk {'print $1 " -- " $3'} | sed 's/bind//g' | sed 's/[][]//g' | sed 's/[=]//g' | sed 's/[#]//g' | column >> ~/.config/spectrwm/bindings.txt
#printf ${RED}${bold}" SUPER KEY BINDINGS\n"${NC}${normal} >> ~/.config/spectrwm/bindings.txt
#grep ^bind ~/.config/spectrwm/spectrwm.conf | grep MOD+ | awk {'print $3 " --- " $1'} | sed 's/bind//g' | sed 's/[][]//g' | 
