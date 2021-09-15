#!/bin/bash
###################################################################### 
#Copyright (C) 2021  Kris Occhipinti
#https://filmsbykris.com
#
#Requirments: Needs JQ to be installed from your repo to work!
#07/14/2021 -Bruce E. Scott
#
# Edited by & For Bruce E. Scott  07/15/2021
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRA#!/bin/bash
###################################################################### 
#Copyright (C) 2021  Kris Occhipinti
#https://filmsbykris.com
#
#This program is free software: you can redistribute it and/or modify
#it under the terms ofcense for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# The Default-> wget -qO- http://wttr.in/?format=j1
#
# Below are mine for my lodation... -Bruce 07/14/2021
# wget -qO- http://wttr.in/vincennes,47591\?format\=j1
# wget -qO- http://wttr.in/Vincennes,47591\?format=j1 | jq -r ."current_condition[0] | .temp_F"
#
# Use this on the server for the TXT file... /N-1-MD-500-Sata/Master-Documents
###################################################################### 

url="http://wttr.in/Vincennes,47591\?format=j1"
json="$(wget -qO- "$url")"
today=$(date +"%B %e, %G - %l:%M:%S %P")

#color library
default=`echo -en "\e[39m"`
red=`echo -en "\e[31m"`
orange=`echo -en "\e[33m"`
blue=`echo -en "\e[34m"`
gray=`echo -en "\e[30m"`

bold=`echo -en "\e[1m"`
normal=`echo -en "\e[0m"`

temp=$(echo $json|jq -r ."current_condition[0]|(.temp_F)")
humidity=$(echo $json|jq -r ."current_condition[0]|(.humidity)")
description=$(echo $json|jq -r ."current_condition[0]|(.weatherDesc[0].value)")
Feels=$(echo $json|jq -r ."current_condition[0]|(.FeelsLikeF)")
#icon=$(echo $json|jq -r ."current_condition[0]|(.wweatherIconUr[0].value)")

if [[ ${temp} > 90 ]]
then
  color=${red}
elif [[ ${temp} > 75 ]]
then
  color=${orange}
elif [[ ${temp} < 50 ]]
then
  color=${blue}
else
  color=""
fi

if [[ ${Feels} > 90 ]]
then
  color1=${red}
elif [[ ${Feels} > 75 ]]
then
  color1=${orange}
elif [[ ${Feels} < 50 ]]
then
  color1=${blue}
else
  color1=""
fi

if [[ ${humidity} > 70 ]]
then
  color2=${red}
elif [[ ${humidity} > 45 ]]
then
  color2=${orange}
elif [[ ${humidity} < 30 ]]
then
  color2=${blue}
else
  color2=""
fi

echo "It is currently ${bold}${description}${normal}"
echo "${color}Temperature: ${temp}℉ ${default}"
echo "It Feels Like: ${color1}${Feels}℉ ${default}"
echo "The Humidity is: ${color2}${humidity}%"
echo "${gray}File Created on: $today"
#echo "${icon}"

