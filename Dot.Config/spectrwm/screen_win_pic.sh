#!/bin/bash
#Taking Windowed Screen Shots with Scrot
scrot -u '%m-%d-%Y-%R-w.png' -e 'mv $f /home/bruce/Pictures/shots'
