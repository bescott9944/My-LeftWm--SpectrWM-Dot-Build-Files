#!/bin/bash

# show welcome message for actual terminal in use
echo "Welcome.  You are attempting to use"
echo ""
 which $(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$))J
echo ""
echo "Good Luck and God Speed."
