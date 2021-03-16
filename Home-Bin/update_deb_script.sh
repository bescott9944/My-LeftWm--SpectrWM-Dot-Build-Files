#!/bin/bash
# Example Bar Action Script for Linux.
# Requires: acpi, iostat, lm-sensors, aptitude.
# Tested on: Debian Testing
# This config can be found on github.com/linuxdabbler

##############################
#	    UPGRADES
##############################

#upgrades() {
#	upgrades="$(aptitude search '~U' | wc -l)"
#	echo -e " $upgrades "
#}
aptitude search '~U' | wc -l
