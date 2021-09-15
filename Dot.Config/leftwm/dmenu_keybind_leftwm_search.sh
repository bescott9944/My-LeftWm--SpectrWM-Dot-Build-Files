#! /bin/bash
# @Zreo's command to show the key binding in Spectrwm fkro Linux Dabblers video!
#https://www.youtube.com/watch?v=orLiGkfPd7s
# Dmenu key binding script for SpectrWm
# grep bind /home/bruce/.config/spectrwm/spectrwm.conf | tail -n +3 | head -n -1 | sed 's/.....//;s/\]//' | column -t | dmenu  -b -i -l 12 -fn font

# This it is for LeftWm
#grep value /home/bruce/.config/leftwm/config.toml | tail -n +3 | head -n -1 | sed 's/.....//;s/\]//' | column -t | dmenu -b  -i -l 12 -fn font


###### NOT WORKING <------- ######### YET <-----!!!!!!

grep value ~/.config/leftwm/config.toml | awk {'print $3 " -- " $4'} | sed 's/bind//g' | sed 's/[][]//g' | sed 's/[=]//g' | sed 's/[#]//g' | column -t | dmenu -b  -i -l 12 -fn font

# [[keybind]]
# command = "Execute"
# value = "/home/bruce/.config/spectrwm/powerspec"
# modifier = ["Control", "Shift"]
# key = "q"

