#!/bin/bash

# Small dmenu script that searches the man page and asked what
# to search and display it using ST terminal

man -k . | awk '{$3="-"; print $0}' | dmenu -b -i -l 20 -p 'Search for:' | awk '{print $2, $1}' | tr -d '()' | xargs tilix -e man 
