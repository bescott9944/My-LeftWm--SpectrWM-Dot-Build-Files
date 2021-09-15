#!/bin/sh
#relies on curl
#recommend putting this script in a cron job that runs at least once a day.
# My Weather script copied from Linux Dabbler's weather script. 06/25/2020 -Bruce
# Vincennes Text Weather for baraction
# # curl wttr.in/Vincennes,47591?format=j1 | sed 30q > ~/.config/spectrwm/vin-weather.txt
# Washington Text Weather for baraction.
curl wttr.in/washington,47501?format=j1 | sed 30q > ~/.config/spectrwm/wash-weather.txt

