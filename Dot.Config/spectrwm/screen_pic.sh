#!/bin/bash
#Taking Whole Screen Shots with Scrot
scrot '%m-%d-%Y-%R.png' -e 'mv $f /home/bruce/Pictures/shots'
