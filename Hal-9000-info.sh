#!/bin/bash
#
#####################################################################
# <<<---================}[ Hal-9000-info.sh ]{================--->>>
# Script Name   : Hal-9000-Info.sh v.1.3.2
# Description   : Displays System and IP Network information
# Dependencies  : awk, ip, nmcli, wget, dmidecode, awk, grep, hdpram, lsblk, inxi, network-tools
# Arguments     : Version: -v, Help: -h
# Author        : Bruce E. Scott, 03 April 2019
# Started On    : 12 April 12:44 p.m. EST 2019 v.0.3 Beta
# Last Change   : 05 September 10:15 p.m. EST 2021
# Author E-Mail : bescott9944@gmail.com
# Author GitHub : https://github.com/bescott9944
# Auther Gitlab : https://gitlab.com/bescott9944
# Linux Forms   : I can be reached at https://www.ezeelinux.com/talk/index.php (bescott9944)
# Comment 1.    : v.0.3 script concept and building.. Current Version is v.1.3.2 -Bruce - 08/31/2021
# Comment 2.    : Requires root/sudo privileges
# Note          : dmidecode may produce error messages on some systems. They can be
#                safely ignored and removed from file with any text editor.
#
#####################################################################
#          -->> Knowen Issues <<--
#
# 1. On some sustems you will get this Error at the top of the Terminal screen:
# (df: /run/user/1000/doc: Operation not permitted) This can be ignored it is a
# Permission issue with the group. I added (sudo) to the command this should help!
#
# 2. The INXI errors can also be dimissed as there path checking errors of the script
# That I need to fix so they do not show up in the terminal...
#
#####################################################################
#
#####################################################################
#       <---> "ABOUT Hal-9000-Info v.1.3.2" <--->
#####################################################################
#
#                   The Purpose:
# The purpose of the script is togather system information for 
# help forum's to assist in fixing issues with your OS and/or your hardware.
# alot of the work. I also gotsome of the commands from the 2 "Snippet Scripts"
# of Richard's which do I found other commands from various scripts and forum posts
# which do most of the work and I add some of my own to make up this full
# script. The script will displays information on screen and to a file
# in your /home/your-name under the file name of the system "XXXXX.stat"...
# I merged all the scripts and commands to make it all work in this one script...
# I also wrote some of the code myself and modified a lot of it for better output.
#                                            Copyright (C) 2019, by Bruce E. Scott
#
####################################################################
#
# ----> Richard Romig Scriptes that were used.. <----
#
# A BIG Thanks goes out to Richard Romig for his 2 scripts.
#               # Mystat.sh is based on these fantastic scripts...
# sysinfo.sh    # The 2 scripts were written and
# ipinfo.sh     # Copyright (C) in 2018 by Richard Romig
#		        # Email: rick.romig@gmail.com
#----------------------------------------
# A BIG Thanks goes out to Leon.P for his Hdd Function for the script.
# The function list all the hard drives and there information for the output
# for the script.... Thank You very Much!! Leon.P
# He can be reached at https://www.ezeelinux.com/talk/index.php
# Web: https://leon-plickat.org/
#----------------------------------------
#
# ----> Terminalforlife Scriptes that were used.. <----
# GitHub:https://github.com/terminalforlife
# I would like to thank terminalforlife for the use of his scripts
# and functions, Error checking, and other misc things that I swipped...
# Tyler is a great teacher of Bash Scripting so give him a watch at his
# YouTube channel... https://www.youtube.com/channel/UCfp-lNJy4QkIGnaEE6NtDSg
# Email: terminalforlife@yahoo.com
#
####################################################################
#
#            <<====> ( GNU General Public License )<====>>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program. If not, see <https://www.gnu.org/licenses/>.
####################################################################
#
# v.0.3 Beta Change log. 04/12/2019
# Script concept and start building and Planing.. -Bruce
#----------------------------------------
# v.0.3 Beta Change log. 05/10/19
# <--( inxi -c0 -Fxzd )-->
# I added the "inxi -c0 -Fxzd" command to get another set information that has the Mobo -Bruce
# NOTE: This decision led to some issues later in the Change log -Bruce
#----------------------------------------
# I pulled all the commands from the 2 above "Snippet Scripts" which do most of the work
# and I add my own to make up this full script. This script displays the information on screen
# and a file in your /home/your-name under the name of the system "XXXXX.stat"...
# I merged all the scripts and commands to make it all work... :D --Bruce E. Scott
#----------------------------------------
# v.0.4 Beta Change log. 05/22/2019
# After a bunch of changes and testing we moved the Version to v.1.0 -Bruce
#----------------------------------------
# v.1.0 change log 6/03/29
# Today I moved the script from Beta to a working version of v.1.0 -Bruce
#----------------------------------------
# v.1.0 Change log. 6/14/19
# Added new commands for the IP. Inxi, and document updates. Fixed bugs in the command
# structure. Various other small changes and fixes....
# 6/14/19 added the path to "inxi" so that it would not rely on the $PATH
# to function...
#----------------------------------------
# NOTE::: 6/14/19  <----"TO DO"----> ???
# You need to changed the ("nmcli dev" an "print $1" to $6) variables so it will would read
# "Active" Nic cards in a 2 Nic card system..... Like this...
#
#  ethint=$(nmcli dev | grep 'ethernet' | awk '{print $1}')
#  ethint=$(nmcli con show --active | grep 'ethernet' | awk '{print $6}')
#  ethint=$(nmcli dev | grep 'ethernet' | awk '{print $1,$3}' to get -->($1)enp2s0  ($3)connected
#-----------------------------------------------------------------------------------
#   wifint=$(nmcli dev | grep 'wifi' | awk '{print $6}')
#   wifint=$(nmcli dev | grep 'wifi' | awk '{print $1}') ##  Changed the $1 to $6... -Bruce
#----------------------------------------
# v1.0.2 change log. 6/16/19
# Hard drive function section added today!
# A BIG Thanks goes out to Leon.P for his Hdd Function for the script.
# The function list all the hard drives and there information for the output
# for the script.... Thank You very Much!! Leon.P
# The inxi section is still flaky... -Bruce
#----------------------------------------
# v1.0.3 Change log. 6/17/19
# Added more Computer Information variables and commands so that
# the board info is pilled with dmidecode command. Created new output
# variables for the information so that is can be displayed on the screen.
# I added the same for the Bios/vendor too..
# --> Note:  On some Distro's "hdpram" is not installed by default.
# You will have to install it for this section to function...
# still dealing with inxi not always working on various Distro's --Bruce E. Scott
#----------------------------------------
# v1.0.3 Change log. 7/04/19
# Made several changes today. I moved all the variables to the top o the script
# for similarity.
# I have found that for some reason this script will not run in a folder that is
# in the $PATH statement on MX & Manjaro Arch Distro's. Works fine on other Debian/Ubuntu Distro's...
# Someday I will figure it out. I is a issue with "INXI". In the script and in the $PATH, the
# script gets stuck in a loop on the "INXI" command in the script and will run until the
# system crashes..... One has to use the key combo "Ctrl + C" to exit the script... -Bruce
#----------------------------------------
# v1.0.3 Update log 8/11/19
# Manjaro and MX Linux sometimes has issues running the inxi
# command at times. Sometimes it works and sometime it hangs on inxi
# and starts to eat CPU time and Memory until the system will crash!
# You will have to watch and see if the screen hangs for along time
# at a blank screen with a flashing cursor! Amy more that 5 seconds
# you will have to hit the " CTRL + C " to stop the script!
# I have not figured it out yet... -Bruce
#----------------------------------------
# v1.0.3 Change log. 8/18/19
# Finely give up a week ago and made a ~/home/bin/info to store
# the main Mystat-system_name file and place a mystat like mystatMX or mystatDF for Defiant
# this is the only thing I know to do as INXI is still hanging on every Distro but Mint 18.3...
# I did this on all the box's till I get the $PATH issue sorted out, So far
# the EzeeTalk forum has been stumped too! --Bruce
#----------------------------------------
# v1.0.3 Change Log. 8/18/19 - 8/19/19
# Deck_luck on EzeeTalk.com offered some of his time to help fix the INXI hanging in a loop.
# He's trying to figure out the issue!
# I sent Deck_luck the master script and all the information on all the Distro's
# with there Version numbers for INXI. Also sent all the .bashrc's from all of the Distro's...
# Thanks Deck_luck! -Bruce
#----------------------------------------
# v1.0.3 Change Log. 8/20/19
# On 8/20/19 Deck_luck on EzeeTalk.com came up with this small script that fix's
# the INXI command from hanging and getting caught in a loop on any INXI v2.3.x.x-00
# or higher! There is a bug in the newer versions that keep calling the parent --version.
# Deck_luck sent a bug report tot he Dev and the Dev said that it was a "child corner bug"
# and closed the bug report even after Deck_luck sent his the process, scripts, the fix and the
# Dev is a bit of a but...
# Thank you Deck_luck for your time and the fix! -Bruce
#----------------------------------------
# v1.0.3 Change log. 8/25/19
# After several days of testing the Mystat script with Deck_luck's fix for the INXI
# hanging issues and further testing on all the Distro's I have on Hardware, also on some
# VM's I can say that is is fixed and works as intended... The script has been tested on
# Mint 18.3 - 19.2, Manjaro, Linux-MX, Peppermint 10 as well sever Disto's in VM's.... -Bruce
#----------------------------------------
# v1.0.3 Change log. 8/26/19
# I have decided to raise the Version Number to v1.2.0....
# I do not see any issues at this time..... -Bruce
#----------------------------------------
# v1.2.1 Change Log 09/17/2019
# I Split the AWK command into 2 AWK commands to get a
# better "Gateway and Adapter" information for the Network...
#
# I Added the "AWK Output" to the Network Section to change the IP Router Information..
#
# I also added NEW "Other HDD Information:" to get more and better HDD information...
# I also Added VENDOR, UUID information to the"lsblk" to the Hard drive Section...
# I also added the "df -h" to the Hard drive Information Section for more information...
###
# I also made a bunch of Line and Display output Changes so that
# the STDOUT look better. Version Number updated too...v.1.2.2   -Bruce
#----------------------------------------
# v.1.2.2 Change Log 09/19/19
# Battery Interfaces
#----------------------------------------
# I fixed The Battery Display option when script is Ran on a Laptop
# so that the information is correct. Was never checked on my Laptop
# until today.
# Also added the ( printf "%s\n" "Battery Information:") to the output, it did not have one
# Things to do; write the code to show when the "AC" power is plugged in and it is charging... 09/19/2019/ -Bruce
#----------------------------------------
# Changed the AWK output to read the "IP4.GATEWAY to get a better IP output
# because some Distro's do not use the IP$.DNS, like Ubuntu Server 18.04. I checked Mint 18.3,
# X 18.3, Manjaro, Peppermint 10. So this should be good for now... 09/20/2019 -Bruce
#----------------------------------------
# v.1.2.2 Change Log 09/20/19
# I went through all the code and found that there was 2 of the same "variables" that were in separate areas
# along with others from the "Coping and Pasting" of all the scripts together. Most were not causing any issues
# but the 2 variables were making some issues on Ubuntu Server.
# So I moved all the script variables to the top of the script to the "Base variables" section so that
# they are all together and streamlines the Code... -Bruce
#----------------------------------------
# v.1.2.2 Change Log 09/20/19
# I am now checking and testing the script on Mint 18.3 / 19.2, MX-18.3, Manjaro 18.04,
# Ubuntu Server 18.04 Distro's. This is done to check "Portability" of the script.....
# Also worked on some working and added some fancy ASCII art stuff to make the output pretty!
# Started testing on laptops to see IF the Wifi and battery section reports correctly as I never
# checked these functions....                                                                       -Bruce
#----------------------------------------
# v.1.2.2 Change Log 10/01/19
# Checking code. Fixed some spacing on some lines. Added some more separators...
# **--- TO-DO Still need to work on the Wifi issues not showing like I want. Battery/AC reporting..  -Bruce
#----------------------------------------
# v.1.2.2 Change Log 10/09/19
# Today I did some more punctuation fixing. Also I worked on the Wifi section for laptops
# to show correct ports for wifi and either net... Started testing on my Dell Latitude 6410
# and my Acer Extensa 4420 to get the IP,Port,Battery reporting to work correctly on the laptops.
# Checked Port reporting with and without the Ethernet cable plugged in and Wifi turned off. So Far so Good!
#
# *** TO-DO Item, see if there is a way to show when the laptop is on the battery or AC when script is ran...***
# Tomorrow start testing on the Desktops again and make sure that the script function correctly on Desktops!   -Bruce
#----------------------------------------
# v.1.2.2 Change log 09/02/2020
# Well the time has come for a Name change to Hal-9000-Info and a version change...
# This will also be published on my GitHub and GitLab accounts @ bescott9944/Hal-9000-Info...
# The script has worked just fine the last few months so I am going to call it done for now! :-)
# The new Version Number is v.1.3.0 Modified 09/2/2020 -Bruce
#----------------------------------------

# v.1.3.1 Change Log 10/19/19
# Today I moved all the output to the right of the headers with the (:). This make for a cleaner look in
# the IP Information Section.
# Took out the empty spacing with the "new line \n tag" too.
# I also changed some of the commands and added Variables to better fix the output on the screen
# and I think it works a bit better too! -Bruce
# Also a Version Change... ):-D
# Today I added somw morw Variables to the IP Section better fix the output on the screen
# and I think it works a bit better too! 10/19/19 -Bruce
# Side note; this 5 minute project has been 4 months now...Lol
#----------------------------------------
# *** TO-DO Item's, Now I need to do some testing on the laptops to make sure that I didn't FooBar
# anything for the "WIFI" Area of the IP Information Section...
# Still need to work on the laptop Battery output... 10/19/19 -Bruce
#----------------------------------------
# v.1.3.1 Change Log 10/20/19
# Today I changed the Hard Drive Section again. I put the output information back
# to the right side of the "Label" for a cleaner look and understanding of the output.
# I still have a issue with one hard drive that the capacity is offset to far to the left and is
# rapped to the next line still. I played with the settings and their is no fixing it at this time.
# All of the other hard drive wok fine, just one BUTT!
# Still have some output that is "Left side" output and will not TAB over to the right. (:-(
# Positive Note! Testing on the laptops complete and all is GOOD... LOL
# That's it for now until my OCD kick's in again.... -Bruce
#----------------------------------------#
# Change Log 10/19/2020
# Finally got the Laptop Battery Interface figured out thanks to
# OTB YouTube Channel. He showed where to get the information
# and I got the Battery Status working because of the video!
# Thanks OTB!       -Bruce
#----------------------------------------
# v.1.3.1 Change Log 00/31/2021
# Today we merged some new Wifi and Laptop Battery testing/stats to the script.
# There are still some testing that needs to be done on the Battery part, I lost
# My Acer Laptop as it stopped working. All I have are my Dells and there all the same.
# Will get Eznix to test it for me as his Dell Laptop is newer than mine!
#
# Also bumped the Version Number Up to v.1.3.2
# Also made the complete name change from Mystat.sh to Hal-9000-Info
#
# ***TODO List: 08/31/2021
# Need to see if there is a way to show when the laptop is on the battery or AC when script is ran
# And not to show anything on a Desktop System...
#
# Added some Dependencies checking 2 months ago but still need to finish what to check for...
#
# Knowen Issue... On some sustems you will get this Error at the top of the Terminal screen:
# (df: /run/user/1000/doc: Operation not permitted) This can be ignored it is a
# Permission issue with the group. I added (sudo) to the command this should help!
#
# Added this to the main Hal-9000 on 08/31/2021.. -Bruce
#----------------------------------------#
# v.1.3.1 Change Log 09/05/2021
#
# Today we got the DF -h permission issue fixed...
# Also we added "Looking for Dependencies Now Section."
# by adding Dependencies Checking to the script to make sure that they
# are all installed. Shows up as a Dependencies check with a STD to the terminal
# output with messages found or error's at the start of the script... -Bruce 09/05/2021
#
# Also got a new error section added for the Dependency check.
# Got this Error section from one of TerminalForLife scripts.
# I like it better than joe Collins version that is commented out. 09/05/2021 -Bruce
#----------------------------------------#
# v.1.3.1 Change Log 09/06/2021
#
# 09/05/2021 -Bruce
#----------------------------------------#
#
#----------------------------------------#
#
#----------------------------------------#

####################################################################

#This Help/Version/Error script section came from TerminalForLife.
#GitHub:https://github.com/terminalforlife
CurVer=' v.1.3.1 2021-09-06 '
Progrm=${0##*/}

Err(){
	printf 'ERROR: %s\n' "$2" 1>&2
	[ $1 -gt 0 ] && exit $1

}

USAGE(){
	while read; do
		printf "%s\n" "$REPLY"
	done <<-EOF
		            ${Progrm^^} ($CurVer)
		            Written by Bruce E. Scott <bescott9944@gmail.com>

		            Simple Script program togather system information for help forum's.

		SYNTAX:     $_PROJECT_ [OPTS]

		OPTS:       --help|-h|-?            - Displays this help information.
		            --version|-v            - Output only the version datestamp.
		            --debug|-D              - Enables the built-in bash debugging.
		            
		            

		NOTE:       The purpose of the script is together system information for 
            help forum's to assist in fixing issues with your OS and/or your hardware.
            I pulled commands from various scripts and forum posts
            which do most of the work and I add my own to make up this full
            script. The script will displays information on screen and to a file
            in your /home/your-name under the file name of the system "XXXXX.stat"...
            I merged all the scripts and commands to make it all work...
            I also wrote some of the code myself and modified a lot of it
            for better output. --Bruce E. Scott
	EOF
}

while [ "$1" ]; do
	case $1 in
		--help|-h|-\?)
			USAGE; exit 0 ;;
		--version|-v)
			printf '%s\n' "$CurVer"; exit 0 ;;
		--debug|-D)
			DEBUGME='true' ;;
		
		-*)
			Err 1 $LINENO "Incorrect argument(s) specified." ;;
		*)
			break ;;
	esac
	shift
done

#-------------------------------------------------------------------#

# Set BASH to quit script and exit on any errors:
 #Added this to the main Hal-9000 on 08/31/2021.. -Bruce
 set -e pipefail

#-------------------------------------------------------------------#
# Dependencies Function
# Checking for Dependencies : awk, ip, nmcli, wget, dmidecode, grep, hdparm, lsblk, inxi, network-tools
# Added this to the main Hal-9000 on 08/31/2021.. -Bruce
# NOTE: Work in progress... Still 09/06/2021 -Bruce
#
# Looking for Dependencies Now...
# Added Dependencies Checking to the script to make sure that they
# are all installed. Shows up as a Dependencies check with a STD to the terminal
# output with messages found or error's at the start of the script... -Bruce 09/05/2021
# Got the Error section from one of TerminalForLife scripts.
# I like it better than joe Collins version that is was using. 09/05/2021 -Bruce


if [[ -f /usr/bin/dmidecode ]]  || [[ -f /usr/sbin/dmidecode ]]; then

printf "dmidecode : All Good I Found dmidecode in /usr/sbin/dmidecode%s\n" 2>/dev/null

else

Err 1 "dmidecode not found.. Please Install Missing Dependency Package!"

fi

if [[ -f /usr/sbin/hdparm ]]  || [[ -f /usr/bin/hdparm ]]; then

printf "Hdparm : All Good I Found Hdparm in /usr/bin/hdparm%s\n" 2>/dev/null

  else

Err 1 "Hdpram not found.. Please Install Missing Dependency Package!"

fi

if [[ -f /usr/bin/ip ]] && [[ -f /usr/sbin/ip ]] && [[ -f /usr/bin/awk ]] &&\
 [[ -f /usr/bin/nmcli ]] && [[ -f /usr/bin/grep ]] && [[ -f /usr/bin/lsblk ]]; then

printf "Core-Utils : All Good I Found All the Core-Utils%s\n" 2>/dev/null

  else

Err 1 "Core-Utils not found.. Please Install Missing Core-Utils Package!"

fi

# End of checking for Dependencies...

#
  echo
  printf "%s\n\t<---====+++++++++++++++++++++++++++++++++++++++++++++++++====--->"
  printf "%s\n\t<<<---================}[ Hal-9000 OS v.2010 ]{================--->>>"
  printf "%s\n\t<---====+++++++++++++++++++++++++++++++++++++++++++++++++====--->\n"
  printf "%s\n\t\t<:>  Hello, I'm The HAL-9000 Computer.\n"
  printf "%s\n\t\t<:>  I will be Processing Your Information today.."
  printf "%s\n\t\t<:>  Please Hold this will take a Bit..  Thank You!"
  printf "%s\n\t\t<:>  We May Need You Password $USER.. \n"
  printf "%s\n\t\t<:>  I am Checking......."
  printf "%s\n\t\t<:>  ...---___---****---___...---___---****---___..."
  printf "%s\n\t\t<:>  Yes we need your password.. Please Enter It Now!......."
  printf "%s\n\t\t<---====+++++++++++++++++++++++++++++++++++====--->"
  printf "%s\n"
#
# Base variables
#
myuser=$USER
myhost=$HOSTNAME
infofile="/home/$myuser/$myhost.stat"
today=$(date +"%B %e, %G - %l:%M:%S %P")
#
# Checking for sudo permissions:
sudo ls > /dev/null

# Computer information

biov=$(sudo /usr/sbin/dmidecode -s bios-vendor 2>/dev/null)
biodate=$(sudo /usr/sbin/dmidecode -s bios-release-date 2>/dev/null)
mfgname=$(sudo /usr/sbin/dmidecode -s system-manufacturer 2>/dev/null)
prodname=$(sudo /usr/sbin/dmidecode -s system-product-name 2>/dev/null)
vername=$(sudo /usr/sbin/dmidecode -s system-version 2>/dev/null)
sernum=$(sudo /usr/sbin/dmidecode -s system-serial-number 2>/dev/null)
bmfgname=$(sudo /usr/sbin/dmidecode -s baseboard-manufacturer 2>/dev/null)
bprodname=$(sudo /usr/sbin/dmidecode -s baseboard-product-name 2>/dev/null)
bvername=$(sudo /usr/sbin/dmidecode -s baseboard-version 2>/dev/null)
bsernum=$(sudo /usr/sbin/dmidecode -s baseboard-serial-number 2>/dev/null)

# RAM and CPU

physmem=$(grep MemTotal /proc/meminfo | awk '{print $2}' | xargs -I {} printf "%s\n" "scale=4; {}/1024^2" | bc)
cpuinfo=$(grep 'model name' /proc/cpuinfo | uniq | cut -c 14-)

# Network

ethint=$(nmcli dev | awk '/ethernet/ {print $1}')
wifint=$(nmcli dev | awk '/wifi/ {print $1}')

#    **** ethint=$(nmcli dev | awk '/ethernet/ {print $1}')
#    **** wifint=$(nmcli dev | awk '/wifi/ {print $1}')

#############
#
# 6/14/19 "TO DO"
# You need to changed the ("nmcli dev" an "print $1" to $6) varables so it will would read
# "Active" Nic cards in a 2 Nic card system..... Like this...
#
# ethint=$(nmcli dev | grep 'ethernet' | awk '{print $1}')
# ethint=$(nmcli con show --active | grep 'ethernet' | awk '{print $6}')
# ethint=$(nmcli dev | grep 'ethernet' | awk '{print $1,$3}' to get -->($1)enp2s0  ($3)connected
#-----------------------------------------------------------------------------------
#   wifint=$(nmcli dev | grep 'wifi' | awk '{print $6}')
#   wifint=$(nmcli dev | grep 'wifi' | awk '{print $1}') ##  Changed the $1 to $6...
#
############
ethernet=$(/usr/bin/lspci | grep 'Ethernet controller' | cut -c 30-)
wireless=$(/usr/bin/lspci | grep 'Network controller' | cut -c 29-)

# IP addresses

publicip=$(wget -qO- http://ipv4.icanhazip.com)
localip1=$(ip -o -f inet addr show | awk -v name="$ethint" '$0~name {print $4}')
localip2=$(ip -o -f inet addr show | awk -v name="$wifint" '$0~name {print $4}')


# Write data to file in user's home directory

clear
{
  printf "%s\n"
  printf "%s\n\t    <---====+++++++++++++++++++++++++++++++++++====--->
\t <<<---================}[ Hal-9000-Info ]{================--->>>
\t Mystat.sh, v.0.3 created on 04/12/2019 Copyright 2019, Bruce E. Scott
\t SysInfo, Copyright 2019, Richard Romig....
\t Current Version: v.1.3.2 Modified by Bruce Scott 08/31/2021" > "$infofile"
#
  printf "%s\n\t    <---====+++++++++++++++++++++++++++++++++++====--->"
  printf "%s\n============"
  printf "%s\nFile created:"
  printf "%s\n============"
  printf "%s\n$today\n"
#
  printf "%s\n\t\t    <---====+++++++++++++++++++++++++++++++++++====--->"
  printf "%s\n\t\t         System information for $myhost:"
  printf "%s\n\t\t    <---====+++++++++++++++++++++++++++++++++++====--->"
#
  printf "%s\n============"
  printf "%s\nBios Information:"
  printf "%s\n============"
  printf "%s\n\tBios Manufacturer: $biov"
  printf "%s\n\tBios Release Date: $biodate"
#
  printf "%s\n============"
  printf "%s\nSystem Information:"
  printf "%s\n============"
  printf "%s\n\tSystem Manufacturer: $mfgname"
  printf "%s\n\tSystem Product Name: $prodname"
  printf "%s\n\tSystem Version: $vername"
  printf "%s\n\tSystem Serial Number: $sernum"
#
  printf "%s\n============"
  printf "%s\nBoard Information:"
  printf "%s\n============"
  printf "%s\n\tBoard Manufacturer: $bmfgname"
  printf "%s\n\tBoard Product Name: $bprodname"
  printf "%s\n\tBoard Version: $bvername"
  printf "%s\n\tBoard Serial Number: $bsernum"
#
  printf "%s\n============"
  printf "%s\nDistro Information:"
  printf "%s\n============"
#  printf "%s\n\tDistro OS: $(/usr/bin/lsb_release -d | cut -c 14-)"  # Changed to "OS" to "Disto OS" to get info in the $infofile. 6/14/19 -bruce.
#  printf "%s\n\tCodename: $(/usr/bin/lsb_release -c | cut -c 11-)"   # Added to get Codename 6/14/19 -bruce.
#  printf "%s\n\tRelease: $(/usr/bin/lsb_release -r | cut -c 10-)"  # Added to get Release 6/14/19 -bruce.

  printf "%s\n\tDistro OS: $(/usr/bin/lsb_release -d | cut -c 14-)"  # Changed to "OS" to "Disto OS" to get info in the $infofile. 6/14/19 -bruce.
  printf "%s\n\tDesktop: $(inxi -S 2>/dev/null | grep 'Desktop' | awk '{print $4 " " $5}')" # Added to get Desktop Info 10/19/16 -Bruce
  printf "%s\n\tCodename: $(/usr/bin/lsb_release -c | cut -c 11-)"   # Added to get Codename 6/14/19 -bruce.
  printf "%s\n\tRelease: $(/usr/bin/lsb_release -r | cut -c 10-)"  # Added to get Release 6/14/19 -bruce.
  printf "%s\n\tKernel Ver: $(cat /proc/sys/kernel/osrelease 2>/dev/null grep '.' | awk '{print}')" # Added to get Kernel Ver Info 6/19/16 -Bruce
#  printf "%s\n\tKernel Bit: $(inxi -S 2>/dev/null | grep 'Kernel' | awk '{print$6" "$7" "$8$9}')"
#  printf "%s\n\tKernel Bit: $(inxi -S 2>/dev/null | grep 'Kernel' | awk '{print$7" "$8$9}')" # Added to get Kernel Bit Ver Info 10/19/16 -Bruce
  printf "%s\n\tSoftware Bit: $(inxi -S 2>/dev/null | grep 'Kernel' | awk '{print $6 " " $7}')" # Added to get Kernel Bit Ver Info 10/19/16 -Bruce
#
  printf "%s\n============"
  printf "%s\nCPU Information:"
  printf "%s\n============"
  printf "%s\n\t$cpuinfo"
#
  printf "%s\n============"
  printf "%s\nRAM Information:"
  printf "%s\n============"
  printf "%s\n\t$physmem GB"
#
 printf "%s\n============"
  printf "%s\n""Graphics Adapter: "
  printf "%s\n============"
  printf "%s\n\t$(/usr/bin/lspci | grep 'VGA' | cut -c 36-)"
#
# Network Interfaces Section
#
  printf "%s\n============"
  printf "%s\nNetwork Adapters:"
  printf "%s\n============"
 if [ -n "$ethernet" ]; then
  printf "%s\n\tEthernet:"
	printf "%s\n\tPort Name: $ethint"
	printf "%s\n\tNic Card: $ethernet"
#   printf "%s\n\tEthernet: $ethint = $ethernet"
#    read -r ethadd < "/sys/class/net/enp3s10/address"
    read -r ethadd < "/sys/class/net/$ethint/address"
    printf "%s\n\tMAC Address: $ethadd"
 fi
if [ -n "$ethint" ] && [ -n "$localip1" ]; then
  printf "%s\n\tEthernet Address: $localip1"
elif [ -n "$ethint" ]; then
  printf "%s\n\tEthernet Cable: Not connected\n"
fi
#
# Wirless Wifi Section
#
  if [ -n "$wireless" ]; then
    printf "%s\n============"
    printf "%s\nWireless Information:"
    printf "%s\n============"
    printf "%s\n\tWireless:"
    printf "%s\n\tPort Name: $wifint"
    printf "%s\n\tNic Card: $wireless"
    read -r wifiadd < "/sys/class/net/$wifint/address"
    printf "%s\n\tMAC Address: $wifiadd"printf "%s\n"
  fi
if [ -n "$wifint" ] && [ -n "$localip2" ]; then
  printf "%s\n\tWireless Ethernet: $localip2"
elif [ -n "$wifint" ]; then
  printf "%s\n\tWireless Ethernet: Not connected\n"
fi
#
####
#    Added the "IP Route" to get Nic card Information...
#
  printf "%s\n============"
  printf "%s\nIP Route Inforomation:" # Added this to get more Nic Information. 6/14/19 -bruce.
  printf "%s\n============\n"
#	/usr/bin/ip route | awk '/default/ "\t"{print}'
#   /sbin/ip route | awk '/default/ "\t"{print}'
  /sbin/ip route | awk '/default/ "{print}"'  #--=== #### NOTE: I Added the "AWK Output" to change
                                                       #### the IP Router Information on 09/17/2019  -Bruce
#  If your "IP" is not in the /sbin/ip. Then uncomment the above
#  "/usr/bin/ip route" line. Then add a line "#" comment to the /sbin/ip/route
#  Solus 4.0, Mint 18.3 keeps their "IP" in the "/sbin"... -Bruce
#
#
# Display IP Information
###-->> 10/19/19 Today I moved all the output to the right of the headers with the (:).
###  This make for a cleaner look in the IP Information Section. Took out the empty spacing with the "new line \n tag" too.
### I also changed some of the commands and added Variables to better fix the output on the screen
### and I think it works a bit better too! -Bruce
  printf "%s\n=============="
  printf "%s\nIP Information:"
  printf "%s\n=============="
  printf "%s\n\tLocal IP:"
if [ -n "$ethint" ] && [ -n "$localip1" ]; then
  printf "%s\n\tEthernet:\t$localip1"
elif [ -n "$ethint" ]; then
  printf "%s\n\tEthernet:\tNot connected"
fi
# /sbin/ip route | awk '/default/ {print "\t"$3}'
eadaptor=$(/sbin/ip route | awk '/default/ {print "\t"$5}')
  printf "%s\n\tE-Adaptor ID:$eadaptor"
# /sbin/ip route | awk '/default/ {print "\t"$5}' ### NOTE: Split the AWK command into 2 AWK commands to get
# /sbin/ip route | awk '/scope/ {print "\t"$9}'  ### better Gatway and Adaptor information on 09/17/2019  -Bruce
# NOTE:->>  If you have a error here, change this "/sbin/ip" to "/bin/ip" for your system if needed.
# To find out in a terminal,type: "whereis ip on CLi" -bruce
#
if [ -n "$wifint" ] && [ -n "$localip2" ]; then
  printf "%s\n\tWireless:\t$localip2"
elif [ -n "$wifint" ]; then
  printf "%s\n\tWireless:\tNot connected"
fi
  printf "%s\n\tPublic IP:\t$publicip"
#
gate=$(/sbin/ip route | awk '/default/ {print "\t"$3}')
 printf "%s\n\tGateway:$gate"
#
dnssrv=$(/usr/bin/nmcli dev show | awk '/IP4.DNS/ {printf "%s",$2}')
  printf "%s\n\tDNS Servers:\t$dnssrv\n"
# /usr/bin/nmcli dev show | awk '/IP4.DNS/ {printf "\t%s\n",$2}'
#         ## Changed the AWK output to read the "IP4.GATEWAY to get a better IP output
#         ## because some Distro's do not use the IP$.DNS, like Ubuntu Server 18.04. I checked Mint 18.3,
#         ## MX 18.3, Manjaro, Peppermint 10. So this should be good for now... 09/20/2019 -bruce
#
#       ### today I added Variables to better fix the output on the screen
#       ### and I think it works a bit better too! 10/19/19 -Bruce
#
# Hard drive
#    Note: On some Distro's "hdpram" is not installed by default.
#    Thanks goes out to Leon.P for his Hdd Function for the script...
#    You will have to install it for this section to function... -Bruce E. Scott -6/18/19
  printf "%s\n============"
#  fi
printf "%s\nHard Disk Information:"
  printf "%s\n============"
   for Disk in /dev/sd[a-z]
do

    hdmodel=$(sudo /sbin/hdparm -I "${Disk}" | grep 'Model Number' | cut -c 22-)
    hdserial=$(sudo /sbin/hdparm -I "${Disk}" | grep 'Serial Number' | cut -c 22-)
    hdsize=$(sudo /sbin/hdparm -I "${Disk}" | grep 'GB' | cut -c 38-)
    trans=$(sudo /sbin/hdparm -I "${Disk}" | grep 'Transport:' | cut -c 22-)
    firm=$(sudo /sbin/hdparm -I "${Disk}" | grep 'Firmware Revision' | cut -c 22-)

    printf "%s\n\tModel Number:\t$hdmodel"
    printf "%s\n\tSerial Number:\t$hdserial"
    printf "%s\n\tCapacity:\t$hdsize"
    printf "%s\n\tTransport:\t$trans"
    printf "%s\n\tFirmware Revision:\t$firm\n"

done
### Note: Added "Other HDD Information:" to get more HDD information on 09/17/2019  -Bruce
  printf "%s\n============"
  printf "%s\nOther DF HDD Information:"
  printf "%s\n============\n"
    sudo df -h     >> "$infofile"
####
  printf "%s\n============"
  printf "%s\n Partition Information:"
  printf "%s\n============\n"
    /bin/lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,VENDOR,UUID  #### NOTE: Added VENDOR, UUID information to the"lsblk" on 09/17/2019  -Bruce
printf "%s\n"
##
# Battery Interfaces
#-----
# I fixed The Battery Display option when script is Ran on a Laptop
# so that the information is correct. Was never checked on my Laptop
# until today.
# Also added the ( printf "%s\n" "Battery Information:") to the output, it did not have one
# Things to do; write the code to show when the "AC" power is plugged in and it is charging... 09/19/2019/ -Bruce
#
# Change Log 10/19/2020
# Finally got the Laptop Battery Interface figured out thanks to
# OTB YouTube Channel. He showed where to get the information
# and I got the Battery Status working because of the video!
# Thanks OTB!       -Bruce
# Added this to the main Hal-9000 on 08/31/2021.. -Bruce
#-----
#

if [ "$(ls -A /sys/class/power_supply/)" ]; then
  printf "%s\n============"
  printf "%s\nBattery Information:"
  printf "%s============"
  printf "%s\nPower and battery:"
  printf "%s\nNotice if you see hidpp_battery_?
 This is your wireless keyboard/mouse. Not configured at this time.:"
 #   ls -1 /sys/class/power_supply
  fi

# Change Log 10/19/2020
# Finally got the Laptop Battery Interface figured out thanks to
# OTB YouTube Channel. He showed where to get the information
# and I got the Battery Status working because of the video!
# Thanks OTB!       -Bruce

# Battery/Laptop Varables
# Added this to the main Hal-9000 on 08/31/2021.. -Bruce
if [[ -d /sys/class/power_supply/BAT0/ ]];then

	EXTERNAL=$(cat /sys/class/power_supply/BAT0/capacity)
	STATUS=$(cat /sys/class/power_supply/BAT0/status)
	ONLINE=$(cat /sys/class/power_supply/AC/online)
	ONLINEN="0"
	ONLINEY="1"
 fi

 if [ "$ONLINE" = "1" ] && [ -d /sys/class/power_supply/BAT0/ ];then
	printf "%s\nBattery Capacity : $EXTERNAL%"
	printf "%s\nBattery Status   : On Mains Voltage & $STATUS"
  
  elif [ -d /sys/class/power_supply/BAT0/ ];then #Added this to keep the below
  # from showing up on Desktops until I find a better way... -Bruce 08/31/2021
	
	printf "%s\nBattery Capacity : $EXTERNAL%"
	printf "%s\nBattery Status   : Not On Mains Voltage & $STATUS"

 fi

####
set -e pipefail #Added this to the main Hal-9000 on 08/31/2021.. -Bruce

 printf "%s============"
 printf "%s\n Inxi - System Data Information:\n"
 printf "%s============\n"
#
#   On 8/20/19 Deck_luck on EzeeTalk.com came up with this small script that fix's
#   the INXI command from hanging and getting caught in a loop on any INXI v2.3.x.x-00
#   or higher! There is a bug in newer versions that keep calling the parent --version.
#   Thank you Deck_luck for your time and the fix! -Bruce
#
 if [[ "${1}" == "--version" ]] ; then
	# patch for inxi_3.0.32 parent --version anomaly Per Deck_luck 8/20/19
 	exit 1
 fi
#
# INXI Verable's... Looking for INXI on the system...
###
# Looking for INXI 06/06/2020
# revisiting INXI 10/20/2020 - Might work!
# revisiting INXI again 10/26/2020 - I think I got all the (if) statements
# working to find all the locations of INXI...
# Cleaned up some more code for INXI too... -Bruce
# Added this to the main Hal-9000 on 08/31/2021.. -Bruce

# if [ -f /bin/inxi ];then
#	/bin/inxi -c0 -Fxzd
#		printf "%s\n" "\n \t    All Good Found INXI in /bin/inxi!"
#  else
#        printf "%s\n" "*** ERROR! - INXI Not Found in /bin/inxi!" >&2
# fi

 if [ -f /usr/bin/inxi ];then
	/usr/bin/inxi -c0 -Fxzd
    printf "%s\n"
    printf "%s   \t\t\t<---====+++++++++++++++++++++++++++++++++++====--->"
       printf "%s\n\t\t\t Searching for INIX:   All Good Found INXI in /usr/bin/inxi!"
  else
  printf "%s\n"
  printf "%s   \t\t\t<---====+++++++++++++++++++++++++++++++++++====---> \n"
        printf "%s\t\t\n  *** ERROR! - INXI Not Found in /usr/bin/inxi!\n" >&2
 fi

 if [ -f /usr/local/bin/inxi ];then
	/usr/local/bin/inxi -c0 -Fxzd
    printf "%s\n"
    printf "%s   \t\t\t<---====+++++++++++++++++++++++++++++++++++====---> \n"
     printf "%s\n\t\t\t Searching for INIX:   All Good Found INXI in /usr/local/bin/inxi!"
  else
  printf "%s\n"
  printf "%s   \t\t\t<---====+++++++++++++++++++++++++++++++++++====---> \n"
        printf "%s\t\t\n *** ERROR! - INXI Not Found in /usr/local/bin/inxi!\n" >&2
 fi
#
  printf "%s\n"
  printf "%s   \t\t\t<---====+++++++++++++++++++++++++++++++++++====---> \n"
  printf "%s \t\t  <<<---================ Hal-9000 OS v.2010 ================--->>> \n"
  printf "%s \t\t\t<:>  The data is being retrieved $USER!! One Moment... \n"
  printf "%s \t\t\t<:>  I Found The Data You Requested... \n"
  printf "%s \t\t\t<:>\n"
  printf "%s \t\t\t<:>  Here's The Data For ""$HOSTNAME""'s"" OS System You Wanted.....\n"
  printf "%s \t\t\t<:>  Thank You For Using Your Hal-9000 Computer...\n"
  printf "%s \t\t\t<:>   		Goodbye $USER! \n"
  printf "%s    \t\t\t<---====+++++++++++++++++++++++++++++++++++====--->\n"
  printf "%s \t\t\t     <<<---==============================--->>>\n"
} >> "$infofile"
#
cat < "$infofile"
exit 0
