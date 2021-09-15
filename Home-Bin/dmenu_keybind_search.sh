#! /bin/bash
# @Zreo's command to show the key binding in Spectrwm fkro Linux Dabblers video!
#https://www.youtube.com/watch?v=orLiGkfPd7s
# Dmenu key binding script for SpectrWm
grep bind /home/bruce/.config/spectrwm/spectrwm.conf | tail -n +3 | head -n -1 | sed 's/.....//;s/\]//' | column -t | dmenu  -b -i -l 12 -fn color  
