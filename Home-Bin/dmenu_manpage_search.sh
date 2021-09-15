#!/bin/bash

# Small dmenu script that searches the man page and asked what
# to search and display it using terminal

man $(ls /usr/share/man/man1/ | awk -F '.' '{print $1}' | dmenu -b -p "Manual PAGE:")
