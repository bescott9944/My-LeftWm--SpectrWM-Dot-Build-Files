# OTBs Weather script I modofied for me 02-28-2021
#!/bin/bash
weather=$(curl -s wttr.in/Vincennes,47591?format=%t)
printf " %s %s \n" "$weather"
