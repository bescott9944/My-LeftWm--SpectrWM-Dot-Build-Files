#!/bin/bash

#Small dmenu script that asks for a man page
man $(ls /usr/share/man/man1/ | awk -F '.' '{print $1}' | dmenu -b -p "Manual PAGE:")
